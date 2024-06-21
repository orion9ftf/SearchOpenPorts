import os
import base64
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes
from cryptography.hazmat.primitives.kdf.pbkdf2 import PBKDF2HMAC
from cryptography.hazmat.primitives import hashes
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.backends import default_backend
from getpass import getpass

def get_key(password, salt):
    kdf = PBKDF2HMAC(
        algorithm=hashes.SHA256(),
        length=32,
        salt=salt,
        iterations=100000,
        backend=default_backend()
    )
    return kdf.derive(password.encode())

def encrypt_file(file_path, password):
    backend = default_backend()
    salt = os.urandom(16)
    key = get_key(password, salt)
    iv = os.urandom(16)
    cipher = Cipher(algorithms.AES(key), modes.CBC(iv), backend=backend)
    encryptor = cipher.encryptor()

    with open(file_path, 'rb') as f:
        plaintext = f.read()

    padder = padding.PKCS7(algorithms.AES.block_size).padder()
    padded_data = padder.update(plaintext) + padder.finalize()
    ciphertext = encryptor.update(padded_data) + encryptor.finalize()

    encrypted_file_path = file_path + '.enc'
    with open(encrypted_file_path, 'wb') as f:
        f.write(salt + iv + ciphertext)

    print(f'File encrypted and saved to {encrypted_file_path}')

def main():
    desktop_path = os.path.join(os.path.expanduser("~"), "Desktop")
    file_name = input("Enter the name of the file to encrypt (with extension): ")
    file_path = os.path.join(desktop_path, file_name)

    if not os.path.isfile(file_path):
        print("File not found!")
        return

    password = getpass("Enter a password for encryption: ")
    encrypt_file(file_path, password)

if __name__ == "__main__":
    main()


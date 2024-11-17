import secrets
import string

def generate_secure_password(length=16):
    characters = string.ascii_letters + string.digits + string.punctuation
    password = ''.join(secrets.choice(characters) for _ in range(length))
    return password

# Genera una contraseña segura de 16 caracteres
print(generate_secure_password())




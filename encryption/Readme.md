### Encryption

Instalar:

```sh
pip install cryptography
```

Este programa realiza lo siguiente:

1.- Pide el nombre del archivo a cifrar en tu escritorio.

2.- Genera una clave derivada de una contraseña proporcionada por el usuario usando PBKDF2HMAC con una sal aleatoria.

3.- Utiliza el cifrado AES en modo CBC para cifrar el archivo.

4.- Guarda el archivo cifrado con una extensión .enc, que incluye la sal y el IV necesarios para el descifrado.


Para usar este programa:

1.- Ejecuta el script.

2.- Introduce el nombre del archivo que quieres cifrar (asegúrate de que el archivo esté en tu escritorio).

3.- Introduce una contraseña que se utilizará para el cifrado.

NOTA: Este programa es una forma sencilla de mantener tus archivos cifrados y seguros en tu escritorio.

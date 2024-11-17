usuari = "luis"
contrasenya = "luis"
archivo = "con.txt"

archivo = open("con.txt", "r")
for linea in archivo.readlines():
    user, password = linea.strip().split(' ')
    if (usuari == user):
        print("L'usuari", usuari, " es correcte es igual a", user)
    if (contrasenya == password):
        print("La Contrasenya ", contrasenya, " es ccorrecte es igual a ", password)
archivo.close()

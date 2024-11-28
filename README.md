# SpamChile
Números de llamadas conocidas por ser SPAM. La mayoría de los números en esta DB son de Chile.

¿Cómo usarla?

Primero, Instalar SpamBlocker desde [F-Droid](https://f-droid.org/packages/spam.blocker)

Habilitarlo, configurarlo con las reglas que se quieran activar (incluir el uso de Base de Datos de Spam)

Crear un Workflow (automatización) que actualice la DB con la frecuencia que quieras.

1. Componente "HTTPS Download" con la URL https://raw.githubusercontent.com/racuna/SpamChile/refs/heads/main/ChileSpam.csv
2. Componente "Parse CSV" con el siguiente patrón: `{'PhoneNumber': 'pattern'}`
3. Componente "Import to Spam Database"
4. Guardar con el nombre que quieras y activar.

Ejemplo:
![Android config](https://nostpic.com/media/ff1a68c42082105d852c425bcb783c99e3c8fccafa6a93a22f3829e0ec9831cf/c1ea1b39042cdee9655a860a318ca653352f1fa253c6a3a5d7dc467009d28b70.webp "Capture")

Listo

# Contribuciones

Como los spammers van cambiando constantemente de números, esta lista estará siempre limitada. O bien, estará en constante crecimiento. Si quieres añadir un nuevo número:

Busca primero si el Nro no existe (Ctr+F), y repórtalo en Issues con alguna descripción. Lo añadiré tan pronto como pueda.

Este no es trabajo remunerado, pero si quieres enviar alguna propina. Igual es bienvenido:

- **Satoshis:** racuna@zbd.gg
- **Bitcoin:** 1CBTKY5hRQa1nfwwZ1YsJpjGBYY64jVQZ8
- **Doge:** DNYcyvuDdw9MYvwGubLTv8ZzrDuDhCa74Z
- **BCH:** bitcoincash:qzrr70nl5nppkslew0qywyx6hfsr97jux599003wcf
- **Monero:** 41euZoUX31iL3hoBD1yYFpQ3kTFQDHpspEfS8LEbfArDBkeVLTSu9SBTuPSJN7Tu8udD5bBsQqh1gBULhT44K8q9NG4UBhs

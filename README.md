# SpamChile
Números de llamadas conocidas por ser SPAM. La mayoría de los números en esta DB son de Chile.

# Motivación
¿Por qué no usar Truecaller? Privacidad. Porque Truecaller utiliza tu agenda de contactos para alimentar su base de datos, cosa que SpamBlocker no hace. Otra alternativa como Yet Another Call Bloquer, que también era respetuosa con tu privacidad dejaron de actualizarse. SpamBlocker está en contínuo desarrollo.

# Uso

¿Cómo usarla?

Primero, Instalar SpamBlocker desde [F-Droid](https://f-droid.org/packages/spam.blocker)

Habilitarlo, configurarlo con las reglas que se quieran activar (incluir el uso de Base de Datos de Spam)

Crear un Workflow (automatización) e importar copiando el siguiente JSON:

```
{
  "id": 5,
  "desc": "SpamChile",
  "schedule": {
    "type": "Daily",
    "time": {
      "hour": 0,
      "min": 0
    }
  },
  "actions": [
    {
      "type": "HttpDownload",
      "method": 0,
      "url": "https://raw.githubusercontent.com/racuna/SpamChile/refs/heads/main/ChileSpam.csv",
      "header": "",
      "body": ""
    },
    {
      "type": "ParseCSV",
      "columnMapping": "{'PhoneNumber': 'pattern'}"
    },
    {
      "type": "ConvertNumber",
      "from": "(\\+)",
      "flags": 5,
      "to": ""
    },
    {
      "type": "ImportAsRegexRule",
      "description": "Spam Chile",
      "priority": 11,
      "isWhitelist": false,
      "importType": "Replace"
    }
  ],
  "enabled": true,
  "workUUID": "8cc6c9a5-4059-477a-a3e2-29d76b8e9c38"
}
```
Nota: Gracias a @aj3423 por su ayuda con el JSON

Ejemplo de cómo debería quedar después de haber hecho la importación:
![Android config](https://i.postimg.cc/TYZx6h40/Screenshot-2024-12-28-21-17-45-620-spam-blocker-edit.jpg "Capture")

Listo, después de guardar puedes hacer un Test con lo que se ejecutará el workflow cargando la información necesaria.

# Contribuciones

Como los spammers van cambiando constantemente de números, esta lista estará siempre limitada. O bien, estará en constante crecimiento. Si quieres añadir un nuevo número:

Busca primero si el Nro no existe (Ctr+F), y repórtalo en Issues con alguna descripción. Lo añadiré tan pronto como pueda.

Este no es trabajo remunerado, pero si quieres enviar alguna propina. Igual es bienvenido:

- **Links Cripto:** https://plisio.net/donate/GevVszjz 
- **Bitcoin:** 1CBTKY5hRQa1nfwwZ1YsJpjGBYY64jVQZ8
- **Doge:** DNYcyvuDdw9MYvwGubLTv8ZzrDuDhCa74Z
- **BCH:** bitcoincash:qzrr70nl5nppkslew0qywyx6hfsr97jux599003wcf
- **Monero:** 41euZoUX31iL3hoBD1yYFpQ3kTFQDHpspEfS8LEbfArDBkeVLTSu9SBTuPSJN7Tu8udD5bBsQqh1gBULhT44K8q9NG4UBhs

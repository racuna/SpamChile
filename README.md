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
    "id": 4,
    "desc": "SpamChile",
    "trigger": {
        "type": "Schedule",
        "enabled": true,
        "schedule": {
            "type": "Daily",
            "time": {
                "hour": 0,
                "min": 0
            }
        },
        "workUUID": "61c0fa79-95e9-4c89-a2f0-43a734dac480"
    },
    "actions": [
        {
            "type": "HttpDownload",
            "method": 0,
            "url": "https://raw.githubusercontent.com/racuna/SpamChile/refs/heads/main/ChileSpam.csv",
            "header": "",
            "body": "",
            "enableRetry": false,
            "retryTimes": 0,
            "retryDelayMs": 0
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
            "importType": "Replace",
            "importAs": 0
        }
    ]
}
```
Nota: Gracias a @aj3423 por su ayuda con el JSON

Ejemplo de cómo debería quedar después de haber hecho la importación:

![Android config](https://i.postimg.cc/TYZx6h40/Screenshot-2024-12-28-21-17-45-620-spam-blocker-edit.jpg "Capture")

Listo, después de guardar puedes hacer un Test con lo que se ejecutará el workflow cargando la información necesaria.

Este workflow actualizará la DB local cada medianoche. Puedes cambiar esto en 'time' al comienzo del JSON. Si quieres hacer una actualización manual, simplemente dale al botón Test del workflow y hará la carga del CSV nuevamente. 

# Contribuciones

Como los spammers van cambiando constantemente de números, esta lista estará siempre limitada. O bien, estará en constante crecimiento. Si quieres añadir un nuevo número:

Busca primero si el Nro no existe (Ctr+F), y repórtalo en [Issues](https://github.com/racuna/SpamChile/issues) con alguna descripción. Lo añadiré tan pronto como pueda.

Este no es trabajo remunerado, pero si quieres enviar alguna propina. Igual es bienvenido:

- **Links Cripto:** https://plisio.net/donate/GevVszjz 
- **BCH:** bitcoincash:qqhketnlpn2uqvyg0tl7vhasktwsum6s8ua3sxhg9e

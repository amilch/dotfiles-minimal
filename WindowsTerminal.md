# Windows Terminal

[Get Windows Terminal Preview](https://www.microsoft.com/en-us/p/windows-terminal-preview/9n8g5rfz9xk3)

## Additional Profile Settings

```json
"colorScheme": "OneLight",
"fontFace": "Fira Code",
"fontSize": 11
```

## Additional Color Schemes

```json
{
  "name": "OneDark",
  "black": "#1e2127",
  "red": "#e06c75",
  "green": "#98c379",
  "yellow": "#d19a66",
  "blue": "#61afef",
  "purple": "#c678dd",
  "cyan": "#56b6c2",
  "white": "#abb2bf",
  "brightBlack": "#5c6370",
  "brightRed": "#e06c75",
  "brightGreen": "#98c379",
  "brightYellow": "#d19a66",
  "brightBlue": "#61afef",
  "brightPurple": "#c678dd",
  "brightCyan": "#56b6c2",
  "brightWhite": "#ffffff",
  "background": "#1e2127",
  "foreground": "#abb2bf",
  "cursorColor": "#aaaaaa"
},
{
  "name": "OneLight",
  "black": "#000000",
  "red": "#de3e35",
  "green": "#3f953a",
  "yellow": "#d2b67c",
  "blue": "#2f5af3",
  "purple": "#950095",
  "cyan": "#3f953a",
  "white": "#bbbbbb",
  "brightBlack": "#000000",
  "brightRed": "#de3e35",
  "brightGreen": "#3f953a",
  "brightYellow": "#44B4CC",
  "brightBlue": "#2f5af3",
  "brightPurple": "#a00095",
  "brightCyan": "#3f953a",
  "brightWhite": "#aaaaaa",
  "background": "#f9f9f9",
  "foreground": "#2a2c33",
  "cursorColor": "#aaaaaa"
},
```

# Shortcuts

| Shortcut                | Description                        |
| ----------------------- | ---------------------------------- |
| Win + Shift + S         | Screenshot                         |
| Win + Strg + Left/Right | Switch Desktop                     |
| Win + Strg + D          | Add Desktop                        |
| Win + Strg + F4         | Close Desktop                      |
| Hold titlebar and shake | Minimize all other windows         |
| Win + Number            | Open pinned Application on Taskbar |

# Other Settings

## Zeitleiste deaktivieren

- Datenschutz -> Aktivitätsverlauf
  - Windows meine Aktivitäten auf diesem PC sammeln lassen -> Muss der Haken entfernt werden
  - Kontoaktivitäten anzeigen -> Beim Benutzerkonto muss die Einstellung auf Aus stehen.]

Quelle: https://www.deskmodder.de/wiki/index.php?title=Zeitleiste_Timeline_deaktivieren_aktivieren_Windows_10

## Expose wsl2 server

Run everything as admin

Enable route: `netsh interface portproxy add v4tov4 listenport=3000 listenaddress=0.0.0.0 connectport=3000 connectaddress=172.18.96.43`

Disable route: `netsh interface portproxy delete v4tov4 listenport=3000 listenaddress=0.0.0.0`

Add inbound rule to Windows Firewall (Run `WF.msc`)
( - ( G r a 2   S c r i p t ) - )
&Utiles
.$iif(!$window(@Globales),Abrir "Globales"):_.open.global
.$iif(!$window(@Noticias),Abrir "Noticias"):_.open.notice
.-
.Post-it:_.Post-it
.Carpeta de descargas:run download\
.Carpeta de logs:run logs\
.Logs del sistema:run sislog\
.-
.Cambiar nick:nick $$?="Nuevo nick?"
.Nick al azar:nick $_.randomnick
.-
$iif(irc-hispano.org isin $server,Registrar nick/canal)
.Registrar nick:.msg NiCK register $$?="tu e-mail?"
.Registrar canal:if ($$?!="Necesitarás buscar 24 apoyos en menos de 7 días... además necesitas tener registrado el nick, Continuar?") { set %cregtemp2 $$?="Canal a registrar? (con #)" | set %cregtemp3 $$?*="Escriba password de fundador" | set %cregtemp4 $$?="Introduzca una pequeña descripcion del canal" | .msg creg registra %cregtemp2 %cregtemp3 %cregtemp4 | unset %cregtemp* }
Comandos simples
.Whois a ti:whois $me
.Canales
..Entrar a canal:join $$?="Introduce nombre de canal (con #):"
..Salir de canal:part $$?="Introduce nombre de canal (con #):"
..Ver nicks de un canal:names $$?="Introduce nombre del canal (con #):"
..Listar Canales:list
.Usuarios
..Privado a un usuario:query $$?="Introduce nick:"
..Enviar notice:notice $$?="Introduce nick:" $$?="Introduce mensaje:"
..Whois usuario:whois $$?="Introduce nick:"
..Invitar usuario:invite $$?="Introduce nick:" $$?="Introduce canal: (debe estar vacío o debes tener @)"
.CTCP
..Ping:ctcp $$?="Introduce nick:" ping
..Time:ctcp $$?="Introduce nick:" time
..Version:ctcp $$?="Introduce nick:" version
..Page:ctcp $$?="Introduce nick:" page
.Ignorar
..Poner Ignorar:ignore $$?="Introduce nick:"
..Quitar Ignorar:ignore -r $$?="Introduce nick:"
.Notify
..Añadir en notify:notify $$?="añadir a?"
..Quitar de notify:notify -r $$?="quitar a?"
.-
.Invitar a un canal:invite $$?="Nick?" $$?="Canal? (con #)"
-
Away:_.awayrun
Info Servidor
.Estado:lusers
.Lista de usuarios:who *
.Mensaje del día:motd
.Hora:time
.Ver server linkados:map
-
Utilidades
.$iif(!$window(@MemMon),Monitor de Memoria):_.memmon
.Envía [SMS]:_.smssender
.MP3 Player:_.player
.Scan de puertos
..Scanear puertos clave:if (!$window(@Portscanner)) { window -ak +l @Portscanner @Portscanner | echo @Portscanner Scanner de puertos } | var %tmp $$?="IP?" | if (!%tmp) return | _.portscanner %tmp 21 23 25 53 59 79 80 110 113 119 | _.portscanner %tmp 135 1080 1503 1720 6667 6699 8080 12345 20034 
..Scanear otro puerto:if (!$window(@Portscanner)) { window -ak +l @Portscanner @Portscanner | echo @Portscanner Scanner de puertos } | _.portscanner $$?="IP?" $$?="Puerto?"
..-
..Scan tu PC (clave):_.scanportwin | _.scanport
..Scan tu PC (otro):set %muesaline no | _.scanportwin | var %tmp $$?="Puerto a scanear?" | if (!%tmp) return | aline 12 @Autoscan $timestamp Scaneando puerto %tmp | _.soport %tmp
.Telnet:if (!$window(@Telnet)) window -ek @Telnet @Telnet | sockclose Telnet | set %telnetip $$?="IP?" | set %telnetport $$?="Puerto?" | telnet %telnetip %telnetport | unset %telnetip %telnetport
.Lector de logs:_.logger
Configurar
.General:_.confscript
.[SMS] Notify:_.smsconfig
-
Publicidad del script
.En un canal de los que estás:if (!$server) { echo -s $_.rs(ERROR) Debes estar conectado para hacer eso | halt } | msg $$?="Canal? (con #)" $_.publi
.En todos los canales que estás:if (!$server) { echo -s $_.rs(ERROR) Debes estar conectado para hacer eso | halt } | amsg $_.publi
Abrir otro Gra2 Script:run $mircexe
-
$iif(%cfg.especial == si,Especial)
.Accion predefinida (a realizar a determinada hora)
..Enviar mensaje
...A nick:.timer -o $$?="A que hora deseas enviar el mensaje? (según tu reloj de windows)" 1 1 toyvivo $chr(124) msg $$?="Nick?" $$?="Mensaje a enviar? (puedes realizar infinitas acciones prefijadas)" 
...A canal:.timer -o $$?="A que hora deseas enviar el mensaje? (según tu reloj de windows)" 1 1 toyvivo $chr(124) msg $$?="Canal? (con #)" $$?="Mensaje a enviar? (puedes realizar infinitas acciones prefijadas)"
..Ctcp
...A nick:.timer -o $$?="A que hora deseas enviar CTCP? (según tu reloj de windows)" 1 1 toyvivo $chr(124) ctcp $$?="Nick? (puedes realizar infinitas acciones prefijadas)" $$?="Mensaje CTCP? (finger, version, ping, time....)"
...A canal completo:.timer -o $$?="A que hora deseas enviar CTCP? (según tu reloj de windows)" 1 1 toyvivo $chr(124) ctcp $$?="Canal? (con #) (puedes realizar infinitas acciones prefijadas)" $$?="Mensaje CTCP? (finger, version, ping, time....)"
..-
..Salir de canal:.timer -o $$?="A que hora deseas salir del canal? (según tu reloj de windows)" 1 1 toyvivo $chr(124) part $$?="Canal? (con #)" $$?="Mensaje de salida? (puedes realizar infinitas acciones prefijadas)"
..Entrar a canal:.timer -o $$?="A que hora deseas entrar al canal? (según tu reloj de windows)" 1 1 toyvivo $chr(124) join $$?="Canal? (con #) (puedes realizar infinitas acciones prefijadas)"
..-
..Cambiar Nick:.timer -o $$?="A que hora deseas Cambiar nick? (según tu reloj de windows)" 1 1 toyvivo $chr(124) nick $$?="Nick? (puedes realizar infinitas acciones prefijadas)"
..Desconectar del IRC:.timer -o $$?="A que hora deseas desconectar? (según tu reloj de windows)" 1 1 toyvivo $chr(124) quit $$?="Mensaje de desconexion? (puedes realizar infinitas acciones prefijadas)"
..-
..Otro comando:.timer -o $$?="A que hora deseas ejecutar? (según tu reloj de windows)" 1 1 $$?="Comando y parametros? (puedes realizar infinitas acciones prefijadas)"
.Conversor Glines/Hora
..¿Que es esto?:_.help.convg
..-
..Gline -> hora:_.convergh
..Hora -> gline:_.converhg
-
Acerca de Gra2 Script:about
-
Buscar nueva versión:_.actualizer

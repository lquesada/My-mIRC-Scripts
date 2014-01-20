;                                     <<<Gra2 ScRiPt>>> by LZ
$iif($server,Servidor)
.Ver G-lines:stats g
.Ver O-lines:stats o
.Estado:lusers
.Lista de usuarios:who *
.Mensaje del día:motd
.Hora:time
.Ver server linkados:links
.Mapa de servers:map
$iif($server,Ver nicks de un canal):names $$?="Introduce nombre del canal (con #):"
$iif($server,Entrar a un canal):j $$?="introduce nombre del canal"
$iif($server,Otros)
.Whois:whois $$?="Introduce nick:"
.Privado:query $$?="Introduce nick:"
.Cambiar de nick:nick $$?="Introduce nuevo nick:"
.Listar Canales:list
-
$iif($server,Salir de IRC):quit
$iif($server,Salidas divertidas)
.Connection reset by peer:!quit Read error to $me $+ [ $+ $wildtok($address($me,5),*,2,64) ] Connection reset by peer.
.Write error, Closing Link:!quit Write error, Closing link.
.Spectrum error:!quit Spectrum error, resetting.
.%$%øÐÆ¶:!quit [%!·&(=")·Äî+Vi_£ùøÐÆ¶] $me error, reset by §+. 
.Autodestruccion:!quit 0,1[AUTODESTRU15,1CTION ORDER RECEIV14,1ED... DISCONECTING BRAIN]
.Bomba(10 secs):ame 4,1Se Va a auToDe5STRuiR CoN eL $_.smbsc(comp) 7Autodestruccion activada [4107Secs] | .timerautodesc1 1 5 ame 4,1Va a Re5VeNTaR eN7[457Secs] | .timerautodesc2 1 10 !quit 7[407Secs]4 BOOOOOOOOOOOOOOOOOOOOOOM!!!, $me ReVieNTa LLeNaNDoLo ToDo De SaNGRe.... $_.smbsc(comp) en %scriptweb
$iif(!$server,NO CONECTADO):halt
-
Limpiar pantalla:clear

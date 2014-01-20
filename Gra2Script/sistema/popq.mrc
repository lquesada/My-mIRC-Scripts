;                                     <<<Gra2 ScRiPt>>> by LZ
Grabar
.Comenzar:log on
.Parar:log off
-
InfoCentral:uwho $$1
Whois:whois $$1
Whois (Idle):whois $$1 $$1
-
Ignorar:ignore $$1
-
CTCP
.Ping:ctcp $$1 ping
.Time:ctcp $$1 time
.Version:ctcp $$1 version
DCC
.Send:dcc send $$1
.Chat:dcc chat $$1
Limpiar Pantalla:clear
-
MP3 Player:_.player
$iif(%cfg.chorras == si,Chorradas)
.Rasca y gana:say 11,1 [ 10Rasca y gana 11]  --->>>14,14 $$?="Introduce el texto que quieres que aparezca al rascar" <<<--- 4  $_.smbsc(comp)
.Chiste al azar:say $_.smbsc $read($findfile(sistema\chistes,*,$rand(1,$findfile(sistema\chistes,*,0))))
.Bebida
..Cocacola:say 6 $+ $$1 $+ 12 te invito a una 0,4[Cocacola]12 12 :)
..Pepsi:say 6 $+ $$1 $+ 12 te invito a una 0,4[Pepsi]12 12 :)
..SevenUp:say 6 $+ $$1 $+ 12 te invito a un 0,3[SevenUp]12 12 :)
..Sprite:say 6 $+ $$1 $+ 12 te invito a un 0,3[Sprite]12 12 :)
..Café:say 6 $+ $$1 $+ 12 te invito a un cafe: 0c0,5[_]12 12 :)
.Tonterías
..Vaso de agua:say 6 $+ $$1 $+ 12 como este año hay sequía... te invito a un 11,12[Vaso de agua]12 pero no te lo bebas todo.. eh?
..Dedicar dedicatoria:say 6 $+ $$1 $+ 12 como no tengo nada mas... te dedico esta dedicatoria 12 xDD
..Barranco:say 6 $+ $$1 $+ 12 tirate por un barranco... un millón de lemmings no pueden estar equivocados 12 :-Þ
..Moscas:say 6 $+ $$1 $+ 12 come mierda... un millón de moscas no pueden estar equivocadas 12 :-Þ
..Explota!:say 6 $+ $$1 $+ 12 revienta! 2.000.000 de Lemmings no pueden estar equivocados...
.Varios
..Tabaco:_.asc tabaco $$1
..Corazón:_.asc corazon $$1
.Insultos
..Melón:_.asc melon $$1
..Ratas:_.asc ratas $$1
-
$iif(%cfg.especial == si,Especial)
.Accion predefinida (hacia ESTE nick)
..Enviar mensaje:.timer -o $$?="A que hora deseas enviar el mensaje a ESTE nick? (según tu reloj de windows)" 1 1 toyvivo $chr(124) msg $_.igg($active) $$?="Mensaje a enviar? (puedes realizar infinitas acciones prefijadas)"
..Ctcp:.timer -o $$?="A que hora deseas enviar CTCP a ESTE nick? (según tu reloj de windows)" 1 1 toyvivo $chr(124) ctcp $_.igg($active) $$?="Mensaje CTCP? (finger, version, ping, time....)"
..-
..Cambiar Nick:.timer -o $$?="A que hora deseas Cambiar nick? (según tu reloj de windows)" 1 1 toyvivo $chr(124) nick $$?="Nick? (puedes realizar infinitas acciones prefijadas)"
..Desconectar del IRC:.timer -o $$?="A que hora deseas desconectar? (según tu reloj de windows)" 1 1 toyvivo $chr(124) quit $$?="Mensaje de desconexion? (puedes realizar infinitas acciones prefijadas)"
..-
..Otro comando:.timer -o $$?="A que hora deseas ejecutar? (según tu reloj de windows)" 1 1 toyvivo $chr(124) $$?="Comando y parametros? (puedes realizar infinitas acciones prefijadas)"
-
Publicidad del script:say $_.publi
-
Cerrar todos los privados:f12

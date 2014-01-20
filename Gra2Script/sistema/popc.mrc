;                                     <<<Gra2 ScRiPt>>> by LZ
Grabar
.Comenzar:log on
.Parar:log off
$iif($me isop # || $me ishop #,Estilos de topic)
.Caritas:topic # $_.tpm(caritas)
.Arcoiris rojo:topic # $_.tpm(arcorojo) 
.Escala Blanco y negro:topic # $_.tpm(escbn)
.Verde y negro:topic # $_.tpm(vernegro)
.Tiritas:topic # $_.tpm(tiritas)
.Agujeritos grises:topic # $_.tpm(agugrises)
.Flores:topic # $_.tpm(flores) 
.Dormido...:topic # $_.tpm(dormido)
$iif($me isop #,Ops)
.Mensaje a todos los @ del canal:omsg $$?="Mensaje?"
.Notice a todos los @ del canal:onotice $$?="Mensaje?"
Ver/Cambiar topic y modos:channel
Invitar a este canal:invite $$?="Nick?" #
-
Mensaje a seleccionados:msg $snicks(#,0) $$?="Mensaje?"
Notice a seleccionados:notice $snicks(#,0) $$?="Notice?"
ctcp a seleccionados:ctcp $snicks(#,0) $$?="ctcp?"
-
$iif(%cfg.chorras == si,Chorradas)
.$iif($me isop # || $me ishop #,Kick aleatorio):!kick # $iif($me isop #,$nick(#,$rand(1,$nick(#,0))),$opnick(#,$rand(1,$opnick(#,0)))) KiCK aLeaToRio ---> $_.smbsc(comp) <---
.-
.Nombrar a todos:{ set %tm.1 2  | set %tm.2 1 | set %tm.3 $nick(#,0) | while (%tm.2 <= %tm.3) { if ($nick(#,%tm.2) != $me) { set %tm.1 %tm.1 $nick(#,%tm.2) } | inc %tm.2 | if ($len(%tm.1) >= 300) { say %tm.1 | set %tm.1 2 } } | say %tm.1 $_.smbsc | unset %tm.1 %tm.2 %tm.3 }
.Buenas + Nombrar a todos:{ set %tm.1 2Buenas,  | set %tm.2 1 | set %tm.3 $nick(#,0) | while (%tm.2 <= %tm.3) { if ($nick(#,%tm.2) != $me) { set %tm.1 %tm.1 $nick(#,%tm.2) } | inc %tm.2 | if ($len(%tm.1) >= 300) { say %tm.1 | set %tm.1 2 } } | say %tm.1 $_.smbsc | unset %tm.1 %tm.2 %tm.3 }
.Adios + Nombrar a todos:{ set %tm.1 2Adios,  | set %tm.2 1 | set %tm.3 $nick(#,0) | while (%tm.2 <= %tm.3) { if ($nick(#,%tm.2) != $me) { set %tm.1 %tm.1 $nick(#,%tm.2) } | inc %tm.2 | if ($len(%tm.1) >= 300) { say %tm.1 | set %tm.1 2 } } | say %tm.1 $_.smbsc | unset %tm.1 %tm.2 %tm.3 }
.-
.Rasca y gana:say 11,1 [ 10Rasca y gana 11]  --->>>14,14 $$?="Introduce el texto que quieres que aparezca al rascar" <<<--- 4  $_.smbsc(comp)
.Café:say 0c0,5[_] 0c0,3[_] 0c0,2[_] Café para todo el canal 0c0,5[_] 0c0,3[_] 0c0,2[_]
.-
.Chiste al azar:say $_.smbsc $read($findfile(sistema\chistes,*,$rand(1,$findfile(sistema\chistes,*,0))))
Juegos
.Desactiva todos:_.parajuegos
.-
.3 en raya
..Poner:_.parajuegos | _.tresya #
..Parar:if (%tres == si) { if ($server) { _.tresend } | else { _.tresendstart } }
.Ruleta rusa
..Poner:_.parajuegos | _.rusastart #
..Parar:if (%rusa == si) { if ($server) { _.rusaend } | else { _.rusaendstart } }
-
Salir del canal:part # $iif($?="Motivo de la salida?",$ifmatch,$_.rquit)
Salir y entrar:hop $_.rquit
Limpiar Pantalla:clear
-
MP3 Player:_.player
$iif(%cfg.especial == si,Especial)
.Accion predefinida (hacia ESTE canal)
..Enviar mensaje:.timer -o $$?="A que hora deseas enviar el mensaje a ESTE canal? (según tu reloj de windows)" 1 1 { toyvivo $chr(124) msg # $$?="Mensaje a enviar? (puedes realizar infinitas acciones prefijadas)" }
..Ctcp:.timer -o $$?="A que hora deseas enviar CTCP a ESTE canal? (según tu reloj de windows)" 1 1 { toyvivo $chr(124) ctcp # $$?="Mensaje CTCP? (finger, version, ping, time....)" }
..-
..Salir de canal:.timer -o $$?="A que hora deseas salir del canal? (según tu reloj de windows)" 1 1 { toyvivo $chr(124) part # (con #)" $$?="Mensaje de salida? (puedes realizar infinitas acciones prefijadas)" }
..-
..Cambiar Nick:.timer -o $$?="A que hora deseas Cambiar nick? (según tu reloj de windows)" 1 1 { toyvivo $chr(124) nick $$?="Nick? (puedes realizar infinitas acciones prefijadas)" }
..Desconectar del IRC:.timer -o $$?="A que hora deseas desconectar? (según tu reloj de windows)" 1 1 { toyvivo $chr(124) quit $$?="Mensaje de desconexion? (puedes realizar infinitas acciones prefijadas)" }
..-
..Otro comando:.timer -o $$?="A que hora deseas ejecutar? (según tu reloj de windows)" 1 1 { toyvivo $chr(124) $$?="Comando y parametros? (puedes realizar infinitas acciones prefijadas)" }
-
Publicidad del script:msg # $_.publi

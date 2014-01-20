;                                     -(Gra2 ScRiPt)- by LZ

dialog chancent {
  title --(Gra2 ScRiPt)-- Central de canales
  size -1 -1 200 103
  option dbu
  list 1, 5 5 135 106
  button  "Entrar", 2, 145 5 50 15
  button  "Añadir", 3, 145 25 50 15
  button  "Borrar", 4, 145 45 50 15
  button  "Cerrar", 600, 145 85 50 15, ok 
}
dialog Actualizer {
  option pixel
  size -1 -1 315 197
  title Gra2 Script -> Buscar última versión
  button ,1,-111 -111 1 1
  edit Desconectado,8,125 17 180 19,read
  button Conectar,9,4 28 108 41
  list 10,125 37 181 150,read
  box Info,11,120 3 192 187
  button URL 1,12,4 74 108 27,hide
  button Cerrar,13,4 137 108 41,cancel
  button URL 2,14,4 105 108 27,hide
  text V. Actual: [ %scriptver ],15, 16 11 110 13
}
dialog about { 
  check ., 600, -50 -50 1 1
  title --(Gra2 ScRiPt)-- %scriptver por LZ
  size -1 -1 200 200
  option dbu
  icon 8, -5 39 32 32, sistema\Gra2.bmp, 1
  icon 9, 172 39 32 32, sistema\Gra2.bmp, 1
  text --(Gra2 ScRiPt)-- %scriptver para mIRC %mircvers, 1, 49 2 110 10
  text "Preparado para IRC-Hispano", 2, 60 10 90 10
  text "PROHIBIDO COPIAR CODIGO SIN LA AUTORIZACION DEL AUTOR", 3, 15 170 170 10
  box "Importante", 50, 10 100 180 65
  text "Si teneis dudas con respecto al script, entrad al canal", 45, 15 110 180 7
  text "#Gra2Script de iRC-Hispano y preguntad por privado a algún", 46, 15 117 180 7
  text "op del mismo (alguien con @ :PP). Agradecimientos a los betatesters:", 47, 15 124 180 7
  text "Bladun, Elfrond, nitrogen, wolse, womad. (orden alfabético)", 48, 15 131 180 7
  text "Gracias por usar --(Gra2 ScRiPt)--", 49, 15 145 180 7
  icon 7, -50 -14 300 150, sistema\gra2about.jpg, 1, noborder
  button "WEB DEL SCRIPT", 5, 50 180 50 15, ok 
  button  "OK", 100, 100 180 50 15, ok 
}
dialog SMSSend {
  option pixel
  size -1 -1 144 99
  title [SMS]
  text Número,8,3 8 39 13
  edit ,9,44 5 98 19,AutoHS
  box Mensaje,10, 1 28 142 44
  edit ,11,5 44 133 19,AutoHS, limit 130
  button Enviar,500,1 75 54 21,cancel
  button Cancelar,501,88 75 54 21,cancel
}
dialog confscript {
  title --(Gra2 ScRiPt)-- %scriptver CONFIGURACION --[F7]--
  icon Gra2.ico,0
  size -1 -1 210 200
  option dbu
  tab General, 100, 1 1 207 170
  button ., 1, -50 -50 1 1,ok
  box Protecciones, 102, 3 20 100 44, tab 100
  check Proteccion anti con/con y ATH0, 103, 5 29 90 7, tab 100
  check Proteccion anti DCC Locker, 104, 5 36 90 7, tab 100
  check Proteccion anti troyanos, 105, 5 43 90 7, tab 100
  check Proteccion anti Fake DCC, 106, 5 50 90 7, tab 100
  box Mostrar, 202, 3 64 100 106, tab 100
  check Menú "Chorradas" en click derecho, 203, 5 73 95 7, tab 100
  check Menú "Especial" en click derecho, 204, 5 80 90 7, tab 100
  check Ventana "Noticias" al arrancar, 205, 5 87 90 7, tab 100
  check Ventana "Globales" al arrancar, 206, 5 94 90 7, tab 100
  check Mostrar tu nick e IP al entrar a canal, 207, 5 101 95 7, tab 100
  check Mostrar Peticiones IDENTD, 208, 5 108 90 7, tab 100
  check Ignorar Kills por nick registrado, 209, 5 115 90 7, tab 100
  check Mostrar @%+ cuando hablan, 210, 5 122 90 7, tab 100
  check Central de canales al conectar, 211, 5 129 90 7, tab 100
  check Monitor de memoria al inicio, 212, 5 136 90 7, tab 100
  check Texto en estado cuando te nombran, 213, 5 143 95 7, tab 100
  check Notify en ventana activa, 214, 5 150 95 7, tab 100
  check Mostrar away's en querys, 215, 5 157 95 7, tab 100
  box Sonidos, 302, 106 85 100 85, tab 100 
  check Sonido cuando te abren privado, 303, 108 94 95 7, tab 100
  check Sonido cuando mencionan tu nick, 304, 108 101 90 7, tab 100
  check Sonido en globales, 305, 108 108 90 7, tab 100
  check Sonido al arrancar el script, 306, 108 115 90 7, tab 100
  check Sonido al conectar, 307, 108 122 90 7, tab 100
  check Sonido en desconexion, 308, 108 129 90 7, tab 100
  check Sonido en @p, 309, 108 136 90 7, tab 100
  check Sonido en De@p, 310, 108 143 90 7, tab 100
  check Sonido en Notify, 311, 108 150 90 7, tab 100
  check Sonido en Kick, 312, 108 157 90 7, tab 100
  box Automatizaciones, 402, 106 20 100 65, tab 100 
  check Reentrar si te kickean, 408, 108 29 65 7, tab 100
  check Autoopearte en DEOP, 420, 108 36 75 7, tab 100
  check Autodeopear a quien te DEOPEA, 421, 108 43 90 7, tab 100
  check Autodesbanearte, 409, 108 50 75 7, tab 100
  check Autodeopear a quien te BANEA, 422, 108 57 90 7, tab 100
  tab Autoident, 200
  box IRC-Hispano, 550, 106 20 100 150, tab 200
  check Autoident IRC-Hispano 1, 410, 108 29 72 7, tab 200
  text Nick:, 411, 109 36 30 7, tab 200
  text Contraseña:, 412, 154 36 30 7, tab 200
  edit , 413, 108 43 40 10, tab 200
  edit , 414, 153 43 40 10, tab 200, pass
  check Autoident IRC-Hispano 2, 560, 108 55 72 7, tab 200
  text Nick:, 561, 109 62 30 7, tab 200
  text Contraseña:, 562, 154 62 30 7, tab 200
  edit , 563, 108 69 40 10, tab 200
  edit , 564, 153 69 40 10, tab 200, pass
  check Autoident IRC-Hispano 3, 570, 108 81 72 7, tab 200
  text Nick:, 571, 109 88 30 7, tab 200
  text Contraseña:, 572, 154 88 30 7, tab 200
  edit , 573, 108 95 40 10, tab 200
  edit , 574, 153 95 40 10, tab 200, pass
  check Autoident IRC-Hispano 4, 580, 108 107 72 7, tab 200
  text Nick:, 581, 109 114 30 7, tab 200
  text Contraseña:, 582, 154 114 30 7, tab 200
  edit , 583, 108 121 40 10, tab 200
  edit , 584, 153 121 40 10, tab 200, pass
  check Autoident IRC-Hispano 5, 590, 108 133 72 7, tab 200
  text Nick:, 591, 109 140 30 7, tab 200
  text Contraseña:, 592, 154 140 30 7, tab 200
  edit , 593, 108 147 40 10, tab 200
  edit , 594, 153 147 40 10, tab 200, pass
  tab Canales, 602
  box "Al conectar entrar a...", 603, 3 20 203 65, tab 602
  text "#", 611, 5 32 40 10, tab 602  
  edit , 621,  10 30 90 10, tab 602
  text "#", 612, 5 41 40 10, tab 602  
  edit , 622,  10 39 90 10, tab 602
  text "#", 613, 5 50 40 10, tab 602  
  edit , 623,  10 48 90 10, tab 602
  text "#", 614, 5 59 40 10, tab 602  
  edit , 624,  10 57 90 10, tab 602
  text "#", 615, 5 68 40 10, tab 602  
  edit , 625,  10 66 90 10, tab 602
  text "#", 616, 105 32 40 10, tab 602  
  edit , 626,  110 30 90 10, tab 602
  text "#", 617, 105 41 40 10, tab 602  
  edit , 627,  110 39 90 10, tab 602
  text "#", 618, 105 50 40 10, tab 602  
  edit , 628,  110 48 90 10, tab 602
  text "#", 619, 105 59 40 10, tab 602  
  edit , 629,  110 57 90 10, tab 602
  text "#", 620, 105 68 40 10, tab 602  
  edit , 630,  110 66 90 10, tab 602
  check Activo,631,10 75 90 10, tab 602
  box Proteccion, 632, 3 85 100 85, tab 602
  check Ajustar +nt al crear un canal, 423, 5 94 95 7, tab 602
  tab Skins, 700
  button "Original",701, 8 20 50 15, tab 700
  icon 704, 8 36 50 90, sistema\skins.jpg,1,tab 700
  button "Listar",702, 8 130 50 15, tab 700
  button "Cargar",703, 8 150 50 15, tab 700
  list 799, 65 19 138 152, tab 700
  tab Varios, 800
  box IDENTD Spoof,801, 3 20 100 20, tab 800
  text Mask:, 802, 5 30 30 7, tab 800
  edit , 803, 20 28 40 10, tab 800,limit10,autoHS
  check Activo, 804, 63 30 30 7, tab 800
  box Color Smileys, 810, 106 20 100 47, tab 800 
  check "Normal", 811, 108 29 65 7, tab 800
  check "Ojos rojos, Boca naranja", 812, 108 36 75 7, tab 800
  check "Ojos rojos, Boca azul", 813, 108 43 90 7, tab 800
  check "Ojos rojos, Boca verde", 814, 108 50 75 7, tab 800
  check "Ojos azules, Boca verde", 815, 108 57 90 7, tab 800
  box Nick completion, 820, 3 40 100 112, tab 800
  check "Nada", 821, 5 49 65 7, tab 800
  check "Letra azul", 822, 5 56 65 7, tab 800
  check "___)", 823, 5 63 65 7, tab 800
  check "<(__)>", 824, 5 70 65 7, tab 800
  check "Blanco y negro", 825, 5 77 65 7, tab 800
  check "Rata", 826, 5 84 65 7, tab 800
  check "Pez", 827, 5 91 65 7, tab 800
  check "Amarillo y azul", 828, 5 98 65 7, tab 800
  check "Quill@", 829, 5 105 65 7, tab 800
  check "Sombreado", 830, 5 112 65 7, tab 800
  check "Personalizado", 831, 5 119 65 7, tab 800
  text Antes:,832,5 129 25 7,tab 800,right
  edit ,833,30 128 65 10,tab 800,autoHS,disabled
  text Después:,834,5 140 25 7,tab 800,right
  edit ,835,30 139 65 10,tab 800,autoHS,disabled
  box Ver nicks,836,106 67 100 47,tab 800
  check "Normal",837,108 76 65 7,tab 800
  check "Nada",838,108 83 65 7,tab 800
  check "Inferno",839,108 90 65 7,tab 800
  check "Paréntesis",840,108 97 65 7,tab 800
  check "Subrayado",841,108 104 65 7,tab 800

  box Otros,842,106 114 100 47,tab 800
  check "Away sin colores",843,108 123 65 7,tab 800
  check "Colorear URL's",844,108 130 65 7,tab 800

  button "Aplicar", 600, 105 180 50 15
  button "Cancelar", 601, 55 180 50 15, cancel
}

on *:DIALOG:Actualizer:sclick:12:if (%actualizer.url) run %actualizer.url
on *:DIALOG:Actualizer:sclick:14:if (%actualizer.patch) run %actualizer.patch
on *:DIALOG:confscript:sclick:701:{ set %skin normal | _.skinsel see stay }
on *:DIALOG:about:sclick:100:set %about %scriptver
on *:DIALOG:about:sclick:5:set %about %scriptver | run %scriptweb
on *:DIALOG:confscript:sclick:702:{ _.skinlst }
on *:DIALOG:confscript:sclick:703:{ if ($left($did(confscript,799,1).seltext,2) != ¿?) { set %skin $did(confscript,799,1).seltext | _.skinsel see } }
on *:DIALOG:Actualizer:sclick:13:_.act-dis remall
on *:DIALOG:Actualizer:sclick:9:{
  if (!$sock(Actualizer).status) {
    _.act-dis remall
    sockopen Actualizer $_.actualizerhere
    _.act-echo 1 Conectando... Espere
    did -r Actualizer 9
    did -r Actualizer 10
    did -a Actualizer 9 Desconectar
  }
  else _.act-dis
}
on *:DIALOG:SMSSend:init:0:_.mdx.asigna SMSSend | _.mdx. SetBorderStyle SMSSend 500,501 clientedge
on *:DIALOG:SMSSend:sclick:500:{
  if ($did(SMSSend,9) isnum) && ($len($did(SMSSend,9)) = 9) {
    if ($did(SMSSend,11)) _.smaster $did(SMSSend,9) $did(SMSSend,11) 
    else _.smsecho 4No ha introducido mensaje 
  }
  else _.smsecho 4Número de TLF incorrecto. 
}
on *:DIALOG:confscript:dclick:799:if ($left($did(confscript,799,1).seltext,2) != ¿?) { set %skin $did(confscript,799,1).seltext | _.skinsel see }
on *:DIALOG:chancent:sclick:4:did -d chancent 1 $$did(chancent,1).sel | _.svcchan
on *:DIALOG:chancent:sclick:3:did -a chancent 1 $$?="Canal a añadir? (con #)" | _.svcchan
on *:DIALOG:chancent:sclick:2:if ($server) j $$did(chancent,1,$did(chancent,1).sel).text | else echo 4 -s $_.rs(ERROR) Tienes que conectar primero
on *:DIALOG:chancent:dclick:1:if ($server) j $$did(chancent,1,$did(chancent,1).sel).text | else echo 4 -s $_.rs(ERROR) Tienes que conectar primero
on *:DIALOG:confscript:init:0:_.menuload muestra | _.skinlst | _.mdx.asigna confscript | _.mdx. SetBorderStyle confscript 600,601,701,702,703 clientedge
on *:DIALOG:confscript:sclick:1:halt
on *:DIALOG:confscript:sclick:*:{
  if (($did >= 811) && ($did <= 815)) { did -u confscript 811,812,813,814,815 | did -c confscript $did }
  if (($did >= 821) && ($did <= 831)) { 
    did -u confscript 821,822,823,824,825,826,827,828,829,830,831 
    did -c confscript $did 
    if ($did = 831) did -e confscript 833,835
    else did -b confscript 833,835
  }
  if (($did >= 837) && ($did <= 841)) { did -u confscript 837,838,839,840,841 | did -c confscript $did }
}



dialog SMSNot {
  option pixel
  size -1 -1 155 182
  title "[SMS] Notify"
  text SMS Notify,842,51 2 56 13
  box Configuración,843,3 16 149 127
  edit ,844,61 32 82 19,AutoHS
  text Enviar a:,845,15 35 43 13
  check Activo en AWAY,846,15 56 108 15
  check Guardar Log de envíos,847,15 77 130 16
  button Ver log,848,94 118 54 21,hide
  text 1 SMS cada,849,14 96 62 13
  edit ,850,77 92 21 19
  text mins,851,100 95 23 13
  button Aplicar,500,3 151 54 21,ok
  button Cancelar,501,97 151 54 21,cancel
}
on *:DIALOG:SMSNot:init:0:{
  if ($exists(sislog\sms.txt)) did -v SMSNot 848
  if (%smsad-away = si) did -c SMSNot 846 | if (%smsad-log = si) did -c SMSNot 847
  if (%smsad-tlfn) did -a SMSNot 844 %smsad-tlfn
  did -a SMSNot 850 $_.smsm
}
on *:DIALOG:SMSNot:sclick:848:if ($exists(sislog\sms.txt)) run sislog\sms.txt
on *:DIALOG:SMSNot:sclick:500:{
  set %smsad-tlfn
  if ($did(SMSNot,844) isnum) set %smsad-tlfn $iif($did(SMSNot,844),$ifmatch)
  if ($did(SMSNot,850) isnum) set %smsad-secs $iif($calc($did(SMSNot,850) * 60) >= 180,$calc($did(SMSNot,850) * 60),180)
  if ($did(SMSNot,847).state = 1) set %smsad-log si
  else set %smsad-log no
  if ($did(SMSNot,846).state = 1) set %smsad-away si
  else set %smsad-away no
  if (%smsad-tlfn) writeini -n sistema\config.ini SMSNot tlfn $ifmatch
  else remini sistema\config.ini SMSNot tlfn
  if (%smsad-secs) writeini -n sistema\config.ini SMSNot secs $ifmatch
  else remini sistema\config.ini SMSNot secs
  if (%smsad-log) writeini -n sistema\config.ini SMSNot log $ifmatch
  else remini sistema\config.ini SMSNot log
  if (%smsad-away) writeini -n sistema\config.ini SMSNot away $ifmatch
  else remini sistema\config.ini SMSNot away
}

;                                     -(Gra2 ScRiPt)- by LZ

_.err var %x $input(Error: $1-,516,Error)
_.notsav {
  remini sistema\config.ini notify
  var %x 1
  while (%x <= $notify(0)) {
    writeini sistema\config.ini notify $_-c1($notify(%x) $iif($notify(%x).note,$ifmatch,1))
    inc %x
  }
}
_.fk return sistema\kicks.dlt
_.fq return sistema\quits.dlt
_.fv return sistema\versions.dlt
_.rquit return $_.smbsc(short) 12 $+ %scriptweb $+  $read($_.fq)
F10 run $getdir
_.cidd. return $iif((!%cidd) || (@ isin %cidd) || (%cidd = ""),Gra2-165,%cidd)
_.cidd.in {
  if (+++ isin $1-) return
  unset %cidd.in
  if (%cfg.veridentd = si) echo $color(info) -s *** IDENTD $sock($1).ip $+ . Enviando: $_.cidd.
  sockwrite $1 $2 $+ , $4 : USERID : mIRC : $_.cidd.
  sockclose $1 
}
_.coloURL {
  set %y $1
  while ($wildtok(%y,http://???*,0,32)) { var %z $wildtok(%y,http://???*,1,32) | set %y $puttok(%y,12 $+ %z $+ ,$findtok(%y,%z,1,32),32) } 
  while ($wildtok(%y,www.???*,0,32)) { var %z $wildtok(%y,www.???*,1,32) | set %y $puttok(%y,12 $+ %z $+ ,$findtok(%y,%z,1,32),32) } 
  var %y1 %y
  unset %y
  return %y1
}
_.cidd.start if (($portfree(113)) && (%cidds = si)) socklisten cidd 113 | if (%cidds = no) sockclose cidd
_.open.notice {
  if (!$window(@Noticias)) set %notitext si
  window -hk +l @Noticias $calc($window(@mdi).w -400) $calc($window(@mdi).h -100) 200 100 @Noticias
  titlebar @Noticias del servidor
  font @Noticias 10 MS Serif
  if (%notitext = si) aline 12 @Noticias Noticias del servidor:
  window -a @Noticias
  unset %notitext
}
_.open.global { 
  if (!$window(@Globales)) set %globtext si
  window -ahk +l @Globales $calc($window(@mdi).w -200) $calc($window(@mdi).h -100) 200 100 @Globales
  font @Globales 10 MS Serif 
  if (%globtext = si) aline 12 @Globales Globales:
  window -a @Globales
  unset %globtext
}
_.mytitlebar return --(Gra2 Script)-- %scriptver
_.scanportwin { 
  if (!$window(@Autoscan)) { 
    window -k +l @Autoscan @Autoscan
    window -a @Autoscan 
    if (%muesaline != no) aline 12 @Autoscan $timestamp Scaneando puertos abiertos: 
    else unset %muesaline
  } 
}
_.actualizer {
  dialog $iif($dialog(Actualizer),-v,-md) Actualizer Actualizer
  if ($1 = now) {
    sockopen Actualizer $_.actualizerhere
    _.act-echo 1 Conectando... Espere
    did -r Actualizer 9
    did -r Actualizer 10
    did -a Actualizer 9 Desconectar
  }
}
_.taimtamp return 5 $+ $timestamp $+ 
_.actualizerhere return www.ayuda-es.net 80
F2 _.Post-it
_.Post-it {
  inc %Post-it-2 | var %Post-it-3 @Post-it- $+ %Post-it-2
  while ($window(%Post-it-3)) inc %Post-it-2 | var %Post-it-3 @Post-it- $+ %Post-it-2
  window -dhake +l %Post-it-3 -1 -1 200 200 @Post-it
  titlebar %Post-it-3 Notas rápidas
  unset %Post-it-2
}
F12 close -m
omsg omsg 12[4@12msg] $1-
onotice onotice 12[4@12notice] $1-
titlebar if ($left($1,1) != @) titlebar $1- | else if ($window($1)) titlebar $1-
Telnet { 
  if (!$window(@Telnet)) { 
    window -ek @Telnet @Telnet 
    window @Telnet sistema\iconos\dconn.ico 0
    titlebar @Telnet -[Desconectado]-
  }
  sockclose Telnet 
  sockopen Telnet $$1 $$2 
  echo @Telnet 2Conectando con $$1 por el puerto $$2 
  titlebar @Telnet -[Conectando con $$1 $+ : $+ $$2 ]-
}
_.act-echo {
  if ($1 = 0) { did -h Actualizer 12 | did -h Actualizer 14 }
  if ($1 = 1) { did -r Actualizer 8 | did -a Actualizer 8 $2- }
  if ($1 = 2) did -a Actualizer 10 $2-
  if ($1 = 3) { did -v Actualizer 12 | set %actualizer.url $2- }
  if ($1 = 4) { did -v Actualizer 14 | set %actualizer.patch $2- }
}
_.modenick {
  if ($2 isop $1) return @ $+ $2
  if ($2 ishop $1) return % $+ $2
  if ($2 isvo $1) return + $+ $2
  return $2
}
_.act-trok {
  if ($left($1,6) === ädûM¶>) _.act-echo 2 $right($1-,-6)
  if ($left($1,6) === ädûU¶>) _.act-echo 3 $right($1-,-6)
  if ($left($1,6) === ädûP¶>) _.act-echo 4 $right($1-,-6)
  if ($left($1,6) === ädûE¶\) { _.act-echo 1 Descarga Finalizada. | _.act-dis }
}
_.act-dis {
  sockclose Actualizer
  _.act-echo 1 Desconectado
  did -r Actualizer 9
  did -a Actualizer 9 Conectar
  if ($1 = remall) { 
    if ($dialog(Actualizer) = Actualizer) { did -h Actualizer 12 | did -h Actualizer 14 }
    unset %actualizer.patch %actualizer.url
  }
}
_.randomnick return Gra2- $+ $rand(0,9) $+ $rand(0,9) $+ $rand(0,9) $+ $rand(0,9) $+ $rand(0,9)
_.mlenv set %mide.lag.actual 0 | _.mlmu | ping :"L | .timermide.lag.suma -o 0 1 { inc %mide.lag.actual $chr(124) _.mlmu $chr(124) if (%mide.lag.actual = 30) || (%mide.lag.actual = 90) || (%mide.lag.actual = 160) || (%mide.lag.actual > 300) $chr(123) ping :"L $chr(125) }
_.awayrun { 
  if (%awayvar = 1) { set %awayvar 0 | _.noaw } 
  if (!$server) { 
    echo -s $_.rs(ERROR) Debes estar conectado para ponerte away 
    halt 
  } 
  set %awaymens $?="Mensaje de away?"
  if (!%awaymens) { 
    unset %awaymens 
    echo -s $_.rs(ERROR) Mensaje de away obligatorio.
    halt
  } 
  else { 
    _.siaw %awaymens
    set %awayvar 1 
  }
}
about dialog $iif($dialog(about),-v,-m) about about
_.chancentral { 
  if (!$dialog(chancent)) { 
    dialog -m chancent chancent
    _.lch 
  }
}
_.starttext { 
  if ($1 = clearh) clear -s
  if ($1 = clear) clear -s
  if ($2 != logogordo) {
    echo 4 -s $_.smbsc(comp) $+  %scriptver 1por LZ para mIRC32 %mircvers
    echo -s Bajalo de 12 $+ %scriptweb
    echo -s  
  }
  elseif ($3 = cargaconf) echo -s $str( ,30) 4Cargando configuración anterior
}
_.smssender dialog $iif($dialog(SMSSend),-v,-md) SMSSend SMSSend
_.smsconfig dialog $iif($dialog(SMSNot),-v,-md) SMSNot SMSNot
_.titlemove set %title-bar 1 | while ($len($_.mytitlebar) >= %title-bar) { .timersetbar $+ %title-bar -om 1 %title-bar $+ 00 titlebar $left($_.mytitlebar,%title-bar) | inc %title-bar } | unset %title-bar
_.settitlebar titlebar $_.mytitlebar $1-
_.smbsc {
  if ($1 = comp) return 3,1 -9-[10Gra2 Script9]-3- 
  if ($1 = short) return 3,1 -9-[10G29]-3- 
  return 3,1 -9-[10Gra29]-3- 
  ; Comp Antiguo: 7,12-(4Gra2 ScRiPt7)-
  ; Short Antiguo: 7,12-(4G27)-
  ; Def. Antiguo: 7,12-(4Gra27)-
}
_.mlmu _.settitlebar -[Lag: %mide.lag.actual $+ ]-
_.confscript dialog $iif($dialog(confscript),-v,-md) confscript confscript
_.siaw { 
  unset %timaway %smsad-noralles
  set %timaway $?="Tiempo entre anuncio y anuncio (en minutos)? minimo 15"
  if (!%timaway) || (%timaway = 0) || (%timaway !isnum) || (%timaway < 15) set %timaway 15
  if (%timaway > 1000) set %timaway 1000
  away $1- 
  ame $_.awcl(2[12Away2]-[4ON2]1 $1- 7 $+ $_.smbsc $+ ) | _.sawaymsg
  .TimerAWAY 0 $calc(%timaway *60) ame $ $+ _.awcl(2[12Away2]1 $remove($1-,|) 7 $+ $_.smbsc $+  $ $+ _.awtim) $chr(124) _.sawaymsg
  set %_.awtim $ctime
}
_.awtim return $duration($calc($ctime - %_.awtim),2)
_.awcl if (%cfg.awaycl = si) return $strip($1) | else return $1
_.asc {
  if ($1 = corazon) {
    .msg $active 4,4L0/¯¯¯\/¯¯¯\4G $+ $crlf $+ PRIVMSG $active :4,4L0|4WWWWW0|4G $+ $crlf $+ PRIVMSG $active :4,4L0\4WWWWll0/4G12  $+ $2
    .msg $active 4,4L-i0\4WiWWi0/4Lk $+ $crlf $+ PRIVMSG $active :4,4L---i0\4WW0/4GLff $+ $crlf $+ PRIVMSG $active :4,4L-----i0\_/4LWLk
    echo 5 -a > 4,4L0/¯¯¯\/¯¯¯\4G
    echo 5 -a > 4,4L0|4WWWWW0|4G
    echo 5 -a > 4,4L0\4WWWWll0/4G12  $+ $2
    echo 5 -a > 4,4L-i0\4WiWWi0/4Lk
    echo 5 -a > 4,4L---i0\4WW0/4GLff
    echo 5 -a > 4,4L-----i0\_/4LWLk
  }
  if ($1 = melon) {
    say 8,3/¯¯¯¯¯\3 $2 CaLLa Ya! MeLoooN!!
    say 8,3\_____/3
  }
  if ($1 = tabaco) describe $active da a $2 un 5,7[¯¯¯¯]1,0¯¯¯¯¯¯¯¯¯¯¯7|4||15~~
  if ($1 = ratas) say 14~~(__ ºº> ~~(__ ºº>12 $2 $+ , hasta las ratas huyen de ti! 14~~(__ ºº> ~~(__ºº>
}
_.noaw { 
  .TimerAWAY off 
  if ($server) {
    ame $_.awcl(2[12Away2]-[4OFF2]1 %awaymens $_.smbsc)
    away 
  }
  unset %awaymens 
  halt
}
_.tres.on { 
  _.trest 
  set %trespone 1 
  msg %trescanal 2 $+ %tres1jug $+ ... te toca, escribe: !pon NUMERO para poner ficha (ej: !pon 1) 
  halt 
}
_.publi return 3,1 -9-[10Gra2 Script %scriptver 'LZ9]-3-  12 $+ %scriptweb $+ 
_.lch { 
  if ($exists(sistema\canales.lis) = $false) return
  _.cllch 
  %tempchan = 1 
  set %tempchan3 $read(sistema\canales.lis,%tempchan)
  while (%tempchan3) { 
    did -a chancent 1 %tempchan3
    inc %tempchan 1
    set %tempchan3 $read(sistema\canales.lis,%tempchan)
  }
  unset %tempchan %tempchan3
  return
}
_.svcchan {
  set %chansavelines $did(chancent,1).lines
  set %chansavedline 1
  .remove sistema\canales.lis
  while %chansavelines >= %chansavedline {
    write sistema\canales.lis $did(chancent,1,%chansavedline).text
    inc %chansavedline
  }
  unset %chansavelines
  unset %chansavedline
}
_.cllch { 
  unset %tempchan3 
  unset %tempchan 
  unset %tempchan2 
}
_.mlll .timermide.lag.suma off | _.mlmu | .timermide.lag.reset -o 1 5 _.mlenv
_.tresya { 
  set %tres si
  set %tresponeO £ 
  set %tresponeX + 
  set %trescanal $1 
  set %tres.c1 1 
  set %tres.c2 2 
  set %tres.c3 3 
  set %tres.c4 4
  set %tres.c5 5 
  set %tres.c6 6 
  set %tres.c7 7 
  set %tres.c8 8 
  set %tres.c9 9 
  set %tresbuscaplayer 0 
  unset %tres1jug 
  unset %tres2jug 
  set %tressep 0,0i0,3 
  set %tresini 4> 0,3 
  set %tresiniend 4> 0,3 
  set %tresfin 4 < 
  unset %trespone 
  msg %trescanal 4Tres en raya, 2escribe !tres para jugar 
}
_.scanport { 
  _.scanports 9 11 13 15 21 23 25 53 59 79 
  _.scanports 80 110 113 119 135 137 138 139 1025 1080 
  _.scanports 1503 1720 3150 6667 6699 8080 12076 12345 20034 21554 
  _.scanports 31337 40426 54320
  echo 12 @AutoScan $timestamp Fin de Scan
  echo 2 @Autoscan Opciones: 15,15¤0,15(15,15l2Scanear15_2de15_2nuevo15,15l14,15)15,15¤ 15,15¤0,15(15,15l2Cerrar15,15l14,15)15,15¤ 
  unset %porttoscan 
  unset %porttoscane 
}
_.portscanner { 
  if (!$window(@Portscanner)) {
    window -ak +l @Portscanner @Portscanner
    echo @Portscanner Scanner de puertos
  }
  _.portscan $$1- 
}
_.scanports { 
  _.soport $$1 
  _.soport $$2
  _.soport $$3
  _.soport $$4
  _.soport $$5
  _.soport $$6
  _.soport $$7
  _.soport $$8
  _.soport $$9
  _.soport $$10
}
_.rs return 12[4 $+ $1- $+ 12]4
vaiteja {
  echo -s 4JAV Detecta nuke:
  echo -s 1,1___9,1Recibidos datos de aplicación externa:1,1___
  echo -s 1,1___3,1 $+ $1- $+ 1,1___
  return
}
op mode $chan +ooooo $$1 $2 $3 $4 $5 | mode $chan +ooooo $$6 $7 $8 $9 $10
dop mode $chan -ooooo $$1 $2 $3 $4 $5 | mode $chan -ooooo $$6 $7 $8 $9 $10
j if (!$1-) return | if ($left($1,1) = $chr(35)) join $1- | else join $chr(35) $+ $1-
p part $chan
n names $$1
w whois $$1-
k kick $chan $$1
toyvivo if (!$server) halt
q query $$1-
send dcc send $1 $2-
chat dcc chat $1
quit { 
  if ($1) quit $_.smbsc(short) 12 $+ %scriptweb $+  $1-
  else quit $_.rquit
}
sF3 if (%invited = si) { join -i | unset %invited }
F7 _.confscript
_.logger _.loggerc Window | _.loggerc Lista
_.lva { 
  if (%awayvar = 1) { 
    .TimerAWAY off 
    unset %_.awtim %awayvar %awaymens
    echo -s 4AWAY ACTIVADO... 3DESACTIVANDO 
  } 
} 
_.soport {
  set %porttoscan $1 
  set %porttoscane $readini(sistema\scanports.ini,Puertos,%porttoscan)
  if ($portfree(%porttoscan)) echo 3 @AutoScan $timestamp Puerto %porttoscan $+ ( $+ %porttoscane $+ ) cerrado
  else echo 4 @AutoScan $timestamp Puerto %porttoscan $+ ( $+ %porttoscane $+ ) abierto 
  unset %porttoscan 
  unset %porttoscane 
}
_.cservw {
  if ($window(@Redes)) { .timermueveRedes off | window -c @Redes }
  if ($window(@Servers)) window -c @Servers 
}
server _.cservw | server $1- | set %erronick 1
nick nick $1 | set %settednick $1 | writeini -n sistema\config.ini General Nick $_-c1(%settednick)
kick set %count.kicks $readini(sistema\config.ini,numeros,kicks) | inc %count.kicks | kick $1 $2 $_.smbsc $3- 4[05 $+ %count.kicks $+ 4] | writeini -n sistema\config.ini numeros kicks %count.kicks
_.lnserv set %servnum $readini(sistema\servidor.ini,%servidor.read,Numeroservidores)
_.trest { 
  if (%tres = si) { 
    msg %trescanal %tresini %tres.c1 %tressep %tres.c2 %tressep %tres.c3 %tresfin
    msg %trescanal %tresini %tres.c4 %tressep %tres.c5 %tressep %tres.c6 %tresfin 
    msg %trescanal %tresiniend %tres.c7 %tressep %tres.c8 %tressep %tres.c9 %tresfin 
  }
}
_.acbar { 
  if (!$window(@BARRA)) { 
    window -phk +dlt @BARRA 0 0 $window(@mdi).w 40 @BARRA 
    window -a @BARRA
  } 
  if ($exists(%skin.bartile)) drawpic -lsn @BARRA 0 0 $window(@mdi).w 40 " $+ %skin.bartile $+ "
  drawpic @BARRA 0 0 " $+ $iif((%skin.barnorm) && ($exists(%skin.barnorm)),%skin.barnorm,sistema\barra.jpg) $+ "
  if (irc-hispano.org isin $server) { drawpic @BARRA 0 0 $iif((%skin.barhisp) && ($exists(%skin.barhisp)),%skin.barhisp,sistema\hisbar.jpg) }
  if (($server) && (irc-hispano.org !isin $server)) drawpic @BARRA 0 0 $iif($exists(%skin.barotra),%skin.barotra,sistema\otrabar.jpg)
}
_.stmod mode $me +sw
_.trescmp { 
  if ($1 = $2 && $1 = $3) { 
    if ($1 = %tresponeO) { msg %trescanal 4Gana %tres2jug $+ !!!! | _.tresend }
    if ($1 = %tresponeX) { msg %trescanal 4Gana %tres1jug $+ !!!! | _.tresend }
  }
}
_.convergh var %tmp $$?="Numero de G-Line?" | if (!%tmp) return | echo -s 3Gline: %tmp Fecha: $asctime( %tmp )
_.utmp1 set %servlist 0 | unset %tempserver | unset %templinea | unset %temptexto
_.utmp1t set %servlistt 0 | unset %servlisz | unset %tempservert | unset %templineat | unset %temptextot
_.converhg { 
  set %tmp.añog $$?="DOS ULTIMOS digitos del año? (ej:2000 = 00)" 
  set %tmp.mesg $$?="Numero del mes?" 
  set %tmp.diag $$?="Dia?" 
  set %tmp.horag $$?="Hora? (ej: 18:30)" 
  set %tmp.glinehora %tmp.diag $+ / $+ %tmp.mesg $+ / $+ %tmp.añog %tmp.horag
  echo -s 3Fecha: %tmp.diag $+ / $+ %tmp.mesg $+ / $+ %tmp.añog %tmp.horag Gline: $ctime(%tmp.glinehora) 4 $_.smbsc 
  unset %tmp.añog %tmp.mesg %tmp.diag %tmp.horag %tmp.glinehora
}
_.rusastart set %rusa si | set %rusacanal $1 | msg %rusacanal 4Ruleta rusa, 2escribe !boom para disparar
_.rusaend { 
  msg %rusacanal 4La ruleta rusa ha terminado
  unset %rusacanal
  unset %rusa
  .timerrecarga off
}
_.rusaendstart { 
  unset %rusacanal
  unset %rusa
  .timerrecarga off
}
_.help.convg { 
  echo -s - 
  echo -s 2Conversor Glines/hora 
  echo -s - 
  echo -s 12Cuando ponen un Gline a un usuario (Ban del servidor) aparecen unos 
  echo -s 12Numeros, por ejemplo 969078976, eso es una fecha, a este conversor 
  echo -s 12Introduces ese numero y te dá la fecha en formato tradicional o viceversa. 
  echo -s - 
}
_.tresendstart if (%tres = si) unset %tres %trescanal %tres.c1 %tres.c2 %tresponeO %tresponeX %tres.c3 %tres.c4 %tres.c5 %tres.c6 %tres.c7 %tres.c8 %tres.c9 %tresbuscaplayer %tres1jug %tres2jug %tressep %tresini %tresiniend %tresfin %trespone
_.tresend msg %trescanal 4El tres en raya ha terminado | unset %tres %trescanal %tres.c1 %tres.c2 %tresponeO %tresponeX %tres.c3 %tres.c4 %tres.c5 %tres.c6 %tres.c7 %tres.c8 %tres.c9 %tresbuscaplayer %tres1jug %tres2jug %tressep %tresini %tresiniend %tresfin %trespone | halt
notify {
  if ($1 = -r) { if ($2) remini sistema\config.ini notify $_-c1($2) }
  elseif ($left($1,1) != -) {
    if ($2) writeini -n sistema\config.ini notify $_-c1($1-)
    elseif ($1) writeini -n sistema\config.ini notify $_-c1($1) 1
  }
  notify $1-
}
_.notrld {
  window -hn @_.notrld
  writeini -n sistema\config.ini notify ~ READ
  loadbuf -tnotify @_.notrld sistema\config.ini 
  var %x 1
  while (%x <= $line(@_.notrld,0)) {
    if (($line(@_.notrld,%x) != ~=READ) && ($gettok($line(@_.notrld,%x),1,61))) {
      .notify $_-c2($gettok($line(@_.notrld,%x),1,61)) $iif($gettok($line(#_.notrld,%x),2,61) != 1,$ifmatch)
    }
    inc %x
  }
  remini sistema\config.ini notify ~
  window -c @_.notrld
}
_-c1 return $replace($1,[,<,],>)
_-c2 return $replace($1,<,[,>,])
_.skinlst {
  did -r confscript 799
  set %skin--list $findfile(skins\,*.ini,0)
  set %skin--act 1
  while (%skin--list >= %skin--act) {
    did -a confscript 799 $wildtok($nopath($findfile(skins\,*.ini,%skin--act)),*,1,46)
    inc %skin--act
  }
  if (%skin--list = 0) did -a confscript 799 ¿? -> No hay skins...
  unset %skin--list
  unset %skin--act
}
_.skinmst {
  var %skin--muestra $readini(%skin.temp.load,skin,$1)
  var %skin.exists- skins\ $+ %skin $+ \ $+ %skin--muestra
  var %skin.exists $exists(%skin.exists-)
  if ((%skin--muestra) && (%skin.exists)) return skins\ $+ %skin $+ \ $+ %skin--muestra
  else return $2
}
_.skinsel {
  if (%skin) {
    if ((%skin = normal) && ($2 = stay)) {
      writeini -n sistema\config.ini General Skin Normal
      if ($1 = see) {
        echo -s -
        echo -s $_.rs(SKIN) Restaurando Skin original 
        echo -s $_.rs(SKIN) Autor del skin original : LZ
        echo -s -
      }
      .background -l sistema\barrita.jpg
      .background -mt sistema\fondo.jpg
      .background -hx
      set %skin.inferior -hx
      set %skin.barnorm sistema\barra.jpg
      set %skin.barhisp sistema\hisbar.jpg
      set %skin.barotra sistema\gra2otra.jpg
      set %skin.over sistema\barover.jpg
      set %skin.bartile sistema\tile.jpg
      set %skin.mmon sistema\memmon.jpg
      _.acbar
      _.MemMon
    }
    else {
      set %skin.temp.load skins\ $+ %skin $+ .ini
      if ($exists(%skin.temp.load)) {
        writeini -n sistema\config.ini General Skin %skin
        if ($1 = see) {
          echo -s -
          echo -s $_.rs(SKIN) Instalando Skin " $+ %skin $+ "
        }
        if ($readini(%skin.temp.load,skin,autor)) {
          echo -s $_.rs(SKIN) Autor del skin " $+ %skin $+ " $+ : $readini(%skin.temp.load,skin,autor)
          echo -s -
        }
        else {
          echo -s $_.rs(SKIN) Autor del skin " $+ %skin $+ " $+ : LZ
          echo -s -
        }
        set %skin.barsupe $_.skinmst(superior,sistema\barrita.jpg)
        set %skin.fondo $_.skinmst(fondo,sistema\fondo.jpg)
        set %skin.barnorm $_.skinmst(normal,sistema\barra.jpg)
        set %skin.barotra $_.skinmst(gra2,sistema\otrabar.jpg)
        set %skin.barhisp $_.skinmst(hispano,sistema\hisbar.jpg)
        set %skin.estilofondo -m $+ $iif(!$readini(%skin.temp.load,skin,estilofondo),t,$readini(%skin.temp.load,skin,estilofondo))
        set %skin.over $_.skinmst(over)
        set %skin.bartile $_.skinmst(tile)
        set %skin.inferior $_.skinmst(inferior,-hx)
        set %skin.mmon $_.skinmst(MemMon,sistema\memmon.jpg)
        _.acbar
        .background -l " $+ %skin.barsupe $+ "
        .background %skin.estilofondo " $+ %skin.fondo $+ "
        .background $iif(%skin.inferior = -hx,-hx,-h " $+ %skin.inferior $+ ")
        _.MemMon
      }
      unset %skin.temp.load
    }
  }
}
_.reload { 
  if (%nick != %scriptver) { 
    set %settednick $readini(sistema\config.ini,General,Nick)
    set %settednick $_-c2(%settednick)
    if (%settednick) { 
      if ($exists(sistema\config.ini)) { 
        set %smsad-tlfn $readini(sistema\config.ini,SMSNot,tlfn)
        set %smsad-secs $readini(sistema\config.ini,SMSNot,secs)
        set %smsad-log $readini(sistema\config.ini,SMSNot,log)
        set %smsad-away $readini(sistema\config.ini,SMSNot,away)
        _.starttext con logogordo cargaconf
        set %count.tlines $readini(sistema\config.ini,numeros,tlines)
        set %count.rlines $readini(sistema\config.ini,numeros,rlines)
        set %count.rdate $readini(sistema\config.ini,numeros,rdate)
        .nick %settednick 
        if ($me) set %nick %scriptver
        set %nickcomp $readini(sistema\config.ini,General,Completion)
        if ((!%nickcomp) || (%nickcomp = Mano)) { set %nickcomp Nada | writeini -n sistema\config.ini General Completion %nickcomp }
        if ($readini(sistema\config.ini,General,Skin)) {
          set %skin $readini(sistema\config.ini,General,Skin)
          _.skinsel
        }
        else {
          set %skin normal
          _.skinsel
        }
        _.menuload 
        _.notrld
        if (!$notify(0)) _.notrld
      }
    }
    else {
      set %settednick $$input(Introduce tu nick,129,--( iniciando Gra2 Script )--)
      set %nick %scriptver
      .nick %settednick
    }
    if ($me) { set %nick %scriptver | writeini -n sistema\config.ini General Nick %settednick }
    .anick $_.randomnick
  }
}
_.hid { 
  if ((!$1) && (%hispapass)) { .msg NiCK@deep.space identify %hispapass | echo -s 12IDENTIFICANDO | halt }
  if (($1 = dos) && (%hispapass2)) { .msg NiCK@deep.space identify %hispapass2 | echo -s 12IDENTIFICANDO | halt }
  if (($1 = tres) && (%hispapass3)) { .msg NiCK@deep.space identify %hispapass3 | echo -s 12IDENTIFICANDO | halt } 
  if (($1 = cuatro) && (%hispapass4)) { .msg NiCK@deep.space identify %hispapass4 | echo -s 12IDENTIFICANDO | halt }
  if (($1 = cinco) && (%hispapass5)) { .msg NiCK@deep.space identify %hispapass5 | echo -s 12IDENTIFICANDO | halt }
}
_.loggerc { 
  if ($1 = Window) { 
    if (!$window(@Lector)) { 
      window -Sl18kbe @Lector 70 60 600 350 @Lector
      window @Lector sistema\iconos\window.ico 0
      titlebar @Lector de logs
      echo @Lector Lector de Logs
    }
  }
  if (($1 = Carga) && ($window(@Lector))) { 
    clear @Lector
    var %x $2-
    while (\\ isin %x) var %x $replace(%x,\\,\)
    if (%x) loadbuf -p @Lector %x
  }
  if ($1 = Lista || $1 = Listasil) {
    set %numero.logoff 0 
    set %numero.logsoff $line(@Lector,0,1) 
    while (%numero.logsoff > %numero.logoff) { dline -l @Lector 1 | inc %numero.logoff }
    unset %numero.log*
    set %numero.logs $findfile($logdir,*,0)
    set %numero.log 1
    if (%numero.logs = 0) { echo @Lector No hay logs en la carpeta | unset %numero.log* | halt }
    while (%numero.log <= %numero.logs) {
      if (!$findfile($logdir,*,%numero.log)) { unset %numero.logs %numero.log %numero.logsoff %numero.logoff | halt }
      aline -l @Lector $nopath($findfile($logdir,*,%numero.log))
      inc %numero.log
    }
    if ($1 != Listasil) echo -e @Lector Logs cargados
    unset %numero.logs %numero.log %numero.logsoff %numero.logoff
  }
  if ($1 = remove) {
    set %numero.logslist $sline(@Lector,0) 
    set %numero.loglist 1 
    while (%numero.loglist <= %numero.logslist) { 
      if ($sline(@Lector,%numero.loglist)) { 
        echo @Lector Log: $sline(@Lector,%numero.loglist) borrado :) 
        set %x " $+ $logdir $+ \ $+ $sline(@Lector,%numero.loglist) $+ "
        while (\\ isin %x) set %x $replace(%x,\\,\)
        if (%x) .remove %x
      } 
      inc %numero.loglist 
    }
    unset %numero.loglist %numero.logslist 
    set %numero.logoff 0 
    set %numero.logsoff $line(@Lector,0,1) 
    while (%numero.logsoff > %numero.logoff) { dline -l @Lector 1 | inc %numero.logoff }
    unset %numero.log*
    set %numero.logs $findfile($logdir,*,0)
    set %numero.log 1
    if (%numero.logs = 0) { echo @Lector No hay logs en la carpeta | unset %numero.log* | halt }
    while (%numero.log <= %numero.logs) {
      if (!$findfile($logdir,*,%numero.log)) { unset %numero.logs %numero.log %numero.logsoff %numero.logoff | halt }
      aline -l @Lector $nopath($findfile($logdir,*,%numero.log))
      inc %numero.log
    }
    unset %numero.logs %numero.log %numero.logsoff %numero.logoff
  }
}
_.slist { 
  _.lnserv 
  _.utmp1t 
  if (!$window(@Redes)) { window -alk +l @Redes 500 120 140 200 @Redes | font @Redes 12 MS Sans Serif }
  else window -a @Redes
  if (!$window(@Servers)) { window -alk -t15 +l @Servers 200 120 300 200 @Servers | font @Servers 12 MS Sans Serif } 
  elseif ($1 != act) window -a @Servers
  clear @Servers 
  clear @Redes 
  .timermueveRedes -mo 0 200 .window -r @Redes $chr(36) $+ calc( $+ $chr(36) $+ window(@Servers).x + $chr(36) $+ window(@Servers).w) $chr(36) $+ window(@Servers).y 140 $chr(36) $+ window(@Servers).h
  set %red.num $readini(sistema\servidor.ini,Datos,Numeroredes)
  set %red.list 0
  while %red.num > %red.list { inc %red.list 1 | set %red.temp.list %red.list $+ Red | aline 15 @Redes $readini(sistema\servidor.ini,Datos,%red.temp.list) }
  unset %red.list %red.num %red.temp.list
  while %servlistt < %servnum { 
    inc %servlistt 1 
    set %temptextot %servlistt $+ Texto 
    set %tempservert Server 
    set %servlisz $calc(%servlistt - 1)
    set %servlisse %servlisz $+ :
    set %tempservdata $readini(sistema\servidor.ini,%servidor.read,%temptextot)
    set %tempservdata $replace(%tempservdata,>,	)
    if (%tempservdata) aline 15 @Servers 12 $+ %tempservdata
  } 
  _.utmp1t 
  unset %servlistt %servnum %servlisse %tempservdata
}
_.portscan { 
  echo 2 @Portscanner Scaneando IP  $+ $$1 $+ : Puertos: $$2- 
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$2 | sockopen %scannertempipport $$1 $$2 
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$3 | sockopen %scannertempipport $$1 $$3 
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$4 | sockopen %scannertempipport $$1 $$4
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$5 | sockopen %scannertempipport $$1 $$5
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$6 | sockopen %scannertempipport $$1 $$6 
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$7 | sockopen %scannertempipport $$1 $$7
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$8 | sockopen %scannertempipport $$1 $$8
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$9 | sockopen %scannertempipport $$1 $$9
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$10 | sockopen %scannertempipport $$1 $$10
  set %scannertempipport SCAN: $+ $$1 $+ : $+ $$11 | sockopen %scannertempipport $$1 $$11
  unset %scannertemp* 
}
_.tpm { 
  if ($1 = caritas) return 7(:-D)1 $input(Texto del topic?,129,--(TopiC)--) $+  7(D-:) 
  if ($1 = arcorojo) return 8,0|0,8|7,8|8,7|4,7|7,4|5,4|4,5|1,5|5,1| 9,1 $input(Texto del topic?,129,--(TopiC)--) $+ 9,1 5,1|1,5|4,5|5,4|7,4|4,7|8,7|7,8|8,0| 
  if ($1 = escbn) return 1,1W14,14i15,15i0,0i15,15i14,14i1,1i 0 $input(Texto del topic?,129,--(TopiC)--) 1,1i14,14i15,15i0,0i15,15i14,14i1,1W 
  if ($1 = vernegro) return 4,7->9,1 $input(Texto del topic?,129,--(TopiC)--) $+ 9,1 4,7<- 
  if ($1 = tiritas) return 0,7( : : : : ) (: : $input(Texto del topic?,129,--(TopiC)--) $+ 0,7 : : ) ( : : : : ) 
  if ($1 = agugrises) return 15,15 14( 0)15 14( 0)15 2 $input(Texto del topic?,129,--(TopiC)--) $+ 2,15 15 14( 0)15 14( 0)15 
  if ($1 = flores) return 3----{-----{4@ $input(Texto del topic?,129,--(TopiC)--) $+  4@3}-----}---- 
  if ($1 = dormido) return 1zZz2ZzZ12zZz7 $input(Texto del topic?,129,--(TopiC)--) 12zZz2zZz1zZz
}
_.trescom { 
  _.trescmp %tres.c1 %tres.c2 %tres.c3 | _.trescmp %tres.c4 %tres.c5 %tres.c6 | _.trescmp %tres.c7 %tres.c8 %tres.c9 | _.trescmp %tres.c1 %tres.c4 %tres.c7 
  _.trescmp %tres.c2 %tres.c5 %tres.c8 | _.trescmp %tres.c3 %tres.c6 %tres.c9 | _.trescmp %tres.c1 %tres.c2 %tres.c3 | _.trescmp %tres.c1 %tres.c5 %tres.c9 
  _.trescmp %tres.c7 %tres.c5 %tres.c3 
  if (%tres.c1 != 1 && %tres.c2 != 2 && %tres.c3 != 3 && %tres.c4 != 4 && %tres.c5 != 5 && %tres.c6 != 6 && %tres.c7 != 7 && %tres.c8 != 8 && %tres.c9 != 9) { msg %trescanal 4EMPATE!!!! | _.tresend }
}
_.parajuegos {
  if (%tres = si) { if ($server) _.tresend | else _.tresendstart }
  if (%rusa = si) { if ($server) _.rusaend | else _.rusaendstart }
}
_.ine if ((@* !iswm $1) && (Env. * !iswm $1) && (Rec * !iswm $1) && ($chr(32) !isin $1)) return $true

_.pnlb if ($numtok($1,32)) return $3 $+ $str($2,$numtok($1,32)) $1
_.pnlbo if ($numtok($1,32)) return $+(-,$str(o,$numtok($1,32)),+,$str(b,$numtok($1,32))) $1 $1

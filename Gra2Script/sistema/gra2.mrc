;                                     -(Gra2 ScRiPt)- by LZ






















alias _.mp3pver return 0.1
dialog mp3 {
  option pixel
  size -1 -1 150 18
  title MP3 $_.mp3pver Gra2 Script
  button ,1,-50 -50 -50 -50,cancel
  button ,2,-50 -50 -50 -50,cancel
  text Cerrar para parar el mp3,3,2 2 150 14
}
alias _.player {
  set %tmp.mp3 $iif($1-,$1-,$sfile($iif($exists(%tmp.mdir),%tmp.mdir,.).,> Elige el mp3,Tocar!))
  if (!%tmp.mp3) return
  if (!$exists(%tmp.mp3)) { _.err El fichero no existe. | return }
  if ($gettok(%tmp.mp3,$numtok(%tmp.mp3,46),46) != mp3) { _.err El fichero no es un mp3. | return }
  set %tmp.mdir $left(%tmp.mp3,$calc($len(%tmp.mp3) - $len($nopath(%tmp.mp3))))
  _.playerw
  unset %tmp.mp3.
  splay stop
  splay -p $shortfn(%tmp.mp3)
  if ($inmp3 = $false) { _.err No se puede iniciar el sistema de audio, está siendo usado! | return }
  if (($active ischan) || ($query($active))) set %tmp.mp3. $active
  if (%tmp.mp3.) {
    msg %tmp.mp3. $_.smbsc 5M4P073: $nopath(%tmp.mp3) 2-12[Tamaño: $bytes($file($shortfn(%tmp.mp3)).size).suf $+ 12]2- -12[Duración: $duration($calc($mp3($shortfn(%tmp.mp3)).length /1000)) $+ 12]2-
    .ctcp %tmp.mp3. MP3 $nopath(%tmp.mp3)
  }
}
alias _.playerw dialog $iif($dialog(mp3),-v,-m) mp3 mp3
alias splay if ((!%tmp.mp3) || (!$inmp3) || ($1 = stop)) { .splay $1- | unset %tmp.mp3. }
on *:MP3END:if (%tmp.mp3) { unset %tmp.mp3 %tmp.mp3. | dialog -x mp3 }
on *:DIALOG:mp3:sclick:*:if (%tmp.mp3) { unset %tmp.mp3 %tmp.mp3. | .splay stop }












alias _.bunact if ($mouse.my > 40) { _.bchange 0 | .timerbunact off }
alias _.baractt {
  if ($mouse.my > 40) return
  if (%skin = normal) set %skin.tmp.over sistema\barover.jpg
  elseif ($exists(%skin.over)) set %skin.tmp.over %skin.over
  else return
  if ($mouse.mx > 5 && $mouse.my < 31 && $mouse.mx > 636 && $mouse.mx < 662) { _.bchange 1 player | set %_.bch player | return }
  if ($mouse.my > 1 && $mouse.my < 35) {
    if ( $mouse.mx > 2 && $mouse.mx < 51 ) { _.bchange 1 con | set %_.bch con | return }
    if ( $mouse.mx > 59 && $mouse.mx < 133 ) { _.bchange 1 blank | set %_.bch blank | return }
    if ( $mouse.mx > 148 && $mouse.mx < 222 ) { _.bchange 1 conf | set %_.bch conf | return }
    if ( $mouse.mx > 238 && $mouse.mx < 312 ) { _.bchange 1 away | set %_.bch away | return } 
    if ( $mouse.mx > 327 && $mouse.mx < 401 ) { _.bchange 1 opers | set %_.bch opers | return }
    if ( $mouse.mx > 415 && $mouse.mx < 488 ) { _.bchange 1 servs | set %_.bch servs | return }
    if ( $mouse.mx > 503 && $mouse.mx < 577 ) { _.bchange 1 chancent | set %_.bch chancent | return }
    if ( $mouse.mx > 581 && $mouse.mx < 629 ) { _.bchange 1 bots | set %_.bch bots | return }
  }
  if ( $mouse.mx > 674 && $mouse.mx < 788 && $mouse.my > 4 && $mouse.my < 34 ) { _.bchange 1 about | set %_.bch about | return }
  _.bchange 0
}
menu @b {
  sclick:echo -s $mouse.x $mouse.y
}
alias _.bchange {
  if ($2 = %_.bch) return
  if (%_.bch = player) drawpic -c @Barra 636 6 49 377 27 27 %skin.tmp.over
  if (%_.bch = conf) drawpic -c @Barra 148 2 0 97 74 35 %skin.tmp.over
  if (%_.bch = away) drawpic -c @Barra 238 2 0 202 74 35 %skin.tmp.over
  if (%_.bch = opers) drawpic -c @Barra 327 2 0 132 74 35 %skin.tmp.over
  if (%_.bch = servs) drawpic -c @Barra 415 2 0 167 74 35 %skin.tmp.over
  if (%_.bch = chancent) drawpic -c @Barra 503 2 0 237 74 35 %skin.tmp.over
  if (%_.bch = bots) drawpic -c @Barra 582 2 0 62 49 35 %skin.tmp.over
  if (%_.bch = about) drawpic -c @Barra 673 5 0 0 116 31 %skin.tmp.over
  if (%_.bch = con) {
    if (($server) && (%servclass != none)) drawpic -c @Barra 2 2 98 342 49 35 %skin.tmp.over
    else drawpic -c @Barra 2 2 0 342 49 35 %skin.tmp.over
  }
  if (%_.bch = blank) {
    if ((irc-hispano.org isin $server) && (%servclass != none)) drawpic -c @Barra 59 2 0 307 74 35 %skin.tmp.over
    else drawpic -c @Barra 59 2 0 272 74 35 %skin.tmp.over
  }
  if ($1 = 1) {
    .timerbunact -mo 0 50 _.bunact
    if ($2 = player) drawpic -c @Barra 636 6 76 377 27 27 %skin.tmp.over
    if ($2 = conf) drawpic -c @Barra 148 2 74 97 74 35 %skin.tmp.over
    if ($2 = away) drawpic -c @Barra 238 2 74 202 74 35 %skin.tmp.over
    if ($2 = opers) drawpic -c @Barra 327 2 74 132 74 35 %skin.tmp.over
    if ($2 = servs) drawpic -c @Barra 415 2 74 167 74 35 %skin.tmp.over
    if ($2 = chancent) drawpic -c @Barra 503 2 74 237 74 35 %skin.tmp.over
    if ($2 = bots) drawpic -c @Barra 582 2 49 62 49 35 %skin.tmp.over
    if ($2 = about) drawpic -c @Barra 673 5 0 31 116 31 %skin.tmp.over
    if ($2 = con) {
      if (($server) && (%servclass != none)) drawpic -c @Barra 2 2 0 377 49 35 %skin.tmp.over
      else drawpic -c @Barra 2 2 49 342 49 35 %skin.tmp.over
    }
    if ($2 = blank) {
      if ((irc-hispano.org isin $server) && (%servclass != none)) drawpic -c @Barra 59 2 74 307 74 35 %skin.tmp.over
      else drawpic -c @Barra 59 2 74 272 74 35 %skin.tmp.over
    }
    return
  }
  if ($1 = 0) unset %_.bch
}

menu @BARRA { 
  leave:_.bchange 0
  mouse:_.baractt
  sclick:{
    if ($mouse.y > 5 && $mouse.y < 31) && ( $mouse.x > 636 && $mouse.x < 662 ) _.player
    if ($mouse.y > 1 && $mouse.y < 35) {
      if ( $mouse.x > 2 && $mouse.x < 51 ) { if ((!$server) && (%servclass = none) && (!%_.con)) { server | set %_.con 1 } | else { disconnect | unset %_.con } | _.acbar }
      if ( $mouse.x > 59 && $mouse.x < 133 ) { if (irc-hispano.org isin $server) { .msg creg apoya $$?="Canal? (Tienes que tener el nick registrado y estar identificado)" | halt } }
      if ( $mouse.x > 148 && $mouse.x < 222 ) { _.confscript | halt }
      if ( $mouse.x > 238 && $mouse.x < 312 ) { _.awayrun | halt } 
      if ( $mouse.x > 327 && $mouse.x < 401 ) { who 0 o | if (irc-hispano.org isin $server) { .msg chan opers } }
      if ( $mouse.x > 415 && $mouse.x < 488 ) { _.slist | halt }
      if ( $mouse.x > 503 && $mouse.x < 577 ) { _.chancentral | halt }
      if ( $mouse.x > 581 && $mouse.x < 629 ) { echo -se 12[4CLICK12]4 Haz click derecho para el menú de bots. | halt }
    }
    if ( $mouse.x > 674 && $mouse.x < 788 && $mouse.y > 4 && $mouse.y < 34 ) about 
  }
  $iif($mouse.x > 581 && $mouse.x < 629 && $mouse.y > 1 && $mouse.y < 35 && (!$server),NO CONECTADO):halt
  $iif($mouse.x > 581 && $mouse.x < 629 && $mouse.y > 1 && $mouse.y < 35 && $server && irc-hispano.org !isin $server,NO PREPARADO):halt
  $iif($mouse.x > 581 && $mouse.x < 629 && $mouse.y > 1 && $mouse.y < 35 && $server && irc-hispano.org !isin $server,PARA ESTA RED):halt
}
menu @Post-it {
  Cerrar Post-it:window -c $active
  $iif($window(@Post-it*,0) > 1,Cerrar todas las Post-its):{
    var %Post-it-close 1
    var %Post-it-all $window(@Post-it*,0)
    while (%Post-it-close <= %Post-it-all) {
      window -c $window(@Post-it*,1)
      inc %Post-it-close
    }
  }
  Guardar a sticky.log:{
    write sislog\sticky.log [Iniciado] Volcado con fecha $time(dd/mm/yy HH:nn:ss)
    savebuf -a 0 $active sislog\sticky.log
    write sislog\sticky.log [Completo] Volcado con fecha $time(dd/mm/yy HH:nn:ss)
    write sislog\sticky.log -
    clear $active
    echo $color(info) $active *** Volcado a sticky.log completo :)
  }
  $iif($exists(sislog\sticky.log),Ver sticky.log):run notepad.exe sislog\sticky.log
  -
  $iif($exists(sislog\sticky.log),Borrar sticky.log):if ($$?!="Se borrará sticky.log, está SEGURO?") .remove sislog\sticky.log | echo $color(info) $active *** Eliminado sistema\sticky.log :)
}
menu @Servers { 
  dclick:{ 
    _.lnserv 
    while %servlist < %servnum { 
      inc %servlist 1 
      set %temptexto %servlist $+ Texto 
      set %tempserver %servlist $+ Server 
      %templinea = %servidor.read 
      if ($sline(@Servers,1).ln = %servlist) { 
        server $readini(sistema\servidor.ini,%templinea,%tempserver)
        _.cservw
      } 
    } 
    _.utmp1 
  }
  Añadir server:{ 
    _.lnserv | %servnumadd = %servnum + 1 | set %servnumadd1 $$?="Descripcion del servidor (1 palabra)?" | set %servnumadd2 $$?="Direccion del servidor?" | set %servnumadd3 $?="Puerto del servidor? (por defecto 6667)" | if (!%servnumadd3) { set %servnumadd3 6667 } 
    writeini -n sistema\servidor.ini %servidor.read Numeroservidores %servnumadd | set %servnumadd4 %servidor.read | set %servnumadd5 %servnumadd $+ Texto | set %servnumadd6 %servnumadd $+ Server | writeini -n sistema\servidor.ini %servnumadd4 %servnumadd5 15 $+ %servnumadd1 > %servnumadd2
    writeini -n sistema\servidor.ini %servnumadd4 %servnumadd6 %servnumadd2 $+ : $+ %servnumadd3 | _.slist | unset %servnumadd | unset %servnumadd2 | unset %servnumadd3 | unset %servnumadd4 | unset %servnumadd5 | unset %servnumadd6 | unset %servnumaddd | unset %servnum | unset %servnumadd1
  }
  $iif($sline(@Servers,1),Borrar server):{
    _.lnserv | set %servnumdel $sline(@Servers,1).ln
    set %servnuma %servnum
    set %servnumdel1 %servnumdel $+ Server 
    set %servnumdel2 %servnumdel $+ Texto  
    writeini -n sistema\servidor.ini %servidor.read Numeroservidores $calc(%servnum - 1) 
    set %servnumdez %servnumdel
    set %servnumdez1 1
    while (%servnumdez < %servnum) { 
      set %servnumdzz1 $calc(%servnumdel + %servnumdez1) $+ Texto
      set %servnumdzz2 $calc(%servnumdel + %servnumdez1) $+ Server
      set %servnumdez2 $readini(sistema\servidor.ini,%servidor.read,%servnumdzz1)
      set %servnumdee2 $readini(sistema\servidor.ini,%servidor.read,%servnumdzz2)
      set %servnumdez3 %servnumdez $+ Texto
      set %servnumdez4 %servnumdez $+ Server
      inc %servnumdez1
      inc %servnumdez
      writeini -n sistema\servidor.ini %servidor.read %servnumdez3 %servnumdez2
      writeini -n sistema\servidor.ini %servidor.read %servnumdez4 %servnumdee2
    }
    set %servnuma1 %servnuma $+ Server
    set %servnuma2 %servnuma $+ Texto
    remini sistema\servidor.ini %servidor.read %servnuma1
    remini sistema\servidor.ini %servidor.read %servnuma2
    unset %servnuma | unset %servnuma1 | unset %servnuma2 | unset %servnumdel | unset %servnumdel1 | unset %servnumdel2 | unset %servnumdez
    unset %servnumdez1 | unset %servnumdzz1 | unset %servnumdzz2 | unset %servnumdez2 | unset %servnumza | unset %servnumdee2 | unset %servnumdez3
    unset %servnumdez4
    _.slist
  }
}
menu @Redes { 
  dclick:{ 
    set %red.num $readini(sistema\servidor.ini,Datos,Numeroredes)
    set %red.list 0
    while %red.num > %red.list { 
      inc %red.list 1 
      %red.temp.list = %red.list $+ Red
      if ($readini(sistema\servidor.ini,Datos,%red.temp.list) = $sline(@Redes,1)) {
        set %red.out.list %red.list
        set %red.list %red.num
      }
    } 
    unset %red.list
    unset %red.num
    unset %red.temp.list
    set %red.out.list %red.out.list $+ Key
    set %servidor.read $readini(sistema\servidor.ini,Datos,%red.out.list)
    _.slist act
    unset %red.out.list
  }
  Añadir red:{ 
    set %red.num.a $readini(sistema\servidor.ini,Datos,Numeroredes)
    set %red.num.b $calc(%red.num.a + 1)
    set %red.num.c $remove($$?="Nombre de la red?",$chr(124))
    set %red.num.d $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z)
    set %red.num.e %red.num.b $+ Red
    set %red.num.f %red.num.b $+ Key
    writeini -n sistema\servidor.ini Datos Numeroredes %red.num.b
    writeini -n sistema\servidor.ini Datos %red.num.e %red.num.c
    writeini -n sistema\servidor.ini Datos %red.num.f %red.num.d
    writeini -n sistema\servidor.ini %red.num.d Numeroservidores 0
    unset %red.num.a | unset %red.num.b | unset %red.num.c | unset %red.num.d | unset %red.num.e | unset %red.num.f
    _.slist
  }
  $iif($sline(@Redes,1),Borrar red):{
    if ($$?!="Perderá la lista de servidores de esta red... Continuar?") {
      set %servnum $readini(sistema\servidor.ini,Datos,Numeroredes)
      set %servnumdel $sline(@Redes,1).ln
      set %servnuma %servnum
      set %servnumdel1 %servnumdel $+ Red
      set %servnumdel2 %servnumdel $+ Key  
      set %servnumzak $readini(sistema\servidor.ini,Datos,%servnumdel2)
      remini sistema\servidor.ini %servnumzak
      writeini -n sistema\servidor.ini Datos Numeroredes $calc(%servnum - 1) 
      set %servnumdez %servnumdel
      set %servnumdez1 1
      while (%servnumdez < %servnum) { 
        set %servnumdzz1 $calc(%servnumdel + %servnumdez1) $+ Red
        set %servnumdzz2 $calc(%servnumdel + %servnumdez1) $+ Key
        set %servnumdez2 $readini(sistema\servidor.ini,Datos,%servnumdzz1)
        set %servnumdee2 $readini(sistema\servidor.ini,Datos,%servnumdzz2)
        set %servnumdez3 %servnumdez $+ Red
        set %servnumdez4 %servnumdez $+ Key
        inc %servnumdez1
        inc %servnumdez
        writeini -n sistema\servidor.ini Datos %servnumdez3 %servnumdez2
        writeini -n sistema\servidor.ini Datos %servnumdez4 %servnumdee2
      }
      set %servnuma1 %servnuma $+ Key
      set %servnuma2 %servnuma $+ Red
      remini sistema\servidor.ini Datos %servnuma1
      remini sistema\servidor.ini Datos %servnuma2
      unset %servnuma | unset %servnuma1 | unset %servnuma2 | unset %servnumdel | unset %servnumdel1 
      unset %servnumdel2 | unset %servnumdez | unset %servnumdez1 | unset %servnumdzz1 | unset %servnumdzz2 
      unset %servnumza | unset %servnumdez2 | unset %servnumdee2 | unset %servnumdez3 | unset %servnumdez4
      unset %servnumzak
      _.slist
    }
  }
}
menu @Portscanner {
  rclick:_.p.portscanner
}
menu @Autoscan {
  rclick:_.p.autoscan
}
menu @Globales,@Noticias {
  rclick:_.p.custom
}
menu @Telnet { 
  rclick:_.p.telnet
}
menu @Lector {
  dclick:if (($sline(@Lector,1)) && ($mouse.lb)) _.loggerc carga " $+ $logdir $+ \ $+ $sline(@Lector,1) $+ "
  rclick:if ($mouse.lb) _.p.logger
}
alias -l _.p.autoscan {
  _.p.menu New autoscan 16 16
  _.p.icons autoscan window.ico clear.ico nada.ico rep-0.ico rep-1.ico port-0.ico port-1.ico
  _.p.menu AddItem autoscan end 4 5 Volver a scanear $cr _.p.telnetc 5
  _.p.menu AddItem autoscan end 6 7 Scanear puerto determinado $cr _.p.telnetc 6
  _.p.menu.sep autoscan
  _.p.menu.clear autoscan 1 2
  _.p.menu.close autoscan 1 3
  _.p.popup autoscan $mouse.dx $mouse.dy
}
alias -l _.p.portscanner {
  _.p.menu New portscanner 16 16
  _.p.icons portscanner window.ico clear.ico nada.ico portc-0.ico portc-1.ico port-0.ico port-1.ico
  _.p.menu AddItem portscanner end 4 5 Scanear puertos clave $cr _.p.telnetc 7
  _.p.menu AddItem portscanner end 6 7 Scanear otro puerto $cr _.p.telnetc 8
  _.p.menu.sep portscanner
  _.p.menu.clear portscanner 1 2
  _.p.menu.close portscanner 1 3
  _.p.popup portscanner $mouse.dx $mouse.dy
}
alias -l _.p.telnetc {
  if ($1 = 1) { if ($sock(Telnet).status) { sockclose Telnet | echo @Telnet 2Conexión Cerrada } | telnet $$?="IP?" $$?="Puerto?" }
  if ($1 = 2) { sockclose Telnet | echo @Telnet 2Conexión Cerrada | window @Telnet sistema\iconos\dconn.ico 0 | titlebar @Telnet -[Desconectado]- } | if ($1 = 3) { sockwrite -n Telnet | echo @Telnet 4> }
  if ($1 = 4) set %telnet.bin.env $iif(%telnet.bin.env = si,no,si) | if ($1 = 5) { aline 12 @Autoscan $timestamp Scaneando puertos abiertos: | _.scanport }
  if ($1 = 6) { var %tmp $$?="Puerto a scanear?" | if (!%tmp) return | aline 12 @Autoscan $timestamp Scaneando puerto %tmp | _.soport %tmp }
  if ($1 = 7) { var %tmp $$?="IP?" | if (!%tmp) return | _.portscanner %tmp 21 23 25 53 59 79 80 110 113 119 | _.portscanner %tmp 135 1080 1503 1720 6667 6699 8080 12345 20034 }
  if ($1 = 8) _.portscanner $$?="IP?" $$?="Puerto?"
}

alias -l _.p.telnet {
  _.p.menu New telnet 16 16
  _.p.icons telnet conn.ico dconn.ico bln-0.ico bln-1.ico bin-0.ico bin-1.ico window.ico clear.ico nada.ico
  _.p.menu AddItem telnet end 2 1 Conectar $cr _.p.telnetc 1
  _.p.menu AddItem telnet end $iif(!$sock(Telnet).status,+d) 1 2 Desconectar $cr _.p.telnetc 2
  _.p.menu.sep telnet
  _.p.menu AddItem telnet end $iif($sock(Telnet).status != active,+d) 3 4 Envía linea en blanco $cr _.p.telnetc 3
  _.p.menu.sep telnet
  _.p.menu AddItem telnet end $iif(%telnet.bin.env = si,5 9,9 6) Envíar en binario $cr _.p.telnetc 4
  _.p.menu.sep telnet
  _.p.menu.clear telnet 7 8
  _.p.menu.close telnet 7 9
  _.p.popup telnet $mouse.dx $mouse.dy
}
alias -l _.p.custom {
  _.p.menu New custom 16 16
  _.p.icons custom window.ico clear.ico nada.ico
  _.p.menu.clear custom 1 2
  _.p.menu.close custom 1 3
  _.p.popup custom $mouse.dx $mouse.dy
}
alias -l _.p.logger {
  _.p.menu New logger 16 16
  _.p.icons logger window.ico clear.ico nada.ico listnew.ico list.ico filepeke.ico load.ico filegran.ico filedel.ico
  _.p.menu AddItem logger end 4 5 Listar de nuevo $cr _.loggerc listasil
  _.p.menu AddItem logger end $iif(!$sline(@Lector,1),+d) 6 7 Cargar log $cr _.loggerc carga " $+ $logdir $+ \ $+ $sline(@Lector,1) $+ "
  _.p.menu.sep logger
  if ($sline(@Lector,0) = 1) _.p.menu AddItem logger end 8 9 Borrar log $cr _.loggerc remove
  elseif ($sline(@Lector,0) > 1) _.p.menu AddItem logger end 8 9 Borrar logs $cr _.loggerc remove
  else _.p.menu AddItem logger end +d 8 9 Borrar logs $cr return
  _.p.menu.sep logger
  _.p.menu.clear logger 1 2
  _.p.menu.close logger 1 3
  _.p.popup logger $mouse.dx $mouse.dy
}





;DLLs:
;Popups.dll
alias _.p.pop return sistema\dll\popups.dll
alias _.p.popup {
  var %tmp = $_.p.menu(Popup,$1-)
  if (%tmp) $gettok(%tmp,3-,32)
  _.p.menu Destroy $1 | _.p.menu Remove
  return
}
alias _.p.menu {
  var %tmp
  if (!$2) set %tmp $dll($_.p.pop,$1,.)
  else set %tmp $dll($_.p.pop,$1,$2-)
  if ($gettok(%tmp,1,32) = OK) return $gettok(%tmp,2-,32)
}
alias _.p.icon _.p.menu LoadImg $1 icon small $2-
alias _.p.icons { 
  var %tmp. 1
  while (%tmp. <= $calc($0 - 1)) { 
    _.p.icon $1 sistema\iconos\ $+ $gettok($2-,%tmp.,32) 
    inc %tmp. 
  }
}
alias _.p.menu.sep _.p.menu AddItem $1 end
alias _.p.menu.clear _.p.menu AddItem $1 end $2 $3 Limpiar pantalla $cr clear $active
alias _.p.menu.close _.p.menu AddItem $1 end $2 $3 Cerrar $cr window -c $active
;mdx.dll
alias _.mdx. return $dll(sistema\dll\mdx.dll,$1,$2-)
alias _.mdx.asigna _.mdx. SetMircVersion $version | _.mdx. MarkDialog $1
;stdio.dll
alias _.stdio return $dll($mircdirsistema\dll\stdio.dll,$1,$2-)
;moo.dll
alias _.moodll return sistema\dll\moo.dll
;EOF





alias setver { 
  set %scriptver 1.65 | set %mircvers 5.91
  if (%mimail != nomail@nomail.com) set %mimail nomail@nomail.com
  if (%scriptweb != http://noweb) set %scriptweb http://noweb
}

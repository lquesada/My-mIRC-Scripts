;                                     -(Gra2 ScRiPt)- by LZ
on *:INPUT:?:{
  if (!$len($1-)) halt
  if ($server) inc %count.lines
  if ($inpaste = $false) { 
    if (($left($1,1) != /) && ($left($1,1) != !)) { 
      var %x $+($iif($1 isnum,$chr(32)),$1-)
      _.mh $iif(%cfg.coloURL = si,$_.coloURL(%x),%x)
      halt 
    } 
  }
}
on *:INPUT:#:{ 
  if (!$len($1-)) halt 
  if ($server) inc %count.lines
  if ($inpaste = $false) {
    if ($left($1,1) = !) { 
      set %tmp $me
      set %tresact $active
      say $1-
      _.ej.rusa $1-
      _.ej.tres $1-
      halt 
    }
    if ($left($1,1) != /) {
      set %x $iif($1 isnum,$chr(32))
      if (%nickcomp != Nada) {
        var %ncbucle 1
        while (%ncbucle <= $numtok($1-,32)) {
          if ($gettok($1-,%ncbucle,32) ison #) {
            set %completionick $gettok($1-,%ncbucle,32)
            _.nc %nickcomp
            set %x %x %separa1 $+ %completionick $+ %separa2 
            unset %separa1 %separa2
          }
          else set %x %x $gettok($1-,%ncbucle,32)
          inc %ncbucle
        }
      }
      else { set %x $1- | _.mh $iif(%cfg.coloURL = si,$_.coloURL(%x),%x) | halt }
      _.mh $iif(%cfg.coloURL = si,$_.coloURL(%x),%x)
      unset %x
      halt
    }
  }
}
alias _.nc { 
  if ($1 = Nada) { unset %separa1 | unset %separa2 | return }
  if ($1 = Azul) { set %separa1 2 | set %separa2  | return }
  if ($1 = Somb) { set %separa1 14 $+ $left(%completionick,1) $+ 1 | set %separa2 14 $+ $right(%completionick,1) $+  | return }
  if ($1 = Parn) { set %separa1 1 | set %separa2 4) | return }
  if ($1 = Flic) { set %separa1 4<(1 | set %separa2 4)> | return }
  if ($1 = Esca) { set %separa1 14,14i15,15i0,0i15,15i14,14i1,1i0 | set %separa2 1,1i14,14i15,15i0,0i15,15i14,14i | return }
  if ($1 = Rata) { set %separa1 14~~( | set %separa2 ºº> | return }
  if ($1 = Pezz) { set %separa1 12><((2 | set %separa2 12((º> | return }
  if ($1 = Marr) { set %separa1 5-< | set %separa2 5>- | return }
  if ($1 = Amaz) { set %separa1 12[12,8 | set %separa2 12] | return }
  if ($1 = Quil) { set %separa1 3(1 | set %separa2 3) 4Q12u4i12l4l12@ | return }
  if ($1 = Mano) { set %separa1  $+ %nickcomp.man | set %separa2 %nickcomp.man2 $+  | return }
  if ($1 = Save) { writeini -n sistema\config.ini General Completion %nickcomp | return }
  if ($1 = Dele) { remini sistema\config.ini General Completion | return }
  unset %separa1 | unset %separa2
}
alias -l _.s {
  if ($1 = 1) return :) 
  if ($1 = 3) return :( 
  if ($1 = 5) return x) 
  if ($1 = 7) return x( 
  if ($1 = 9) return xD 
  if ($1 = 11) return :D 
  if ($1 = 13) return :O 
  if ($1 = 15) return :P 
  if ($1 = 17) return :Þ 
  if ($1 = 18) return ;) 
  if ($1 = 20) return ;D 
  if ($1 = 22) return :*
  if (%cfg.mhabla = Rojo-Naranja) {
    if ($1 = 2) return 4:7) | if ($1 = 4) return 4:7(
    if ($1 = 6) return 4x7) | if ($1 = 8) return 4x7(
    if ($1 = 10) return 4x7D | if ($1 = 12) return 4:7D
    if ($1 = 14) return 4:7O | if ($1 = 19) return 4;7) 
    if ($1 = 21) return 4;7D | if ($1 = 16) return 4:7Þ
    if ($1 = 23) return 4:7*
  }
  if (%cfg.mhabla = Rojo-Azul) {
    if ($1 = 2) return 4:12) | if ($1 = 4) return 4:12(
    if ($1 = 6) return 4x12) | if ($1 = 8) return 4x12(
    if ($1 = 10) return 4x12D | if ($1 = 12) return 4:12D
    if ($1 = 14) return 4:12O | if ($1 = 16) return 4:12Þ
    if ($1 = 19) return 4;12) | if ($1 = 21) return 4;12D
    if ($1 = 23) return 4:12*
  }
  if (%cfg.mhabla = Rojo-Verde) {
    if ($1 = 2) return 4:3) | if ($1 = 4) return 4:3(
    if ($1 = 6) return 4x3) | if ($1 = 8) return 4x3(
    if ($1 = 10) return 4x3D | if ($1 = 12) return 4:3D
    if ($1 = 14) return 4:3O | if ($1 = 16) return 4:3Þ
    if ($1 = 19) return 4;3) | if ($1 = 21) return 4;3D
    if ($1 = 23) return 4:3*
  }
  if (%cfg.mhabla = Azul-Verde) {
    if ($1 = 2) return 12:3) | if ($1 = 4) return 12:3(
    if ($1 = 6) return 12x3) | if ($1 = 8) return 12x3(
    if ($1 = 10) return 12x3D | if ($1 = 12) return 12:3D
    if ($1 = 14) return 12:3O | if ($1 = 16) return 12:3Þ
    if ($1 = 19) return 12;3) | if ($1 = 21) return 12;3D
    if ($1 = 23) return 12:3*
  }
  if ($1 = 2) return :) | if ($1 = 4) return :(
  if ($1 = 6) return x) | if ($1 = 8) return x(
  if ($1 = 10) return xD | if ($1 = 12) return :D
  if ($1 = 14) return :O | if ($1 = 16) return :Þ
  if ($1 = 19) return ;) | if ($1 = 21) return ;D
  if ($1 = 23) return :*
}
alias -l _.r {
  if ($2 = 1) return $replace($1,$_.s(1),$_.s(2),$_.s(3),$_.s(4),$_.s(5),$_.s(6),$_.s(7),$_.s(8),$_.s(9),$_.s(10),$_.s(11),$_.s(12)) 
  if ($2 = 2) return $replace($1,$_.s(13),$_.s(14),$_.s(15),$_.s(16),$_.s(17),$_.s(16),$_.s(18),$_.s(19),$_.s(20),$_.s(21),$_.s(22),$_.s(23))
}
alias -l _.mh {
  if ((%cfg.mhabla = Normal) || ($inpaste)) { say $1- | return }
  else { say $_.r($_.r($1-,1),2) | return }
}
alias _.ej.rusa {
  if (%rusa = si) && (# = %rusacanal) && (!boom = $1) { 
    unset %rusa | .timerrecarga -o 1 2 set %rusa si
    if ($rand(1,3) = 3) { 
      if ($me isop #) !kick # %tmp 4,1BOOOO5OOOOOM.........
      else msg # %tmp !!!! 4,1BOOOO5OOOOOM.........
    }
    else msg # 2Click... 3 $+ %tmp $+ : Te has salvado :) 
    unset %tmp
    halt
  }
}
alias _.ej.tres {
  if (%tres = si) { 
    if (%tresact = %trescanal) { 
      if (%trespone = 1) { 
        if (!pon = $1) { 
          if (%tmp = %tres1jug) { 
            if (%tres.nf = 1) halt
            else set -u3 %tres.nf 1
            if ($2 != 1 && $2 != 2 && $2 != 3 && $2 != 4 && $2 != 5 && $2 != 6 && $2 != 7 && $2 != 8 && $2 != 9) halt 
            if ($2 = 1) { if (%tres.c1 = 1) { set %tres.c1 %tresponeX | _.trescom } | else halt } 
            if ($2 = 2) { if (%tres.c2 = 2) { set %tres.c2 %tresponeX | _.trescom } | else halt } 
            if ($2 = 3) { if (%tres.c3 = 3) { set %tres.c3 %tresponeX | _.trescom } | else halt }
            if ($2 = 4) { if (%tres.c4 = 4) { set %tres.c4 %tresponeX | _.trescom } | else halt }
            if ($2 = 5) { if (%tres.c5 = 5) { set %tres.c5 %tresponeX | _.trescom } | else halt } 
            if ($2 = 6) { if (%tres.c6 = 6) { set %tres.c6 %tresponeX | _.trescom } | else halt } 
            if ($2 = 7) { if (%tres.c7 = 7) { set %tres.c7 %tresponeX | _.trescom } | else halt }
            if ($2 = 8) { if (%tres.c8 = 8) { set %tres.c8 %tresponeX | _.trescom } | else halt }
            if ($2 = 9) { if (%tres.c9 = 9) { set %tres.c9 %tresponeX | _.trescom } | else halt }
            _.trest 
            set %trespone 2 
            msg %trescanal 2 $+ %tres2jug $+ ... te toca, escribe: !pon NUMERO para poner ficha (ej: !pon 1) 
            halt 
          } 
        }
      }
      if (%trespone = 2) {
        if (!pon = $1) { 
          if (%tmp = %tres2jug) { 
            if (%tres.nf = 1) halt
            else set -u3 %tres.nf 1
            if ($2 != 1 && $2 != 2 && $2 != 3 && $2 != 4 && $2 != 5 && $2 != 6 && $2 != 7 && $2 != 8 && $2 != 9) halt 
            if ($2 = 1) { if (%tres.c1 = 1) { set %tres.c1 %tresponeO | _.trescom } | else halt }
            if ($2 = 2) { if (%tres.c2 = 2) { set %tres.c2 %tresponeO | _.trescom } | else halt }
            if ($2 = 3) { if (%tres.c3 = 3) { set %tres.c3 %tresponeO | _.trescom } | else halt }
            if ($2 = 4) { if (%tres.c4 = 4) { set %tres.c4 %tresponeO | _.trescom } | else halt }
            if ($2 = 5) { if (%tres.c5 = 5) { set %tres.c5 %tresponeO | _.trescom } | else halt }
            if ($2 = 6) { if (%tres.c6 = 6) { set %tres.c6 %tresponeO | _.trescom } | else halt }
            if ($2 = 7) { if (%tres.c7 = 7) { set %tres.c7 %tresponeO | _.trescom } | else halt }
            if ($2 = 8) { if (%tres.c8 = 8) { set %tres.c8 %tresponeO | _.trescom } | else halt }
            if ($2 = 9) { if (%tres.c9 = 9) { set %tres.c9 %tresponeO | _.trescom } | else halt }
            _.trest 
            set %trespone 1
            msg %trescanal 2 $+ %tres1jug $+ ... te toca, escribe: !pon NUMERO para poner ficha (ej: !pon 1) 
            halt 
          } 
        } 
      }
      if (!tres = $1) { 
        if (%tresbuscaplayer = 0) { 
          inc %tresbuscaplayer 
          set %tres1jug %tmp
          msg %trescanal 4Primer jugador:12 %tres1jug $+ ,4 Segundo jugador: 12escribe !tres para jugar 
          halt 
        }
        if (%tresbuscaplayer = 1) { if (%tmp = %tres1jug) halt
          inc %tresbuscaplayer 
          set %tres2jug %tmp
          msg %trescanal 4Primer jugador:12 %tres1jug $+ , 4Segundo jugador:12 %tres2jug 
          _.tres.on 
          halt 
        } 
        if (%tresbuscaplayer = 2) echo %trescanal 4*** $+ %tmp se quiere añadir al 3 en raya pero no puede
      }
    } 
  } 
}
on *:TEXT:*:#:set %tresact # | set %tmp $nick | _.ej.rusa $1- | _.ej.tres $1-

alias _.smaster {
  if ($2 && $1 isnum && $len($1) = 9) {
    if (%smsad-tray) { _.smsecho 7Siguiente Mensaje de %smsad-tray | unset %smsad-tray }
    var %smsad-mens $strip($replace($left($2-,130),$chr(32),$_.rp))
    var %smsad-send smsad-send. $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9)
    while ($sock(%smsad-send).status) var %smsad-send smsad-send. $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9) $+ $rand(1,9)
    sockopen %smsad-send sms.amenate.com 80
    sockmark %smsad-send $1 %smsad-mens
    _.smsecho 2Enviando SMS a $1 $+ : $strip($replace($2-,$chr(32),$chr(160)))
  }
}
alias -l _.rp return % $+ 20
on *:SOCKCLOSE:smsad-send.*:_.smsecho 4Perdida conexión: $sock($sockname).mark
on *:SOCKOPEN:smsad-send.*:{
  if ($sockerr != 0) { _.smsecho 4No puedo conectar: $sock($sockname).mark }
  else { _.smadsend $sockname $sock($sockname).mark }
}
alias _.smadsend {
  sockwrite -n $1 POST http://sms.amenate.com//freesms/sendsms.html HTTP/1.0
  sockwrite -n $1 Referer: http://sms.amenate.com/freesms/sendsms.html
  sockwrite -n $1 Host: sms.amenate.com 
  sockwrite -n $1 Cookie: NETSCAPE_LIVEWIRE_ID=58EFF04F57BC34A9FDA47DC89794CB4B001916aE; WEBSMS_TEST_COOKIE=testcookie
  sockwrite -n $1 Content-type: application/x-www-form-urlencoded 
  var %smsad-tmpsend from=&cook=true&numero= $+ $2 $+ &msg= $+ $replace($3-,$chr(32),$repl) $+ &combocategoria=&comboabreviatura=ABREVIATURAS
  sockwrite -n $1 Content-length: $len(%smsad-tmpsend) 
  sockwrite -n $1 
  sockwrite -n $1 %smsad-tmpsend 
  sockwrite -n $1
}
on *:SOCKREAD:smsad-send.*:{
  sockread %smsad-rec
  var %compr nténtelo de nuevo más tarde | if (%compr isin %smsad-rec) { _.smsecho 4Intente más tarde: $replace($sock($sockname).mark,$_.rp,$chr(32)) | sockclose $sockname }
  var %compr enviado con éxito. | if (%compr isin %smsad-rec) { _.smsecho 3SMS ACEPTADO: $replace($sock($sockname).mark,$_.rp,$chr(32)) | sockclose $sockname }
  var %compr This server has encountered an internal error which prevents it from fulfilling your request. | if (%compr isin %smsad-rec) { _.smsecho 4Intente más tarde: $replace($sock($sockname).mark,$_.rp,$chr(32)) | sockclose $sockname }
  var %compr no es posible enviar el mensaje | if (%compr isin %smsad-rec) { _.smsecho 4Intente más tarde: $replace($sock($sockname).mark,$_.rp,$chr(32)) | sockclose $sockname }
  unset %smsad-rec
}
alias _.smsecho if (!$window(@SMS-Log)) { window -k +l @SMS-Log 544 41 256 163 @SMS-Log | clear @SMS-Log } | echo @SMS-Log -> $1- | if (%smsad-log = si) write sislog\sms.txt $1-
alias _.sawaymsg {
  if (%smsad-tlfn && %smsad-tlfn isnum && %smsad-away = si) {
    if (%smsad-noralles != 1) { amsg 2[12SMS2] 4Mensajes urgentes: /ctcp $me SMS Mensaje. 2No abuses! | set %smsad-noralles 1 }
    else unset %smsad-noralles
  }
}
ctcp *:SMS:?:{ 
  if ($2-) && ((%smsad-tlfn) && (%smsad-tlfn isnum) && ($away) && (%smsad-away = si)) { 
    if (%smsad-antiflood != 1) {
      if ($calc($len($2-) + 1 + $len($nick)) < 115) {
        set -u300 %smsad-antiflood 1
        set %smsad-tray $nick
        _.smaster %smsad-tlfn $nick $+ > $2-
        .notice $nick 2[12SMS2] Aceptado SMS.
      }
      else {
        _.smsecho $nick -4DENEGADO (demasiados caracteres): $2-
        if (%smsad-antinnflood != 1) { .notice $nick 2[12SMS2] Reduzca caracteres. | set -u4 %smsad-antinnflood 1 } 
      }
    }
    else { 
      _.smsecho $nick -4DENEGADO (1 sms cada $_.smss secs): $2-
      if (%smsad-antimiflood != 1) { .notice $nick 2[12SMS2] 1 SMS cada $_.smsm mins. | set -u4 %smsad-antimiflood 1 }
    }
  }
}
alias _.smsm return $calc($_.smss / 60)
alias _.smss return $iif((%smsad-secs !isnum) || (%smsad-secs < 180) || (!%smsad-secs),180,%smsad-secs)
menu @SMS-Log {
  [SMS] Notify:_.smsconfig
  Envía [SMS]:_.smssender
}

on *:SOCKLISTEN:cidd::a | var %cidd.tmp cidd. $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | if ($sock(%cidd.tmp).status) goto a | sockaccept %cidd.tmp
on *:SOCKREAD:cidd.*:sockread %cidd.in | _.cidd.in $sockname %cidd.in






raw 004:*:{
  echo -s $1-
  if (h isincs $4) { 
    set %servclass unr 
    echo -s 5Cargados controles Half-op (%) 
  }
  else set %servclass other
  if (anillo.adm isin $server) set %servclass other
  halt
}
raw 007:*:echo -s 2Fin de MAP | echo -s - | halt 
raw 251:*:echo -s - | echo -s 12 Hay $4 usuarios visibles y $7 invisibles (Total: $calc($4 + $7) $+ ) en $10 servidores | halt
raw 252:*:echo -s 12 $2 4IRCops12 conectados | halt 
raw 253:*:echo -s 12 $2 Conexiones desconocidas | halt
raw 254:*:echo -s 12 $2 Canales | halt
raw 255:*:echo -s 12 $4 Clientes en $7 servidores | halt
raw 301:*:echo -s 6 $+ $2 12está AWAY: $3- | if ((%cfg.awaysq = si) && ($query($2)) && ($2 != $me)) echo $2 6 $+ $2 12está AWAY: $3- | halt
raw 305:*:echo -s 6 $+ $me $+ :12 Ya has desactivado la ausencia. | halt
raw 306:*:echo -s 6 $+ $me $+ :12 A partir de ahora estás marcado como 7AUSENTE | halt
raw 311:*:echo -s 2 $+ Whois a6 $2 $+ : 3 $+ $3 $+ 12@3 $+ $4 6* $6- | halt
raw 312:*:echo -s 6 $+ $2 12conectado a: $3- | halt 
raw 315:*:echo -s 2Fin de who | echo -s - | halt
raw 317:*:echo -s 6 $+ $2 $+ 12 $duration($3) sin escribir. | echo -s 6 $+ $2 12conectó hace $duration($calc($ctime - $4)) | halt
raw 318:*:echo -s 2Fin de whois | echo -s - | halt
raw 319:*:echo -s 12Canales de6 $2 $+ : $3- | halt
raw 331:*:echo $2 12CANAL SIN TOPIC | halt
raw 332:*:echo $2 12TOPIC: $3- | halt 
raw 333:*:echo $2 12Topic cambiado por $3 en $asctime($4) | halt
raw 341:*:echo -s 6 $+ $2 12ha sido invitado a: $3 | halt
raw 352:*:echo -s 6 $+ $6 4 $+ $2 $+ 12 $3 $+ @ $+ $4 * $9- -> $7 $8 $5 | halt
raw 353:*:echo -s 6 $+ $3 NICKS12 $4- | if ($4- = @ $+ $me) l.creacanal $3 !! | halt
raw 366:*:echo -s 12Fin de listado de nicks | echo -s - | halt
raw 367:*:echo -s 6 $2 BAN12 $3 6EN12 $asctime($5) | halt
raw 378:*:{
  if (anillo.adm isin $server) echo -s 6 $+ $2 12IP virtual $2 
  else echo -s 6 $+ $2 12IP virtual $5-
  halt
}
raw 381:*:echo -s 12Ahora eres 4IRCop :) | halt
raw 401:*:{
  if ($chr(35) != $left($2,1)) { 
    echo -s -
    if ($window($2)) echo $2 6 $+ $2 $+ :2 No está en IRC | echo -s 6 $+ $2 $+ :2 No está en IRC 
    halt 
  }
}
raw 405:*:echo -s 4No puedes entrar a $2 . Demasiados canales. | halt
raw 421:*:echo -s $_.rs(ERROR) Comando desconocido: $2 | halt 
raw 422:*:echo -s 12No hay fichero de mensaje del día | echo -s - | halt
raw 433:*:echo -s $_.taimtamp $_.rs(ERROR) El nick está siendo usado | if (%erronick = 1) { nick $_.randomnick | echo -s $_.rs(NICK) Cambiando a nick al azar | unset %erronick }
raw 471:*:echo -s 4No puedes entrar a $2 : El canal está lleno (+l) | halt
raw 472:*:echo -s $_.taimtamp $_.rs(ERROR) Modo desconocido | halt 
raw 473:*:echo -s 4No puedes entrar a $2 : Solo invitados (+i) | halt
raw 474:*:echo -s 4No puedes entrar a $2 : Estas baneado (+b) | if ((%cfg.autounban = si) && (%autounbann != 1)) { set -u3 %autounbann 1 | if (irc-hispano.org isin $server) { .msg CHaN invite $2 | .msg CHaN unban $2 | echo -s 12Intentando Unban } } | halt
raw 475:*:echo -s 4No puedes entrar a $2 : Requiere contraseña CORRECTA (+k) | halt
raw 501:*:echo -s $_.taimtamp $_.rs(ERROR) Modo desconocido | halt 
raw 512:*:echo -s $_.taimtamp $_.rs(ERROR) No existe esa Gline | halt
alias -l l.creacanal if (%cfg.creacanal = si) mode $1 +nt


menu @MemMon {
  mouse:{ 
    if ($mouse.key = 1) {
      if (($mouse.y < 10) && (%tmp.mmcb)) { .timermm.adj -mo 0 50 _.mm.adj @MemMon | _.mm.adj @MemMon }
    }
    else unset %tmp.mmcb
  }
  sclick:{
    if ($mouse.y < 10) { set %tmp.mmcb 1 | if ($mouse.x > 34) window -c $active }
  }
}
alias -l _.mmondraw drawrect -nfr @MemMon $rgb($calc(188 - $int($calc(1.8 * $1))),$int($calc(1.8 * $1)),0) 1 34 14 4 55 | drawrect -nfr @MemMon 0 1 34 14 4 $calc(55* $1 /100) | drawrect @MemMon
alias -l _.mm.adj {
  if ((!%tmp.mmonx) && ($mouse.x < 45) && ($mouse.y < 75)) { set %tmp.mmonx $mouse.x | set %tmp.mmony $mouse.y }
  if (($mouse.key != 1) || (!$window(@MemMon))) { .timermm.adj off | unset %tmp.mmonx %tmp.mmony | return }
  window $1 $calc($mouse.mx - %tmp.mmonx) $calc($mouse.my - %tmp.mmony)
}
alias _.MemMon if (!$window(@MemMon)) { window -phk +d @MemMon 0 40 44 75 | window -a @MemMon } | drawpic @MemMon 0 0 %skin.mmon | unset %tmp.mmonx %tmp.mmony | .timermm.act -o 0 5 _.mmoncore | _.mmoncore
alias -l _.mmoncore {
if ($exists($_.moodll)) {
  if (!$window(@MemMon)) { .timermm.act off | return }
  var %tmp $dll($_.moodll,meminfo,_),%tmp. $mid($gettok(%tmp,3,32),2,-2),%tmp $gettok(%tmp,2,32)
  _.mmondraw $int($calc(100.00 - %tmp.))
}
}




alias -l _.dccparse var %tmp. $left($1-,$calc($len($gettok($1-,$numtok($1-,32),32)) * -1)),%tmp. $left(%tmp.,$calc($len($gettok(%tmp.,$numtok(%tmp.,32),32)) * -1)),%tmp. $left(%tmp.,$calc($len($gettok(%tmp.,$numtok(%tmp.,32),32)) * -1)) | return %tmp.

ctcp ^*:DCC SEND*:{
  echo 4 -s $_.rs(ENVIO) $nick te envía: $_.dccparse($3-) $+ . 12 $iif($target != $me,Objetivo: $target)
  if ($longip($gettok($1-,$calc($0 - 2),32))) echo 4 -s IP de $nick $+ : $longip($gettok($1-,$calc($0 - 2),32))
  if (%cfg.notroyas = si) { 
    if ((*.exe iswm $_.dccparse($3-)) || (*.bat iswm $_.dccparse($3-)) || (*.com iswm $_.dccparse($3-)) || (*.shs iswm $_.dccparse($3-))) {
      echo -s $_.rs(TROYANO) 4Protección antitroyanos deteniendo recibo de $nick $+ : $_.dccparse($3-) 
      dcc reject $filename 
      halt 
    }
    if (($ isin $3-) || (/ isin $3-) || (\ isin $3-) || (*.ini iswm $_.dccparse($3-)) || (*.vbs iswm $_.dccparse($3-)) || (*.scr iswm $_.dccparse($3-))) { 
      echo -s $_.rs(TROYANO) 4Protección antitroyanos deteniendo recibo de $nick $+ : $_.dccparse($3-) 
      dcc reject $filename 
      halt 
    }
  } 
  if (%prot.sdccf = 1) return
  else { splay sistema\dcc.wav | set -u10 %prot.sdccf 1 }
}
ctcp *:DCC CHAT*:{
  if (%prot.sdccc = 1) return
  else { splay sistema\chat.wav | set -u10 %prot.sdccc 1 } 
  if ($longip($4)) echo 4 -s IP de $nick $+ : $longip($4) | if (($wildtok($3-,chat,0,32) > 1) && (%cfg.pfdcc = si)) { echo 4 -s $_.taimtamp $_.rs(PROTECCIÓN) Deteniendo Fake DCC de $nick $+ . | halt }
}
ctcp *:VERSION*:*:{
  if (%prot.verflood != 1) { .timernoflood -o 1 4 set %prot.verflood 0 | set %prot.verflood 1 | .ctcpreply $nick VERSION $_.publi (mIRC32 %mircvers $+ ) } 
  if (($chr(35) = $left($target,1)) || (+ = $left($target,1)) || (& = $left($target,1))) echo 4 $target [ $+ $nick $+ : $+ $target $1 $+ ] $2- | else echo 4 -s [ $+ $nick $1 $+ ] $2- | halt
}
ctcp ^*:MP3*:*:_.cmpr $1- | if ($2) { echo -s $_.taimtamp $_.rs(MP3) 6 $+ $nick 12  $2- . 12 $iif($target != $me,Objetivo: $target) | halt }
ctcp ^*:SOUND*:*:_.cmpr $1- | if ($2) { echo -s $_.taimtamp $_.rs(SOUND) 6 $+ $nick 12  $2- . 12 $iif($target != $me,Objetivo: $target) | halt }
ctcp ^*:PING:*:_.mmpr $1- | if (($chr(35) = $left($target,1)) || (+ = $left($target,1)) || (& = $left($target,1))) echo 4 $target [ $+ $nick $+ : $+ $target $1 $+ ] $2- | else echo 4 -s [ $+ $nick $1 $+ ] $2- | halt
ctcp ^*:*:*:{
  if (DCC = $1) return
  if (($chr(35) = $left($target,1)) || (+ = $left($target,1)) || (& = $left($target,1))) echo 4 $target [ $+ $nick $+ : $+ $target $1 $+ ] $2- 
  else echo 4 -s [ $+ $nick $1 $+ ] $2- | halt 
  halt 
}
alias _.rplecho {
  if (($chr(35) = $left($2,1)) || (+ = $left($2,1)) || (& = $left($2,1))) echo 4 $2 [ $+ $1 $+ : $+ $2 $3 $+  respuesta] $4-
  else echo 4 -s [ $+ $1 $3 $+  respuesta] $4- | halt 
}
on *:CTCPREPLY:*:{
  if (($1 = PING) && ($2 isnum)) _.rplecho $nick $target $1 $duration($calc($ctime - $2)) $iif($3-,[ $3- ])
  else _.rplecho $nick $target $1-
}
alias -l _.cmpr if (%cfg.conprot = si) { if (/ isin $1-) || (\ isin $1-) { echo -s $_.taimtamp 6 $+ $nick 12 $iif($target != $me,Objetivo: $target) utiliza caracter inválido en CTCP $1 $+ : $2- | halt } }
alias -l _.mmpr if ((%cfg.conprot = si) && (+++ isin $1-)) echo -s $_.taimtamp 6 $+ $nick 12 $iif($target != $me,Objetivo: $target) utiliza caracter inválido en CTCP $1 $+ : $2-

menu query,chat {
  -
  $iif(o isin $usermode,Ircops)
  .KILL RAPIDO:kill $1 KILL RAPIDO $_.smbsc(comp) %scriptweb $+ 
  .Otro kill:kill $1 $$?="Motivo?"
  .Conversor Glines/Hora
  ..¿Que es esto?:_.help.convg
  ..-
  ..Gline -> hora:_.convergh
  ..Hora -> gline:_.converhg
  -
}
menu menubar {
  -
  $iif(o isin $usermode,Ircops)
  .Status IRCOP
  ..Activar Status de IRCop:oper $?="Login de ircop:" $?="Password:"
  ..Desactivar Status de IRCop:mode $me -o
  .Entrada a canal
  ..Está en modo +k:join $$?="Canal? (con #)" GOD
  ..Está en modo +i:join $$?="Canal? (con #)" GOD
  ..Está en modo +l:join $$?="Canal? (con #)" GOD
  ..-
  ..Otro modo:join $$?="Canal? (con #)" GOD
  .KILL RAPIDO:kill $$?="Nick?" KILL RAPIDO $_.smbsc(comp) %scriptweb $+ 
  .Otro kill:kill $$?="Nick?" $$?="Motivo?"
  .Conectar
  ..Normal:connect $$?="Servidor?"
  ..Remoto:connect $$?="Server LEAF?" $$?="Puerto?" $$?="Server HUB?"
  ..Conecta todo:connect *.* $$?="Puerto?" *.*
  .Mensajes al servidor
  ..MENSAJE:msg $ $+ $server $$?="Introduce el mensaje"
  ..NOTICE:notice $ $+ $server $$?="Introduce el notice"
  ..ACTION:describe $ $+ $server $$?="Introduce el action"
  .Ctcps al servidor
  ..Version:ctcp $ $+ $server VERSION
  ..Ping:ctcp $ $+ $server VERSION
  ..Finger:ctcp $ $+ $server VERSION
  .Encontrar Bots
  ..Eggdrops (1):msg $ $+ $server Este es un test para encontrar bots, por favor no contestar (si no sois bots :)) | msg $ $+ $server hello bawts! | msg $ $+ $server email blah@blah.net | msg $ $+ $server ident blah
  ..Eggdrops (2):who */msg*
  ..Johbots:who *=*=*
  .-
  .Admins
  ..Rehash:rehash
  ..Die:die
  .Utilidades del servidor
  ..Listar K-Lines:stats k
  ..Listar I-Lines:stats i
  ..Listar O-Lines:stats o
  ..Listar G-liines:stats g
  ..Listar ?-Lines:stats $$?="Pon el tipo de Line"
  ..-
  ..Motd de $server :motd
  ..Motd de otro servidor:motd $$?="Pon el servidor"
  ..-
  ..Version del servidor: version
  ..Admin del servidor: admin
  ..-
  ..Enlaces del servidor: links
  .Conversor Glines/Hora
  ..¿Que es esto?:_.help.convg
  ..-
  ..Gline -> hora:_.convergh
  ..Hora -> gline:_.converhg
  -
}
menu nicklist {
  -
  $iif(o isin $usermode,Ircops)
  .$iif(%servclass != unr,Control)
  ..Dar op:mode # +xoooo $$1 $2-4 | mode # +xoooo $$5 $6-8
  ..Quitar op:mode # -xoooo $$1 $2-4 | mode # -xoooo $$5 $6-8
  ..Dar voz:mode # +xvvvv $$1 $2-4 | mode # +xvvvv $$5 $6-8
  ..Quitar voz:mode # -xvvvv $$1 $2-4 | mode # -xvvvv $$5 $6-8
  ..Banear:mode # +xbbbb $$1 $2-4 | mode # +xbbbb $$5 $6-8
  ..Unban:mode # -xbbbb $$1 $2-4 | mode # -xbbbb $$5 $6-8
  .$iif(%servclass = unr,Control)
  ..Dar op:mode # +oooo $$1 $2-4 | mode # +oooo $$5 $6-8
  ..Quitar op:mode # -oooo $$1 $2-4 | mode # -oooo $$5 $6-8
  ..Dar voz:mode # +vvvv $$1 $2-4 | mode # +vvvv $$5 $6-8
  ..Quitar voz:mode # -vvvv $$1 $2-4 | mode # -vvvv $$5 $6-8
  ..Banear:mode # +bbbb $$1 $2-4 | mode # +bbbb $$5 $6-8
  ..Unban:mode # -bbbb $$1 $2-4 | mode # -bbbb $$5 $6-8
  .KILL RAPIDO:kill $1 KILL RAPIDO $_.smbsc(comp)
  .Otro kill:kill $1 $$?="Motivo?"
  .Conversor Glines/Hora
  ..¿Que es esto?:_.help.convg
  ..-
  ..Gline -> hora:_.convergh
  ..Hora -> gline:_.converhg
  -
}
on *:NOTICE:*:*:{
  if (%prot.notices = 10) {
    .ignore -nu30 *
    .timer -o 1 30 echo -s $_.taimtamp $_.rs(PROTECCIÓN) 12Ya no se ignoran notices.
    echo -s $_.taimtamp $_.rs(PROTECCIÓN) 12Posible flood de notices, ignorando notices durante 30 segundos.
  }
  else $iif(%prot.notices,inc,set) -u3 %prot.notices 1
}

;                                     -(Gra2 ScRiPt)- by LZ

on ^*:ACTION:*:?:{
  if (($me isin $strip($1-)) && ($me = $target) && (%cfg.avisanick = si)) { 
    if (%temponolag != 1) { 
      set -u4 %temponolag 1
      splay sistema\llaman.wav 
    }
    if (%cfg.tstado = si) echo 6 -s 2 $+ $nick te menciona por query: * $nick $1- 
    if ($window($nick)) window -g2 $nick
  } 
}
on ^*:TEXT:*:?:{
  if ($me = $target) {
    if ($me isin $strip($1-)) { if (%cfg.avisanick = si) { if (%temponolag != 1) { set -u4 %temponolag 1 | splay sistema\llaman.wav } | if (%cfg.tstado = si) echo -s 2 $+ $nick te menciona por query: $1- | if ($window($nick)) window -g2 $nick } } 
    echo $nick %ver1 $+ $nick $+ %ver2 $1- | halt 
  }
}
on *:INPUT:@telnet:if ($sock(telnet).status = active) { echo @telnet $iif(%telnet.bin.env = si,Bin) 4> $1- | sockwrite $iif(%telnet.bin.env != si,-tn,-t) telnet $1- | halt } | else { echo @telnet 4NO CONECTADO | halt }
on ^*:NOTIFY:halt
on *:NOTIFY:{
  echo -s $_.taimtamp $_.rs(NOTIFY) $nick entra en IRC!3 $notify($nick).note
  if (%cfg.notact = si) {
    if ($_.ine($active)) echo -a $_.taimtamp 2[5NOTIFY2] $nick entra en IRC!3 $notify($nick).note
  }
  if (%cfg.snd.notify = si) {
    if (($notify($nick).sound) && ($exists($notify($nick).sound))) splay $notify($nick).sound
    if (%prot.snd.notify != 1) { 
      set -u3 %prot.snd.notify 1 
      splay sistema\notify.wav
    }
  }
  halt
}
on ^*:UNOTIFY:halt
on *:UNOTIFY:{
  echo -s $_.taimtamp $_.rs(NOTIFY) $nick sale de IRC!3 $notify($nick).note
  if (%cfg.notact = si) {
    if ($_.ine($active)) echo -a $_.taimtamp 2[5NOTIFY2] $nick sale de IRC!3 $notify($nick).note
  }
  if (%cfg.snd.notify = si) {
    if (($notify($nick).sound) && ($exists($notify($nick).sound))) splay $notify($nick).sound
    if (%prot.snd.notify != 1) {
      set -u3 %prot.snd.notify 1
      splay sistema\unnotify.wav
    }
  }
  halt
}
on *:SOCKREAD:Telnet:{
  set %Telnetbin.chr.act 0
  unset %receive
  sockread &Telnet
  while (%Telnetbin.chr.act < $bvar(&Telnet,0)) {
    inc %telnetbin.chr.act
    if ($bvar(&Telnet,%Telnetbin.chr.act) = 13) {
      inc %telnetbin.chr.act
      if ($bvar(&Telnet,%Telnetbin.chr.act) = 10) {
        if ($window(@Telnet)) echo @Telnet 3> %receive
        unset %receive
        set %_.trec 1
      }
    }
    else {
      if ($bvar(&Telnet,%Telnetbin.chr.act) = 32) set %receive %receive $chr(32)
      set %receive %receive $+ $chr($bvar(&Telnet,%Telnetbin.chr.act))
      if ($len(%receive) = 800) {
        if ($window(@Telnet)) echo @Telnet Bin 3> %receive
        unset %receive
      }
    }
  }
  if ($window(@Telnet)) {
    if (!%_.trec) echo @Telnet Bin 3> %receive
    else unset %_.trec
  }
  unset %receive %Telnetbin.chr.act
}
on *:SOCKCLOSE:Actualizer:did -r Actualizer 9 | did -a Actualizer 9 Conectar | _.act-echo 1 Desconexión remota.
on *:SOCKREAD:Actualizer:{
  sockread %receive
  if (%receive) { _.act-trok %receive | unset %receive }
  else {
    set %Telnetbin.chr.act 0
    unset %receive
    sockread &Telnet
    while (%Telnetbin.chr.act < $bvar(&Telnet,0)) {
      %Telnetbin.chr.act = %Telnetbin.chr.act + 1
      if ($bvar(&Telnet,%Telnetbin.chr.act) = 13) {
        %Telnetbin.chr.act = %Telnetbin.chr.act + 1
        if ($bvar(&Telnet,%Telnetbin.chr.act) = 10) {
          _.act-trok %receive
          unset %receive
        }
      }
      else {
        if ($bvar(&Telnet,%Telnetbin.chr.act) = 32) set %receive %receive $chr(32)
        set %receive %receive $+ $chr($bvar(&Telnet,%Telnetbin.chr.act))
        if ($len(%receive) = 931) {
          _.act-trok %receive
          unset %receive
        }
      }
    }
    _.act-trok %receive
    unset %receive %Telnetbin.chr.act
  }
}
on *:SOCKOPEN:Actualizer:{
  if ($sockerr = 0) { 
    _.act-echo 1 Conectado... Bajando datos 
    sockwrite -n Actualizer GET /~lz/last.txt HTTP/1.1 
    sockwrite -n Actualizer User-Agent: Gra2-Script:Actualizer
    sockwrite -n Actualizer Host: www.ayuda-es.net 
    sockwrite -n Actualizer
    did -r Actualizer 9 | did -a Actualizer 9 Desconectar
  }
  else { _.act-echo 1 Error al conectar. | did -r Actualizer 9 | did -a Actualizer 9 Conectar }
}
on ^*:PONG:if ($2 = "L) halt
on *:CLOSE:@Servers,@Redes:_.cservw
on +100:JOIN:#:cline 12 # $nick | if ($nick != $me) { echo 3 # *** $nick ( $+ $address $+ ) >- $+ $_.taimtamp $+ -12[ENTRA12] | halt } 
on ^*:TEXT:*:#:if ($me isin $strip($1-)) { if (%cfg.avisanick = si) { if (%temponolag != 1) { set -u4 %temponolag 1 | splay sistema\llaman.wav } | if (%cfg.tstado = si) echo -s 2 $+ $nick te menciona en # : $1- | window -g2 # } } | if (%cfg.opnick = si) { echo # %ver1 $+ $_.modenick(#,$nick) $+ %ver2 $1- | halt } | echo # %ver1 $+ $nick $+ %ver2 $1- | halt 
on ^*:ACTION:*:#:if ($me isin $strip($1-)) { if (%cfg.avisanick = si) { if (%temponolag != 1) { set -u4 %temponolag 1 | splay sistema\llaman.wav } | if (%cfg.tstado = si) echo 6 -s 2 $+ $nick te menciona en # : * $nick $1- | window -g2 # } }
on ^*:EXIT:if ($server) quit | _.notsav
on *:START:{ 
  .timerbarover -mo 0 500  _.baractt
  set %servclass none
  unset %smsad-antiflood %smsad-antinnflood %smsad-antimiflood %erronick %mp.playing %invited %servnum %proteckick %smsad-noralles %actualizer.patch %actualizer.url %prot.sdccf %tmp.kickcon %_.bch %_.awtim %awayvar %awaymens %tmp.mp3 %tmp.mp3.
  unset %_.con %_.trec
  showmirc -x 
  window "Status Window" 0 $calc($window(@mdi).h - 252) 400 252
  set %nickdat nick, type /msg Nick IDENTIFY password. Otherwise,
  set %hnickdat /msg nick@deep.space identify 
  set %globdat (Mensaje Global) 
  _.parajuegos 
  _.utmp1 
  _.utmp1t 
  _.lnserv 
  setver
  .timernodccflood -o 0 2 set %prot.dccflood 0 
  .dcc packetsize 4096
  .pdcc 2147483647 
  .fsend on 
  if (%cfg.sonar = si) splay sistema\abre.wav 
  _.starttext clearh 
  if (%cfg.notimues = si) _.open.notice
  if (%cfg.globmues = si) _.open.global 
  if (%cfg.memmon = si) _.memmon
  _.slist
  _.acbar 
  .ial on 
  .sound off 
  _.lva 
  set %count.lines 0
  _.cidd.start
  _.titlemove
  if (!$notify(0)) _.notrld
  _.reload 
  if (%about != %scriptver) about 
}
on +1:OPEN:?:{
  echo 2 $nick *** $nick ( $+ $address $+ ) Iniciando sesión.
  var %tmp 1
  set %tmp.
  while (%tmp <= $comchan($nick,0)) { 
    if ($nick isop $comchan($nick,%tmp)) set %tmp. %tmp. @ $+ $comchan($nick,%tmp) 
    elseif ($nick ishop $comchan($nick,%tmp)) set %tmp. %tmp. % $+ $comchan($nick,%tmp) 
    elseif ($nick isvo $comchan($nick,%tmp)) set %tmp. %tmp. + $+ $comchan($nick,%tmp) 
    else set %tmp. %tmp. $comchan($nick,%tmp) 
    inc %tmp 
  }
  echo 2 $nick *** Canales comunes ( $+ $comchan($nick,0) $+ ): %tmp.
  unset %tmp.
}
on ^+1:OPEN:?:{
  if (%tmp.prot.open < 5) || (!%tmp.prot.open) {
    $iif(%tmp.prot.open,inc,set) -u3 %tmp.prot.open 1
    flash QUERY
    echo -s $_.taimtamp $_.rs(QUERY) $nick ( $+ $address $+ ) te abre privado.
    if (%cfg.sonquery = si) { 
      if (%prot.sonquery != 1) { 
        set -u4 %prot.sonquery 1 
        splay sistema\ring.wav 
      }
    }
  }
  else {
    if (%tmp.prot.open = 5) {
      unset %tmp.prot.open
      set -u30 %tmp.prot.open 6
      echo -s $_.taimtamp 12Flood de privados, serán redireccionados al estado durante 30 segundos.
      .timer -o 1 30 echo -s $_.taimtamp Ya no se redireccionarán más los privados
    }
    echo -s $_.taimtamp $_.rs(Q) 12 $+ $nick 4> $1-
    halt
  }
}
on *:CHAT:*:{ 
  if (%cfg.dcclock = si) { inc %prot.dccflood | if (%prot.dccflood => 10) { close -c $nick | echo -s $_.taimtamp $_.rs(FLOOD) 12Posible intento de flood de6 $nick $+ 12, CERRANDO CHAT DCC | if (%prot.cflood = 0) { set %prot.cflood 1 | .timernocflood -o 1 8 set %prot.cflood 0 | .notice $nick 12Este script está protegido contra DCC LOCKER y similares :PPPPP $_.smbsc(comp) %scriptweb $+  } } } 
  if ((Closing Idle connection isin $1-) || (cerrando conexión isin $1-)) { echo 2 =$nick *** Lanzando AntiIdle | msg =$nick ! }
}
on *:CONNECT:{ 
  set %_.con 1
  _.cservw | unset %erronick %tmp.kickcon | _.parajuegos | set %count.lines 0
  _.acbar
  if (%awayvar = 1) { 
    echo -s 4AWAY ACTIVADO... 2RESTAURANDO 
    away %awaymens
    ame 2[12Away2]1 %awaymens 7 $+ $_.smbsc $+  
    .TimerAWAY 0 $calc($iif(%timaway isnum && %timaway >= 15,%timaway,15) *60) ame 2[12Away2]1 $remove(%awaymens,|) 7 $+ $_.smbsc $+  
  } 
  _.stmod | echo -se 12Conectado a3 $server 12a las3 $time 12Tu nick es:3 $me
  if (%cfg.conso = si) splay sistema\conecta.wav
  flash CONECTADO | _.settitlebar
  if (%cfg.chancent = si) _.chancentral | .ping :"L
  if (%autojoin = si) {
    if (%autojoin1) { .timeraj1 1 3 j %autojoin1 }
    if (%autojoin2) { .timeraj2 -m 1 3400 j %autojoin2 }
    if (%autojoin3) { .timeraj3 -m 1 3800 j %autojoin3 }
    if (%autojoin4) { .timeraj4 -m 1 4200 j %autojoin4 }
    if (%autojoin5) { .timeraj5 -m 1 4600 j %autojoin5 }
    if (%autojoin6) { .timeraj6 1 5 j %autojoin6 }
    if (%autojoin7) { .timeraj7 -m 1 5400 j %autojoin7 }
    if (%autojoin8) { .timeraj8 -m 1 5800 j %autojoin8 }
    if (%autojoin9) { .timeraj9 -m 1 6200 j %autojoin9 }
    if (%autojoin10) { .timeraj10 -m 1 6400 j %autojoin10 }
  }
}
on ^*:INPUT:@Post-it-*:halt
on *:INPUT:@Post-it-*:echo $active $1- | halt
on *:DISCONNECT:{ 
  if (!%_.con) return
  unset %_.con
  if ($window(@tmp.cpart)) clear @tmp.cpart
  set %servclass none
  .timermide.lag.suma off | .timermide.lag.reset off | if ($dialog(chancent) = chancent) { dialog -x chancent }
  if (!$window(@Servers)) _.slist
  echo -s - | echo -s 12Desconectado de3 $server 12a las3 $time 
  echo 12 -s Has escrito3 %count.lines lineas durante esta conexión.
  set %count.tlines $calc(%count.tlines + %count.lines)
  echo 12 -s Lineas escritas en total:3 %count.tlines
  writeini -n sistema\config.ini numeros tlines %count.tlines
  if (%count.rlines > %count.lines) echo 12 -s Tu record sigue siendo:3 %count.rlines , alcanzado en %count.rdate
  else {
    set %count.rlines %count.lines
    writeini -n sistema\config.ini numeros rlines %count.rlines
    set %count.rdate $date $time
    writeini -n sistema\config.ini numeros rdate %count.rdate
    echo 12 -s Tu record ha alcanzado:3 %count.rlines !!!
  }
  set %count.lines 0
  if (%cfg.dconso = si) splay sistema\desconecta.wav 
  clear @BARRA | drawpic @BARRA 0 0 " $+ $iif(%skin.barnorm && $exists(%skin.barnorm),%skin.barnorm,sistema\barra.jpg) $+ "
  flash DESCONECTADO | _.settitlebar 
}
on ^*:NICK:{ 
  if (%tres = si) { 
    if (%tres1jug = $nick) set %tres1jug $newnick
    if (%tres2jug = $nick) set %tres2jug $newnick 
  }
  if ($nick = $me) { 
    if ($nick === $newnick) halt
    echo -se $_.taimtamp $_.rs(NICK) $nick $+ 12, has cambiado al nick a4 $newnick 
  } 
  if (($nick != $me) && ($window($newnick))) echo $newnick $_.taimtamp $_.rs(NICK) $nick 12cambia el nick a4 $newnick 
  set %count.ncc 1 
  while (%count.ncc <= $comchan($newnick,0)) { 
    if ($nick = $me) { 
      echo $comchan($newnick,%count.ncc) $_.taimtamp $_.rs(NICK) $nick $+ 12, has cambiado al nick a4 $newnick 
      inc %count.ncc 
      haltdef 
    } 
  else { echo $comchan($newnick,%count.ncc) $_.taimtamp $_.rs(NICK) $nick 12cambia el nick a4 $newnick | inc %count.ncc | haltdef } } | halt 
}
on ^*:KICK:#:{ 
  if ($knick = $me) {
    echo -se $_.taimtamp $_.rs(KICK) $nick 12te ha kickeado de 4 $+ # 12( $+ $1- $+ 12)
    if ($window(#)) echo # $_.taimtamp $_.rs(KICK) $nick 12te kickea de 4 $+ # 12( $+ $1- $+ 12)
    if (%cfg.sndkick = si) {
      if (%tmp.kickcon != 1) {
        set -u4 %tmp.kickcon 1
        splay sistema\kick.wav
      }
    }
  }
  else echo # $_.taimtamp $_.rs(KICK) $nick 12kickea a 4 $+ $knick 12de 4 $+ # 12( $+ $1- $+ 12)
  halt
} 
on ^*:TOPIC:#:{ 
  if ($nick = $me) echo # $_.taimtamp $_.rs(TOPIC) $nick $+ , has cambiado el topic a " $+ $1- $+ "
  else echo # $_.taimtamp $_.rs(TOPIC) $nick cambia el topic a " $+ $1- $+ "
  halt
}
on ^*:INVITE:#:halt
on *:INVITE:#:set %invited si | echo -s $_.rs(INVITE) $nick te invita a # $+ . Pulsa SHIFT + F3 para entrar.
on ^*:HOTLINK:¤*¤:@Autoscan:return
on *:PONG:if ($2 = "L) { _.mlll | halt }
on *:HOTLINK:¤*¤:@Autoscan:{
  if ( $1 = ¤(lScanear_de_nuevol)¤ ) { _.scanportwin | _.scanport } 
  if ( $1 = ¤(lCerrarl)¤ ) window -c @Autoscan
  return 
}
on *:SOCKOPEN:Telnet:{ 
  if ($sockerr != 0) { window @Telnet sistema\iconos\dconn.ico 0 | titlebar @Telnet -[Desconectado]- | echo @Telnet 2No puedo conectar } 
  if ($sockerr = 0) { window @Telnet sistema\iconos\conn.ico 0 | titlebar @Telnet -[Conectado a $sock(Telnet).IP $+ : $+ $sock(Telnet).port $+ ]- | echo @Telnet 2Conexión establecida con $sock(Telnet).IP por el puerto $sock(Telnet).port } 
}
on ^*:FILERCVD:*:halt
on *:FILERCVD:*:{
  echo -s $_.rs(DCC RECIBIDO) $nopath($filename) ( $+ $lof($filename) bytes) desde: $nick ( $+ $address $+ )
  echo -s 4Para abrir la carpeta de DCCs pulsa F10
  if (($send($nick).ip != n/a) && ($send($nick).ip)) echo 4 -s IP de $nick $+ : $send($nick).ip
  if ($right($filename,4) = .mp3) || ($right($filename,4) = .wav) {
    echo -s $_.rs(SONIDO) $nopath($filename) Pulsa Shift+F10 para oirlo!
    set %tmp.sf10 " $+ $filename $+ "
  }
  halt
}
alias sF10 if (%tmp.sf10) { _.player %tmp.sf10 | unset %tmp.sf10 }
on *:SENDFAIL:*:if (($send($nick).ip != n/a) && ($send($nick).ip)) echo 4 -s IP de $nick $+ : $send($nick).ip
on *:FILESENT:*:if (($send($nick).ip != n/a) && ($send($nick).ip)) echo 4 -s IP de $nick $+ : $send($nick).ip
on *:GETFAIL:*:if (($send($nick).ip != n/a) && ($send($nick).ip)) echo 4 -s IP de $nick $+ : $send($nick).ip
on *:OPEN:=:if (($chat($nick).ip != n/a) && ($chat($nick).ip)) echo 4 -s IP de $nick $+ : $chat($nick).ip
on *:SOCKCLOSE:Telnet:window @Telnet sistema\iconos\dconn.ico 0 | titlebar @Telnet -[Desconectado]- | echo @Telnet 2Conexión Cerrada | sockclose Telnet | if ($sock(Telnet).port) { echo @Telnet 2Cerrando conexion actual | sockclose $1- }
on *:CLOSE:@Telnet:if ($sock(Telnet).status) { sockclose Telnet | echo -s 2Cerrado telnet }
on *:CLOSE:@Portscanner:sockclose SCAN*
on *:SOCKOPEN:SCAN*:{ 
  set %scannertempname $readini(sistema\scanports.ini,Puertos,$gettok($sockname,3,58))
  if ($sockerr = 0) { 
  if ($window(@Portscanner)) { echo 4 @Portscanner $gettok($sockname,2,58)  $+ $gettok($sockname,3,58) $+ ( $+ %scannertempname $+ ) abierto } | sockclose $sockname | unset %scannertemp* | return } 
  elseif ($window(@Portscanner)) { echo 3 @Portscanner $gettok($sockname,2,58)  $+ $gettok($sockname,3,58) $+ ( $+ %scannertempname $+ ) cerrado } | unset %scannertemp* | return
}
on ^*:QUIT:{
  if ($nick = $me) halt
  if ($window($nick)) echo $nick 4*** $nick 4( $+ $address $+ 4) >- $+ $timestamp $+ -12[4CIERRA12]4 $+ $iif($1-,-[ $1- 4])
  var %count.ncc 1 
  while %count.ncc <= $comchan($nick,0) { 
    echo $comchan($nick,%count.ncc) 4*** $nick 4( $+ $address $+ 4) >- $+ $timestamp $+ -12[4CIERRA12]4 $+ $iif($1-,-[ $1- 4])
    inc %count.ncc 
  } 
  halt
}
on ^*:PART:*:{
  if ($nick = $me) halt
  echo # 6*** $nick 6( $+ $address $+ 6) >- $+ $timestamp $+ -12[6SALE12]6 $+ $iif($1-,-[ $1- 6]) 
  halt
}
on ^*:JOIN:#:{
  if ($nick = $me) { 
    cline 9 # $me
    echo # 12Has entrado a # $iif(%cfg.nickeip = si,14< $+ $nick $+ ! $+ $address $+ >)
  } 
  else echo # 3*** $nick 3( $+ $address $+ 3) >- $+ $timestamp $+ -12[3ENTRA12]
  halt 
}
on ^*:SNOTICE:*net*break*: halt
on *:SNOTICE:*net*break*: {
  if ($window(@Noticias)) { 
    echo @Noticias 12 $+ $timestamp $+ -> 4SPLIT $6- 
    halt 
  } 
  else { 
    echo -s 12 $+ $timestamp $+ -> 4SPLIT $1- 
  }
  halt
}
on ^*:SNOTICE:*net*junction*: halt
on *:SNOTICE:*net*junction*: { 
  if ($window(@Noticias)) echo @Noticias 12 $+ $timestamp $+ -> 3UNION $6-
  else echo -s 12 $+ $timestamp $+ -> 3UNION $1-
  halt
}
on ^*:WALLOPS:*:{ 
  if ($window(@Globales)) { echo 12 @Globales 2,3WALLOPS: $timestamp -> $nick $+ : $1- | halt } 
  else { echo 12 -s 2,3WALLOPS: $timestamp -> $nick $+ : $1- | halt }
}
on ^*:RAWMODE:#:echo 6 # $_.taimtamp $_.rs(MODO) 04 $+ $nick 12pone modo: $1- | halt
on ^*:USERMODE:if ($nick = $me) { echo 6 -se $_.taimtamp $_.rs(MODO) 12Pones modo: $1- 4( $+ $usermode $+ ) | halt }
on *:OP:*:{
  if ($nick = $me) halt
  if ($opnick = $me) { 
    echo -se 6 $+ $nick 2te da @p en1 # 
    if (%cfg.opconso = si && %opconz != 1) { 
      if ($1- $ctime = %prot.amop) halt
      set %prot.amop $1- $ctime 
      set -u5 %opconz 1 | splay sistema\op.wav 
    }
  }
}
on *:DEOP:*:{
  if ($nick = $me) halt
  if ($opnick = $me) { 
    if ($me isop #) halt
    echo -se 6 $+ $nick 2te quita @p de1 # 
    if (%cfg.autoreop = si) { 
      if ($1- $ctime = %prot.amdop) halt
      set %prot.amdop $1- $ctime
      if (irc-hispano.org isin $server) .msg CHaN op # $me 
    }
    if (%cfg.autodreop = si) { if (irc-hispano.org isin $server) { if (CHaN !isin $nick && irc-hispano.org !isin $nick) { .msg CHaN deop # $nick } } }  
    if ((%cfg.deopson = si) && (%deopsonz != 1)) { set -u5 %deopsonz 1 | splay sistema\deop.wav }
  }
}
on *:BAN:*:{ 
  if ($nick = $me) halt 
  if ($bnick = $me) {
if (!%prot.ban) {
    if (%cfg.autounban = si) { 
      if ($me isop #) mode # -b $me 
      if (irc-hispano.org isin $server) { .msg chan unban # | .msg chan invite # | .timerreen 1 1 join # | .timerkita 1 2 mode # -b $me }
    } 
    if (%cfg.autodnban = si) { 
      if ($me isop #) mode # -o $nick 
      if (irc-hispano.org isin $server) .msg chan deop # $nick
    }
set -u5 %prot.ban 1
}
  }
}
on *:KICK:*:{ 
  if ($nick = $me) halt 
  if (($knick = $me) && (%cfg.rejoin = si)) join # 
}
on ^*:SNOTICE:*: { 
  if (%cfg.killprot = si) { 
    if (irc-hispano.org isin $server) { 
      if (Nick kill enforced isin $1-) halt
      if (GHOST command isin $1-) halt
      var %x _antispam (Publicidad no autorizada
      if (%x isin $1-) halt
      var %x *From SHaDoW*Publicidad no autorizada. Si desea contratar servicios publicitarios*
      if (%x iswm $1-) halt
    }
  }
  if ($window(@Noticias)) { echo 12 @Noticias 12 $+ $timestamp $+ -> $1- }
  else echo 12 -s 2SNotice $timestamp $+ -> $1- | halt 
}

;DuaLBoun Versión 1.5 por LZ

;---------------------------
;Dual Bouncer generates a virtual IRC server that can be used as an IRC bouncer.
;It features a virtual operator that talks to the user.
;---------------------------

alias DuaLBovers return 1.5
alias -l d..u set %DuaLBo.c % $+ DuaLBodatuser. $+ %DuaLBo.a | return [ [ %DuaLBo.c ] ]
alias -l d..p return $iif($strip(%DuaLBo.pass) != $null,$strip(%DuaLBo.pass),DuaLBo)
alias -l d..s set %DuaLBo.a2 S. $+ %DuaLBo.a | sockwrite -nt %DuaLBo.a2 $1- | unset %DuaLBo.a2
alias -l d..q if ($sock($1).status != $null) sockwrite -nt $1 :&DuaLBoun!Eres@ $+ $sock(%DuaLBo.a).ip PRIVMSG $d..n : $+ $2-
alias -l d...p set %DuaLBo.c % $+ DuaLBodatpass. $+ %DuaLBo.a | set [ [ %DuaLBo.c ] ] $1-
alias -l d...q set %DuaLBo.c % $+ DuaLBodatpass. $+ %DuaLBo.a | return [ [ %DuaLBo.c ] ]
alias -l d..i set %DuaLBo.c % $+ DuaLBodatstat. $+ %DuaLBo.a | set [ [ %DuaLBo.c ] ] $1-
alias -l d..z set %DuaLBo.c % $+ DuaLBodatstat. $+ %DuaLBo.a | return [ [ %DuaLBo.c ] ]
alias -l sipn return $iif($left($1,1) = :,$right($1,-1),$1)
alias -l d..n set %DuaLBo.c % $+ DuaLBodatnick. $+ %DuaLBo.a | return [ [ %DuaLBo.c ] ]
alias -l d..did did -a DuaLBo 8 $iif($sock(DuaLBo).status != $null,Cierr&a,&Abre) | did -o DuaLBo 20 1 $iif($sock(DuaLBo).status != $null,Activo,Inactivo)
alias -l d..ping set %DuaLBo.c % $+ DuaLBodatping. $+ $1 | if ([ [ %DuaLBo.c ] ] = 1) d..d $1 pt | else { sockwrite -nt $1 PING :"DB | set [ [ %DuaLBo.c ] ] 1 }
alias -l d..port {
  if ((%DuaLBo.port <= 0) || (%DuaLBo.port > 65535) || (%DuaLBo.port !isnum) || ($portfree(%DuaLBo.port) = $false)) {
    var %DuaLBo.tport $rand(1,65535) | while ($portfree(%DuaLBo.tport) = $false) var %DuaLBo.tport $rand(1,65535)
  else return %DuaLBo.tport } | else return %DuaLBo.port
}
alias -l d..sr {
  if ($1 = PING) sockwrite -nt $sockname PONG $2- | sockwrite -nt $right($sockname,-2) %DuaLBo.s | if (($gettok($sipn($1),1,33) = $d..n) && ($2 = NICK)) {
  set %DuaLBo.c % $+ DuaLBodatnick. $+ $right($sockname,-2) | d..deb $d..n cambia nick a $sipn($3) | set [ [ %DuaLBo.c ] ] $sipn($3) } | unset %DuaLBo.s
}
alias -l d..deb if ($window(@DuaLBo).state = $null) window -kan @DuaLBo @DuaLBo | echo $colour(info) @DuaLBo - $1- | if (%DuaLBo.log = si) write DuaLBo.log - $1- | d..lst
alias -l d..d {
  set %DuaLBo.c % $+ DuaLBodatnick. $+ $1 | if ([ [ %DuaLBo.c ] ] != $null) d..deb Desconectado $chr(91) $+ $1 $+ $chr(93) Nick: [ [ %DuaLBo.c ] ]
  else d..deb Desconectado $chr(91) $+ $1 $+ $chr(93) | if ($2 = noident) { sockwrite -nt $1 ERROR: Ping Timeout | d..deb $chr(91) $+ $1 $+ $chr(93) -> No envía datos. }
  if ($2 = nopass) { sockwrite -nt $1 ERROR: Tiempo de identificación ha pasado | d..deb $chr(91) $+ $1 $+ $chr(93) -> No envía contraseña. }
  if ($2 = pt) { sockwrite -nt $1 ERROR: Ping Timeout | d..deb $chr(91) $+ $1 $+ $chr(93) -> Ping Timeout. }
  if ($2 = passinc) { sockwrite -nt $1 ERROR: Contraseña incorrecta | d..deb $chr(91) $+ $1 $+ $chr(93) -> Contraseña incorrecta. }
  if ($2 = descrem) d..deb $chr(91) $+ $1 $+ $chr(93) -> Desconexión remota
  if ($2 = allcon) d..deb $chr(91) $+ $1 $+ $chr(93) -> Todas las conexiónes en uso.
  .timerDuaLBoun.Noid. $+ $1 off | .timerDuaLBoun.noPass. $+ $1 off | .timerDuaLBoun.ping. $+ $1 off | unset [ %DuaLBo.c ]
  set %DuaLBo.c % $+ DuaLBodatuser. $+ $1 | unset [ %DuaLBo.c ] | set %DuaLBo.c % $+ DuaLBodatstat. $+ $1 | unset [ %DuaLBo.c ]
  set %DuaLBo.c % $+ DuaLBodatpass. $+ $1 | unset [ %DuaLBo.c ] | set %DuaLBo.c % $+ DuaLBodatping. $+ $1 | unset [ %DuaLBo.c ]
  set %DuaLBo.c S. $+ $1
  if ($sock(%DuaLBo.c).status != $null) sockwrite -nt %DuaLBo.c QUIT :4DuaLBoun $DuaLBovers por LZ 12noweb noweb
  sockclose %DuaLBo.c | sockclose $1 | dec %DuaLBo.cons | var %DuaLBo.tmpwin @DuaLBo.debug- $+ $1 | if ($window(%DuaLBo.tmpwin).state != $null) echo %DuaLBo.tmpwin ------DESCONEXIÓN------
  d..lst
}
alias -l d..cnn {
  var %DuaLBo.temptemp S. $+ %DuaLBo.a
  if ($sock(%DuaLBo.temptemp).status != $null) { d..dt %DuaLBo.a 9 | halt }
  unset %DuaLBo.conn.s %DuaLBo.conn.p %DuaLBo.conn.w
  if ($chr(46) isin $2 && $2 != $chr(46)) d..q $1 $d..dt(0,14) $+ : $2
  else { d..q $1 Servidor NO valido. | halt }
  if (($3 isnum) && ($3 != $null) && ($3 <= 65535)) d..q $1 $d..dt(0,15) $+ : $3
  else d..q $1 Puerto: 6667
  if ($4 != $null) { d..q $1 $d..dt(0,16) $+ : $4 | d...p $4 }
  sockopen S. $+ %DuaLBo.a $2 $iif(($3 isnum) && ($3 != $null) && ($3 <= 65535),$3,6667)
  d..deb $1 Conecta a $2 $iif(($3 isnum) && ($3 != $null) && ($3 <= 65535),$3,6667) $4
  d..q $1 Conectando...
}
on *:SOCKOPEN:S.DuaLBo.*:{
  set %DuaLBo.a $right($sockname,-2)
  if ($sockerr = 0) { d..dt %DuaLBo.a 12 | d..s NICK $d..n | d..s USER $d..u | if ($d...q != $null) d..s PASS $d...q | set %DuaLBo.c % $+ DuaLBodatpass. $+ %DuaLBo.a | unset [ %DuaLBo.c ] | d..i D }
  else d..dt %DuaLBo.a 13
}
on *:SOCKLISTEN:DuaLBo:{
  var %DuaLBo.tport $rand(1,65535) | while ($portfree(%DuaLBo.tport) = $false) var %DuaLBo.tport $rand(1,65535)
  set %DuaLBo.a DuaLBo. $+ $rand(A,Z) $+ $rand(a,z) $+ $rand(A,Z)
  var %DuaLBo.tmpwin @DuaLBo.debug- $+ %DuaLBo.a
  while (($sock(%DuaLBo.a).status != $null) || ($window(%DuaLBo.tmpwin).state != $null)) { set %DuaLBo.a DuaLBo. $+ $rand(A,Z) $+ $rand(a,z) $+ $rand(A,Z) | var %DuaLBo.tmpwin @DuaLBo.debug- $+ %DuaLBo.a }
  sockaccept %DuaLBo.a | d..deb Recibida conexión $chr(91) $+ %DuaLBo.a $+ $chr(93) ( $+ $sock(%Dualbo.a).ip $+ ) | d..i A | .timerDuaLBoun.Noid. $+ %DuaLBo.a 1 20 d..d %DuaLBo.a noident
  .timerDuaLBoun.ping. $+ %DuaLBo.a 0 120 d..ping %DuaLBo.a | if (%DuaLBo.cons = $null) set %DuaLBo.cont 1 | else set %DuaLBo.cont $calc(%DuaLBo.cons + 1) | if (%DuaLBo.cont > %DuaLBo.maxc) {
    if ((%DuaLBo.maxc isnum) && (%DuaLBo.maxc != 0) && (%DuaLBo.maxc != $null)) { d..deb Desconectando $chr(91) $+ %DuaLBo.a $+ $chr(93) (Sobrepasado número máximo de conexiónes)
  sockwrite -nt %DuaLBo.a ERROR: All conections in use | if (%DuaLBo.cons = $null) set %DuaLBo.cons 1 | else inc %DuaLBo.cons | d..d %DuaLBo.a allcon } } | unset %DuaLBo.cont
}
on *:SOCKREAD:S.DuaLBo.*:{
  sockread %DuaLBo.s
  var %DuaLBo.tmpwin @DuaLBo.debug- $+ $right($sockname,-2)
  if ($window(%DuaLBo.tmpwin).state != $null) if ($gettok(%DuaLBo.s,2,32) != PONG) echo %DuaLBo.tmpwin 4Server> %DuaLBo.s
  d..sr %DuaLBo.s
}
on *:SOCKREAD:DuaLBo.*:sockread %DuaLBo.b | set %DuaLBo.a $sockname | DuaLBo.t %DuaLBo.b
on *:SOCKCLOSE:S.DuaLBo.*:set %DuaLBo.a $right($sockname,-2) | d..i C | d..dt %DuaLBo.a 11
on *:SOCKCLOSE:DuaLBo.*:d..d $sockname descrem
alias -l DuaLBo.t {
  unset %DuaLBo.b | set %DuaLBo.a $sockname
  if ($d..z === A) {
    if ($1 = NICK) {
      set %DuaLBo.c % $+ DuaLBodatnick. $+ %DuaLBo.a | set [ [ %DuaLBo.c ] ] $sipn($2)
      if ($d..u = $null) halt
      d..i B | unset %DuaLBo.c | d..dt %DuaLBo.a 1
    }
    if ($1 = USER) {
      set %DuaLBo.c % $+ DuaLBodatuser. $+ %DuaLBo.a | set [ [ %DuaLBo.c ] ] $2-
      if ($d..n = $null) halt
      d..i B | unset %DuaLBo.c | d..dt %DuaLBo.a 1
    }
    .timerDuaLBoun.Noid. $+ %DuaLBo.a off
    .timerDuaLBoun.Nopass. $+ %DuaLBo.a 0 40 d..d %DuaLBo.a nopass
    halt
  }
  if ($d..z === B) {
    if ($1 = PRIVMSG) {
      if ($2 = &DuaLBoun) {
        if ($sipn($3) = PASS) {
          if ($strip($4) === $d..p) {
            if (%DuaLBo.cons = $null) set %DuaLBo.cons 1
            else inc %DuaLBo.cons
            if (%DuaLBo.cons > %DuaLBo.maxc) {
              if ((%DuaLBo.maxc isnum) && (%DuaLBo.maxc != 0) && (%DuaLBo.maxc != $null)) {
                d..deb Desconectando $chr(91) $+ %DuaLBo.a $+ $chr(93) (Sobrepasado número máximo de conexiónes)
                sockwrite -nt %DuaLBo.a ERROR: All conections in use | d..d %DuaLBo.a allcon
              }
            }
            d..i C | d..dt %DuaLBo.a 2 | .timerDuaLBoun.Nopass. $+ %DuaLBo.a off
          }
          else { d..dt %DuaLBo.a 3 | d..d %DuaLBo.a passinc }
          halt
        }
      }
      if ($2 != $d..n) sockwrite -nt %DuaLBo.a : $+ $2 PRIVMSG $d..n :&DuaLBoun: No estás conectado a ningún servidor!!!
    }
  }
  if (($d..z === C) || ($d..z === D)) {
    if ($1 = PRIVMSG && $2 = &DuaLBoun) {
      if ($sipn($3) = HELP) { d..dt %DuaLBo.a 4 | halt } | if ($sipn($3) = STATUS) { d..dt %DuaLBo.a 6 | halt }
      if (($sipn($3) = BYE) || ($sipn($3) = QUIT)) { d..dt %DuaLBo.a 7 | d..d %DuaLBo.a descrem | halt }
      if (($sipn($3) != DISCONNECT) && ($sipn($3) != CONNECT)) { d..dt %DuaLBo.a 0 | halt }
    }
    if ($1 = PONG) { if ($sipn($2) = "DB) { set %DuaLBo.c % $+ DuaLBodatping. $+ %DuaLBo.a | unset [ %DuaLBo.c ] } | halt }
  }
  if ($d..z === C) {
    if ($1 = PRIVMSG) {
      if ($2 = &DuaLBoun) {
        if ($sipn($3) = CONNECT) { d..cnn %DuaLBo.a $4 $5 $6 | halt }
        if ($sipn($3) = DISCONNECT) {
          var %DuaLBo.temptemp S. $+ %DuaLBo.a
          if ($sock(%DuaLBo.temptemp).status != $null) { d..dt %DuaLBo.a 10 | sockclose %DuaLBo.temptemp | halt }
          else d..dt %DuaLBo.a 8
          halt
        }
      }
      elseif ($2 != $d..n) sockwrite -nt %DuaLBo.a : $+ $2 PRIVMSG $d..n :&DuaLBoun: No estás conectado a ningún servidor!!!
      if ($2 = $d..n) { sockwrite -nt %DuaLBo.a : $+ $d..n $+ !You@You PRIVMSG $d..n $3- | halt }
      halt
    }
    if ($1 = NOTICE) { if ($2 = $d..n) { sockwrite -nt %DuaLBo.a : $+ $d..n $+ !You@You NOTICE $d..n $3- | halt } | halt }
    if ($1 = PING) { sockwrite -nt %DuaLBo.a PONG $2- | halt }
    if (($1 = WATCH) || ($1 = PONG) || ($1 = USERHOST) || ($1 = ISON)) halt
    sockwrite -nt %DuaLBo.a :DuaLBoun 421 $d..n : $+ $1 | halt
  }
  if ($d..z === D) {
    if ($1 = PRIVMSG && $2 = &DuaLBoun) {
      if ($sipn($3) = CONNECT) { d..dt %DuaLBo.a 9 | halt }
      if ($sipn($3) = DISCONNECT) {
        d..i C
        var %DuaLBo.tmp S. $+ %DuaLBo.a
        if ($sock(%DuaLBo.tmp).status != $null) sockwrite -nt %DuaLBo.tmp QUIT :4DuaLBoun $DuaLBovers por LZ 12noweb noweb
        sockclose %DuaLBo.tmp
        d..dt %DuaLBo.a 10
        halt
      }
    }
    var %DuaLBo.tmpwin @DuaLBo.debug- $+ %DuaLBo.a
    if ($window(%DuaLBo.tmpwin).state != $null) if ($1 != PING) echo %DuaLBo.tmpwin 3Client> $1-
    d..s $1-
  }
  halt
}
alias -l d..dt {
  if ($2 = 0) d..q $1 Comando incorrecto, escriba HELP para ver ayuda.
  if ($2 = 1) {
    set %DuaLBo.c % $+ DuaLBodatnick. $+ $1
    sockwrite -nt %DuaLBo.a :DuaLBoun 001 [ [ %DuaLBo.c ] ] :Bienvenido a DuaLBoun
    d..q $1 6,6_1/¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯\6_/l
    d..q $1 6,6_1|6__l_/14D1DuaL14L6_ll/_1|6__
    d..q $1 6,6_1\6___14B1Bouncer14r6___1/6__i
    d..q $1 6,6l_\1\_/¯¯¯¯¯¯¯¯¯¯\_/6___|
    d..q $1 
    d..q $1 DuaLBoun $DuaLBovers por LZ.
    d..q $1 -| 12noweb |-
    d..q $1  -|  12noweb  |-
    d..q $1  $+ $d..n $+ , Bienvenido al DuaLBoun! Escribemé pass CONTRASEÑA :)
    d..deb $chr(91) $+ $1 $+ $chr(93) Nick: [ [ %DuaLBo.c ] ]
  }
  if ($2 = 2) {
    d..q $1 3Contraseña Aceptada, Bienvenido al DuaLBoun ;) Escribe HELP para ayuda.
    set %DuaLBo.c % $+ DuaLBodatnick. $+ $1
    d..deb Identificado $chr(91) $+ $1 $+ $chr(93) Nick: [ [ %DuaLBo.c ] ]
  }
  if ($2 = 3) d..q $1 4Contraseña incorrecta.
  if ($2 = 4) {
    d..q $1 2CONNECT servidor [puerto(6667)] [contraseña(ninguna)] Conecta a ese servidor.
    d..q $1 2DISCONNECT Desconecta del servidor actual.
    d..q $1 
    d..q $1 2STATUS muestra el estado de tu conexión.
    d..q $1 2BYE o 2QUIT desconectar TODO.
  }
  if ($2 = 6) d..q $1 Status: 4 $+ $d..z 2 $iif($d..z = C,Sin conexión a server,Conectado a server) $+ .
  if ($2 = 7) {
    d..q $1 Adios! Vuelve pronto!
    sockwrite -nt %DuaLBo.a :DuaLBoun 001 [ [ %DuaLBo.c ] ] :DuaLBoun! noweb noweb
    sockwrite -nt %DuaLBo.a :DuaLBoun 004 [ [ %DuaLBo.c ] ] :-
  }
  if ($2 = 8) d..q $1 Debes estar conectado a algún servidor para desconectar.
  if ($2 = 9) d..q $1 Debes desconectar del server actual primero!
  if ($2 = 10) {
    set %DuaLBo.c % $+ DuaLBodatnick. $+ $1
    sockwrite -nt %DuaLBo.a :DuaLBoun 001 [ [ %DuaLBo.c ] ] :DuaLBoun! noweb noweb
    sockwrite -nt %DuaLBo.a :DuaLBoun 004 [ [ %DuaLBo.c ] ] :-
    d..q $1 Desconectado del server actual.
    d..deb $chr(91) $+ $1 $+ $chr(93) Desconecta del server.
    var %DuaLBo.tmpwin @DuaLBo.debug- $+ $right($sockname,-2)
    if ($window(%DuaLBo.tmpwin).state != $null) echo %DuaLBo.tmpwin ------Desconectado del servidor------
  }
  if ($2 = 11) {
    set %DuaLBo.c % $+ DuaLBodatnick. $+ $1
    sockwrite -nt %DuaLBo.a :DuaLBoun 001 [ [ %DuaLBo.c ] ] :DuaLBoun! noweb noweb
    sockwrite -nt %DuaLBo.a :DuaLBoun 004 [ [ %DuaLBo.c ] ] :-
    d..q $1 Desconexión remota del servidor.
    d..deb $chr(91) $+ $1 $+ $chr(93) Desconexión remota del servidor.
  }
  if ($2 = 12) {
    d..q $1 Conexión con $sock($sockname).ip $+ : $+ $sock($sockname).port establecida con éxito. Espere por favor.
    d..deb $chr(91) $+ $1 $+ $chr(93) Conexión establecida con el servidor
  }
  if ($2 = 13) {
    d..q $1 No puedo conectar con $sock($sockname).ip $+ : $+ $sock($sockname).port
    d..deb $chr(91) $+ $1 $+ $chr(93) No se puede conectar con el servidor.
  }
  if ($2 = 14) return Servidor
  if ($2 = 15) return Puerto
  if ($2 = 16) return Contraseña
}
alias -l d..lst {
  if ($dialog(DuaLBo) != $null) did -o DuaLBo 32 1 $sock(DuaLBo.*,0)
  did -r DuaLBo 30 | var %DuaLBo.tmpc1 $sock(DuaLBo.*,0) | var %DuaLBo.tmpc2 0
  while (%DuaLBo.tmpc2 != %DuaLBo.tmpc1) { inc %DuaLBo.tmpc2 | set %DuaLBo.cede $sock(DuaLBo.*,%DuaLBo.tmpc2)
  set %DuaLBo.c % $+ DuaLBodatstat. $+ %DuaLBo.cede | if (([ [ %DuaLBo.c ] ] === C) || ([ [ %DuaLBo.c ] ] === D)) did -a DuaLBo 30 %DuaLBo.cede }
  unset %DuaLBo.cede
}
menu menubar {
  -
  DuaLBoun:if ($dialog(DuaLBo) = $null) { dialog -md DuaLBo DuaLBo | d..lst }
  -
}
menu @DuaLBo.debug {
  dclick:{
    if ($mouse.lb = $true) {
      if ($sline($active,1) = Ver IP/Puerto remoto) echo 12 -a IP: $sock($right($active,-14)).ip PUERTO REMOTO: $sock($right($active,-14)).port
      if ($sline($active,1) = Desconectar a Cliente y Server) {
        if ($sock($right($active,-14)).status = $null) { echo -a El socket ya estaba desconectado! | halt }
        d..d $right($active,-14)
      }
      if ($sline($active,1) = Desconectar de Server) {
        var %DuaLBo.tmpsock S. $+ $right($active,-14)
        if ($sock(%DuaLBo.tmpsock).status = $null) { echo -a No hay conexión con server activa. | halt }
        if ($sock(%DuaLBo.tmpsock).status != $null) {
          d..i C
          sockwrite -nt %DuaLBo.tmpsock QUIT :4DuaLBoun $DuaLBovers por LZ 12noweb noweb
          sockclose %DuaLBo.tmpsock | d..dt $right($active,-14) 10
        }
      }
    }
  }
}
Dialog DuaLBo {
  option pixel
  size -1 -1 406 214
  title DuaLBoun $DuaLBovers |LZ'2001|
  button ,1,-50 -50 5 5,ok
  button ,8,154 42 56 22
  edit ,9,327 25 65 19,limit5
  edit ,10,327 46 65 19,autoHS
  Box Configuración,11,221 10 178 106
  edit ,12,327 67 65 19
  check &Logear,13,228 93 54 15
  button &Ver log,16,321 91 73 20
  text Puerto,17,215 28 108 13,right
  text Contraseña,18,215 49 108 13,right
  text Máximas conexiones,19, 215 71 108 13,right
  edit ,20,154 16 55 22,read,center
  text DuaLBoun,21,158 67 68 13
  text $DuaLBovers,22,162 80 39 13,center
  text por LZ,23,165 93 34 13
  link noweb,24,245 158 113 13
  link noweb,25,245 145 108 13
  link nomail@nomail.com,26,245 132 108 13
  text Doble click en una conexión para ver el debug.,29,3 135 240 13
  list 30,3 150 225 70
  text Conexiónes activas:,31,245 188 100 13
  edit ,32,345 185 55 22,read,center
  icon 27,1 21 142 90
}
on *:DIALOG:DuaLBo:dclick:30:{
  if ($did(30).seltext != $null) {
    var %DuaLBo.tmpwin @DuaLBo.debug- $+ $did(30).seltext
    window -kal26 %DuaLBo.tmpwin @DuaLBo.debug | aline -l %DuaLBo.tmpwin Opciones:
    aline -l %DuaLBo.tmpwin Desconectar a Cliente y Server | aline -l %DuaLBo.tmpwin Desconectar de Server
    aline -l %DuaLBo.tmpwin Ver IP/Puerto remoto
  }
}
on *:DIALOG:DuaLBo:sclick:*:{
  if ($did = 1) halt | if (($did != 10) && ($d..p = DuaLBo)) did -o DuaLBo 10 1 $d..p
  if ($did = 8) {
    if ($sock(DuaLBo).status != $null) { sockclose DuaLBo | d..deb DuaLBoun cerrado | d..deb - }
    else { socklisten DuaLBo $d..port | d..deb - | d..deb DuaLBoun abierto en puerto $sock(DuaLBo).port }
    d..did | unset %DuaLBo.cons %DuaLBodat* | sockclose S.DuaLBo.* | sockclose DuaLBo.*
    .timerDuaLBoun.Noid.* off | .timerDuaLBoun.noPass.* off | .timerDuaLBoun.ping.* off | d..lst
  }
  if ($did = 13) set %DualBo.log $iif($did(13).state = 1,si,no) | if ($did = 16) if ($exists(DuaLBo.log) = $true) run notepad.exe DuaLBo.log
  if ($did = 24) run noweb | if ($did = 25) run noweb | if ($did = 26) run mailto:nomail@nomail.com
}
on *:DIALOG:DuaLBo:init:0:{
  did -a DuaLBo 9 $iif(%DuaLBo.port != $null,%DuaLBo.port,$d..port)
  did -a DuaLBo 10 $d..p | d..did | did -a DuaLBo 12 $iif(%DuaLBo.maxc != $null,%DuaLBo.maxc,3)
  if ($findfile(.,DuaLBoun.jpg,1) != $null)  did -g DuaLBo 27 " $+ $findfile(.,DuaLBoun.jpg,1) $+ " 1
  set %DuaLBo.port $did(9) | set %DuaLBo.maxc $did(12) | set %DuaLBo.pass $did(10)
}
on *:DIALOG:DuaLBo:edit:*:{
  if ($did = 9) set %DuaLBo.port $did(9) | if ($did = 10) set %DuaLBo.pass $did(10)
  if (($did != 10) && ($d..p = DuaLBo)) did -o DuaLBo 10 1 $d..p | if ($did = 12) set %DuaLBo.maxc $did(12)
}

;Binary Server Version 1.4, LZ

;---------------------------
;This is a server that receives and show data.
;Type /serverbin port to open a server.
;---------------------------

alias Serverbinvers return v1.4
alias Serverbin {
if ($sock(Serverbin).status != $null) {
echo -s 12[4Serverbin12] Cerrado puerto $sock(Serverbin).port
sockclose Serverbin
sockclose Serverbin2 
}
  if ($window(@Serverbin).state == $null) {
    window -ek @Serverbin @Serverbin
    titlebar @Serverbin -[Cerrado]-
    echo @Serverbin Server Binario $serverbinvers por LZ
    echo @Serverbin Visita: noweb para más addons
    echo @Serverbin 
  }
  if ($1 isnum && $portfree($1) == $true) {
    echo -s 12[4Serverbin12] Abierto puerto $1
    socklisten Serverbin $1
    titlebar @Serverbin -[Esperando $sock(Serverbin).port $+ ]-
    return
  }
  :select
  set %serverbin.port $$?="Puerto a abrir?"
  if (%serverbin.port != $null && %serverbin.port isnum && $portfree(%serverbin.port) == $true) {
    echo -s 12[4Serverbin12] Abierto puerto %serverbin.port
    socklisten Serverbin %serverbin.port
    if ($window(@Serverbin).state != $null) titlebar @Serverbin -[Esperando $sock(Serverbin).port $+ ]-
    unset %serverbin.port
  }
  else {
    echo -s 12[4Serverbin12] Puerto %serverbin.port ocupado
    goto select
    unset %serverbin.port
  }
}
on *:CLOSE:@Serverbin:if ($sock(Serverbin).status != $null) { echo -s 12[4Serverbin12] Cerrado puerto $sock(Serverbin).port | sockclose Serverbin | sockclose Serverbin2 }
on ^*:INPUT:@Serverbin:halt
on *:INPUT:@Serverbin:{
  if ($sock(Serverbin2).status == active) { echo @Serverbin $iif(%Serverbin.bin.env == si,Bin) 4> $1- | sockwrite $iif(%Serverbin.bin.env != si,-tn) Serverbin2 $1- | halt }
  else echo @Serverbin 4NO HAY CONEXIÓN ACTIVA | halt
}
on *:SOCKLISTEN:Serverbin:{
  if ($sock(Serverbin2).status != active) {
    sockaccept Serverbin2
    echo 2 @Serverbin Conectado $sock(Serverbin2).ip
    if ($window(@Serverbin).state != $null) titlebar @Serverbin -[Conectado: $sock(Serverbin2).ip $+ ]-
  }
}
on *:SOCKCLOSE:Serverbin2:{
  if ($window(@Serverbin).state != $null) {
    if ($window(@Serverbin).state != $null) titlebar @Serverbin $iif($sock(Serverbin).status == listening,-[Esperando $sock(Serverbin).port $+ ]-,-[Cerrado]-)
    echo @Serverbin 2Conexion Cerrada Remotamente
  }
}
menu @Serverbin {
  $iif($sock(Serverbin).status == listening,Cerrar todo):sockclose Serverbin | sockclose Serverbin2 | if ($window(@Serverbin).state != $null) titlebar @Serverbin -[Cerrado]- | echo 2 @Serverbin Cerrado server
  $iif($sock(Serverbin2).status == active,Cerrar conectado):sockclose Serverbin2 | if ($window(@Serverbin).state != $null) titlebar @Serverbin $iif($sock(Serverbin).status == listening,-[Esperando $sock(Serverbin).port $+ ]-,-[Cerrado]-)  | echo 2 @Serverbin Desconectado
  $iif($sock(Serverbin).status != listening,Abrir):{
    sockclose Serverbin | sockclose Serverbin2
    set %serverbin.port $$?="Puerto a abrir?"
    if (%serverbin.port != $null && %serverbin.port isnum && $portfree(%serverbin.port) == $true) {
      echo -s 12[4Serverbin12] Abierto puerto %serverbin.port
      socklisten Serverbin %serverbin.port
      if ($window(@Serverbin).state != $null) titlebar @Serverbin -[Esperando $sock(Serverbin).port $+ ]-
      unset %serverbin.port
    }
    else {
      echo -s 12[4Serverbin12] Puerto %serverbin.port ocupado
      goto select
      unset %serverbin.port
    }
  }
  -
  $iif($sock(Serverbin2).status == active,Envía linea en blanco):sockwrite -n Serverbin2 | echo @Serverbin Bin 4>
  -
  Envío Binario ( $+ $iif(%Serverbin.bin.env == si,si,no) $+ ):set %Serverbin.bin.env $iif(%Serverbin.bin.env == si,no,si)
  -
  Limpiar pantalla:clear @Serverbin
}
menu menubar {
  -
  Server-Bin
  .$iif($sock(Serverbin).status == listening,Cerrar todo):sockclose Serverbin | sockclose Serverbin2 | if ($window(@Serverbin).state != $null) titlebar @Serverbin -[Cerrado]- | echo 2 @Serverbin Cerrado server
  .$iif($sock(Serverbin2).status == active,Cerrar conectado):sockclose Serverbin2 | if ($window(@Serverbin).state != $null) titlebar @Serverbin $iif($sock(Serverbin).status == listening,-[Esperando $sock(Serverbin).port $+ ]-,-[Cerrado]-)  | echo 2 @Serverbin Desconectado
  .Abrir:serverbin
  .-
  .Envío Binario ( $+ $iif(%Serverbin.bin.env == si,si,no) $+ ):set %Serverbin.bin.env $iif(%Serverbin.bin.env == si,no,si)
  -
}
on *:SOCKREAD:Serverbin2:{
  sockread %receive
  if (%receive != $null) { if ($window(@Serverbin).state != $null) { echo @Serverbin 3> %receive | unset %receive } }
  else {
    set %Serverbinbin.chr.act 0
    unset %receive
    sockread &Serverbin
    :bucle
    %Serverbinbin.chr.act = %Serverbinbin.chr.act + 1
    if ($bvar(&Serverbin,%Serverbinbin.chr.act) == 13) {
      %Serverbinbin.chr.act = %Serverbinbin.chr.act + 1
      if ($bvar(&Serverbin,%Serverbinbin.chr.act) == 10) {
        if ($window(@Serverbin).state != $null) echo @Serverbin Bin 3> %receive
        unset %receive
        goto bucle
      }
    }
    if ($bvar(&Serverbin,%Serverbinbin.chr.act) == 32) set %receive %receive $chr(32)
    set %receive %receive $+ $chr($bvar(&Serverbin,%Serverbinbin.chr.act))
    if ($len(%receive) = 930) {
      if ($window(@Serverbin).state != $null) echo @Serverbin Bin 3> %receive
      unset %receive
      goto bucle
    }
    if (%Serverbinbin.chr.act >= $bvar(&Serverbin,0)) goto muestra
    else goto bucle
    :muestra
    if ($window(@Serverbin).state != $null) echo @Serverbin Bin 3> %receive
    unset %receive
    unset %Serverbinbin.chr.act
  }
}

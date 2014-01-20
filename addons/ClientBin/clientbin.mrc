;Binary Client Version 1.4, LZ

;---------------------------
;This is a socket client.
;
;Type /Clientbin ip port to connect to a remote server.
;---------------------------

Alias clientbinvers return v1.4
Alias Clientbin {
  if ($window(@Clientbin).state == $null) {
    window -ek @Clientbin @Clientbin
    titlebar @Clientbin -[Desconectado]-
    echo @Clientbin Client Binario $clientbinvers por LZ
    echo @Clientbin Visita: noweb para más addons
    echo @Clientbin 
  }
  if ($2 isnum) {
    sockclose Clientbin
    sockopen Clientbin $$1 $$2
    echo @Clientbin 2Conectando con $$1 por el puerto $$2
    if ($window(@Clientbin).state != $null) titlebar @Clientbin -[Conectando con $$1 $+ : $+ $$2 $+ ]-
  }
}
Alias Clientbin.con {
  sockclose Clientbin
  set %Clientbinip $$?="IP?"
  set %Clientbinport $$?="Puerto?"
  Clientbin %Clientbinip %Clientbinport
  unset %Clientbinip %Clientbinport
}
on ^*:INPUT:@Clientbin:halt
on *:INPUT:@Clientbin:{
  if ($sock(Clientbin).status == active) {
    echo @Clientbin $iif(%Clientbin.bin.env == si,Bin) 4> $1-
    sockwrite $iif(%Clientbin.bin.env != si,-tn) Clientbin $1-
  }
  else echo @Clientbin 4NO CONECTADO
  halt
}
on *:CLOSE:@Clientbin:if ($sock(Clientbin).status == active) { sockclose Clientbin | echo -s 2Cerrada conexión Clientbin }
on *:SOCKOPEN:Clientbin:{
  if ($window(@Clientbin).state != $null) titlebar @Clientbin -[Conectado: $sock(Clientbin).IP $+ : $+ $sock(Clientbin).port $+ ]-
  if ($sockerr != 0) echo @Clientbin 2No puedo conectar | titlebar @Clientbin -[Desconectado]-
  if ($sockerr == 0) echo @Clientbin 2Conexión establecida con $sock(Clientbin).IP por el puerto $sock(Clientbin).port
}
on *:SOCKCLOSE:Clientbin:{
  if ($window(@Clientbin).state != $null) { titlebar @Clientbin -[Desconectado]- | echo @Clientbin 2Conexion Cerrada }
  sockclose Clientbin
  if ($sock(Clientbin).port != $null) sockclose $1-
}
menu @Clientbin {
  Conectar:Clientbin.con
  $iif($sock(Clientbin).status == active,Desconectar):sockclose Clientbin
  -
  $iif($sock(Clientbin).status == active,Envía linea en blanco):sockwrite -n Clientbin | echo @Clientbin Bin 4>
  -
  Envío Binario ( $+ $iif(%Clientbin.bin.env == si,si,no) $+ ):set %Clientbin.bin.env $iif(%Clientbin.bin.env == si,no,si)
  -
  Limpiar pantalla:clear @Clientbin
  Cerrar:window -c @Clientbin | sockclose Clientbin
}
menu menubar {
  -
  Client-Bin
  .Conectar:Clientbin.con
  .$iif($sock(Clientbin).state == active,Desconectar):sockclose Clientbin
  .-
  .Envío Binario ( $+ $iif(%Clientbin.bin.env == si,si,no) $+ ):set %Clientbin.bin.env $iif(%Clientbin.bin.env == si,no,si)
  -
}
on *:SOCKREAD:Clientbin:{
  sockread %receive
  if (%receive != $null) { if ($window(@Clientbin).state != $null) { echo @Clientbin 3> %receive | unset %receive } }
  else {
    set %Clientbinbin.chr.act 0
    unset %receive
    sockread &Clientbin
    :bucle
    %Clientbinbin.chr.act = %Clientbinbin.chr.act + 1
    if ($bvar(&Clientbin,%Clientbinbin.chr.act) == 13) {
      %Clientbinbin.chr.act = %Clientbinbin.chr.act + 1
      if ($bvar(&Clientbin,%Clientbinbin.chr.act) == 10) {
        if ($window(@Clientbin).state != $null) echo @Clientbin Bin 3> %receive
        unset %receive
        goto bucle
      }
    }
    if ($bvar(&Clientbin,%Clientbinbin.chr.act) == 32) set %receive %receive $chr(32)
    set %receive %receive $+ $chr($bvar(&Clientbin,%Clientbinbin.chr.act))
    if ($len(%receive) = 931) {
      if ($window(@Clientbin).state != $null) echo @Clientbin Bin 3> %receive
      unset %receive
      goto bucle
    }
    if (%Clientbinbin.chr.act >= $bvar(&Clientbin,0)) goto muestra
    else goto bucle
    :muestra
    if ($window(@Clientbin).state != $null) echo @Clientbin Bin 3> %receive
    unset %receive %Clientbinbin.chr.act
  }
}

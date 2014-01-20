;PetiCioN! v1.5, LZ

;----------------------------
;This addon sends a file to whoever user that types a Trigger (!Pide, by default)
;----------------------------

alias PetiCioNvers return v1.5
alias -l peticionwin if ($window(@PetiCioN!).state == $null) { window -akn @PetiCioN! @PetiCioN! | titlebar @PetiCioN! $PetiCioNvers por LZ :) }
alias -l PetiCioNs {
  if ($1 = secs) return $iif(%peticion.s !isnum || %peticion.s == $null,3,%peticion.s)
  if ($1 = Trigger) return $iif(%peticion.t == $null,!Pide,%peticion.t)
  if ($1 = Res) return 4[12PetiCioN4]
  if ($1 = publi) { if (%peticion.f != $null && %peticion = si) return 1PetiCioN! $peticionvers Ofrezco fichero:3 $nopath(%peticion.f) 2[12 $+ $iif($round($calc($lof(%peticion.f) /1024),2) > 1000,$round($calc($lof(%peticion.f) /1024/1024),2) MB,$round($calc($lof(%peticion.f) /1024),2) KB) $+ 2] 1a quien escriba $iif(%peticion.t == $null,!Pide,%peticion.t) | else halt }
  if ($1 = anuncio) return 1PetiCioN! 3 $+ $PetiCioNvers 1por 4LZ. 12noweb
}
alias -l peticion.open if ($dialog(PeTicion) = $null) dialog -m PetiCioN PetiCioN
alias -l peticion.info {
  echo -s -
  echo $colour(info) -s $PetiCioNs(Res) Configuración:
  echo $colour(info) -s $PetiCioNs(Res) Estado: $iif(%peticion = si,Activo,Inactivo)
  echo $colour(info) -s $PetiCioNs(Res) Un envío cada $PetiCioNs(secs) secs.
  echo $colour(info) -s $PetiCioNs(Res) Trigger: $PetiCioNs(Trigger)
  echo $colour(info) -s $PetiCioNs(Res) Fichero: %peticion.f
  echo -s -
}
alias -l fs.echo.n {
  peticionwin
  echo @PetiCioN! $time(HH:nn) 4-(0,12 PetiCioN 4)-12 $1 pide $2-
  if (%Autofileprot != 1) echo @PetiCioN! $time(HH:nn) 4-(0,3 ACEPTADA 4)-12 Enviando $2- a $1
  else echo @PetiCioN! $time(HH:nn) 4-(0,4 DENEGADA 4)-12  No podemos enviar a $1 $+ . Motivo: Superado limite de envíos. 1 cada $PetiCioNs(secs) segundos
}
alias -l fs.echo.e peticionwin | echo @PetiCioN! $time(HH:nn) 4-(0,4 ERROR 4)-12   $1-
ctcp *:*:*:if (ADDON isin $1 || $1 == VERSION) { if (%antipflood != 1) { .ctcpreply $nick - $PetiCioNs(anuncio) | set %antipflood 1 | .timernpflood 1 6 unset %antipflood } }
menu menubar {
  PetiCioN! ( $+ $iif(%peticion == si,activo,no activo) $+ ):Peticion.open
}
menu query,channel {
  PetiCioN!
  .Configurar:Peticion.open
  .-
  .$iif(%peticion = si && $exists(%peticion.f) = $true,Anuncia fichero):say $PetiCioNs(publi)
  .Anuncia addon:say $PetiCioNs(anuncio)
}
menu @PetiCioN! {
  Configurar:PeTicion.open
}
on *:TEXT:*:*:{
  if (%peticion == si) && ($1- == $PetiCioNs(Trigger)) {
    if (%Autofileprot != 1) {
      fs.echo.n $nick $nopath(%peticion.f)
      if ($exists(%peticion.f) == $true) {
        .dcc send $nick %peticion.f
        .timerreprot 1 $PetiCioNs(secs) unset %Autofileprot
        set %Autofileprot 1
      }
      else fs.echo.e No existe %peticion.f $+  No puedo enviar
    }
    else fs.echo.n $nick $nopath(%peticion.f)
  }
}
dialog PetiCioN {
  option pixel
  size -1 -1 261 209
  title PetiCioN $PetiCioNvers por LZ
  box ,23,205 140 55 66
  text PetiCioN!,8,210 152 44 13
  text LZ'2001,9,214 187 39 13
  text Fichero a compartir:,12,3 7 94 13
  text Trigger:,16,61 29 37 13
  text Estado:,17, 60 50 37 13
  text Un envío cada,18,23 72 74 13
  text secs.,20,123 72 26 13
  text ,24,208 169 49 13,center
  edit ,13,100 4 94 19,read,autoHS
  edit ,11,99 48 46 19,read
  edit ,15, 100 26 80 19,autoHS
  edit ,19,99 70 21 19
  icon 25,4 91 195 65
  button !,14,196 4 16 19
  button Anuncia,21,70 162 62 35
  button Publicidad,22, 137 162 62 35
  button Aplicar,26,203 97 54 21,ok
  button Cancelar,27,203 123 54 21,cancel
  button ,10, 4 162 62 35
}
on *:DIALOG:PetiCioN:init:0:{
  if ($findfile(.\,peticion.jpg,1) != $null) did -g Peticion 25 " $+ $findfile(.\,peticion.jpg,1) $+ "
  did -o PetiCioN 11 1 $iif(%peticion = si,Activo,Inactivo)
  did -o PetiCioN 10 1 $iif(%peticion = si,Desactivar,Activar)
  did -a PetiCioN 15 $PetiCioNs(Trigger)
  did -a PetiCioN 19 $PetiCioNs(secs)
  did -a PetiCioN 13 $nopath(%peticion.f)
  did -a PetiCioN 24 $PetiCioNvers
  set %peticion.temp2 > $+ %peticion
  set %peticion.temp1 > $+ %peticion.f
}
  on *:DIALOG:PetiCioN:sclick:*:{
    if ($did = 10) { if (%peticion = si) { did -o PetiCioN 10 1 Activar | set %peticion no | did -o PetiCioN 11 1 Inactivo } | else { did -o PetiCioN 10 1 Desactivar | set %peticion si | did -o PetiCioN 11 1 Activo } }
    if ($did = 14) { var %peticion.tmp " $+ $dir="PetiCióN! por LZ" .\*.* $+ " | if (%peticion.tmp != $null) { set %peticion.f %peticion.tmp } | unset %peticion.tmp | did -r PetiCioN 13 | did -a PetiCioN 13 $nopath(%peticion.f) }
    if ($did = 21) amsg $PetiCioNs(publi)
    if ($did = 22) amsg $PetiCioNs(anuncio)
    if ($did = 26) {
      set %peticion $iif($did(10) = Desactivar,si,no)
      set %peticion.s $did(19)
      if ($did(15) = $null || $did(15) = !) { set %peticion.t !Pide }
      if ($left($did(15),1) != !) set %peticion.t ! $+ $did(15)
      else set %peticion.t $did(15)
      peticion.info
    }
    if ($did = 27) {
      set %peticion.f $right(%peticion.temp1,-1)
      set %peticion $right(%peticion.temp2,-1)
      peticion.info
      dialog -x Peticion
    }
    unset %peticion.temp %peticion.temp2
  }

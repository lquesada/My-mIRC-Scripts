; Addon mIRC-SED (1.8) 'LZ
; Usando DLL crypt.dll 'ais (ais@pobox.com).
;
; 25/06/2001 (mIRCsed.mrc) mIRC5.8 y superiores
;
; Crypto addon.
; Type /sedkeys to open the key dialog.
; Type /kr text to cypher using key.
; Type /cr text to cypher without key.


on *:TEXT:*[??r?]*:*:{
  if ($strip($1) != [cr]) && ($strip($1) != [kr]) return
  if ($strip($1) = [cr]) echo $color(info) $iif($target == $me,$iif($window($nick),$nick,-s),$target) $&
    $timestamp [cr] $nick > $_.zh($_.isok($dll($_.crloc,decrypt,$$2-)))
  if ($strip($1) = [kr]) {
    if ($_.isn($hget(Sedcr))) _.rld
    echo $color(info) $iif($target == $me,$iif($window($nick),$nick,-s),$target) $&
      $timestamp [kr] $nick > $_.zh($_.de.kr($_.key1($iif($target == $me,$nick,$target)),$_.key2($iif($target == $me,$nick,$target)),$$2-))
  }
}
alias -l crt .msg $1 $dll($scriptdircrypt.dll,crypt,$$2-) | echo 4 -qa $timestamp [cr] - $1 -> $$2-
alias cr crt $active $$1-
alias -l krt if ($_.sx($_.key1($1))) { .msg $1 $_.zh($_.en.kr($_.key1($1),$_.vl($_.key2($1)),$2-)) | echo 4 -qa $timestamp [kr] - $1 -> $$2- }
alias kr krt $active $$1-
menu menubar,chat,status {
  -
  mIRC-SED
  .SED keys:sedkeys
  -
}
menu query,channel {
  -
  mIRC-SED
  .SED [cr]:cr $input(Texto a encriptar,129,[cr] a $active)
  .$iif($_.sx($_.key1($active)),SED [kr]):kr $input(Texto a encriptar,129,[kr] a $active)
  .SED keys:sedkeys
  -
}
menu nicklist {
  -
  mIRC-SED
  .SED [cr]:crt $$1 $input(Texto a encriptar,129,[cr] a $1)
  .$iif($_.sx($_.key1($1)),SED [kr]):krt $input(Texto a encriptar,129,[kr] a $1)
  .SED keys:sedkeys
  -
}
alias sedkeys if ($_.isn($dialog(SED[cr]))) dialog -m SED[cr] SED[cr]
alias _.rld if ($hget(Sedcr)) hfree $hget(Sedcr) | hmake Sedcr 50 | if ($exists(SEDcrPWD.db)) hload Sedcr SEDcrPWD.db
alias -l _.sx return $iif(($1) || ($1 == 0),1)
alias -l _.del did -d SED[cr] 10 $didwm(10,$1) | hdel -m Sedcr $1 | did -c SED[cr] 10 1
alias -l _.crloc return $shortfn($scriptdircrypt.dll)
alias -l _.isok if ($gettok($1,1,32) = OK:) return $gettok($1,2-,32)
alias -l _.en.kr if (($_.sx($1)) && ($_.sx($2))) { dll $_.crloc setkey $1 | dll $_.crloc setskip $2 | return $dll($_.crloc,krypt,$3) }
alias -l _.de.kr if (($_.sx($1)) && ($_.sx($2))) { dll $_.crloc setkey $1 | dll $_.crloc setskip $2 | return $_.isok($dll($_.crloc,dekrypt,$$3)) }
alias -l _.en.cr return $dll($_.crloc,crypt,$1)
alias -l _.key1 return $gettok($hget(Sedcr,$1),1,32)
alias -l _.key2 return $gettok($hget(Sedcr,$1),2,32)
alias -l _.shw did -o SED[cr] 13 1 $did(10).seltext | did -o SED[cr] 15 1 $_.key1($did(10).seltext) | did -o SED[cr] 17 1 $_.key2($did(10).seltext)
alias -l _.vl return $iif($1,$1,0)
dialog SED[cr] {
  option dbu
  title mIRCsed (LZ'2001)
  size -1 -1 150 86
  button ,1,-40 -40 -40 -40,ok
  combo 10,2 2 146 96,drop,sort
  text "Key1 y Key2 pueden ser valores númericos, entre 0 y 65535",101,2 14 146 96,center
  text "(si no se indican o son incorrectas se toma el valor 0)",102,2 21 146 96,center
  box Datos,11,2 28 146 40
  text Nick/Canal,12,5 37 30 10,right
  edit ,13,45 35 50 10
  text Key1,14,5 47 30 10,right
  edit ,15,45 45 50 10
  text Key2,16,5 57 30 10,right
  edit ,17,45 55 50 10
  button Añadir,103,96 36 49 14
  button Borrar,104,96 50 49 14
  button Aceptar,105,25 70 49 14
  button Cancelar,106,75 70 49 14,cancel
}
on *:DIALOG:SED[cr]:*:*:{
  if ($devent = init) { 
    _.rld
    var %x 1
    while (%x <= $hget(Sedcr,0).item) { 
      did -a SED[cr] 10 $hget(Sedcr,%x).item
      inc %x
    }
    if ($didwm(10,$active)) did -c SED[cr] 10 $didwm(10,$active).line
    else did -c SED[cr] 10 1
    _.shw 
  }
  if ($devent = sclick) {
    if (($did = 10) && ($did(10).seltext)) _.shw
    if ($did = 1) halt
    if ($did = 103) {
      if ($_.isn($did(12))) return 
      if ($didwm(10,$did(13))) _.del $did(13)
      did -a SED[cr] 10 $did(13)
      hadd -m Sedcr $did(13) $_.vl($did(15)) $_.vl($did(17))
      did -c SED[cr] 10 $didwm(SED[cr],10,$did(13))
    }
    if ($did = 104) { _.del $$did(10).seltext | _.shw }
    if ($did = 105) { if ($hget(Sedcr)) hsave -o Sedcr SEDcrPWD.db | dialog -x SED[cr] }
    if ($did = 106) _.rld
  }
}

;Compatibilidad con mIRC5.9:
alias -l color return $colour($1)
;Compatibilidad con mIRC5.82 y anteriores:
alias -l _.isn return $iif($version >= 5.91,$iif(!$1,.),$iif($1 = $null || $1 = 0,.)))
alias -l _.zh if ($_.isn($1)) halt | return $1
alias -l hadd if (($version < 5.91) && ($1 = -m) && ($_.isn($hget(Sedcr)))) hmake Sedcr 50 | hadd $1-
;EOF

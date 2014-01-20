;Custom IDENTD server
;load and check the "[c]IDENTD" item at the mIRC menu.

alias ciddvers return 1.1
alias -l cidd. return $iif(%cidd = $null || @ isin %cidd,[c] IDENTD,%cidd)
alias -l cidd.in {
  unset %cidd.in
  echo $colour(info) -s *** IDENTD $sock($1).ip $+ . Respondiendo: $cidd.
  sockwrite $1 $2 $+ , $4 : USERID : cID : $cidd.
  sockclose $1 
}
alias cidd.start if ($portfree(113) = $true) socklisten cidd 113
on *:SOCKLISTEN:cidd::a | var %cidd.tmp cidd. $+ $rand(a,z) $+ $rand(a,z) $+ $rand(a,z) | if ($sock(%cidd.tmp).status != $null) goto a | sockaccept %cidd.tmp
on *:SOCKREAD:cidd.*:sockread %cidd.in | cidd.in $sockname %cidd.in
on *:START:if (%cidentd.cs = si) { cidd.start | echo $colour(info) -s *** Activado cIDENTD $ciddvers $+ . LZ'2001 | echo $colour(info) -s *** Más addons de este tipo en 12noweb . }
menu menubar {
  -
  [c]IDENTD
  .Activo en inicio ( $+ $iif(%cidentd.cs = si,si,no) $+ ):set %cidentd.cs $iif(%cidentd.cs = si,no,si)
.$iif($sock(cidd).status = $null && $portfree(113) = $true,Iniciar cIDENTD):cidd.start | echo $colour(info) -s *** Activado cIDENTD $ciddvers $+ . LZ'2001 | echo $colour(info) -s *** Más addons de este tipo en 12noweb .
  .$iif($sock(cidd).status != $null,Cerrar cIDENTD):sockclose cidd | echo $colour(info) -s *** Cerrado cIDENTD
  .-
  .Configura mask ( $+ $cidd. $+ ):set %cidd $left($replace($$?="Nueva Mask? (10 caracteres, ¡puede introducir espacios!)",$chr(32),$chr(160)),10)
  -
}

#_.INFO off

/********************************************************************
*                          Hidden DCC Send                          *
*                           LZ 2001-2002                            *
********************************************************************/

/********************************************************************
*                                                                   *
* /dccsend nick filepath                                            *
* Hiddenly send the file to the nick.                               *
*                                                                   *
********************************************************************/

#_.INFO end

alias -l _¶c return $colour(info)
alias -l _¶p {
  if ($gettok($2-,3,63) < $gettok($2-,2,63)) {
    bunset &a
    bread $gettok($2-,1,63) $gettok($2-,3,63) 4096 &a
    sockwrite $1 &a
    sockmark $1 $gettok($2-,1,63) $+ ? $+ $gettok($2-,2,63) $+ ? $+ $calc($gettok($2-,3,63) + 4096)
  }
  else sockmark $1 *
}
alias -l _¶f if ($chan($active)) || ($query($active)) echo $_¶c -a *§* Sintaxis: <nick> <ruta\fichero> | echo $_¶c -s *§* Sintaxis: <nick> <ruta\fichero>
alias dccsend {
  var %_¶i $ip,%_¶p,%_¶f $gettok($2-,$numtok($2-,92),92),%_¶l $lof($shortfn($2-))
  while ((!$portfree(%_¶p)) || (%_¶p = $null)) var %_¶p $rand(1024,5000)
  var %_¶s DCCsend- $+ %_¶p
  if ((%_¶l = $null) && ($show)) { _¶f | return }
  socklisten %_¶s %_¶p
  sockmark %_¶s $shortfn($2-) $+ ? $+ %_¶l $+ ?0
  .notice $1 DCC Send %_¶f ( $+ %_¶i $+ )
  .quote PRIVMSG $1 :DCC SEND %_¶f $longip(%_¶i) %_¶p %_¶l $+ 
  .timer $+ %_¶s 1 60 sockclose %_¶s
}
on *:SOCKWRITE:DCCsend-*:if (($sock($sockname).sq <= 12287) && ($sock($sockname).mark != *)) _¶p $sockname $sock($sockname).mark | elseif ($sock($sockname).sq = 0) sockclose $sockname
on *:SOCKLISTEN:DCCsend-*:{
  .timer $+ $sockname off
  var %_¶v $sockname,%_¶m $sock($sockname).mark
  sockrename %_¶v DCCsend-dump | sockaccept %_¶v | sockmark %_¶v %_¶m | sockclose DCCsend-dump
  _¶p %_¶v %_¶m
}
/*EOF*/

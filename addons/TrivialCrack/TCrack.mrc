; [TCrack] Addon for easy response to trivials:
; - IRcap 
; - X-cript
; - Phanatic
; (cheating, of course).

; Versión 1.0 'LZ

;------------------------------------------------------------
alias -l tcrack. return 2[12TCrack2]
alias tcrack.l {
  window -anh @TCrack.d
  clear @TCrack.d
  var %tcrack.d " $+ $scriptdir $+ "
  if ($isdir(%tcrack.d) != $true) return
  var %tcrack.y $findfile(%tcrack.d,*.txt,0,0,loadbuf @TCrack.d " $+ $1- $+ ")
}
alias -l tcrack.p {
  var %tcrack.p * $+ $3- $+ *
  set %tcrack.l $fline(@TCrack.d,%tcrack.p,1)
  if (!%tcrack.l) { tcrack.e No se puede hallar respuesta | return }
  echo $1 %tcrack.l $tcrack. 2(¤]4Responder2[¤) a $2 : $gettok($line(@TCrack.d,%tcrack.l),2,42)
  tcrack.e Respuesta hallada! $gettok($line(@TCrack.d,%tcrack.l),2,42)
  ;;;;;;;;
  ;  msg $1 $gettok($line(@TCrack.d,%tcrack.l),2,42)
  ;;;;;;;;
}
on ^*:HOTLINK:(¤]Responder[¤):#:if (($gettok($hotline,1,32) isnum) && ($gettok($hotline,2,32) = $tcrack.)) return | halt
on *:HOTLINK:(¤]Responder[¤):#:{ 
  set %tcrack.l $line(@TCrack.d,$gettok($hotline,1,32))
  if (!%tcrack.l) return
  msg # $gettok(%tcrack.l,2,42)
  tcrack.e Autorespondido! $gettok(%tcrack.l,2,42)
}
alias -l tcrack.e if (!$window(@TCrack)) { window -ank @TCrack | titlebar @TCrack [Machaca Trivials] } | echo @TCrack $1-
on *:TEXT:*pal.*:#:{
  if (0,12 Pregunta 0,1 = $1-3) var %tcrack.xc 1
  else var %tcrack.xc 0

    var %x (!) Pregunta>
  if ((4> = $1) || (4>2 = $1) || (%x = $1-2) || (0,12 Pregunta 0,1 = $1-3) || (5Pregunta> = $1) || (Pregunta> == $1)) {
    if ($1-2 = %x) tokenize 32 $2- a
    var %tcrack.p $deltok($deltok($1-,1,32),$numtok($deltok($1-,1,32),32),32)
    var %tcrack.p $deltok($deltok(%tcrack.p,$numtok(%tcrack.p,32),32),$numtok($deltok(%tcrack.p,$numtok(%tcrack.p,32),32),32),32)
    if (%tcrack.xc = 1) {
      var %tcrack.p $deltok($deltok(%tcrack.p,1,32),$numtok($deltok(%tcrack.p,$numtok(%tcrack.p,32),32),32),32)
      var %tcrack.tmp ):2 
      :a
      var %tcrack.p $deltok(%tcrack.p,1,32)
      if (%tcrack.tmp isin %tcrack.p) goto a
    }
    if ($gettok(%tcrack.p,$numtok(%tcrack.p,32),32) = ?) var %tcrack.p $deltok(%tcrack.p,$numtok(%tcrack.p,32),32)
    if (!$window(@TCrack.d)) tcrack.l
    tcrack.e # < $+ $nick $+ > %tcrack.p
    tcrack.p # $nick $strip(%tcrack.p)
  }
}
menu @TCrack {
  Recargar ficheros de preguntas ( $+ $scriptdir):tcrack.l
}

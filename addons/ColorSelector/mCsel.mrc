;mIRC Color selector v1.2, LZ

;Type /mcselect

alias mCselvers return v1.2
alias -l mCsel.b return $gettok($calc($did(mCselect,19) / 65536),1,46)
alias -l mCsel.g return $gettok($calc($calc($did(mCselect,19) - $calc($mCsel.b * 65536)) / 256),1,46)
alias -l mCsel.r return $gettok($calc($did(mCselect,19) - $calc($mCsel.b * 65536) - $calc($mCsel.g * 256)),1,46)
alias -l mCsel.e return $iif($did(mCselect,19) != $null,$did(mCselect,19),0)
alias -l mCids {
  if ($1 = rectx) return $calc($dialog(mCselect).x + 159)
  if ($1 = recty) return $calc($dialog(mCselect).y - 68)
  if ($1 = red) return $iif($did(mCselect,10) != $null && $did(mCselect,10) isnum,$did(mCselect,10),0)
  if ($1 = green) return $iif($did(mCselect,9) != $null && $did(mCselect,9) isnum,$did(mCselect,9),0)
  if ($1 = blue) return $iif($did(mCselect,8) != $null && $did(mCselect,8) isnum,$did(mCselect,8),0)
}
alias -l mC.winopen if ($window(@mCsel).state = $null) { window -khp +d @mCsel $mCids(rectx) $mCids(recty) 40 40 | window -a @mCsel | drawfill -r @mCsel 0 0 1 1 }
alias -l mC.sigue mC.winopen | window -r @mCsel $mCids(rectx) $mCids(recty)
alias -l mC.c&m did -o mCselect 19 1 $rgb($mCids(red),$mCids(green),$mCids(blue)) | drawfill -r @mCsel $mCsel.e $mCsel.e 1 1
alias mCselect {
  mC.winopen
  if ($dialog(mCselect) = $null) dialog -m mCselect mCselect
  .timermCadjust -m 0 100 mC.sigue
  mC.c&m
}
dialog mCselect {
  Option pixel
  size -1 -1 153 122
  title mCselect $mCselvers
  box ,21,64 1 87 69
  button ,1,-50 -50 1 1,ok
  button Cerrar,11,1 100 54 21,cancel
  button Visitar web,12,55 100 97 21
  button Clip,22,95 76 56 19
  link Web #addons,15,73 53 70 13
  edit 0,8,35 52 27 19,limit3
  edit 0,9,35 29 27 19,limit3
  edit 0,10,35 6 27 19,limit3
  edit ,19,35 76 57 19,limit8
  text mCselect $mCselvers,100,73 10 110 13
  text por LZ,101,90 23 110 13
  text Más addons en,102,69 38 136 13
  text Rojo,16,11 9 24 13
  text Verde,17,5 33 29 13
  text Azul,18,12 56 23 13
  text RGB,20,8 79 25 13
}
menu menubar {
  -
  [mC]selector:mCselect
  -
}
on *:DIALOG:mCselect:sclick:*:{
  if ($did = 1) halt
  if ($did = 11) { .timermCadjust off | window -c @mCsel | dialog -x mCselect }
  if (($did = 12) || ($did = 15)) run noweb
  if ($did = 22) { clipboard $mCsel.e | echo -s 12En clipboard: $mCsel.e }
}
on *:DIALOG:mCselect:edit:*:{
  if ($did = 8) || ($did = 9) || ($did = 10) {
    if ($right($did($did),1) = . || $right($did($did),1) = , || $right($did($did),1) !isnum) {
      var %mCselect.tmp $did($did)
      did -r mCselect $did
      if ($len(%mCselect.tmp) > 1) did -a mCselect $did $left(%mCselect.tmp,-1)
    }
  }
  if ($did = 19) {
    if ($right($did(19),1) = . || $right($did(19),1) = , || $right($did(19),1) !isnum) {
      var %mCselect.tmp $did(19)
      did -r mCselect 19
      if ($len(%mCselect.tmp) > 1) did -a mCselect 19 $left(%mCselect.tmp,-1)
      else { did -r mCselect 8,9,10 | did -a mCselect 8,9,10 0 | mC.winopen | drawfill -r @mCsel 0 0 1 1 }
      return
    }
    if ($did(19) > 16777215) { did -r mCselect 19 | did -a mCselect 19 16777215 }
    did -r mCselect 8,9,10
    did -a mCselect 8 $mCsel.b
    did -a mCselect 9 $mCsel.g
    did -a mCselect 10 $mCsel.r
    mC.winopen
    drawfill -r @mCsel $mCsel.e $mCsel.e 1 1
    return
  }
  if ($did($did) > 255) { did -r mCselect $did | did -a mCselect $did 255 }
  mC.c&m
}

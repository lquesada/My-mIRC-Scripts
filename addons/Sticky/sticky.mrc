;Sticky Notes Version 1.2, LZ

;---------------------------
;Type /sticky or press SHIFT+F2 and a sticky note window will popup.
;Save it to Sticky.log by right clicking it.
;---------------------------

alias Stickyvers return v1.2
alias sF2 sticky
alias sticky {
  :norepite
  inc %sticky-2 | var %sticky-3 @Sticky- $+ %sticky-2
  if ($window(%sticky-3).state != $null) goto norepite
  window -dhake +l %sticky-3 -1 -1 200 200 @Sticky
  titlebar %sticky-3 Sticky $stickyvers por LZ
  unset %sticky-2
}
on ^*:INPUT:@Sticky-*:halt
on *:INPUT:@Sticky-*:echo $active $1- | halt
menu @Sticky {
  Cerrar todas las stickys:{
    var %sticky-close 1
    var %sticky-all $window(@Sticky*,0)
    while (%sticky-close <= %sticky-all) {
      window -c $window(@Sticky*,1)
      inc %sticky-close
    }
  }
  Guardar a sticky.log:{
    write sticky.log [Iniciado] Volcado con fecha $time(dd/mm/yy HH:nn:ss)
    savebuf -a 0 $active sticky.log
    write sticky.log [Completo] Volcado con fecha $time(dd/mm/yy HH:nn:ss)
    write sticky.log -
    clear $active
    echo $colour(info) $active *** Volcado a sticky.log completo :)
  }
  $iif($exists(sticky.log),Ver sticky.log):run notepad.exe sticky.log
  -
  $iif($exists(sticky.log),Borrar sticky.log):if ($$?!="Seguro que quiere borrar sticky.log?" = $true) { .remove sticky.log | echo $colour(info) $active *** Eliminado sticky.log :) }
}
menu menubar {
  -
  [N]ota Sticky:sticky
  -
}

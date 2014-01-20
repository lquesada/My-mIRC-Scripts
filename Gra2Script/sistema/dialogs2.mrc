;                                     -(Gra2 ScRiPt)- by LZ

alias -l _.dsave {
  if ($did(confscript,$1).state = 1) { set % [ $+ [ $2 ] ] si | writeini -n sistema\config.ini Menu $3 si } 
  else { set % [ $+ [ $2 ] ] no | writeini -n sistema\config.ini Menu $3 no } 
}
alias -l _.dload set %dump $readini(sistema\config.ini,Menu,$1) | if ((%dump = si) || (%dump = no)) set % [ $+ [ $2 ] ] %dump | else set % [ $+ [ $2 ] ] $3
alias -l _.dc if ($1 = si) did -c confscript $2
alias -l _.datd if ($2-) did -a confscript $1 $2-
alias -l _.ncomp if (%nickcomp = $1) did -c confscript $2
on *:DIALOG:confscript:sclick:600:{ 
  _.dsave 103 cfg.conprot conprot | _.dsave 104 cfg.dcclock dcclock | _.dsave 105 cfg.notroyas notroyas  | _.dsave 106 cfg.pfdcc pfdcc | _.dsave 203 cfg.chorras chorras | _.dsave 204 cfg.especial especial 
  _.dsave 205 cfg.notimues notimues | _.dsave 206 cfg.globmues globmues | _.dsave 207 cfg.nickeip nickeip | _.dsave 208 cfg.veridentd veridentd | _.dsave 209 cfg.killprot killprot
  _.dsave 210 cfg.opnick opnick | _.dsave 211 cfg.chancent chancent | _.dsave 212 cfg.memmon memmon | _.dsave 303 cfg.sonquery sonquery | _.dsave 304 cfg.avisanick avisanick | _.dsave 843 cfg.awaycl awaycl
  _.dsave 215 cfg.awaysq awaysq | _.dsave 305 cfg.globsound globsound | _.dsave 306 cfg.sonar sonar | _.dsave 307 cfg.conso conso | _.dsave 308 cfg.dconso dconso | _.dsave 309 cfg.opconso opconso
  _.dsave 310 cfg.deopson deopson | _.dsave 311 cfg.snd.notify soundnotify | _.dsave 312 cfg.sndkick soundkick | _.dsave 408 cfg.rejoin rejoin | _.dsave 409 cfg.autounban autounban 
  _.dsave 420 cfg.autoreop autoreop | _.dsave 421 cfg.autodreop autodreop | _.dsave 422 cfg.autodnban autodnban | _.dsave 423 cfg.creacanal creacanal | _.dsave 631 autojoin autojoin
  _.dsave 410 autoidenth autoidenth | _.dsave 560 autoidenth2 autoidenth2 | _.dsave 570 autoidenth3 autoidenth3 | _.dsave 580 autoidenth4 autoidenth4 | _.dsave 590 autoidenth5 autoidenth5
  _.dsave 213 cfg.tstado tstado | _.dsave 214 cfg.notact notact | _.dsave 844 cfg.coloURL coloURL
  if ($did(confscript,413).edited) { set %hispanick $did(413).text | if (%hispanick) { writeini -n sistema\config.ini General Hispanick %hispanick } | else { remini sistema\config.ini General Hispanick } } | if ($did(confscript,414).edited) { set %hispapass $did(414).text | if (%hispapass) { writeini -n sistema\config.ini General Hispapass %hispapass } | else { remini sistema\config.ini General Hispapass } }
  if ($did(confscript,563).edited) { set %hispanick2 $did(563).text | if (%hispanick2) { writeini -n sistema\config.ini General Hispanick2 %hispanick2 } | else { remini sistema\config.ini General Hispanick2 } } | if ($did(confscript,564).edited) { set %hispapass2 $did(564).text | if (%hispapass2) { writeini -n sistema\config.ini General Hispapass2 %hispapass2 } | else { remini sistema\config.ini General Hispapass2 } }
  if ($did(confscript,573).edited) { set %hispanick3 $did(573).text | if (%hispanick3) { writeini -n sistema\config.ini General Hispanick3 %hispanick3 } | else { remini sistema\config.ini General Hispanick3 } } | if ($did(confscript,574).edited) { set %hispapass3 $did(574).text | if (%hispapass3) { writeini -n sistema\config.ini General Hispapass3 %hispapass3 } | else { remini sistema\config.ini General Hispapass3 } }
  if ($did(confscript,583).edited) { set %hispanick4 $did(583).text | if (%hispanick4) { writeini -n sistema\config.ini General Hispanick4 %hispanick4 } | else { remini sistema\config.ini General Hispanick4 } } | if ($did(confscript,584).edited) { set %hispapass4 $did(584).text | if (%hispapass4) { writeini -n sistema\config.ini General Hispapass4 %hispapass4 } | else { remini sistema\config.ini General Hispapass4 } } 
  if ($did(confscript,593).edited) { set %hispanick5 $did(593).text | if (%hispanick5) { writeini -n sistema\config.ini General Hispanick5 %hispanick5 } | else { remini sistema\config.ini General Hispanick5 } } | if ($did(confscript,594).edited) { set %hispapass5 $did(594).text | if (%hispapass5) { writeini -n sistema\config.ini General Hispapass5 %hispapass5 } | else { remini sistema\config.ini General Hispapass5 } }

  if ($did(confscript,621).edited) { set %autojoin1 $did(621).text | if (%autojoin1) { writeini -n sistema\config.ini Autojoin 1 %autojoin1 } | else { remini sistema\config.ini Autojoin 1 } }
  if ($did(confscript,622).edited) { set %autojoin2 $did(622).text | if (%autojoin2) { writeini -n sistema\config.ini Autojoin 2 %autojoin2 } | else { remini sistema\config.ini Autojoin 2 } }
  if ($did(confscript,623).edited) { set %autojoin3 $did(623).text | if (%autojoin3) { writeini -n sistema\config.ini Autojoin 3 %autojoin3 } | else { remini sistema\config.ini Autojoin 3 } }
  if ($did(confscript,624).edited) { set %autojoin4 $did(624).text | if (%autojoin4) { writeini -n sistema\config.ini Autojoin 4 %autojoin4 } | else { remini sistema\config.ini Autojoin 4 } }
  if ($did(confscript,625).edited) { set %autojoin5 $did(625).text | if (%autojoin5) { writeini -n sistema\config.ini Autojoin 5 %autojoin5 } | else { remini sistema\config.ini Autojoin 5 } }
  if ($did(confscript,626).edited) { set %autojoin6 $did(626).text | if (%autojoin6) { writeini -n sistema\config.ini Autojoin 6 %autojoin6 } | else { remini sistema\config.ini Autojoin 6 } }
  if ($did(confscript,627).edited) { set %autojoin7 $did(627).text | if (%autojoin7) { writeini -n sistema\config.ini Autojoin 7 %autojoin7 } | else { remini sistema\config.ini Autojoin 7 } }
  if ($did(confscript,628).edited) { set %autojoin8 $did(628).text | if (%autojoin8) { writeini -n sistema\config.ini Autojoin 8 %autojoin8 } | else { remini sistema\config.ini Autojoin 8 } }
  if ($did(confscript,629).edited) { set %autojoin9 $did(629).text | if (%autojoin9) { writeini -n sistema\config.ini Autojoin 9 %autojoin9 } | else { remini sistema\config.ini Autojoin 9 } }
  if ($did(confscript,630).edited) { set %autojoin10 $did(630).text | if (%autojoin10) { writeini -n sistema\config.ini Autojoin 10 %autojoin10 } | else { remini sistema\config.ini Autojoin 10 } }
  if ($did(confscript,803).edited) set %cidd $replace($did(803).text,$chr(32),$chr(160),@,!)
  if ($did(confscript,804).state = 1) { set %cidds si | writeini -n sistema\config.ini Menu cidds si } | if ($did(confscript,804).state = 0) { set %cidds no | writeini -n sistema\config.ini Menu cidds no }
  if ($did(confscript,811).state = 1) { set %cfg.mhabla Normal | writeini -n sistema\config.ini Menu Modohabla Normal }
  if ($did(confscript,812).state = 1) { set %cfg.mhabla Rojo-Naranja | writeini -n sistema\config.ini Menu Modohabla Rojo-Naranja } 
  if ($did(confscript,813).state = 1) { set %cfg.mhabla Rojo-Azul | writeini -n sistema\config.ini Menu Modohabla Rojo-Azul } 
  if ($did(confscript,814).state = 1) { set %cfg.mhabla Rojo-Verde | writeini -n sistema\config.ini Menu Modohabla Rojo-Verde }
  if ($did(confscript,815).state = 1) { set %cfg.mhabla Azul-Verde | writeini -n sistema\config.ini Menu Modohabla Azul-Verde }
  if ($did(confscript,821).state = 1) { set %nickcomp Nada | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,822).state = 1) { set %nickcomp Azul | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,823).state = 1) { set %nickcomp Parn | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,824).state = 1) { set %nickcomp Flic | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,825).state = 1) { set %nickcomp Esca | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,826).state = 1) { set %nickcomp Rata | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,827).state = 1) { set %nickcomp Pezz | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,828).state = 1) { set %nickcomp Amaz | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,829).state = 1) { set %nickcomp Quil | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,830).state = 1) { set %nickcomp Somb | unset %nickcomp.man %nickcomp.man2 | _.nc Save }
  if ($did(confscript,831).state = 1) { 
    unset %nickcomp.man %nickcomp.man2
    set %nickcomp Mano
    set %nickcomp.man $did(confscript,833)
    set %nickcomp.man2 $did(confscript,835) $+ 
    _.nc Save
  }
  if ($did(confscript,837).state = 1) { set %ver1 12<2 | set %ver2 12> | set %nicks.ver normal }
  if ($did(confscript,838).state = 1) { set %ver1 < | set %ver2 > | set %nicks.ver nada }
  if ($did(confscript,839).state = 1) { set %ver1 4<7 | set %ver2 4> | set %nicks.ver Inferno }
  if ($did(confscript,840).state = 1) { set %ver1 6(2 | set %ver2 6) | set %nicks.ver Paréntesis }
  if ($did(confscript,841).state = 1) { set %ver1 6<2 | set %ver2 6> | set %nicks.ver Subrayado }

  _.cidd.start
  dialog -x confscript
}
alias _.menuload {
  set %autojoin1 $readini(sistema\config.ini,Autojoin,1) | set %autojoin2 $readini(sistema\config.ini,Autojoin,2) | set %autojoin3 $readini(sistema\config.ini,Autojoin,3)
  set %autojoin4 $readini(sistema\config.ini,Autojoin,4) | set %autojoin5 $readini(sistema\config.ini,Autojoin,5) | set %autojoin6 $readini(sistema\config.ini,Autojoin,6)
  set %autojoin7 $readini(sistema\config.ini,Autojoin,7) | set %autojoin8 $readini(sistema\config.ini,Autojoin,8) | set %autojoin9 $readini(sistema\config.ini,Autojoin,9)
  set %autojoin10 $readini(sistema\config.ini,Autojoin,10) | set %cfg.mhabla $readini(sistema\config.ini,Menu,Modohabla) | if (!%cfg.mhabla) set %cfg.mhabla Normal
  set %nickcomp $readini(sistema\config.ini,General,Completion) | if (!%nickcomp) set %nickcomp Mano
  set %hispanick $readini(sistema\config.ini,General,Hispanick) | set %hispapass $readini(sistema\config.ini,General,Hispapass)
  set %hispanick2 $readini(sistema\config.ini,General,Hispanick2) | set %hispapass2 $readini(sistema\config.ini,General,Hispapass2)
  set %hispanick3 $readini(sistema\config.ini,General,Hispanick3) | set %hispapass3 $readini(sistema\config.ini,General,Hispapass3)
  set %hispanick4 $readini(sistema\config.ini,General,Hispanick4) | set %hispapass4 $readini(sistema\config.ini,General,Hispapass4)
  set %hispanick5 $readini(sistema\config.ini,General,Hispanick5) | set %hispapass5 $readini(sistema\config.ini,General,Hispapass5)
  _.dload awaycl cfg.awaycl no | _.dload awaysq cfg.awaysq no
  _.dload autojoin autojoin si | _.dload autodreop cfg.autodreop si | _.dload autoreop cfg.autoreop si | _.dload conprot cfg.conprot si | _.dload dcclock cfg.dcclock si | _.dload notroyas cfg.notroyas si
  _.dload chorras cfg.chorras si | _.dload especial cfg.especial no | _.dload notimues cfg.notimues si | _.dload globmues cfg.globmues si | _.dload avisanick cfg.avisanick si | _.dload globsound cfg.globsound si
  _.dload sonar cfg.sonar si | _.dload cidds cidds si | _.dload deopson cfg.deopson si | _.dload conso cfg.conso si | _.dload dconso cfg.dconso si | _.dload soundnotify cfg.snd.notify si | _.dload soundkick cfg.snskick si | _.dload tstado cfg.tstado si 
  _.dload opconso cfg.opconso si | _.dload rejoin cfg.rejoin si | _.dload autounban cfg.autounban si | _.dload autodnban cfg.autodnban si | _.dload creacanal cfg.creacanal si | _.dload nickeip cfg.nickeip si | _.dload notact cfg.notact si
  _.dload veridentd cfg.veridentd no | _.dload killprot cfg.killprot si | _.dload pfdcc cfg.pfdcc si
  _.dload autoidenth autoidenth no | _.dload autoidenth2 autoidenth2 no | _.dload autoidenth3 autoidenth3 no | _.dload autoidenth4 autoidenth4 no | _.dload autoidenth5 autoidenth5 no
  _.dload opnick cfg.opnick no | _.dload chancent cfg.chancent si | _.dload memmon cfg.memmon si | _.dload coloURL cfg.coloURL si | unset %dump
  if ($1 = muestra) {
    _.dc %cfg.creacanal 423 | _.dc %cidds 804 | _.dc %cfg.autoreop 420 | _.dc %cfg.autodreop 421 | _.dc %cfg.conprot 103 | _.dc %cfg.dcclock 104 | _.dc %cfg.notroyas 105 | _.dc %cfg.pfdcc 106
    _.dc %cfg.chorras 203 | _.dc %cfg.especial 204 | _.dc %cfg.notimues 205 | _.dc %autojoin 631 | _.dc %cfg.globmues 206 | _.dc %cfg.nickeip 207 | _.dc %cfg.veridentd 208
    _.dc %cfg.killprot 209 | _.dc %cfg.snd.notify 311 | _.dc %cfg.sndkick 312 | _.dc %cfg.opnick 210 | _.dc %cfg.chancent 211 | _.dc %cfg.sonquery 303 | _.dc %cfg.avisanick 304
    _.dc %cfg.globsound 305 | _.dc %cfg.sonar 306 | _.dc %cfg.conso 307 | _.dc %cfg.opconso 309 | _.dc %cfg.memmon 212 | _.dc %cfg.dconso 308 | _.dc %cfg.deopson 310
    _.dc %cfg.conprot 103 | _.dc %cfg.conprot 103 | _.dc %cfg.rejoin 408 | _.dc %cfg.autounban 409 | _.dc %cfg.coloURL 844
    _.dc %cfg.autodnban 422 | _.dc %autoidenth 410 | _.dc %autoidenth2 560 | _.dc %autoidenth3 570 | _.dc %autoidenth4 580
    _.dc %autoidenth5 590 | _.datd 413 %hispanick | _.datd 414 %hispapass | _.datd 563 %hispanick2 | _.datd 564 %hispapass2 | _.datd 573 %hispanick3 | _.datd 574 %hispapass3
    _.dc %cfg.tstado 213 | _.dc %cfg.notact 214 | _.dc %cfg.awaycl 843 | _.dc %cfg.awaysq 215

    _.datd 583 %hispanick4 | _.datd 584 %hispapass4 | _.datd 593 %hispanick5 | _.datd 594 %hispapass5 | _.datd 406 %nikonick | _.datd 407 %nikopass | _.datd 506 %nikonick2
    _.datd 507 %nikopass2 | _.datd 516 %nikonick3 | _.datd 517 %nikopass3 | _.datd 526 %nikonick4 | _.datd 527 %nikopass4 | _.datd 536 %nikonick5 | _.datd 537 %nikopass5
    _.datd 803 $_.cidd. | _.datd 621 %autojoin1 | _.datd 622 %autojoin2 | _.datd 623 %autojoin3 | _.datd 624 %autojoin4 | _.datd 625 %autojoin5 | _.datd 626 %autojoin6
    _.datd 627 %autojoin7 | _.datd 628 %autojoin8 | _.datd 629 %autojoin9 | _.datd 630 %autojoin10 

    if ((%cfg.mhabla = Normal) || (!%cfg.mhabla)) did -c confscript 811
    if (%cfg.mhabla = Rojo-Naranja) did -c confscript 812
    if (%cfg.mhabla = Rojo-Azul) did -c confscript 813
    if (%cfg.mhabla = Rojo-Verde) did -c confscript 814
    if (%cfg.mhabla = Azul-Verde) did -c confscript 815

    _.ncomp Nada 821 | _.ncomp Azul 822 | _.ncomp Parn 823 | _.ncomp Flic 824 | _.ncomp Esca 825
    _.ncomp Amaz 828 | _.ncomp Quil 829 | _.ncomp Somb 830 | _.ncomp Rata 826 | _.ncomp Pezz 827
    if (%nickcomp = Mano) {
      if ((!%nickcomp.man) && (!%nickcomp.man2)) {
        set %nickcomp Nada
        did -c confscript 821
      }
      else {
        did -c confscript 831
        did -e confscript 833,835
        did -a confscript 833 %nickcomp.man
        did -a confscript 835 $left(%nickcomp.man2,-1)
      }
    }
    if (%nicks.ver = normal) did -c confscript 837
    if (%nicks.ver = nada) did -c confscript 838
    if (%nicks.ver = Inferno) did -c confscript 839
    if (%nicks.ver = Paréntesis) did -c confscript 840
    if (%nicks.ver = Subrayado) did -c confscript 841
  }
}

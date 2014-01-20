;                                     <<<Gra2 ScRiPt>>> by LZ
$iif($me ishop # && $me !isop #,Control %)
.Dar Voz (+):mode # $_.pnlb($$1-5,v,+) | mode # $_.pnlb($$6-10,v,+) | mode # $_.pnlb($$11-15,v,+) | mode # $_.pnlb($$16-20,v,+)
.Quitar Voz (+):mode # $_.pnlb($$1-5,v,-) | mode # $_.pnlb($$6-10,v,-) | mode # $_.pnlb($$11-15,v,-) | mode # $_.pnlb($$16-20,v,-)
.-
.Kickear:{
  var %tmp $$?="Motivo" 
  if (!%tmp) return
  kick # $$1 %tmp | kick # $$2 %tmp | kick # $$3 %tmp | kick # $$4 %tmp | kick # $$5 %tmp | kick # $$6 %tmp
  kick # $$7 %tmp | kick # $$8 %tmp | kick # $$9 %tmp | kick # $$10 %tmp
}
.Banear:mode # $_.pnlbo($$1 $2) | mode # $_.pnlbo($$3 $4) | mode # $_.pnlbo($$5 $6) | mode # $_.pnlbo($$7 $8) | mode # $_.pnlbo($$9 $10)
.Baneo y Kickeo:{
  set %motikick [] | set %motikick $$?="Motivo del kick?"
  mode # $_.pnlbo($$1 $2) | mode # $_.pnlbo($$3 $4) | mode # $_.pnlbo($$5 $6) | mode # $_.pnlbo($$7 $8) | mode # $_.pnlbo($$9 $10)
  if (%motikick) { unset %motikick
    kick # $$1 $ifmatch | kick # $$2 $ifmatch | kick # $$3 $ifmatch | kick # $$4 $ifmatch | kick # $$5 $ifmatch | kick # $$6 $ifmatch
    kick # $$7 $ifmatch | kick # $$8 $ifmatch | kick # $$9 $ifmatch | kick # $$10 $ifmatch
  }
}
.Unban:mode # $_.pnlb($$1-5,b,-) | mode # $_.pnlb($$6-10,b,-) | mode # $_.pnlb($$11-15,b,-)
.-
.Kick Divertido:{
  kick # $$1 $read($_.fk) | kick # $$2 $read($_.fk) | kick # $$3 $read($_.fk) | kick # $$4 $read($_.fk) | kick # $$5 $read($_.fk)
  kick # $$6 $read($_.fk) | kick # $$7 $read($_.fk) | kick # $$8 $read($_.fk) | kick # $$9 $read($_.fk) | kick # $$10 $read($_.fk)
}
.Ban+Kick Divertido:{
  mode # $_.pnlbo($$1 $2) | mode # $_.pnlbo($$3 $4) | mode # $_.pnlbo($$5 $6) | mode # $_.pnlbo($$7 $8) | mode # $_.pnlbo($$9 $10)
  kick # $$1 $read($_.fk) | kick # $$2 $read($_.fk) | kick # $$3 $read($_.fk) | kick # $$4 $read($_.fk) | kick # $$5 $read($_.fk)
  kick # $$6 $read($_.fk) | kick # $$7 $read($_.fk) | kick # $$8 $read($_.fk) | kick # $$9 $read($_.fk) | kick # $$10 $read($_.fk)
}
$iif($me isop #,Control @)
.Dar Op (@):mode # $_.pnlb($$1-5,o,+) | mode # $_.pnlb($$6-10,o,+) | mode # $_.pnlb($$11-15,o,+) | mode # $_.pnlb($$16-20,o,+)
.Quitar Op (@):mode # $_.pnlb($$1-5,o,-) | mode # $_.pnlb($$6-10,o,-) | mode # $_.pnlb($$11-15,o,-) | mode # $_.pnlb($$16-20,o,-)
.$iif(%servclass = unr,Dar Half-op $chr(40) $+ % $+ $chr(41)):mode # $_.pnlb($$1-5,h,+) | mode # $_.pnlb($$6-10,h,+) | mode # $_.pnlb($$11-15,h,+) | mode # $_.pnlb($$16-20,h,+)
.$iif(%servclass = unr,Quitar Half-op $chr(40) $+ % $+ $chr(41)):mode # $_.pnlb($$1-5,h,-) | mode # $_.pnlb($$6-10,h,-) | mode # $_.pnlb($$11-15,h,-) | mode # $_.pnlb($$16-20,h,-)
.Dar Voz (+):mode # $_.pnlb($$1-5,v,+) | mode # $_.pnlb($$6-10,v,+) | mode # $_.pnlb($$11-15,v,+) | mode # $_.pnlb($$16-20,v,+)
.Quitar Voz (+):mode # $_.pnlb($$1-5,v,-) | mode # $_.pnlb($$6-10,v,-) | mode # $_.pnlb($$11-15,v,-) | mode # $_.pnlb($$16-20,v,-)
.Quitar @ Dar +:mode # $_.pnlb($$1-5,v,+) | mode # $_.pnlb($$1-5,o,-) | mode # $_.pnlb($$6-10,v,+) | mode # $_.pnlb($$6-10,o,-)
.Quitar Voz y Op:mode # $_.pnlb($$1-5,o,-) | mode # $_.pnlb($$1-5,v,-) | mode # $_.pnlb($$6-10,o,-) | mode # $_.pnlb($$6-10,v,-)
.-
.Kickear:{
  var %tmp $$?="Motivo" 
  if (!%tmp) return
  kick # $$1 %tmp | kick # $$2 %tmp | kick # $$3 %tmp | kick # $$4 %tmp | kick # $$5 %tmp | kick # $$6 %tmp
  kick # $$7 %tmp | kick # $$8 %tmp | kick # $$9 %tmp | kick # $$10 %tmp
}
.Banear:mode # $_.pnlbo($$1 $2) | mode # $_.pnlbo($$3 $4) | mode # $_.pnlbo($$5 $6) | mode # $_.pnlbo($$7 $8) | mode # $_.pnlbo($$9 $10)
.Baneo y Kickeo:{
  set %motikick [] | set %motikick $$?="Motivo del kick?"
  mode # $_.pnlbo($$1 $2) | mode # $_.pnlbo($$3 $4) | mode # $_.pnlbo($$5 $6) | mode # $_.pnlbo($$7 $8) | mode # $_.pnlbo($$9 $10)
  if (%motikick) { unset %motikick
    kick # $$1 $ifmatch | kick # $$2 $ifmatch | kick # $$3 $ifmatch | kick # $$4 $ifmatch | kick # $$5 $ifmatch | kick # $$6 $ifmatch
    kick # $$7 $ifmatch | kick # $$8 $ifmatch | kick # $$9 $ifmatch | kick # $$10 $ifmatch
  }
}
.Unban:mode # $_.pnlb($$1-5,b,-) | mode # $_.pnlb($$6-10,b,-) | mode # $_.pnlb($$11-15,b,-)
.-
.Kick Divertido:{
  kick # $$1 $read($_.fk) | kick # $$2 $read($_.fk) | kick # $$3 $read($_.fk) | kick # $$4 $read($_.fk) | kick # $$5 $read($_.fk)
  kick # $$6 $read($_.fk) | kick # $$7 $read($_.fk) | kick # $$8 $read($_.fk) | kick # $$9 $read($_.fk) | kick # $$10 $read($_.fk)
}
.Ban+Kick Divertido:{
  mode # $_.pnlbo($$1 $2) | mode # $_.pnlbo($$3 $4) | mode # $_.pnlbo($$5 $6) | mode # $_.pnlbo($$7 $8) | mode # $_.pnlbo($$9 $10)
  kick # $$1 $read($_.fk) | kick # $$2 $read($_.fk) | kick # $$3 $read($_.fk) | kick # $$4 $read($_.fk) | kick # $$5 $read($_.fk)
  kick # $$6 $read($_.fk) | kick # $$7 $read($_.fk) | kick # $$8 $read($_.fk) | kick # $$9 $read($_.fk) | kick # $$10 $read($_.fk)
}
Ignorar
.Meter en ignore:ignore $$1 
.Quitar de ignore:ignore -r $$1 
Notificar
.Añadir en notify:notify $$1
.Quitar de notify:notify -r $$1
-
Whois:whois $$1
Whois (Idle):whois $$1 $$1
InfoCentral:uwho $$1
Privado:query $$1
-
CTCP
.Ping:ctcp $$1 ping
.Time:ctcp $$1 time
.Version:ctcp $$1 version
DCC
.Envio:dcc send $$1
.Chat:dcc chat $$1
-
$iif(%cfg.chorras,Chorradas)
.Bebida
..Cocacola:say 6 $+ $$1 $+ 12 te invito a una 0,4[Cocacola]12    :)
..Pepsi:say 6 $+ $$1 $+ 12 te invito a una 0,4[Pepsi]12    :)
..SevenUp:say 6 $+ $$1 $+ 12 te invito a un 0,3[SevenUp]12    :)
..Sprite:say 6 $+ $$1 $+ 12 te invito a un 0,3[Sprite]12    :)
..Café:say 6 $+ $$1 $+ 12 te invito a un cafe: 0c0,5[_]12    :)
.Tonterías
..Vaso de agua:say 6 $+ $$1 $+ 12 como este año hay sequía... te invito a un 11,12[Vaso de agua]12 pero no te lo bebas todo.. eh?
..Dedicar dedicatoria:say 6 $+ $$1 $+ 12 como no tengo nada mas... te dedico esta dedicatoria    xDD
..Barranco:say 6 $+ $$1 $+ 12 tirate por un barranco... un millón de lemmings no pueden estar equivocados    :-Þ
..Moscas:say 6 $+ $$1 $+ 12 come mierda... un millón de moscas no pueden estar equivocadas    :-Þ
..Explota!:say 6 $+ $$1 $+ 12 revienta! 2.000.000 de Lemmings no pueden estar equivocados...
.Varios
..Tabaco:_.asc tabaco $$1
..Corazón:_.asc corazon $$1
.Insultos
..Melón:_.asc melon $$1
..Ratas:_.asc ratas $$1
-
$iif(%cfg.especial == si,Especial)
.Accion predefinida (hacia ESTE nick)
..Enviar mensaje:.timer -o $$?="A que hora deseas enviar el mensaje a ESTE nick? (según tu reloj de windows)" 1 1 msg $nick $$?="Mensaje a enviar? (puedes realizar infinitas acciones prefijadas)"
..Ctcp.timer -o $$?="A que hora deseas enviar CTCP a ESTE nick? (según tu reloj de windows)" 1 1 ctcp $nick $$?="Mensaje CTCP? (finger, version, ping, time....)"
..-
..Cambiar Nick:.timer -o $$?="A que hora deseas Cambiar nick? (según tu reloj de windows)" 1 1 nick $$?="Nick? (puedes realizar infinitas acciones prefijadas)"
..Desconectar del IRC:.timer -o $$?="A que hora deseas desconectar? (según tu reloj de windows)" 1 1 quit $$?="Mensaje de desconexion? (puedes realizar infinitas acciones prefijadas)"
..-
..Otro comando:.timer -o $$?="A que hora deseas ejecutar? (según tu reloj de windows)" 1 1 $$?="Comando y parametros? (puedes realizar infinitas acciones prefijadas)"

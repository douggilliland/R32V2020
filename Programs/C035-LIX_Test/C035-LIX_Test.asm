; Fast Screen test
start:
	liu	r8,01234
	lil	r8,0x5678
	lix	r8,0x7def
	nop
self:
	bra	self
	
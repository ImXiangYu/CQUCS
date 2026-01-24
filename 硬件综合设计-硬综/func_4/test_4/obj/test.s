
main.elf:     file format elf32-tradlittlemips
main.elf


Disassembly of section .text:

bfc00000 <_ftext>:
/home/ghj/Desktop/func/start.S:11
bfc00000:	3408150c 	li	t0,0x150c
/home/ghj/Desktop/func/start.S:12
bfc00004:	00084400 	sll	t0,t0,0x10
/home/ghj/Desktop/func/start.S:13
bfc00008:	35080770 	ori	t0,t0,0x770
/home/ghj/Desktop/func/start.S:15
bfc0000c:	34094ce9 	li	t1,0x4ce9
/home/ghj/Desktop/func/start.S:16
bfc00010:	00094c00 	sll	t1,t1,0x10
/home/ghj/Desktop/func/start.S:17
bfc00014:	3529e895 	ori	t1,t1,0xe895
bfc00018:	fd091000 	0xfd091000
/home/ghj/Desktop/func/start.S:22
bfc0001c:	3409150c 	li	t1,0x150c
/home/ghj/Desktop/func/start.S:23
bfc00020:	00094c00 	sll	t1,t1,0x10
/home/ghj/Desktop/func/start.S:24
bfc00024:	35290770 	ori	t1,t1,0x770
bfc00028:	fd091000 	0xfd091000
_ftext():
bfc0002c:	00000000 	nop
bfc00030:	00000300 	sll	zero,zero,0xc
	...

Disassembly of section .data:

80000000 <__CTOR_LIST__>:
	...

80000008 <__CTOR_END__>:
	...

Disassembly of section .debug_aranges:

00000000 <.debug_aranges>:
   0:	0000001c 	0x1c
   4:	00000002 	srl	zero,zero,0x0
   8:	00040000 	sll	zero,a0,0x0
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	0000002c 	0x2c
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	0000003b 	0x3b
   4:	001e0002 	srl	zero,s8,0x0
   8:	01010000 	0x1010000
   c:	000d0efb 	0xd0efb
  10:	01010101 	0x1010101
  14:	01000000 	0x1000000
  18:	00010000 	sll	zero,at,0x0
  1c:	72617473 	0x72617473
  20:	00532e74 	0x532e74
  24:	00000000 	nop
  28:	00020500 	sll	zero,v0,0x14
  2c:	03bfc000 	0x3bfc000
  30:	4b4b010a 	c2	0x14b010a
  34:	874b4b4c 	lh	t3,19276(k0)
  38:	08024b4b 	j	92d2c <data_size+0x92d1c>
  3c:	Address 0x000000000000003c is out of bounds.


Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	00000044 	0x44
   4:	00000002 	srl	zero,zero,0x0
   8:	01040000 	0x1040000
   c:	00000000 	nop
  10:	bfc00000 	0xbfc00000
  14:	bfc0002c 	0xbfc0002c
  18:	72617473 	0x72617473
  1c:	00532e74 	0x532e74
  20:	6d6f682f 	0x6d6f682f
  24:	68672f65 	0x68672f65
  28:	65442f6a 	0x65442f6a
  2c:	6f746b73 	0x6f746b73
  30:	75662f70 	jalx	598bdc0 <data_size+0x598bdb0>
  34:	4700636e 	c1	0x100636e
  38:	4120554e 	0x4120554e
  3c:	2e322053 	sltiu	s2,s1,8275
  40:	352e3831 	ori	t6,t1,0x3831
  44:	80010030 	lb	at,48(zero)

Disassembly of section .debug_abbrev:

00000000 <.debug_abbrev>:
   0:	10001101 	b	4408 <data_size+0x43f8>
   4:	12011106 	beq	s0,at,4420 <data_size+0x4410>
   8:	1b080301 	0x1b080301
   c:	13082508 	beq	t8,t0,9430 <data_size+0x9420>
  10:	00000005 	0x5

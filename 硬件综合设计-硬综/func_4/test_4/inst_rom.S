   .org 0x0
   .set noat
   .global _start
_start:

	ori  $8,$0,0x150c           # $8 = 0x150c
	sll  $8,$8,16               # $8 = 0x150c0000
	ori  $8,$8,0x0770           # $8 = 0x150c0770

	ori  $9,$0,0x4ce9           # $9 = 0x4ce9
	sll  $9,$9,16               # $9 = 0x4ce90000
	ori  $9,$9,0xe895           # $9 = 0x4ce9e895
	
	.word 0xfd091000			# equal 
								# $2 = 0x00000000

	ori  $9,$0,0x150c           # $9 = 0x150c
	sll  $9,$9,16               # $9 = 0x150c0000
	ori  $9,$9,0x0770           # $9 = 0x150c0770
	
	.word 0xfd091000			# equal 
								# $2 = 0x00000001
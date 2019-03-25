#macros
	.eqv BASE 	0x10000000
	.eqv NAVY 	0x00000080
	.eqv PERU 	0x00FEFEFE #EL CODIGO NO ES DE COLOR PERU
	.eqv TEAL 	0x00008080
	.eqv CLARO 	0x000040FF #azul claro
	.eqv ROJO 	0x00FF0000 #Color rojo
	.eqv NEGRO 	0x00000000
	.eqv BLANCO	0x00FFFFFF
	.eqv PIEL	0x00F7819F
	.eqv AZUL_AGUA 	0x002ECCFA
	.eqv VERDE	0x0031B404
	.eqv TOSTADO	0x00FFBF00
	.eqv AMARILLO 	0x00FFFF00
	.eqv MORADO	0x004B088A
	
.macro verificar(%primero,%segundo)
	beq %primero,%primero,todos
.end_macro 

.macro ImprimirMensaje(%mensaje)
	li $v0, 4
	la $a0, %mensaje
	syscall
.end_macro 

.macro imprimirCaracter(%x)
	li $v0,11
	la $a0,0(%x)
	syscall
.end_macro

.macro DibujarPunto(%x,%y,%color)
	add $t0, $zero, %x
	add $t1, $zero, %y
	li $t2, BASE
	sll $t0, $t0, 2	#x = x*4
	sll $t1, $t1, 8 #y = y*4*64
	add $t2, $t2, $t0	#base + X
	add $t2, $t2, $t1	#base + Y
	li $t0, %color
	sw $t0, 0($t2) #Pintar
.end_macro

.macro DibujarLineaV(%x,%yi,%yf,%color)
	add $t3, $zero, %yi	
loopLineaV:
	DibujarPunto(%x,$t3,%color)
	addi $t3, $t3, 1
	ble $t3, %yf, loopLineaV
.end_macro

.macro DibujarLineaH(%y,%xi,%xf,%color)
	add $t3, $zero, %xi	
loopLineaH:
	DibujarPunto($t3,%y,%color)
	addi $t3, $t3, 1
	ble $t3, %xf, loopLineaH
.end_macro
 
.macro Borrar(%color)
	li $t0, BASE
	li $t1, %color
	li $t2, 0	#Contador
loopBorrar:
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	addi $t2, $t2, 1	#Contador++
	ble $t2, 4095, loopBorrar
.end_macro

.macro Bienvenida(%color)
	li $t1, %color
	#letra J
	li $t0, BASE
	addi $t0, $t0, 1348
	vertical(6)
	
	li $t0, BASE
	addi $t0, $t0, 2872
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 2356
	vertical(2)
	#letra U
	li $t0, BASE
	addi $t0, $t0, 1360
	vertical(6)
	
	li $t0, BASE
	addi $t0, $t0, 2900
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 1376
	vertical(6)
	#letra E
	li $t0, BASE
	addi $t0, $t0, 1388
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 1392
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 2160
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 2928
	horizontal(4)
	#letra G
	li $t0, BASE
	addi $t0, $t0, 1688
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 1420
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 1672
	vertical(5)
	
	li $t0, BASE
	addi $t0, $t0, 2956
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 2456
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 2452
	horizontal(1)
	#letra O
	li $t0, BASE
	addi $t0, $t0, 1448
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 1716
	vertical(5)
	
	li $t0, BASE
	addi $t0, $t0, 2984
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 1700
	vertical(5)
	#letra D
	li $t0, BASE
	addi $t0, $t0, 3676
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 3676
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 5212
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 3948
	vertical(5)
	#letra E
	li $t0, BASE
	addi $t0, $t0, 3704
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 3704
	horizontal(5)
	
	li $t0, BASE
	addi $t0, $t0, 4476
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 5244
	horizontal(4)
	#letra M
	li $t0, BASE
	addi $t0, $t0, 5908
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 6168
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 6428
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 6176
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 5924
	vertical(7)
	#letra E
	li $t0, BASE
	addi $t0, $t0, 5936
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 5936
	horizontal(5)
	
	li $t0, BASE
	addi $t0, $t0, 6708
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 7476
	horizontal(4)
	#letra M
	li $t0, BASE
	addi $t0, $t0, 5964
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 6224
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 6484
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 6232
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 5980
	vertical(7)
	#letra O
	li $t0, BASE
	addi $t0, $t0, 5996
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 6264
	vertical(5)
	
	li $t0, BASE
	addi $t0, $t0, 7532
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 6248
	vertical(5)
	#letra R
	li $t0, BASE
	addi $t0, $t0, 6020
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 6020
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 6292
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 6792
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 7052
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 7312
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 7572
	horizontal(1)
	#letra I
	li $t0, BASE
	addi $t0, $t0, 6048
	horizontal(5)
	
	li $t0, BASE
	addi $t0, $t0, 6056
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 7584
	horizontal(5)
	#letra A
	li $t0, BASE
	addi $t0, $t0, 6844
	vertical(4)
	
	li $t0, BASE
	addi $t0, $t0, 6336
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 6084
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 6344
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 6860
	vertical(4)
	
	li $t0, BASE
	addi $t0, $t0, 7104
	horizontal(3)
		
.end_macro

.macro Cerebro(%colorClaro)
	li $t1, %colorClaro
	li $t0, BASE
	addi $t0, $t0, 9840
	horizontal(7)
	
	li $t0, BASE
	addi $t0, $t0, 10092
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 10344
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 10344
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 10852
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 11104
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 11356
	horizontal(7)
	
	li $t0, BASE
	addi $t0, $t0, 11372
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 11880
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 10868
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 10864
	horizontal(1)
	
	li $t0, BASE
	addi $t0, $t0, 11356
	vertical(13)
	
	li $t0, BASE
	addi $t0, $t0, 11864
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 14432
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 14692
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 14948
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 15212
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 15472
	horizontal(7)
	
	li $t0, BASE
	addi $t0, $t0, 14704
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 14196
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 14184
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 13920
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 13664
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 12392
	vertical(8)
	
	li $t0, BASE
	addi $t0, $t0, 12388
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 13160
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 12144
	vertical(4)
	
	li $t0, BASE
	addi $t0, $t0, 12144
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 13172
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 13680
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 9852
	vertical(23)
	
	li $t0, BASE
	addi $t0, $t0, 9864
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 10124
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 10384
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 10900
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 11160
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 11420
	vertical(13)
	
	li $t0, BASE
	addi $t0, $t0, 11936
	vertical(7)
	
	li $t0, BASE
	addi $t0, $t0, 11396
	horizontal(7)
	
	li $t0, BASE
	addi $t0, $t0, 10884
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 10884
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 11404
	vertical(4)
	
	li $t0, BASE
	addi $t0, $t0, 12168
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 12420
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 12420
	vertical(4)
	
	li $t0, BASE
	addi $t0, $t0, 12432
	horizontal(5)
	
	li $t0, BASE
	addi $t0, $t0, 13188
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 12940
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 12948
	vertical(3)
	
	li $t0, BASE
	addi $t0, $t0, 13460
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 13972
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 13976
	vertical(4)
	
	li $t0, BASE
	addi $t0, $t0, 14740
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 14984
	horizontal(4)
	
	li $t0, BASE
	addi $t0, $t0, 15240
	horizontal(2)
	
	li $t0, BASE
	addi $t0, $t0, 14468
	vertical(2)
	
	li $t0, BASE
	addi $t0, $t0, 14216
	vertical(5)
	
	li $t0, BASE
	addi $t0, $t0, 14216
	horizontal(3)
	
	li $t0, BASE
	addi $t0, $t0, 13964
	horizontal(1)
	
.end_macro

.macro vertical(%pixeles)
	li $t3, %pixeles
	sub $t4, $t3, 1
	li $t2, 0	#Contador = 0
loopV:
	sw $t1, 0($t0)
	addi $t0, $t0, 256
	addi $t2, $t2, 1	#Contador++
	ble $t2, $t4, loopV
.end_macro

.macro horizontal(%pixeles)
	li $t3, %pixeles
	sub $t4, $t3, 1
	li $t2, 0	#Contador = 0
loopV:
	sw $t1, 0($t0)
	addi $t0, $t0, 4
	addi $t2, $t2, 1	#Contador++
	ble $t2, $t4, loopV
.end_macro

.macro pintarLetras()
	pintarA()
	pintarB()
	pintarC()
	pintarD()
	pintarE()
	pintarF()
	pintarG()
	pintarH()
	pintarI()
	pintarJ()
	pintarK()
	pintarL()
	pintarM()
	pintarN()
	pintarO()
	pintarP()
.end_macro

.macro pintarA()
	DibujarLineaV(5,6,11,PERU)#x,yi,yf,color
	DibujarLineaV(10,6,11,PERU)#x,yi,yf,color
	DibujarLineaH(5,6,9,PERU)#y,xi,xf,color
	DibujarLineaH(9,6,9,PERU)#y,xi,xf,color
.end_macro
.macro pintarB()
	DibujarLineaH(5,22,26,PERU)#y,xi,xf,color
	DibujarLineaV(21,5,11,PERU)#x,yi,yf,color
	DibujarLineaH(11,22,26,PERU)#y,xi,xf,color
	DibujarLineaH(8,22,26,PERU)#y,xi,xf,color
	DibujarLineaV(27,6,7,PERU)#x,yi,yf,color
	DibujarLineaV(27,9,10,PERU)#x,yi,yf,color
.end_macro
.macro pintarC()
	DibujarLineaV(37,6,10,PERU)#x,yi,yf,color
	DibujarLineaH(11,38,42,PERU)#y,xi,xf,color
	DibujarLineaH(5,38,42,PERU)#y,xi,xf,color
	DibujarPunto(43,6,PERU)#x,y,color
	DibujarPunto(43,10,PERU)#x,y
.end_macro
.macro pintarD()
	DibujarLineaV(53,5,11,PERU)#x,yi,yf,color
	DibujarLineaH(5,53,58,PERU)#y,xi,xf,color
	DibujarLineaV(59,6,10,PERU)#x,yi,yf,color
	DibujarLineaH(11,53,58,PERU)#y,xi,xf,color
.end_macro
.macro pintarE()
	DibujarLineaV(5,20,26,PERU)#x,yi,yf,color
	DibujarLineaH(20,5,10,PERU)#y,xi,xf,color
	DibujarLineaH(23,5,9,PERU)#y,xi,xf,color
	DibujarLineaH(26,5,10,PERU)#y,xi,xf,color
.end_macro
.macro pintarF()
	DibujarLineaV(21,20,26,PERU)#x,yi,yf,color
	DibujarLineaH(20,22,26,PERU)#y,xi,xf,color
	DibujarLineaH(23,22,25,PERU)#y,xi,xf,color
.end_macro
.macro pintarG()
	DibujarLineaV(37,21,25,PERU)#x,yi,yf,color
	DibujarLineaV(43,24,25,PERU)#x,yi,yf,color
	DibujarLineaH(20,38,42,PERU)#y,xi,xf,color
	DibujarLineaH(23,40,42,PERU)#y,xi,xf,color
	DibujarLineaH(26,38,42,PERU)#y,xi,xf,color
.end_macro	
.macro pintarH()
	DibujarLineaV(53,20,26,PERU)#x,yi,yf,color
	DibujarLineaV(58,20,26,PERU)#x,yi,yf,color
	DibujarLineaH(23,53,58,PERU)#y,xi,xf,color
.end_macro	
.macro pintarI()
	DibujarLineaV(7,36,42,PERU)#x,yi,yf,color
	DibujarLineaH(36,5,9,PERU)#y,xi,xf,color
	DibujarLineaH(42,5,9,PERU)#y,xi,xf,color
.end_macro
.macro pintarJ()
	DibujarLineaH(36,21,26,PERU)#y,xi,xf,color
	DibujarLineaV(24,36,42,PERU)#x,yi,yf,color
	DibujarLineaH(42,22,23,PERU)#y,xi,xf,color
	DibujarPunto(21,41,PERU)#x,y,color
.end_macro
.macro pintarK()
	DibujarLineaV(37,36,42,PERU)#x,yi,yf,color
	DibujarPunto(38,39,PERU)#x,y,color
	DibujarPunto(40,37,PERU)#x,y,color
	DibujarPunto(41,36,PERU)#x,y,
	DibujarPunto(39,38,PERU)#x,y,color
	DibujarPunto(39,40,PERU)#x,y,color
	DibujarPunto(40,41,PERU)#x,y,color
	DibujarPunto(41,42,PERU)#x,y,color
.end_macro
.macro pintarL()
	DibujarLineaV(53,36,42,PERU)#x,yi,yf,
	DibujarLineaH(42,53,58,PERU)#y,xi,xf,color
.end_macro
.macro pintarM()
	DibujarLineaV(5,52,58,PERU)#x,yi,yf,color
	DibujarPunto(6,53,PERU)#x,y,color
	DibujarPunto(7,54,PERU)#x,y,color
	DibujarPunto(8,54,PERU)#x,y,color
	DibujarPunto(9,53,PERU)#x,y,color
	DibujarLineaV(10,52,58,PERU)#x,yi,yf,color
.end_macro
.macro pintarN()
	DibujarLineaV(21,52,58,PERU)#x,yi,yf,color
	DibujarPunto(22,53,PERU)#xx,y,color
	DibujarPunto(23,54,PERU)#x,y,color
	DibujarPunto(24,55,PERU)#x,y,color
	DibujarPunto(25,56,PERU)#x,y,color
	DibujarLineaV(26,52,58,PERU)#x,yi,yf,color
.end_macro
.macro pintarO()
	DibujarLineaV(37,53,57,PERU)#x,yi,yf,color
	DibujarLineaH(52,38,42,PERU)#y,xi,xf,color
	DibujarLineaH(58,38,42,PERU)#y,xi,xf,color
	DibujarLineaV(43,53,57,PERU)#x,yi,yf,color
.end_macro
.macro pintarP()
	DibujarLineaV(53,52,58,PERU)#x,yi,yf,color
	DibujarLineaH(52,53,57,PERU)#y,xi,xf,color
	DibujarLineaH(55,53,57,PERU)#y,xi,xf,color
	DibujarPunto(58,54,PERU)#x,y,color
	DibujarPunto(58,53,PERU)#x,y,color
.end_macro

.macro cuadrado(%xi,%yi,%color)
	add $t4,%xi,13
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	add %yi,%yi,1
	DibujarLineaH(%yi,%xi,$t4,%color)
	sub $t4,%xi,10
	sub %yi,%yi,10
.end_macro

.macro pintarCuadrados()
	pintarCuadradoA(CLARO)
	pintarCuadradoB(CLARO)
	pintarCuadradoC(CLARO)
	pintarCuadradoD(CLARO)
	pintarCuadradoE(CLARO)
	pintarCuadradoF(CLARO)
	pintarCuadradoG(CLARO)
	pintarCuadradoH(CLARO)
	pintarCuadradoI(CLARO)
	pintarCuadradoJ(CLARO)
	pintarCuadradoK(CLARO)
	pintarCuadradoL(CLARO)
	pintarCuadradoM(CLARO)
	pintarCuadradoN(CLARO)
	pintarCuadradoO(CLARO)
	pintarCuadradoP(CLARO)
.end_macro

.macro pintarCuadradoA(%color)
	add $s1,$zero,1 #x
	add $s2,$zero,1 #y
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoB(%color)
	add $s1,$zero,17#x
	add $s2,$zero,1 #y
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoC(%color)
	add $s2,$zero,1 #y
	add $s1,$zero,33#x
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoD(%color)
	add $s2,$zero,1 #y
	add $s1,$zero,49 #X
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoE(%color)
	add $s1,$zero,1 #x
	add $s2,$zero,17 #y
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoF(%color)
	add $s2,$zero,17 #y
	add $s1,$zero,17 #x
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoG(%color)
	add $s2,$zero,17 #y
	add $s1,$zero,33 #X
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoH(%color)
	add $s2,$zero,17 #y
	add $s1,$zero,49 #X
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoI(%color)
	add $s1,$zero,1 #x
	add $s2,$zero,33 #y
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoJ(%color)
	add $s2,$zero,33 #y
	add $s1,$zero,17 #x
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoK(%color)
	add $s2,$zero,33 #y
	add $s1,$zero,33
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoL(%color)
	add $s2,$zero,33 #y
	add $s1,$zero,49 #x
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoM(%color)
	add $s1,$zero,1 #x
	add $s2,$zero,49 #y
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoN(%color)
	add $s2,$zero,49 #y
	add $s1,$zero,17 #x
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoO(%color)
	add $s2,$zero,49 #y
	add $s1,$zero,33 #x
	cuadrado($s1,$s2,%color)
.end_macro
.macro pintarCuadradoP(%color)
	add $s2,$zero,49 #y
	add $s1,$zero,49
	cuadrado($s1,$s2,%color)
.end_macro

.macro acostarLetra(%x)
	beq %x,'A',acostarA
	beq %x,'B',acostarB
	beq %x,'C',acostarC
	beq %x,'D',acostarD
	beq %x,'E',acostarE
	beq %x,'F',acostarF
	beq %x,'G',acostarG
	beq %x,'H',acostarH
	beq %x,'I',acostarI
	beq %x,'J',acostarJ
	beq %x,'K',acostarK
	beq %x,'L',acostarL
	beq %x,'M',acostarM
	beq %x,'N',acostarN
	beq %x,'O',acostarO
	beq %x,'P',acostarP
	
.end_macro

.macro dibujar_A()
	
	DibujarLineaH(2,4,5,NEGRO)#y,xi,xf,color
	DibujarPunto(3,3,NEGRO)#x,y,color
	DibujarLineaV(2,4,7,NEGRO)#x,yi,yf,color
	DibujarPunto(6,3,NEGRO)#x,y,color
	DibujarPunto(8,4,NEGRO)#x,y,color
	DibujarPunto(7,4,NEGRO)#x,y,color
	DibujarPunto(9,3,NEGRO)#x,y,color
	DibujarLineaH(2,10,11,NEGRO)#y,xi,xf,color
	DibujarPunto(12,3,NEGRO)#x,y,color
	DibujarLineaV(13,4,7,NEGRO)#x,yi,yf,color
	DibujarPunto(3,8,NEGRO)#x,y,color
	DibujarPunto(4,9,NEGRO)#x,y,color
	DibujarPunto(5,10,NEGRO)#x,y,color
	DibujarPunto(6,11,NEGRO)#x,y,color
	DibujarPunto(7,12,NEGRO)#x,y,color
	DibujarPunto(8,12,NEGRO)#x,y,color
	DibujarPunto(12,8,NEGRO)#x,y,color
	DibujarPunto(11,9,NEGRO)#x,y,color
	DibujarPunto(10,10,NEGRO)#x,y,color
	DibujarPunto(9,11,NEGRO)#x,y,color
	DibujarLineaH(3,4,5,ROJO)#y,xi,xf,color
	DibujarLineaH(3,10,11,ROJO)#y,xi,xf,color
	DibujarLineaH(4,3,6,ROJO)#y,xi,xf,color
	DibujarLineaH(4,9,12,ROJO)#y,xi,xf,color
	DibujarLineaH(5,3,12,ROJO)#y,xi,xf,color
	DibujarLineaH(6,3,12,ROJO)#y,xi,xf,color
	DibujarLineaH(7,3,12,ROJO)#y,xi,xf,color
	DibujarLineaH(8,4,11,ROJO)#y,xi,xf,color
	DibujarLineaH(9,5,10,ROJO)#y,xi,xf,color
	DibujarLineaH(10,6,9,ROJO)#y,xi,xf,color
	DibujarLineaH(11,7,8,ROJO)#y,xi,xf,color
	DibujarPunto(11,4,PERU)#x,y,color
	
.end_macro

.macro dibujar_B()
	
	DibujarLineaH(1,19,22,ROJO)#y,xi,xf,color
	DibujarLineaH(2,18,20,ROJO)#y,xi,xf,color
	DibujarLineaH(3,17,22,ROJO)#y,xi,xf,color
	DibujarLineaH(4,17,19,ROJO)#y,xi,xf,color
	DibujarLineaH(5,17,18,ROJO)#y,xi,xf,color
	DibujarLineaH(6,17,19,ROJO)#y,xi,xf,color
	DibujarLineaH(1,25,28,ROJO)#y,xi,xf,color
	DibujarLineaH(2,27,29,ROJO)#y,xi,xf,color
	DibujarLineaH(3,25,30,ROJO)#y,xi,xf,color
	DibujarLineaH(4,28,30,ROJO)#y,xi,xf,color
	DibujarLineaH(5,29,30,ROJO)#y,xi,xf,color
	DibujarLineaH(6,28,30,ROJO)#y,xi,xf,color
	DibujarLineaH(6,23,24,ROJO)#y,xi,xf,color
	DibujarLineaH(7,18,29,ROJO)#y,xi,xf,color
	DibujarLineaH(8,20,27,ROJO)#y,xi,xf,color
	DibujarLineaH(9,18,29,ROJO)#y,xi,xf,color
	DibujarLineaH(10,20,27,ROJO)#y,xi,xf,color
	DibujarLineaH(11,19,28,ROJO)#y,xi,xf,color
	DibujarLineaH(12,21,26,ROJO)#y,xi,xf,color
	DibujarLineaH(13,23,24,ROJO)#y,xi,xf,color
	DibujarLineaH(13,20,21,ROJO)#y,xi,xf,color
	DibujarLineaH(13,26,27,ROJO)#y,xi,xf,color
	DibujarPunto(22,6,AZUL_AGUA)#x,y,color
	DibujarPunto(25,6,AZUL_AGUA)#x,y,color

.end_macro

.macro dibujar_C()

	DibujarLineaV(33,7,14,VERDE)#x,yi,yf,color
	DibujarLineaV(34,4,13,VERDE)#x,yi,yf,color
	DibujarLineaV(35,3,12,VERDE)#x,yi,yf,color
	DibujarLineaV(36,2,5,VERDE)#x,yi,yf,color
	DibujarLineaV(37,2,4,VERDE)#x,yi,yf,color
	DibujarLineaV(38,1,4,VERDE)#x,yi,yf,color
	DibujarLineaV(39,1,5,VERDE)#x,yi,yf,color
	DibujarLineaV(40,1,12,VERDE)#x,yi,yf,color
	DibujarLineaV(41,1,14,VERDE)#x,yi,yf,color
	DibujarLineaV(42,2,5,VERDE)#x,yi,yf,color
	DibujarLineaV(43,2,4,VERDE)#x,yi,yf,color
	DibujarLineaV(44,3,4,VERDE)#x,yi,yf,color
	DibujarLineaV(45,4,5,VERDE)#x,yi,yf,color
	DibujarLineaV(46,6,14,VERDE)#x,yi,yf,color
	DibujarLineaV(36,9,13,VERDE)#x,yi,yf,color
	DibujarLineaV(37,10,14,VERDE)#x,yi,yf,color
	DibujarLineaV(38,10,14,VERDE)#x,yi,yf,color
	DibujarLineaV(39,9,12,VERDE)#x,yi,yf,color
	DibujarLineaV(42,9,14,VERDE)#x,yi,yf,color
	DibujarLineaV(43,10,13,VERDE)#x,yi,yf,color
	DibujarLineaV(44,10,12,VERDE)#x,yi,yf,color
	DibujarLineaV(45,9,13,VERDE)#x,yi,yf,color
	DibujarLineaV(38,7,8,AZUL_AGUA)#x,yi,yf,color
	DibujarLineaV(39,7,8,AZUL_AGUA)#x,yi,yf,color
	DibujarLineaV(44,7,8,AZUL_AGUA)#x,yi,yf,color
	DibujarLineaV(45,7,8,AZUL_AGUA)#x,yi,yf,color
	
.end_macro

.macro dibujar_D()

	DibujarLineaV(49,7,14,VERDE)#x,yi,yf,color
	DibujarLineaV(50,4,13,VERDE)#x,yi,yf,color
	DibujarLineaV(51,3,12,VERDE)#x,yi,yf,color
	DibujarLineaV(52,2,5,VERDE)#x,yi,yf,color
	DibujarLineaV(53,2,4,VERDE)#x,yi,yf,color
	DibujarLineaV(54,1,4,VERDE)#x,yi,yf,color
	DibujarLineaV(55,1,5,VERDE)#x,yi,yf,color
	DibujarLineaV(56,1,12,VERDE)#x,yi,yf,color
	DibujarLineaV(57,1,14,VERDE)#x,yi,yf,color
	DibujarLineaV(58,2,5,VERDE)#x,yi,yf,color
	DibujarLineaV(59,2,4,VERDE)#x,yi,yf,color
	DibujarLineaV(60,3,4,VERDE)#x,yi,yf,color
	DibujarLineaV(61,4,5,VERDE)#x,yi,yf,color
	DibujarLineaV(62,6,14,VERDE)#x,yi,yf,color
	DibujarLineaV(52,9,13,VERDE)#x,yi,yf,color
	DibujarLineaV(53,10,14,VERDE)#x,yi,yf,color
	DibujarLineaV(54,10,14,VERDE)#x,yi,yf,color
	DibujarLineaV(55,9,12,VERDE)#x,yi,yf,color
	DibujarLineaV(58,9,14,VERDE)#x,yi,yf,color
	DibujarLineaV(59,10,13,VERDE)#x,yi,yf,color
	DibujarLineaV(60,10,12,VERDE)#x,yi,yf,color
	DibujarLineaV(61,9,13,VERDE)#x,yi,yf,color
	DibujarLineaV(54,7,8,AZUL_AGUA)#x,yi,yf,color
	DibujarLineaV(55,7,8,AZUL_AGUA)#x,yi,yf,color
	DibujarLineaV(60,7,8,AZUL_AGUA)#x,yi,yf,color
	DibujarLineaV(61,7,8,AZUL_AGUA)#x,yi,yf,color
	
.end_macro

.macro dibujar_E()

	DibujarLineaV(2,20,22,NEGRO)#x,yi,yf,color
	DibujarLineaV(5,23,25,NEGRO)#x,yi,yf,color
	DibujarLineaV(5,27,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(10,27,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(13,20,23,NEGRO)#x,yi,yf,color
	DibujarLineaH(18,4,11,NEGRO)#y,xi,xf,color
	DibujarLineaH(23,3,9,NEGRO)#y,xi,xf,color
	DibujarLineaH(22,6,9,NEGRO)#y,xi,xf,color
	DibujarLineaH(21,6,9,NEGRO)#y,xi,xf,color
	DibujarLineaH(25,10,11,NEGRO)#y,xi,xf,color
	DibujarLineaH(26,6,9,NEGRO)#y,xi,xf,color
	DibujarLineaH(29,6,9,NEGRO)#y,xi,xf,color
	DibujarPunto(3,19,NEGRO)#x,y,color
	DibujarPunto(12,19,NEGRO)#x,y,color
	DibujarPunto(12,24,NEGRO)#x,y,color
	DibujarLineaH(19,4,11,PERU)#y,xi,xf,color
	DibujarLineaH(20,3,12,PERU)#y,xi,xf,color
	DibujarLineaH(21,3,5,PERU)#y,xi,xf,color
	DibujarLineaH(21,10,12,PERU)#y,xi,xf,color
	DibujarLineaH(22,3,5,PERU)#y,xi,xf,color
	DibujarLineaH(22,10,12,PERU)#y,xi,xf,color
	DibujarLineaH(23,10,12,PERU)#y,xi,xf,color
	DibujarLineaH(24,6,11,PERU)#y,xi,xf,color
	DibujarLineaH(25,6,9,PERU)#y,xi,xf,color
	DibujarLineaH(27,6,9,PERU)#y,xi,xf,color
	DibujarLineaH(28,6,9,PERU)#y,xi,xf,color
	
.end_macro

.macro dibujar_F()

	DibujarLineaV(18,19,28,TOSTADO)#x,yi,yf,color
	DibujarLineaV(19,18,29,TOSTADO)#x,yi,yf,color
	DibujarLineaV(20,17,18,TOSTADO)#x,yi,yf,color
	DibujarLineaV(21,17,18,TOSTADO)#x,yi,yf,color
	DibujarLineaV(22,17,18,TOSTADO)#x,yi,yf,color
	DibujarLineaV(23,17,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(24,17,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(25,17,18,TOSTADO)#x,yi,yf,color
	DibujarLineaV(26,17,18,TOSTADO)#x,yi,yf,color
	DibujarLineaV(27,17,18,TOSTADO)#x,yi,yf,color
	DibujarLineaV(28,18,29,TOSTADO)#x,yi,yf,color
	DibujarLineaV(29,19,28,TOSTADO)#x,yi,yf,color
	DibujarLineaV(20,23,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(21,23,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(22,23,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(25,23,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(26,23,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(27,23,30,TOSTADO)#x,yi,yf,color
	DibujarLineaV(19,25,27,NEGRO)#x,yi,yf,color
	DibujarLineaV(22,20,21,NEGRO)#x,yi,yf,color
	DibujarLineaV(25,20,21,NEGRO)#x,yi,yf,color
	DibujarLineaV(28,25,27,NEGRO)#x,yi,yf,color
	DibujarLineaH(27,19,28,NEGRO)#y,xi,xf,color
	
.end_macro

.macro dibujar_G()
	
	DibujarLineaV(33,21,25,NEGRO)#x,yi,yf,color
	DibujarLineaV(35,26,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(38,25,27,NEGRO)#x,yi,yf,color
	DibujarLineaV(41,25,27,NEGRO)#x,yi,yf,color
	DibujarLineaV(44,26,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(46,21,25,NEGRO)#x,yi,yf,color
	DibujarLineaH(17,38,41,NEGRO)#y,xi,xf,color
	DibujarLineaH(18,36,37,NEGRO)#y,xi,xf,color
	DibujarLineaH(18,42,43,NEGRO)#y,xi,xf,color
	DibujarLineaH(25,37,42,NEGRO)#y,xi,xf,color
	DibujarLineaH(26,34,36,NEGRO)#y,xi,xf,color
	DibujarLineaH(26,43,45,NEGRO)#y,xi,xf,color
	DibujarLineaH(30,37,42,NEGRO)#y,xi,xf,color
	DibujarPunto(35,19,NEGRO)#x,y,color
	DibujarPunto(34,20,NEGRO)#x,y,color
	DibujarPunto(36,29,NEGRO)#x,y,color
	DibujarPunto(43,29,NEGRO)#x,y,color
	DibujarPunto(44,19,NEGRO)#x,y,color
	DibujarPunto(45,20,NEGRO)#x,y,color
	DibujarLineaH(25,34,36,ROJO)#y,xi,xf,color
	DibujarLineaH(25,43,45,ROJO)#y,xi,xf,color
	DibujarLineaH(24,35,38,ROJO)#y,xi,xf,color
	DibujarLineaH(24,41,44,ROJO)#y,xi,xf,color
	DibujarLineaH(23,36,37,ROJO)#y,xi,xf,color
	DibujarLineaH(23,42,43,ROJO)#y,xi,xf,color
	DibujarLineaH(22,36,37,ROJO)#y,xi,xf,color
	DibujarLineaH(22,42,43,ROJO)#y,xi,xf,color
	DibujarLineaH(21,35,38,ROJO)#y,xi,xf,color
	DibujarLineaH(21,41,44,ROJO)#y,xi,xf,color
	DibujarLineaH(20,38,41,ROJO)#y,xi,xf,color
	DibujarLineaH(19,39,40,ROJO)#y,xi,xf,color
	DibujarLineaH(18,39,40,ROJO)#y,xi,xf,color
	DibujarPunto(35,20,ROJO)#x,y,color
	DibujarPunto(44,20,ROJO)#x,y,color
	
.end_macro

.macro dibujar_H()

	DibujarLineaV(50,20,22,NEGRO)#x,yi,yf,color
	DibujarLineaV(53,23,25,NEGRO)#x,yi,yf,color
	DibujarLineaV(53,27,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(58,27,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(61,20,23,NEGRO)#x,yi,yf,color
	DibujarLineaH(18,52,59,NEGRO)#y,xi,xf,color
	DibujarLineaH(23,51,57,NEGRO)#y,xi,xf,color
	DibujarLineaH(22,54,57,NEGRO)#y,xi,xf,color
	DibujarLineaH(21,54,57,NEGRO)#y,xi,xf,color
	DibujarLineaH(25,58,59,NEGRO)#y,xi,xf,color
	DibujarLineaH(26,54,57,NEGRO)#y,xi,xf,color
	DibujarLineaH(29,54,57,NEGRO)#y,xi,xf,color
	DibujarPunto(51,19,NEGRO)#x,y,color
	DibujarPunto(60,19,NEGRO)#x,y,color
	DibujarPunto(60,24,NEGRO)#x,y,color
	DibujarLineaH(19,52,59,PERU)#y,xi,xf,color
	DibujarLineaH(20,51,60,PERU)#y,xi,xf,color
	DibujarLineaH(21,51,53,PERU)#y,xi,xf,color
	DibujarLineaH(21,58,60,PERU)#y,xi,xf,color
	DibujarLineaH(22,51,53,PERU)#y,xi,xf,color
	DibujarLineaH(22,58,60,PERU)#y,xi,xf,color
	DibujarLineaH(23,58,60,PERU)#y,xi,xf,color
	DibujarLineaH(24,54,59,PERU)#y,xi,xf,color
	DibujarLineaH(25,54,57,PERU)#y,xi,xf,color
	DibujarLineaH(27,54,57,PERU)#y,xi,xf,color
	DibujarLineaH(28,54,57,PERU)#y,xi,xf,color
	
.end_macro

.macro dibujar_I()

	#Se pinta el borde del huevo

	DibujarLineaV(2,39,43,NEGRO)#x,yi,yf,color
	DibujarLineaV(3,37,38,NEGRO)#x,yi,yf,color
	DibujarLineaV(4,35,36,NEGRO)#x,yi,yf,color
	DibujarLineaV(11,35,36,NEGRO)#x,yi,yf,color
	DibujarLineaV(12,37,38,NEGRO)#x,yi,yf,color
	DibujarLineaV(13,39,43,NEGRO)#x,yi,yf,color
	DibujarLineaH(33,6,9,NEGRO)#y,xi,xf,color
	DibujarLineaH(45,4,5,NEGRO)#y,xi,xf,color
	DibujarLineaH(45,10,11,NEGRO)#y,xi,xf,color
	DibujarLineaH(46,6,9,NEGRO)#y,xi,xf,color
	DibujarPunto(5,34,NEGRO)#x,y,color
	DibujarPunto(10,34,NEGRO)#x,y,color
	DibujarPunto(3,44,NEGRO)#x,y,color
	DibujarPunto(12,44,NEGRO)#x,y,color
	
	#Se pintan los detalles verdes del huevo
	
	DibujarLineaV(4,37,38,VERDE)#x,yi,yf,color
	DibujarLineaV(5,35,38,VERDE)#x,yi,yf,color
	DibujarLineaV(6,34,37,VERDE)#x,yi,yf,color
	DibujarLineaV(7,35,36,VERDE)#x,yi,yf,color
	DibujarLineaV(4,42,44,VERDE)#x,yi,yf,color
	DibujarLineaV(5,42,44,VERDE)#x,yi,yf,color
	DibujarLineaV(6,42,45,VERDE)#x,yi,yf,color
	DibujarLineaV(7,43,45,VERDE)#x,yi,yf,color
	DibujarLineaV(8,44,44,VERDE)#x,yi,yf,color
	DibujarLineaV(9,40,41,VERDE)#x,yi,yf,color
	DibujarLineaV(10,39,42,VERDE)#x,yi,yf,color
	DibujarLineaV(11,40,41,VERDE)#x,yi,yf,color
	DibujarPunto(3,43,VERDE)#x,y,color
	
.end_macro

.macro dibujar_J()

	DibujarLineaV(18,40,43,VERDE)#x,yi,yf,color
	DibujarLineaV(19,39,40,VERDE)#x,yi,yf,color
	DibujarLineaV(20,38,42,VERDE)#x,yi,yf,color
	DibujarLineaV(21,37,38,VERDE)#x,yi,yf,color
	DibujarLineaV(22,36,41,VERDE)#x,yi,yf,color
	DibujarLineaV(23,36,41,VERDE)#x,yi,yf,color
	DibujarLineaV(24,36,41,VERDE)#x,yi,yf,color
	DibujarLineaV(25,36,41,VERDE)#x,yi,yf,color
	DibujarLineaV(26,37,38,VERDE)#x,yi,yf,color
	DibujarLineaV(27,38,42,VERDE)#x,yi,yf,color
	DibujarLineaV(28,39,40,VERDE)#x,yi,yf,color
	DibujarLineaV(29,40,43,VERDE)#x,yi,yf,color
	DibujarLineaV(21,40,41,VERDE)#x,yi,yf,color
	DibujarLineaV(26,40,41,VERDE)#x,yi,yf,color
	DibujarPunto(21,35,VERDE)#x,y,color
	DibujarPunto(26,35,VERDE)#x,y,color
	DibujarLineaH(43,21,22,VERDE)#y,xi,xf,color
	DibujarLineaH(43,25,26,VERDE)#y,xi,xf,color

.end_macro

.macro dibujar_K()

	DibujarLineaV(34,35,44,TOSTADO)#x,yi,yf,color
	DibujarLineaV(35,34,45,TOSTADO)#x,yi,yf,coloR
	DibujarLineaV(36,33,34,TOSTADO)#x,yi,yf,color
	DibujarLineaV(37,33,34,TOSTADO)#x,yi,yf,color
	DibujarLineaV(38,33,34,TOSTADO)#x,yi,yf,color
	DibujarLineaV(39,33,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(40,33,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(41,33,34,TOSTADO)#x,yi,yf,color
	DibujarLineaV(42,33,34,TOSTADO)#x,yi,yf,color
	DibujarLineaV(43,33,34,TOSTADO)#x,yi,yf,color
	DibujarLineaV(44,34,45,TOSTADO)#x,yi,yf,color
	DibujarLineaV(45,35,44,TOSTADO)#x,yi,yf,color
	DibujarLineaV(36,39,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(37,39,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(38,39,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(41,39,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(42,39,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(43,39,46,TOSTADO)#x,yi,yf,color
	DibujarLineaV(35,41,43,NEGRO)#x,yi,yf,color
	DibujarLineaV(38,36,37,NEGRO)#x,yi,yf,color
	DibujarLineaV(41,36,37,NEGRO)#x,yi,yf,color
	DibujarLineaV(44,41,43,NEGRO)#x,yi,yf,color
	DibujarLineaH(43,35,44,NEGRO)#y,xi,xf,color
	
.end_macro

.macro dibujar_L()

	#Se pinta el borde del huevo

	DibujarLineaV(50,39,43,NEGRO)#x,yi,yf,color
	DibujarLineaV(51,37,38,NEGRO)#x,yi,yf,color
	DibujarLineaV(52,35,36,NEGRO)#x,yi,yf,color
	DibujarLineaV(59,35,36,NEGRO)#x,yi,yf,color
	DibujarLineaV(60,37,38,NEGRO)#x,yi,yf,color
	DibujarLineaV(61,39,43,NEGRO)#x,yi,yf,color
	DibujarLineaH(33,54,57,NEGRO)#y,xi,xf,color
	DibujarLineaH(45,52,53,NEGRO)#y,xi,xf,color
	DibujarLineaH(45,58,59,NEGRO)#y,xi,xf,color
	DibujarLineaH(46,54,57,NEGRO)#y,xi,xf,color
	DibujarPunto(53,34,NEGRO)#x,y,color
	DibujarPunto(58,34,NEGRO)#x,y,color
	DibujarPunto(51,44,NEGRO)#x,y,color
	DibujarPunto(60,44,NEGRO)#x,y,color
	
	#Se pintan los detalles verdes del huevo
	
	DibujarLineaV(52,37,38,VERDE)#x,yi,yf,color
	DibujarLineaV(53,35,38,VERDE)#x,yi,yf,color
	DibujarLineaV(54,34,37,VERDE)#x,yi,yf,color
	DibujarLineaV(55,35,36,VERDE)#x,yi,yf,color
	DibujarLineaV(52,42,44,VERDE)#x,yi,yf,color
	DibujarLineaV(53,42,44,VERDE)#x,yi,yf,color
	DibujarLineaV(54,42,45,VERDE)#x,yi,yf,color
	DibujarLineaV(55,43,45,VERDE)#x,yi,yf,color
	DibujarLineaV(56,44,44,VERDE)#x,yi,yf,color
	DibujarLineaV(57,40,41,VERDE)#x,yi,yf,color
	DibujarLineaV(58,39,42,VERDE)#x,yi,yf,color
	DibujarLineaV(59,40,41,VERDE)#x,yi,yf,color
	DibujarPunto(51,43,VERDE)#x,y,color
	
.end_macro

.macro dibujar_M()

	DibujarLineaH(49,3,6,ROJO)#y,xi,xf,color
	DibujarLineaH(50,2,4,ROJO)#y,xi,xf,color
	DibujarLineaH(51,1,6,ROJO)#y,xi,xf,color
	DibujarLineaH(52,1,3,ROJO)#y,xi,xf,color
	DibujarLineaH(53,1,2,ROJO)#y,xi,xf,color
	DibujarLineaH(54,1,3,ROJO)#y,xi,xf,color
	DibujarLineaH(49,9,12,ROJO)#y,xi,xf,color
	DibujarLineaH(50,11,13,ROJO)#y,xi,xf,color
	DibujarLineaH(51,9,14,ROJO)#y,xi,xf,color
	DibujarLineaH(52,12,14,ROJO)#y,xi,xf,color
	DibujarLineaH(53,13,14,ROJO)#y,xi,xf,color
	DibujarLineaH(54,12,14,ROJO)#y,xi,xf,color
	DibujarLineaH(54,7,8,ROJO)#y,xi,xf,color
	DibujarLineaH(55,2,13,ROJO)#y,xi,xf,color
	DibujarLineaH(56,4,11,ROJO)#y,xi,xf,color
	DibujarLineaH(57,2,13,ROJO)#y,xi,xf,color
	DibujarLineaH(58,4,11,ROJO)#y,xi,xf,color
	DibujarLineaH(59,3,12,ROJO)#y,xi,xf,color
	DibujarLineaH(60,5,10,ROJO)#y,xi,xf,color
	DibujarLineaH(61,7,8,ROJO)#y,xi,xf,color
	DibujarLineaH(61,4,5,ROJO)#y,xi,xf,color
	DibujarLineaH(61,10,11,ROJO)#y,xi,xf,color
	DibujarPunto(6,54,AZUL_AGUA)#x,y,color
	DibujarPunto(9,54,AZUL_AGUA)#x,y,color

.end_macro

.macro dibujar_N()
	
	DibujarLineaV(17,52,57,NEGRO)#x,yi,yf,color
	DibujarLineaV(19,58,60,NEGRO)#x,yi,yf,color
	DibujarLineaV(22,57,59,NEGRO)#x,yi,yf,color
	DibujarLineaV(25,57,59,NEGRO)#x,yi,yf,color
	DibujarLineaV(28,58,60,NEGRO)#x,yi,yf,color
	DibujarLineaV(30,53,57,NEGRO)#x,yi,yf,color
	DibujarLineaH(49,22,25,NEGRO)#y,xi,xf,color
	DibujarLineaH(50,20,21,NEGRO)#y,xi,xf,color
	DibujarLineaH(50,26,27,NEGRO)#y,xi,xf,color
	DibujarLineaH(57,21,26,NEGRO)#y,xi,xf,color
	DibujarLineaH(58,18,20,NEGRO)#y,xi,xf,color
	DibujarLineaH(69,27,29,NEGRO)#y,xi,xf,color
	DibujarLineaH(62,21,26,NEGRO)#y,xi,xf,color
	DibujarPunto(19,51,NEGRO)#x,y,color
	DibujarPunto(18,52,NEGRO)#x,y,color
	DibujarPunto(20,61,NEGRO)#x,y,color
	DibujarPunto(27,61,NEGRO)#x,y,color
	DibujarPunto(28,51,NEGRO)#x,y,color
	DibujarPunto(29,52,NEGRO)#x,y,color
	DibujarLineaH(57,18,20,ROJO)#y,xi,xf,color
	DibujarLineaH(57,27,29,ROJO)#y,xi,xf,color
	DibujarLineaH(56,19,22,ROJO)#y,xi,xf,color
	DibujarLineaH(56,25,28,ROJO)#y,xi,xf,color
	DibujarLineaH(55,20,21,ROJO)#y,xi,xf,color
	DibujarLineaH(55,26,27,ROJO)#y,xi,xf,color
	DibujarLineaH(54,20,21,ROJO)#y,xi,xf,color
	DibujarLineaH(54,26,27,ROJO)#y,xi,xf,color
	DibujarLineaH(53,19,22,ROJO)#y,xi,xf,color
	DibujarLineaH(53,25,28,ROJO)#y,xi,xf,color
	DibujarLineaH(52,22,25,ROJO)#y,xi,xf,color
	DibujarLineaH(51,23,24,ROJO)#y,xi,xf,color
	DibujarLineaH(50,23,24,ROJO)#y,xi,xf,color
	DibujarPunto(19,52,ROJO)#x,y,color
	DibujarPunto(28,52,ROJO)#x,y,color
	
.end_macro

.macro dibujar_O()

	DibujarLineaV(34,56,59,VERDE)#x,yi,yf,color
	DibujarLineaV(35,55,56,VERDE)#x,yi,yf,color
	DibujarLineaV(36,54,58,VERDE)#x,yi,yf,color
	DibujarLineaV(37,53,54,VERDE)#x,yi,yf,color
	DibujarLineaV(38,52,57,VERDE)#x,yi,yf,color
	DibujarLineaV(39,52,57,VERDE)#x,yi,yf,color
	DibujarLineaV(40,52,57,VERDE)#x,yi,yf,color
	DibujarLineaV(41,52,57,VERDE)#x,yi,yf,color
	DibujarLineaV(42,53,54,VERDE)#x,yi,yf,color
	DibujarLineaV(43,54,58,VERDE)#x,yi,yf,color
	DibujarLineaV(44,55,56,VERDE)#x,yi,yf,color
	DibujarLineaV(45,56,59,VERDE)#x,yi,yf,color
	DibujarLineaV(37,56,57,VERDE)#x,yi,yf,color
	DibujarLineaV(42,56,57,VERDE)#x,yi,yf,color
	DibujarPunto(37,51,VERDE)#x,y,color
	DibujarPunto(42,51,VERDE)#x,y,color
	DibujarLineaH(59,37,38,VERDE)#y,xi,xf,color
	DibujarLineaH(59,41,42,VERDE)#y,xi,xf,color

.end_macro

.macro dibujar_P()

	DibujarLineaH(50,52,53,NEGRO)#y,xi,xf,color
	DibujarPunto(51,51,NEGRO)#x,y,color
	DibujarLineaV(50,52,55,NEGRO)#x,yi,yf,color
	DibujarPunto(54,51,NEGRO)#x,y,color
	DibujarPunto(56,52,NEGRO)#x,y,color
	DibujarPunto(55,52,NEGRO)#x,y,color
	DibujarPunto(57,51,NEGRO)#x,y,color
	DibujarLineaH(50,58,59,NEGRO)#y,xi,xf,color
	DibujarPunto(60,51,NEGRO)#x,y,color
	DibujarLineaV(61,52,55,NEGRO)#x,yi,yf,color
	DibujarPunto(51,56,NEGRO)#x,y,color
	DibujarPunto(52,57,NEGRO)#x,y,color
	DibujarPunto(53,58,NEGRO)#x,y,color
	DibujarPunto(54,59,NEGRO)#x,y,color
	DibujarPunto(55,60,NEGRO)#x,y,color
	DibujarPunto(56,60,NEGRO)#x,y,color
	DibujarPunto(60,56,NEGRO)#x,y,color
	DibujarPunto(59,57,NEGRO)#x,y,color
	DibujarPunto(58,58,NEGRO)#x,y,color
	DibujarPunto(57,59,NEGRO)#x,y,color
	DibujarLineaH(51,52,53,ROJO)#y,xi,xf,color
	DibujarLineaH(51,58,59,ROJO)#y,xi,xf,color
	DibujarLineaH(52,51,54,ROJO)#y,xi,xf,color
	DibujarLineaH(52,57,60,ROJO)#y,xi,xf,color
	DibujarLineaH(53,51,60,ROJO)#y,xi,xf,color
	DibujarLineaH(54,51,60,ROJO)#y,xi,xf,color
	DibujarLineaH(55,51,60,ROJO)#y,xi,xf,color
	DibujarLineaH(56,52,59,ROJO)#y,xi,xf,color
	DibujarLineaH(57,53,58,ROJO)#y,xi,xf,color
	DibujarLineaH(58,54,57,ROJO)#y,xi,xf,color
	DibujarLineaH(59,55,56,ROJO)#y,xi,xf,color
	DibujarPunto(59,52,PERU)#x,y,color

.end_macro

.macro gano()
	Borrar(NAVY)
	
	#Dibujar la Y (el borde)
	
	DibujarLineaH(2,12,14,NEGRO)#y,xi,xf,color
	DibujarLineaH(2,22,24,NEGRO)#y,xi,xf,color
	DibujarLineaH(10,14,15,NEGRO)#y,xi,xf,color
	DibujarLineaH(10,21,22,NEGRO)#y,xi,xf,color
	DibujarLineaH(17,17,19,NEGRO)#y,xi,xf,color
	
	DibujarPunto(17,7,NEGRO)#x,y,color
	DibujarPunto(19,7,NEGRO)#x,y,color
	
	DibujarLineaV(11,3,5,NEGRO)#x,yi,yf,color
	DibujarLineaV(12,6,7,NEGRO)#x,yi,yf,color
	DibujarLineaV(13,8,9,NEGRO)#x,yi,yf,color
	DibujarLineaV(16,11,16,NEGRO)#x,yi,yf,color
	DibujarLineaV(20,11,16,NEGRO)#x,yi,yf,color
	DibujarLineaV(23,8,9,NEGRO)#x,yi,yf,color
	DibujarLineaV(24,6,7,NEGRO)#x,yi,yf,color
	DibujarLineaV(25,3,5,NEGRO)#x,yi,yf,color
	DibujarLineaV(15,3,4,NEGRO)#x,yi,yf,color
	DibujarLineaV(16,5,6,NEGRO)#x,yi,yf,color
	DibujarLineaV(20,5,6,NEGRO)#x,yi,yf,color
	DibujarLineaV(21,3,4,NEGRO)#x,yi,yf,color
	
	#Dibujar la Y (relleno)
	
	DibujarLineaV(12,3,5,AMARILLO)#x,yi,yf,color
	DibujarLineaV(13,3,7,AMARILLO)#x,yi,yf,color
	DibujarLineaV(14,3,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(15,5,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(16,7,10,AMARILLO)#x,yi,yf,color
	DibujarLineaV(17,8,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(18,8,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(19,8,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(20,7,10,AMARILLO)#x,yi,yf,color
	DibujarLineaV(21,5,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(22,3,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(23,3,7,AMARILLO)#x,yi,yf,color
	DibujarLineaV(24,3,5,AMARILLO)#x,yi,yf,color
	DibujarPunto(18,8,NEGRO)#x,y,color
	
	#Dibujar la O (Borde)
	
	DibujarLineaV(27,4,15,NEGRO)#x,yi,yf,color
	DibujarLineaV(37,4,15,NEGRO)#x,yi,yf,color
	DibujarLineaV(31,7,12,NEGRO)#x,yi,yf,color
	DibujarLineaV(33,7,12,NEGRO)#x,yi,yf,color
	DibujarLineaH(2,29,35,NEGRO)#y,xi,xf,color
	DibujarLineaH(17,29,35,NEGRO)#y,xi,xf,color
	DibujarPunto(28,3,NEGRO)#x,y,color
	DibujarPunto(28,16,NEGRO)#x,y,color
	DibujarPunto(36,3,NEGRO)#x,y,color
	DibujarPunto(36,16,NEGRO)#x,y,color
	DibujarPunto(32,6,NEGRO)#x,y,color
	DibujarPunto(32,13,NEGRO)#x,y,color
	
	#Dibujar la O (Relleno)
	
	DibujarLineaV(28,4,15,AMARILLO)#x,yi,yf,color
	DibujarLineaV(29,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(30,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,3,6,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,3,5,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,3,6,AMARILLO)#x,yi,yf,color
	DibujarLineaV(34,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(35,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(36,4,15,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,13,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,14,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,13,16,AMARILLO)#x,yi,yf,color
	
	#Dibujar la U (Borde)
	
	DibujarLineaV(39,3,15,NEGRO)#x,yi,yf,color
	DibujarLineaV(43,3,12,NEGRO)#x,yi,yf,color
	DibujarLineaV(45,3,12,NEGRO)#x,yi,yf,color
	DibujarLineaV(49,3,15,NEGRO)#x,yi,yf,color
	
	DibujarPunto(40,16,NEGRO)#x,y,color
	DibujarPunto(48,16,NEGRO)#x,y,color
	DibujarPunto(44,13,NEGRO)#x,y,color
	
	DibujarLineaH(17,41,47,NEGRO)#y,xi,xf,color
	DibujarLineaH(2,40,42,NEGRO)#y,xi,xf,color
	DibujarLineaH(2,46,48,NEGRO)#y,xi,xf,color
	
	#Dibujar la U (Relleno)
	
	DibujarLineaV(40,3,15,AMARILLO)#x,yi,yf,color
	DibujarLineaV(41,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(42,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(43,13,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(44,14,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(45,13,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(46,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(47,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(48,3,15,AMARILLO)#x,yi,yf,color
	
	#Dibujar la W (Borde)
	
	DibujarLineaV(11,22,30,NEGRO)#x,yi,yf,color
	DibujarLineaV(15,22,24,NEGRO)#x,yi,yf,color
	DibujarLineaV(16,25,30,NEGRO)#x,yi,yf,color
	DibujarLineaV(20,25,30,NEGRO)#x,yi,yf,color
	DibujarLineaV(21,22,24,NEGRO)#x,yi,yf,color
	DibujarLineaV(25,22,30,NEGRO)#x,yi,yf,color
	DibujarLineaV(13,32,33,NEGRO)#x,yi,yf,color
	DibujarLineaV(14,34,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(22,34,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(23,32,33,NEGRO)#x,yi,yf,color
	
	DibujarPunto(12,31,NEGRO)#x,y,color
	DibujarPunto(24,31,NEGRO)#x,y,color
	DibujarPunto(18,35,NEGRO)#x,y,color
	
	DibujarLineaH(21,12,14,NEGRO)#y,xi,xf,color
	DibujarLineaH(21,22,24,NEGRO)#y,xi,xf,color
	DibujarLineaH(24,17,19,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,15,17,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,19,21,NEGRO)#y,xi,xf,color
	
	#Dibujar la W (Relleno)
	
	DibujarLineaV(12,22,30,AMARILLO)#x,yi,yf,color
	DibujarLineaV(13,22,31,AMARILLO)#x,yi,yf,color
	DibujarLineaV(14,22,33,AMARILLO)#x,yi,yf,color
	DibujarLineaV(15,25,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(16,31,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(17,25,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(18,25,34,AMARILLO)#x,yi,yf,color
	DibujarLineaV(19,25,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(20,31,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(21,25,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(22,22,33,AMARILLO)#x,yi,yf,color
	DibujarLineaV(23,22,31,AMARILLO)#x,yi,yf,color
	DibujarLineaV(24,22,30,AMARILLO)#x,yi,yf,color
	
	#Dibujar la O (Borde)
	
	DibujarLineaV(27,23,34,NEGRO)#x,yi,yf,color
	DibujarLineaV(37,23,34,NEGRO)#x,yi,yf,color
	DibujarLineaV(31,26,31,NEGRO)#x,yi,yf,color
	DibujarLineaV(33,26,31,NEGRO)#x,yi,yf,color
	
	DibujarLineaH(21,29,35,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,29,35,NEGRO)#y,xi,xf,color
	
	DibujarPunto(28,22,NEGRO)#x,y,color
	DibujarPunto(28,35,NEGRO)#x,y,color
	DibujarPunto(36,22,NEGRO)#x,y,color
	DibujarPunto(36,35,NEGRO)#x,y,color
	DibujarPunto(32,25,NEGRO)#x,y,color
	DibujarPunto(32,32,NEGRO)#x,y,color
	
	#Dibujar la O (Relleno)
	
	DibujarLineaV(28,23,34,AMARILLO)#x,yi,yf,color
	DibujarLineaV(29,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(30,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,22,25,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,22,24,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,22,25,AMARILLO)#x,yi,yf,color
	DibujarLineaV(34,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(35,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(36,23,34,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,32,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,33,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,32,35,AMARILLO)#x,yi,yf,color
	
	#Dibujar N (Borde)
	
	DibujarLineaV(39,22,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(43,22,24,NEGRO)#x,yi,yf,color
	DibujarLineaV(44,25,26,NEGRO)#x,yi,yf,color
	DibujarLineaV(46,22,28,NEGRO)#x,yi,yf,color
	DibujarLineaV(50,22,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(43,30,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(45,32,33,NEGRO)#x,yi,yf,color
	DibujarLineaV(46,34,35,NEGRO)#x,yi,yf,color
	
	DibujarPunto(44,31,NEGRO)#x,y,color
	DibujarPunto(45,27,NEGRO)#x,y,color
	
	DibujarLineaH(21,40,42,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,40,42,NEGRO)#y,xi,xf,color
	DibujarLineaH(21,47,49,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,47,49,NEGRO)#y,xi,xf,color
	
	#Dibujar N (Relleno)
	
	DibujarLineaV(40,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(41,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(42,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(43,25,29,AMARILLO)#x,yi,yf,color
	DibujarLineaV(44,27,30,AMARILLO)#x,yi,yf,color
	DibujarLineaV(45,28,31,AMARILLO)#x,yi,yf,color
	DibujarLineaV(46,29,33,AMARILLO)#x,yi,yf,color
	DibujarLineaV(47,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(48,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(49,22,35,AMARILLO)#x,yi,yf,color
	
	#Dibujar los borde, las gafas y la sonrisa de la carita
	
	DibujarLineaV(25,48,52,NEGRO)#x,yi,yf,color
	DibujarLineaV(26,46,47,NEGRO)#x,yi,yf,color
	DibujarLineaV(38,46,47,NEGRO)#x,yi,yf,color
	DibujarLineaV(39,48,52,NEGRO)#x,yi,yf,color
	DibujarLineaV(26,53,54,NEGRO)#x,yi,yf,color
	DibujarLineaV(38,53,54,NEGRO)#x,yi,yf,color
	
	DibujarLineaH(43,30,34,NEGRO)#y,xi,xf,color
	DibujarLineaH(44,28,29,NEGRO)#y,xi,xf,color
	DibujarLineaH(44,35,36,NEGRO)#y,xi,xf,color
	DibujarLineaH(56,28,29,NEGRO)#y,xi,xf,color
	DibujarLineaH(56,35,36,NEGRO)#y,xi,xf,color
	DibujarLineaH(57,30,34,NEGRO)#y,xi,xf,color
	DibujarLineaH(48,25,39,NEGRO)#y,xi,xf,color
	DibujarLineaH(49,27,37,NEGRO)#y,xi,xf,color
	DibujarLineaH(50,27,31,NEGRO)#y,xi,xf,color
	DibujarLineaH(50,33,37,NEGRO)#y,xi,xf,color
	DibujarLineaH(51,28,30,NEGRO)#y,xi,xf,color
	DibujarLineaH(51,34,36,NEGRO)#y,xi,xf,color
	
	DibujarPunto(27,45,NEGRO)#x,y,color
	DibujarPunto(37,45,NEGRO)#x,y,color
	DibujarPunto(27,55,NEGRO)#x,y,color
	DibujarPunto(37,55,NEGRO)#x,y,color
	
	DibujarPunto(28,49,PERU)#x,y,color
	DibujarPunto(29,49,PERU)#x,y,color
	DibujarPunto(28,50,PERU)#x,y,color
	
	DibujarPunto(34,49,PERU)#x,y,color
	DibujarPunto(35,49,PERU)#x,y,color
	DibujarPunto(34,50,PERU)#x,y,color
	
	#Dibujar la carita (Rellena)
	
	DibujarLineaH(44,30,34,AMARILLO)#y,xi,xf,color
	DibujarLineaH(45,28,36,AMARILLO)#y,xi,xf,color
	DibujarLineaH(46,27,37,AMARILLO)#y,xi,xf,color
	DibujarLineaH(47,27,37,AMARILLO)#y,xi,xf,color
	
	DibujarLineaV(26,49,52,AMARILLO)#x,yi,yf,color
	DibujarLineaV(27,51,54,AMARILLO)#x,yi,yf,color
	DibujarLineaV(28,52,55,AMARILLO)#x,yi,yf,color
	DibujarLineaV(29,52,55,AMARILLO)#x,yi,yf,color
	DibujarLineaV(30,52,56,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,51,56,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,50,56,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,51,56,AMARILLO)#x,yi,yf,color
	DibujarLineaV(34,52,56,AMARILLO)#x,yi,yf,color
	DibujarLineaV(35,52,55,AMARILLO)#x,yi,yf,color
	DibujarLineaV(36,52,55,AMARILLO)#x,yi,yf,color
	DibujarLineaV(37,51,54,AMARILLO)#x,yi,yf,color
	DibujarLineaV(38,49,52,AMARILLO)#x,yi,yf,color
	
	DibujarLineaH(54,31,34,NEGRO)#y,xi,xf,color
	DibujarPunto(35,53,NEGRO)#x,y,color

	ImprimirMensaje(otravez)
	li $v0, 12
	syscall 	#leo el caracter
	add $s0,$v0,$zero
	beq $s0,'S',main
	beq $s0,'s',main
	beq $s0,'N',fin
	beq $s0,'n',fin
.end_macro
	
.macro perdio()
	Borrar(NAVY)
	
	#Dibujar la Y (el borde)
	
	DibujarLineaH(2,12,14,NEGRO)#y,xi,xf,color
	DibujarLineaH(2,22,24,NEGRO)#y,xi,xf,color
	DibujarLineaH(10,14,15,NEGRO)#y,xi,xf,color
	DibujarLineaH(10,21,22,NEGRO)#y,xi,xf,color
	DibujarLineaH(17,17,19,NEGRO)#y,xi,xf,color
	
	DibujarPunto(17,7,NEGRO)#x,y,color
	DibujarPunto(19,7,NEGRO)#x,y,color
	
	DibujarLineaV(11,3,5,NEGRO)#x,yi,yf,color
	DibujarLineaV(12,6,7,NEGRO)#x,yi,yf,color
	DibujarLineaV(13,8,9,NEGRO)#x,yi,yf,color
	DibujarLineaV(16,11,16,NEGRO)#x,yi,yf,color
	DibujarLineaV(20,11,16,NEGRO)#x,yi,yf,color
	DibujarLineaV(23,8,9,NEGRO)#x,yi,yf,color
	DibujarLineaV(24,6,7,NEGRO)#x,yi,yf,color
	DibujarLineaV(25,3,5,NEGRO)#x,yi,yf,color
	DibujarLineaV(15,3,4,NEGRO)#x,yi,yf,color
	DibujarLineaV(16,5,6,NEGRO)#x,yi,yf,color
	DibujarLineaV(20,5,6,NEGRO)#x,yi,yf,color
	DibujarLineaV(21,3,4,NEGRO)#x,yi,yf,color
	
	#Dibujar la Y (relleno)
	
	DibujarLineaV(12,3,5,AMARILLO)#x,yi,yf,color
	DibujarLineaV(13,3,7,AMARILLO)#x,yi,yf,color
	DibujarLineaV(14,3,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(15,5,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(16,7,10,AMARILLO)#x,yi,yf,color
	DibujarLineaV(17,8,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(18,8,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(19,8,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(20,7,10,AMARILLO)#x,yi,yf,color
	DibujarLineaV(21,5,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(22,3,9,AMARILLO)#x,yi,yf,color
	DibujarLineaV(23,3,7,AMARILLO)#x,yi,yf,color
	DibujarLineaV(24,3,5,AMARILLO)#x,yi,yf,color
	DibujarPunto(18,8,NEGRO)#x,y,color
	
	#Dibujar la O (Borde)
	
	DibujarLineaV(27,4,15,NEGRO)#x,yi,yf,color
	DibujarLineaV(37,4,15,NEGRO)#x,yi,yf,color
	DibujarLineaV(31,7,12,NEGRO)#x,yi,yf,color
	DibujarLineaV(33,7,12,NEGRO)#x,yi,yf,color
	DibujarLineaH(2,29,35,NEGRO)#y,xi,xf,color
	DibujarLineaH(17,29,35,NEGRO)#y,xi,xf,color
	DibujarPunto(28,3,NEGRO)#x,y,color
	DibujarPunto(28,16,NEGRO)#x,y,color
	DibujarPunto(36,3,NEGRO)#x,y,color
	DibujarPunto(36,16,NEGRO)#x,y,color
	DibujarPunto(32,6,NEGRO)#x,y,color
	DibujarPunto(32,13,NEGRO)#x,y,color
	
	#Dibujar la O (Relleno)
	
	DibujarLineaV(28,4,15,AMARILLO)#x,yi,yf,color
	DibujarLineaV(29,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(30,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,3,6,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,3,5,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,3,6,AMARILLO)#x,yi,yf,color
	DibujarLineaV(34,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(35,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(36,4,15,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,13,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,14,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,13,16,AMARILLO)#x,yi,yf,color
	
	#Dibujar la U (Borde)
	
	DibujarLineaV(39,3,15,NEGRO)#x,yi,yf,color
	DibujarLineaV(43,3,12,NEGRO)#x,yi,yf,color
	DibujarLineaV(45,3,12,NEGRO)#x,yi,yf,color
	DibujarLineaV(49,3,15,NEGRO)#x,yi,yf,color
	
	DibujarPunto(40,16,NEGRO)#x,y,color
	DibujarPunto(48,16,NEGRO)#x,y,color
	DibujarPunto(44,13,NEGRO)#x,y,color
	
	DibujarLineaH(17,41,47,NEGRO)#y,xi,xf,color
	DibujarLineaH(2,40,42,NEGRO)#y,xi,xf,color
	DibujarLineaH(2,46,48,NEGRO)#y,xi,xf,color
	
	#Dibujar la U (Relleno)
	
	DibujarLineaV(40,3,15,AMARILLO)#x,yi,yf,color
	DibujarLineaV(41,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(42,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(43,13,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(44,14,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(45,13,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(46,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(47,3,16,AMARILLO)#x,yi,yf,color
	DibujarLineaV(48,3,15,AMARILLO)#x,yi,yf,color
	
	#Dibujar la L(Contorno)
	
	DibujarLineaV(3,22,34,NEGRO)#x,yi,yf,color
	DibujarLineaV(7,22,31,NEGRO)#x,yi,yf,color
	DibujarLineaV(13,33,35,NEGRO)#x,yi,yf,color
	
	DibujarLineaH(21,4,6,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,5,12,NEGRO)#y,xi,xf,color
	DibujarLineaH(32,8,12,NEGRO)#y,xi,xf,color
	
	DibujarPunto(4,35,NEGRO)#x,y,color
	
	#Dibujar la L(Relleno)
	
	DibujarLineaV(4,22,34,AMARILLO)#x,yi,yf,color
	DibujarLineaV(5,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(6,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(7,32,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(8,33,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(9,33,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(10,33,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(11,33,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(12,33,35,AMARILLO)#x,yi,yf,color
	
	#Dibujar la O (Borde)
	
	DibujarLineaV(15,23,34,NEGRO)#x,yi,yf,color
	DibujarLineaV(25,23,34,NEGRO)#x,yi,yf,color
	DibujarLineaV(19,26,31,NEGRO)#x,yi,yf,color
	DibujarLineaV(21,26,31,NEGRO)#x,yi,yf,color
	
	DibujarLineaH(21,17,23,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,17,23,NEGRO)#y,xi,xf,color
	
	DibujarPunto(16,22,NEGRO)#x,y,color
	DibujarPunto(16,35,NEGRO)#x,y,color
	DibujarPunto(24,22,NEGRO)#x,y,color
	DibujarPunto(24,35,NEGRO)#x,y,color
	DibujarPunto(20,25,NEGRO)#x,y,color
	DibujarPunto(20,32,NEGRO)#x,y,color
	
	#Dibujar la O (Relleno)
	
	DibujarLineaV(16,23,34,AMARILLO)#x,yi,yf,color
	DibujarLineaV(17,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(18,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(19,22,25,AMARILLO)#x,yi,yf,color
	DibujarLineaV(20,22,24,AMARILLO)#x,yi,yf,color
	DibujarLineaV(21,22,25,AMARILLO)#x,yi,yf,color
	DibujarLineaV(22,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(23,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(24,23,34,AMARILLO)#x,yi,yf,color
	
	DibujarLineaV(19,32,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(20,33,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(21,32,35,AMARILLO)#x,yi,yf,color
	
	#Dibujar la S(Borde)
	
	DibujarLineaV(27,23,30,NEGRO)#x,yi,yf,color
	DibujarLineaV(27,32,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(37,22,25,NEGRO)#x,yi,yf,color
	DibujarLineaV(37,27,34,NEGRO)#x,yi,yf,color
	
	DibujarPunto(28,22,NEGRO)#x,y,color
	DibujarPunto(36,35,NEGRO)#x,y,color
	
	DibujarLineaH(21,29,36,NEGRO)#y,xi,xf,color
	DibujarLineaH(36,28,35,NEGRO)#y,xi,xf,color
	
	#Dibujar la S(Relleno y otro del borde)
	
	DibujarLineaV(28,23,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(29,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(30,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(31,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(32,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(33,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(34,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(35,22,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(36,22,34,AMARILLO)#x,yi,yf,color
	
	DibujarLineaH(31,28,32,NEGRO)#y,xi,xf,color
	DibujarLineaH(26,32,36,NEGRO)#y,xi,xf,color

	#Dibujar la T(Borde)
	
	DibujarLineaV(42,22,35,NEGRO)#x,yi,yf,color
	DibujarLineaV(43,26,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(44,26,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(45,26,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(46,26,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(47,26,35,AMARILLO)#x,yi,yf,color
	DibujarLineaV(48,22,35,NEGRO)#x,yi,yf,color
	DibujarLineaH(36,42,48,NEGRO)#y,xi,xf,
	
	DibujarLineaH(23,43,47,AMARILLO)#y,xi,xf,
	DibujarLineaH(24,43,47,AMARILLO)#y,xi,xf,
	DibujarLineaH(25,43,47,AMARILLO)#y,xi,xf,
	DibujarLineaH(22,40,50,AMARILLO)#y,xi,xf,
	DibujarLineaH(21,40,50,AMARILLO)#y,xi,xf,
	DibujarLineaH(20,39,50,NEGRO)#y,xi,xf,
	DibujarPunto(39,21,NEGRO)#x,y,color
	DibujarPunto(39,22,NEGRO)#x,y,color
	DibujarPunto(39,23,NEGRO)#x,y,color
	DibujarPunto(40,23,NEGRO)#x,y,color
	DibujarPunto(41,23,NEGRO)#x,y,color
	
	DibujarPunto(49,23,NEGRO)#x,y,color
	DibujarPunto(50,23,NEGRO)#x,y,color

	DibujarPunto(50,22,NEGRO)#x,y,color
	DibujarPunto(50,21,NEGRO)#x,y,color
	#Dibujar la cara(Borde y detalles en negro)
	
	DibujarLineaV(26,45,54,NEGRO)#x,yi,yf,color
	DibujarLineaV(27,44,45,NEGRO)#x,yi,yf,color
	DibujarLineaV(28,43,44,NEGRO)#x,yi,yf,color
	DibujarLineaV(36,43,44,NEGRO)#x,yi,yf,color
	DibujarLineaV(37,44,45,NEGRO)#x,yi,yf,color
	DibujarLineaV(38,45,54,NEGRO)#x,yi,yf,color
	
	DibujarPunto(27,55,NEGRO)#x,y,color
	DibujarPunto(28,56,NEGRO)#x,y,color
	DibujarPunto(36,56,NEGRO)#x,y,color
	DibujarPunto(37,55,NEGRO)#x,y,color
	DibujarPunto(28,54,NEGRO)#x,y,color
	DibujarPunto(36,54,NEGRO)#x,y,color
	
	DibujarLineaH(43,28,36,NEGRO)#y,xi,xf,color
	DibujarLineaH(57,29,35,NEGRO)#y,xi,xf,color
	DibujarLineaH(48,30,31,NEGRO)#y,xi,xf,color
	DibujarLineaH(48,33,34,NEGRO)#y,xi,xf,color
	DibujarLineaH(49,30,31,NEGRO)#y,xi,xf,color
	DibujarLineaH(49,33,34,NEGRO)#y,xi,xf,color
	DibujarLineaH(53,29,35,NEGRO)#y,xi,xf,color
	
	#Dibujar la cara(Detalles morados y blancos)
	
	DibujarLineaH(44,29,35,MORADO)#y,xi,xf,color
	DibujarLineaH(45,28,36,MORADO)#y,xi,xf,color
	DibujarLineaH(46,27,37,MORADO)#y,xi,xf,color
	DibujarLineaH(52,27,37,MORADO)#y,xi,xf,color
	DibujarLineaH(54,29,35,MORADO)#y,xi,xf,color
	DibujarLineaH(55,28,36,MORADO)#y,xi,xf,color
	DibujarLineaH(56,29,35,MORADO)#y,xi,xf,color
	DibujarLineaH(47,27,30,MORADO)#y,xi,xf,color
	DibujarLineaH(47,34,37,MORADO)#y,xi,xf,color
	
	DibujarLineaV(27,46,54,MORADO)#x,yi,yf,color
	DibujarLineaV(28,45,53,MORADO)#x,yi,yf,color
	DibujarLineaV(32,47,51,MORADO)#x,yi,yf,color
	DibujarLineaV(36,45,53,MORADO)#x,yi,yf,color
	DibujarLineaV(37,46,54,MORADO)#x,yi,yf,color
	
	DibujarLineaV(29,48,51,PERU)#x,yi,yf,color
	DibujarLineaV(30,50,51,PERU)#x,yi,yf,color
	DibujarLineaV(31,50,51,PERU)#x,yi,yf,color
	DibujarLineaV(33,50,51,PERU)#x,yi,yf,color
	DibujarLineaV(34,50,51,PERU)#x,yi,yf,color
	DibujarLineaV(35,48,51,PERU)#x,yi,yf,color
	
	DibujarPunto(31,47,PERU)#x,y,color
	DibujarPunto(33,47,PERU)#x,y,color
	
	ImprimirMensaje(otravez)
	li $v0, 12
	syscall 	#leo el caracter
	add $s0,$v0,$zero
	beq $s0,'S',main
	beq $s0,'s',main
	beq $s0,'N',fin
	beq $s0,'n',fin
.end_macro

.macro ImprimirMensajeIntentos()
	ImprimirMensaje(msjIntentos)
	li $v0,1
	add $a0,$t6,$zero
	syscall
	ImprimirMensaje(msjIntentos2)
.end_macro

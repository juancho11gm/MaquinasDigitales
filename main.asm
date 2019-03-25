.include "pantalla.asm"

.data
	mal: .asciiz "mal"
	msjBienvenida: .asciiz "\nBienvenido al juego. \nPresione ENTER para continuar..."
	msjIngLetra: .asciiz "\nIngrese una letra: "
	msjEnter: .asciiz "\nPresione ENTER..."
	msjIntentos: .asciiz "\nLe quedan "
	msjIntentos2: .asciiz "   intentos "
	invalido: .asciiz "\nINGRESE UNA LETRA VALIDA POR FAVOR"
	otravez: .asciiz "\n DESEA JUGAR OTRA VEZ? S/N"
	adios: .asciiz "\n ADIOS"
	arreglo: .space 64
.text
main:
	Borrar(NAVY)
	Bienvenida(BLANCO)
	Cerebro(BLANCO)
	ImprimirMensaje(msjBienvenida)
	li $v0, 12
	syscall
	Borrar(NAVY)
	pintarCuadrados()
	pintarLetras()
	add $t6,$zero,5 #numero de intentos
	addi $t7, $zero, 0 #numero de cartas volteadas
	addi $s6,$zero,0
	li $s3, 0 #contador = 0
bucle:
	beq $t7,8,ganador
	beq $t6,0,perdedor
	beq $s3, 0, ingreseLetra
	beq $s3, 1, ingreseLetra
	beq $s3, 2, ingreseEnter
ingreseLetra:
	ImprimirMensaje(msjIngLetra)
	j bucleContinuacion
ingreseEnter:
	ImprimirMensaje(msjEnter)
bucleContinuacion:
	addi $s3,$s3,1 #contador +1
	li $v0, 12
	syscall 	#leo el caracter
	add $s0,$v0,$zero	#lo guardo en $s0
	beq $s3,3,pintar
	bgt  $s0,80,volver
	blt  $s0,65,volver
	beq $s3,1,guardarUno
	beq $s3,2,guardarDos
continuar:
	beq $s0,'A',levantarA
	beq $s0,'B',levantarB
	beq $s0,'C',levantarC
	beq $s0,'D',levantarD
	beq $s0,'E',levantarE
	beq $s0,'F',levantarF
	beq $s0,'G',levantarG
	beq $s0,'H',levantarH
	beq $s0,'I',levantarI
	beq $s0,'J',levantarJ
	beq $s0,'K',levantarK
	beq $s0,'L',levantarL
	beq $s0,'M',levantarM
	beq $s0,'N',levantarN
	beq $s0,'O',levantarO
	beq $s0,'P',levantarP
	beq $s0,'0',fin
ninguna:
	j bucle
guardarUno:
	add $s4,$v0,$zero
	j continuar
guardarDos:
	add $s5,$v0,$zero
	j continuar
levantarA:
	pintarCuadradoA(PERU)
	dibujar_A()
	j bucle
acostarA:
	pintarCuadradoA(CLARO)
	pintarA()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarB:
	pintarCuadradoB(PERU)
	dibujar_B()
	j bucle
acostarB:
	pintarCuadradoB(CLARO)
	pintarB()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarC:
	pintarCuadradoC(PERU)
	dibujar_C()
	j bucle
acostarC:
	pintarCuadradoC(CLARO)
	pintarC()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarD:
	pintarCuadradoD(PERU)
	dibujar_D()
	j bucle
acostarD:
	pintarCuadradoD(CLARO)
	pintarD()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarE:
	pintarCuadradoE(ROJO)
	dibujar_E()
	j bucle
acostarE:
	pintarCuadradoE(CLARO)
	pintarE()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarF:
	pintarCuadradoF(PERU)
	dibujar_F()
	j bucle
acostarF:
	pintarCuadradoF(CLARO)
	pintarF()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarG:
	pintarCuadradoG(PERU)
	dibujar_G()
	j bucle
acostarG:
	pintarCuadradoG(CLARO)
	pintarG()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarH:
	pintarCuadradoH(ROJO)
	dibujar_H()
	j bucle
acostarH:
	pintarCuadradoH(CLARO)
	pintarH()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarI:
	pintarCuadradoI(PERU)
	dibujar_I()
	j bucle
acostarI:
	pintarCuadradoI(CLARO)
	pintarI()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarJ:
	pintarCuadradoJ(PERU)
	dibujar_J()
	j bucle
acostarJ:
	pintarCuadradoJ(CLARO)
	pintarJ()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarK:
	pintarCuadradoK(PERU)
	dibujar_K()
	j bucle
acostarK:
	pintarCuadradoK(CLARO)
	pintarK()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarL:
	pintarCuadradoL(PERU)
	dibujar_L()
	j bucle
acostarL:
	pintarCuadradoL(CLARO)
	pintarL()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarM:
	pintarCuadradoM(PERU)
	dibujar_M()
	j bucle
acostarM:
	pintarCuadradoM(CLARO)
	pintarM()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarN:
	pintarCuadradoN(PERU)
	dibujar_N()
	j bucle
acostarN:
	pintarCuadradoN(CLARO)
	pintarN()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarO:
	pintarCuadradoO(PERU)
	dibujar_O()
	j bucle
acostarO:
	pintarCuadradoO(CLARO)
	pintarO()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
levantarP:
	pintarCuadradoP(PERU)
	dibujar_P()
	j bucle
acostarP:
	pintarCuadradoP(CLARO)
	pintarP()
	la $s4,0($s5)
	add $s5,$zero,$zero
	j verificar
pintar:
	add $s3,$zero,$zero
	add $t6,$t6,1
verificar:	
	beq $s4,'A',verificarAP
	beq $s4,'P'verificarPA
	
	beq $s4,'C',verificarCD
	beq $s4,'D'verificarDC
	
	beq $s4,'B',verificarBM
	beq $s4,'M'verificarMB
	
	beq $s4,'E',verificarEH
	beq $s4,'H'verificarHE

	beq $s4,'F',verificarFK
	beq $s4,'K'verificarKF
	
	beq $s4,'G',verificarGN
	beq $s4,'N'verificarNG
	
	beq $s4,'I',verificarIL
	beq $s4,'L'verificarLI
	
	beq $s4,'J'verificarJO
	beq $s4,'O'verificarOJ
	
	j bucle
verificarAP:
	beq $s5'P', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarPA:
	beq $s5'A', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarCD:
	beq $s5'D', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarDC:
	beq $s5'C', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarBM:
	beq $s5'M', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarMB:
	beq $s5'B', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarEH:
	beq $s5'H', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarHE:
	beq $s5'E', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarFK:
	beq $s5'K', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarKF:
	beq $s5'F', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarGN:
	beq $s5'N', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarNG:
	beq $s5'G', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarIL:
	beq $s5'L', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarLI:
	beq $s5'I', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarOJ:
	beq $s5'J', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle
verificarJO:
	beq $s5'O', agregarArreglo
	addi $t6,$t6,-1
	ImprimirMensajeIntentos()
	acostarLetra($s4)
	j bucle

agregarArreglo:
	addi $t6,$t6,-1
	addi $t7,$t7,1
	ImprimirMensajeIntentos()
	j bucle
ganador:
	gano()
	j fin
perdedor:
	perdio()
	j fin
volver:
	add $s3,$zero,$zero
	ImprimirMensaje(invalido)
	j bucle
fin:
	ImprimirMensaje(adios)
	li $v0, 10		#Finalizar el programa
	syscall

	

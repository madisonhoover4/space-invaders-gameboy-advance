	.cpu arm7tdmi
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 2
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"main.c"
	.text
	.align	2
	.global	goToStart
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToStart, %function
goToStart:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #4864
	ldr	r4, .L4
	mov	r2, #100663296
	ldr	r1, .L4+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L4+8
	ldr	r1, .L4+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L4+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #0
	ldr	r1, .L4+20
	ldr	r2, .L4+24
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	DMANow
	.word	startScreenTiles
	.word	100720640
	.word	startScreenMap
	.word	startScreenPal
	.word	state
	.word	seed
	.size	goToStart, .-goToStart
	.align	2
	.global	initialize
	.syntax unified
	.arm
	.fpu softvfp
	.type	initialize, %function
initialize:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #7168
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	b	goToStart
	.size	initialize, .-initialize
	.align	2
	.global	goToGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToGame, %function
goToGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #9024
	ldr	r4, .L9
	mov	r2, #100663296
	ldr	r1, .L9+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L9+8
	ldr	r1, .L9+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #256
	mov	r2, #83886080
	ldr	r1, .L9+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #1
	ldr	r3, .L9+20
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L10:
	.align	2
.L9:
	.word	DMANow
	.word	gameBackTiles
	.word	100720640
	.word	gameBackMap
	.word	gameBackPal
	.word	state
	.size	goToGame, .-goToGame
	.align	2
	.global	start
	.syntax unified
	.arm
	.fpu softvfp
	.type	start, %function
start:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r4, .L18
	ldr	r3, [r4]
	ldr	r2, .L18+4
	add	r3, r3, #1
	str	r3, [r4]
	mov	lr, pc
	bx	r2
	ldr	r3, .L18+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L11
	ldr	r3, .L18+12
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L17
.L11:
	pop	{r4, lr}
	bx	lr
.L17:
	ldr	r0, [r4]
	ldr	r3, .L18+16
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L18+24
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToGame
.L19:
	.align	2
.L18:
	.word	seed
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.word	srand
	.word	initGame
	.word	hideSprites
	.size	start, .-start
	.align	2
	.global	goToPause
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToPause, %function
goToPause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L22
	ldr	r4, .L22+4
	mov	r2, #100663296
	ldr	r1, .L22+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L22+12
	ldr	r1, .L22+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L22+20
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L22+24
	mov	lr, pc
	bx	r3
	ldr	r3, .L22+28
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L22+32
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #2
	ldr	r3, .L22+36
	pop	{r4, lr}
	str	r2, [r3]
	bx	lr
.L23:
	.align	2
.L22:
	.word	9424
	.word	DMANow
	.word	pauseScreenTiles
	.word	100720640
	.word	pauseScreenMap
	.word	pauseScreenPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	state
	.size	goToPause, .-goToPause
	.align	2
	.global	pause
	.syntax unified
	.arm
	.fpu softvfp
	.type	pause, %function
pause:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L36
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L36+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L25
	ldr	r2, .L36+8
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L34
.L25:
	tst	r3, #4
	beq	.L24
	ldr	r3, .L36+8
	ldrh	r3, [r3]
	tst	r3, #4
	beq	.L35
.L24:
	pop	{r4, lr}
	bx	lr
.L35:
	pop	{r4, lr}
	b	goToStart
.L34:
	pop	{r4, lr}
	b	goToGame
.L37:
	.align	2
.L36:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	pause, .-pause
	.align	2
	.global	goToWin
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToWin, %function
goToWin:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #1856
	ldr	r4, .L40
	mov	r2, #100663296
	ldr	r1, .L40+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L40+8
	ldr	r1, .L40+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L40+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L40+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L40+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L40+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #25
	mov	r2, #3
	ldr	r1, .L40+32
	ldr	r3, .L40+36
	str	r0, [r1]
	str	r2, [r3]
	pop	{r4, lr}
	bx	lr
.L41:
	.align	2
.L40:
	.word	DMANow
	.word	winScreenTiles
	.word	100720640
	.word	winScreenMap
	.word	winScreenPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	enemiesRemaining
	.word	state
	.size	goToWin, .-goToWin
	.align	2
	.global	win
	.syntax unified
	.arm
	.fpu softvfp
	.type	win, %function
win:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L49
	push	{r4, lr}
	mov	lr, pc
	bx	r3
	ldr	r3, .L49+4
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L42
	ldr	r3, .L49+8
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L48
.L42:
	pop	{r4, lr}
	bx	lr
.L48:
	pop	{r4, lr}
	b	goToStart
.L50:
	.align	2
.L49:
	.word	waitForVBlank
	.word	oldButtons
	.word	buttons
	.size	win, .-win
	.align	2
	.global	goToLose
	.syntax unified
	.arm
	.fpu softvfp
	.type	goToLose, %function
goToLose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r3, #2048
	ldr	r4, .L53
	mov	r2, #100663296
	ldr	r1, .L53+4
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #1024
	ldr	r2, .L53+8
	ldr	r1, .L53+12
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r2, #83886080
	ldr	r1, .L53+16
	mov	r0, #3
	mov	r3, #256
	mov	lr, pc
	bx	r4
	ldr	r3, .L53+20
	mov	lr, pc
	bx	r3
	ldr	r3, .L53+24
	mov	lr, pc
	bx	r3
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L53+28
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r3, #4
	ldr	r1, .L53+32
	ldr	r2, .L53+36
	str	r3, [r1]
	str	r3, [r2]
	pop	{r4, lr}
	bx	lr
.L54:
	.align	2
.L53:
	.word	DMANow
	.word	gameOverTiles
	.word	100720640
	.word	gameOverMap
	.word	gameOverPal
	.word	hideSprites
	.word	waitForVBlank
	.word	shadowOAM
	.word	livesRemaining
	.word	state
	.size	goToLose, .-goToLose
	.align	2
	.global	game
	.syntax unified
	.arm
	.fpu softvfp
	.type	game, %function
game:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r3, .L71
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+4
	mov	lr, pc
	bx	r3
	ldr	r3, .L71+8
	mov	lr, pc
	bx	r3
	ldr	r4, .L71+12
	mov	r3, #512
	mov	r2, #117440512
	ldr	r1, .L71+16
	mov	r0, #3
	mov	lr, pc
	bx	r4
	ldr	r3, .L71+20
	ldrh	r3, [r3]
	tst	r3, #8
	beq	.L56
	ldr	r2, .L71+24
	ldrh	r2, [r2]
	tst	r2, #8
	beq	.L67
.L56:
	tst	r3, #2
	beq	.L57
	ldr	r3, .L71+24
	ldrh	r3, [r3]
	tst	r3, #2
	beq	.L68
.L57:
	ldr	r3, .L71+28
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L69
	ldr	r3, .L71+32
	ldr	r3, [r3]
	cmp	r3, #0
	beq	.L70
.L55:
	pop	{r4, lr}
	bx	lr
.L70:
	pop	{r4, lr}
	b	goToLose
.L69:
	bl	goToWin
	ldr	r3, .L71+32
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L55
	b	.L70
.L67:
	ldr	r3, .L71+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToPause
.L68:
	ldr	r3, .L71+36
	mov	lr, pc
	bx	r3
	pop	{r4, lr}
	b	goToLose
.L72:
	.align	2
.L71:
	.word	updateGame
	.word	drawGame
	.word	waitForVBlank
	.word	DMANow
	.word	shadowOAM
	.word	oldButtons
	.word	buttons
	.word	enemiesRemaining
	.word	livesRemaining
	.word	hideSprites
	.size	game, .-game
	.section	.text.startup,"ax",%progbits
	.align	2
	.global	main
	.syntax unified
	.arm
	.fpu softvfp
	.type	main, %function
main:
	@ Function supports interworking.
	@ Volatile: function does not return.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	mov	r3, #67108864
	mov	r1, #4352
	mov	r2, #7168
	push	{r4, r7, fp, lr}
	strh	r1, [r3]	@ movhi
	strh	r2, [r3, #8]	@ movhi
	ldr	r3, .L84
	mov	lr, pc
	bx	r3
	ldr	r6, .L84+4
	ldr	fp, .L84+8
	ldr	r5, .L84+12
	ldr	r10, .L84+16
	ldr	r9, .L84+20
	ldr	r8, .L84+24
	ldr	r7, .L84+28
	ldr	r4, .L84+32
.L74:
	ldr	r2, [r6]
	ldrh	r3, [fp]
.L75:
	strh	r3, [r5]	@ movhi
	ldrh	r3, [r4, #48]
	strh	r3, [fp]	@ movhi
	cmp	r2, #4
	ldrls	pc, [pc, r2, asl #2]
	b	.L75
.L77:
	.word	.L76
	.word	.L78
	.word	.L79
	.word	.L80
	.word	.L80
.L80:
	mov	lr, pc
	bx	r7
	b	.L74
.L79:
	mov	lr, pc
	bx	r8
	b	.L74
.L78:
	mov	lr, pc
	bx	r9
	b	.L74
.L76:
	mov	lr, pc
	bx	r10
	b	.L74
.L85:
	.align	2
.L84:
	.word	goToStart
	.word	state
	.word	buttons
	.word	oldButtons
	.word	start
	.word	game
	.word	pause
	.word	win
	.word	67109120
	.size	main, .-main
	.text
	.align	2
	.global	lose
	.syntax unified
	.arm
	.fpu softvfp
	.type	lose, %function
lose:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	b	win
	.size	lose, .-lose
	.comm	shadowOAM,1024,4
	.comm	seed,4,4
	.comm	areEnemiesAllDead,4,4
	.comm	oldButtons,2,2
	.comm	buttons,2,2
	.comm	state,4,4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

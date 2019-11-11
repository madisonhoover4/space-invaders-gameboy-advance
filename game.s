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
	.file	"game.c"
	.text
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy.part.0, %function
drawEnemy.part.0:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	ldr	r2, [r0, #48]
	ldr	r4, [r0, #36]
	ldr	r3, [r0, #28]
	ldr	r1, [r0, #4]
	ldr	ip, .L4
	ldr	lr, [r0]
	lsl	r2, r2, #3
	add	r3, r3, r4, lsl #5
	add	r0, ip, r2
	orr	r1, r1, #16384
	lsl	r3, r3, #1
	strh	lr, [ip, r2]	@ movhi
	strh	r1, [r0, #2]	@ movhi
	strh	r3, [r0, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L5:
	.align	2
.L4:
	.word	shadowOAM
	.size	drawEnemy.part.0, .-drawEnemy.part.0
	.set	drawBullet.part.3,drawEnemy.part.0
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy.part.1, %function
updateEnemy.part.1:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #24]
	ldr	r3, .L15
	push	{r4, r5, lr}
	smull	r4, r5, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r5, asr #3
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #2
	sub	sp, sp, #20
	bne	.L7
	ldr	r3, [r0, #36]
	cmp	r3, #2
	moveq	r3, #3
	streq	r3, [r0, #36]
	beq	.L7
	cmp	r3, #3
	moveq	r3, #4
	streq	r3, [r0, #36]
	beq	.L7
	cmp	r3, #4
	moveq	r3, #2
	streq	r3, [r0, #36]
.L7:
	ldr	r1, .L15+4
	add	r4, r1, #16
	ldm	r4, {r4, r5}
	add	r2, r2, #1
	ldr	r3, [r0, #20]
	str	r2, [r0, #24]
	ldr	lr, [r1]
	ldr	ip, [r1, #4]
	str	r5, [sp, #12]
	ldr	r2, [r0, #16]
	str	r4, [sp, #8]
	ldr	r4, .L15+8
	ldr	r1, [r0]
	ldr	r0, [r0, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r4
	cmp	r0, #0
	movne	r2, #0
	ldrne	r3, .L15+12
	strne	r2, [r3]
	add	sp, sp, #20
	@ sp needed
	pop	{r4, r5, lr}
	bx	lr
.L16:
	.align	2
.L15:
	.word	1717986919
	.word	player
	.word	collision
	.word	.LANCHOR0
	.size	updateEnemy.part.1, .-updateEnemy.part.1
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyPos.part.2, %function
updateEnemyPos.part.2:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, .L26
	ldr	r2, .L26+4
	add	r1, r3, #1392
	ldr	ip, [r2]
	add	r1, r1, #8
.L20:
	ldr	r2, [r3, #44]
	cmp	r2, #0
	beq	.L18
	ldr	r2, [r3, #4]
	cmp	ip, #0
	sub	r0, r2, #1
	addeq	r2, r2, #1
	strne	r0, [r3, #4]
	streq	r2, [r3, #4]
.L18:
	add	r3, r3, #56
	cmp	r3, r1
	bne	.L20
	bx	lr
.L27:
	.align	2
.L26:
	.word	enemies
	.word	.LANCHOR1
	.size	updateEnemyPos.part.2, .-updateEnemyPos.part.2
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets.part.4, %function
updateBullets.part.4:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #8]
	ldr	r3, [r0]
	add	r3, r3, r2
	cmp	r3, #0
	movle	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L47
	add	r6, r4, #1392
	str	r3, [r0]
	sub	sp, sp, #16
	mov	r5, r0
	ldrgt	r3, [r0, #44]
	movle	r3, r2
	strle	r2, [r0, #44]
	ldr	r8, .L47+4
	ldr	r7, .L47+8
	ldr	r9, .L47+12
	add	r6, r6, #8
	b	.L35
.L32:
	add	r4, r4, #56
	cmp	r4, r6
	beq	.L28
.L46:
	ldr	r3, [r5, #44]
.L35:
	cmp	r3, #0
	beq	.L32
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L32
	add	r10, r4, #16
	ldm	r10, {r10, ip}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	ldr	lr, [r4]
	str	ip, [sp, #12]
	ldr	ip, [r4, #4]
	str	r10, [sp, #8]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r8
	cmp	r0, #0
	beq	.L32
	mov	r2, #0
	str	r2, [r5, #44]
	ldr	r1, [r4, #52]
	ldr	r3, [r7, #4]
	cmp	r1, r2
	str	r2, [r4, #44]
	add	r4, r4, #56
	sub	r3, r3, #1
	strne	r2, [r9, #44]
	cmp	r4, r6
	str	r3, [r7, #4]
	bne	.L46
.L28:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L48:
	.align	2
.L47:
	.word	enemies
	.word	collision
	.word	.LANCHOR0
	.word	enemyBullets
	.size	updateBullets.part.4, .-updateBullets.part.4
	.align	2
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullets.part.5, %function
updateEnemyBullets.part.5:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #8]
	ldr	r3, [r0]
	add	r3, r3, r2
	cmp	r3, #159
	movgt	r2, #0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r4, .L62
	str	r3, [r0]
	sub	sp, sp, #16
	mov	r5, r0
	mov	r10, r1
	ldrle	r3, [r0, #44]
	movgt	r3, r2
	strgt	r2, [r0, #44]
	ldr	r6, .L62+4
	ldr	r9, .L62+8
	ldr	r8, .L62+12
	add	r7, r4, #1120
	b	.L56
.L53:
	add	r4, r4, #56
	cmp	r4, r7
	beq	.L49
.L61:
	ldr	r3, [r5, #44]
.L56:
	cmp	r3, #0
	beq	.L53
	add	ip, r6, #16
	ldm	ip, {ip, lr}
	add	r2, r5, #16
	ldm	r2, {r2, r3}
	ldr	r1, [r5]
	ldr	r0, [r5, #4]
	str	lr, [sp, #12]
	str	ip, [sp, #8]
	ldr	lr, [r6]
	ldr	ip, [r6, #4]
	stm	sp, {ip, lr}
	mov	lr, pc
	bx	r9
	cmp	r0, #0
	beq	.L53
	mov	r3, #0
	str	r3, [r4, #40]
	str	r3, [r4]
	ldr	r3, [r8]
	ldr	r2, [r10, #36]
	add	r4, r4, #56
	sub	r3, r3, #1
	add	r2, r2, #1
	cmp	r4, r7
	str	r2, [r10, #36]
	str	r3, [r8]
	bne	.L61
.L49:
	add	sp, sp, #16
	@ sp needed
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L63:
	.align	2
.L62:
	.word	enemyBullets+4
	.word	player
	.word	collision
	.word	.LANCHOR0
	.size	updateEnemyBullets.part.5, .-updateEnemyBullets.part.5
	.align	2
	.global	drawGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawGame, %function
drawGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, lr}
	ldr	r4, .L81
	add	r6, r4, #1392
	mov	r7, #512
	ldr	r5, .L81+4
	add	r6, r6, #8
	b	.L67
.L65:
	ldr	r3, [r4, #48]
	add	r4, r4, #56
	lsl	r3, r3, #3
	cmp	r6, r4
	strh	r7, [r5, r3]	@ movhi
	beq	.L78
.L67:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L65
	mov	r0, r4
	add	r4, r4, #56
	bl	drawEnemy.part.0
	cmp	r6, r4
	bne	.L67
.L78:
	ldr	r4, .L81+8
	mov	r7, #512
	add	r6, r4, #1120
	b	.L70
.L68:
	ldr	r3, [r4, #48]
	add	r4, r4, #56
	lsl	r3, r3, #3
	cmp	r6, r4
	strh	r7, [r5, r3]	@ movhi
	beq	.L79
.L70:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L68
	mov	r0, r4
	add	r4, r4, #56
	bl	drawBullet.part.3
	cmp	r6, r4
	bne	.L70
.L79:
	ldr	r4, .L81+12
	mov	r7, #512
	add	r6, r4, #1120
	b	.L73
.L71:
	ldr	r3, [r4, #48]
	add	r4, r4, #56
	lsl	r3, r3, #3
	cmp	r6, r4
	strh	r7, [r5, r3]	@ movhi
	beq	.L80
.L73:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L71
	mov	r0, r4
	add	r4, r4, #56
	bl	drawBullet.part.3
	cmp	r6, r4
	bne	.L73
.L80:
	ldr	r3, .L81+16
	ldr	r0, [r3, #4]
	mvn	r0, r0, lsl #17
	mvn	r0, r0, lsr #17
	ldr	r4, [r3, #36]
	ldr	r1, [r3, #28]
	ldr	ip, .L81+20
	ldr	r2, [r3, #48]
	ldr	lr, [r3]
	add	r1, r1, r4, lsl #4
	ldr	r3, [ip, #28]
	ldr	r4, [ip, #36]
	lsl	r2, r2, #3
	orr	lr, lr, #16384
	strh	lr, [r5, r2]	@ movhi
	add	r3, r3, r4, lsl #5
	ldm	ip, {r4, lr}
	add	r2, r5, r2
	orr	ip, lr, #16384
	lsl	r1, r1, #2
	lsl	r3, r3, #1
	strh	r0, [r2, #2]	@ movhi
	strh	r1, [r2, #4]	@ movhi
	strh	r3, [r5, #4]	@ movhi
	strh	ip, [r5, #2]	@ movhi
	strh	r4, [r5]	@ movhi
	pop	{r4, r5, r6, r7, r8, lr}
	bx	lr
.L82:
	.align	2
.L81:
	.word	enemies
	.word	shadowOAM
	.word	bullets
	.word	enemyBullets
	.word	healthBar
	.word	player
	.size	drawGame, .-drawGame
	.align	2
	.global	initPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	initPlayer, %function
initPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #0
	mov	r4, #135
	mov	lr, #112
	mov	r0, #16
	mov	r1, #1
	mov	ip, #2
	ldr	r3, .L85
	stm	r3, {r4, lr}
	str	ip, [r3, #12]
	str	r2, [r3, #8]
	str	r2, [r3, #28]
	str	r2, [r3, #36]
	str	r0, [r3, #16]
	str	r0, [r3, #20]
	str	r1, [r3, #44]
	str	r1, [r3, #40]
	pop	{r4, lr}
	bx	lr
.L86:
	.align	2
.L85:
	.word	player
	.size	initPlayer, .-initPlayer
	.align	2
	.global	drawPlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawPlayer, %function
drawPlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L88
	ldr	r1, [r2, #36]
	ldr	r3, [r2, #28]
	ldr	r0, [r2, #4]
	ldr	ip, [r2]
	add	r3, r3, r1, lsl #5
	ldr	r1, .L88+4
	lsl	r3, r3, #1
	orr	r2, r0, #16384
	strh	r3, [r1, #4]	@ movhi
	strh	ip, [r1]	@ movhi
	strh	r2, [r1, #2]	@ movhi
	bx	lr
.L89:
	.align	2
.L88:
	.word	player
	.word	shadowOAM
	.size	drawPlayer, .-drawPlayer
	.align	2
	.global	updatePlayer
	.syntax unified
	.arm
	.fpu softvfp
	.type	updatePlayer, %function
updatePlayer:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r3, .L103
	ldrh	r3, [r3, #48]
	tst	r3, #32
	ldreq	r3, [r0, #4]
	ldreq	r2, [r0, #12]
	subeq	r3, r3, r2
	streq	r3, [r0, #4]
	ldr	r3, .L103
	ldrh	r3, [r3, #48]
	tst	r3, #16
	ldreq	r3, [r0, #4]
	ldreq	r2, [r0, #12]
	addeq	r3, r3, r2
	streq	r3, [r0, #4]
	ldr	r3, .L103+4
	ldrh	r3, [r3]
	tst	r3, #1
	str	lr, [sp, #-4]!
	beq	.L93
	ldr	r3, .L103+8
	ldrh	r3, [r3]
	ands	r3, r3, #1
	bne	.L93
	ldr	ip, .L103+12
	mov	r2, ip
	b	.L95
.L94:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	beq	.L93
.L95:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	bne	.L94
	mov	r1, #1
	ldr	r2, .L103+16
	rsb	r3, r3, r3, lsl #3
	ldr	lr, [r2]
	lsl	r3, r3, #3
	ldr	r2, [r2, #4]
	str	lr, [ip, r3]
	add	r3, ip, r3
	str	r2, [r3, #4]
	str	r1, [r3, #44]
.L93:
	ldr	r3, [r0, #4]
	ldr	r2, [r0, #16]
	add	r1, r3, r2
	cmp	r1, #239
	rsbgt	r3, r2, #239
	strgt	r3, [r0, #4]
	cmp	r3, #0
	movlt	r3, #0
	ldr	lr, [sp], #4
	strlt	r3, [r0, #4]
	bx	lr
.L104:
	.align	2
.L103:
	.word	67109120
	.word	oldButtons
	.word	buttons
	.word	bullets
	.word	player
	.size	updatePlayer, .-updatePlayer
	.align	2
	.global	updateGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateGame, %function
updateGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	ldr	r5, .L151
	ldr	r0, .L151+4
	add	r7, r5, #1392
	mov	r6, r5
	mov	r4, r5
	bl	updatePlayer
	add	r7, r7, #8
	b	.L107
.L106:
	add	r4, r4, #56
	cmp	r4, r7
	beq	.L144
.L107:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L106
	mov	r0, r4
	add	r4, r4, #56
	bl	updateEnemy.part.1
	cmp	r4, r7
	bne	.L107
.L144:
	ldr	r3, .L151
	b	.L113
.L108:
	cmp	r2, #8
	beq	.L145
	cmp	r3, r4
	beq	.L146
.L113:
	ldr	r2, [r3, #4]
	cmp	r2, #222
	add	r3, r3, #56
	bne	.L108
	mov	r3, #1
	ldr	r7, .L151+8
	str	r3, [r7]
	ldr	r3, .L151+12
.L109:
	ldr	r2, [r3, #-4]
	add	r2, r2, #2
	str	r2, [r3, #-4]
	ldr	r2, [r5, #4]
	sub	r2, r2, #1
	str	r2, [r5, #4]
	add	r5, r5, #56
	cmp	r5, r4
	add	r3, r3, #56
	bne	.L109
.L110:
	ldr	r2, [r7, #4]
	ldr	r3, .L151+16
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	beq	.L147
.L114:
	ldr	r4, .L151+20
	add	r5, r4, #1120
	b	.L116
.L115:
	add	r4, r4, #56
	cmp	r4, r5
	beq	.L148
.L116:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L115
	mov	r0, r4
	add	r4, r4, #56
	bl	updateBullets.part.4
	cmp	r4, r5
	bne	.L116
.L148:
	ldr	r9, .L151+24
	ldr	r8, .L151+28
	mov	r10, r9
	mov	r4, r9
	add	r5, r9, #1120
	b	.L118
.L117:
	add	r4, r4, #56
	cmp	r5, r4
	beq	.L149
.L118:
	ldr	r3, [r4, #44]
	cmp	r3, #0
	beq	.L117
	mov	r0, r4
	mov	r1, r8
	add	r4, r4, #56
	bl	updateEnemyBullets.part.5
	cmp	r5, r4
	bne	.L118
.L149:
	ldr	r3, [r7, #4]
	add	r3, r3, #1
	cmp	r3, #100
	strne	r3, [r7, #4]
	beq	.L150
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L145:
	mov	r3, #0
	ldr	r7, .L151+8
	str	r3, [r7]
	ldr	r3, .L151+12
.L112:
	ldr	r2, [r3, #-4]
	add	r2, r2, #2
	str	r2, [r3, #-4]
	ldr	r2, [r5, #4]
	add	r2, r2, #1
	str	r2, [r5, #4]
	add	r5, r5, #56
	cmp	r5, r4
	add	r3, r3, #56
	bne	.L112
	b	.L110
.L147:
	bl	updateEnemyPos.part.2
	b	.L114
.L146:
	ldr	r7, .L151+8
	b	.L110
.L150:
	mov	r4, #0
	ldr	r3, .L151+32
	str	r4, [r7, #4]
	mov	lr, pc
	bx	r3
	ldr	r1, .L151+36
	smull	r7, r8, r0, r1
	asr	r2, r0, #31
	rsb	r2, r2, r8, asr #3
	add	r2, r2, r2, lsl #2
	add	r2, r2, r2, lsl #2
	sub	r2, r0, r2
	rsb	r3, r2, r2, lsl #3
	add	r3, r6, r3, lsl #3
	ldr	r3, [r3, #44]
	cmp	r3, r4
	beq	.L121
	mov	r3, r4
	b	.L123
.L122:
	add	r3, r3, #1
	cmp	r3, #20
	add	r9, r9, #56
	beq	.L121
.L123:
	ldr	r1, [r9, #44]
	cmp	r1, #0
	bne	.L122
	mov	r1, #1
	sub	r2, r2, #1
	rsb	r2, r2, r2, lsl #3
	lsl	r2, r2, #3
	ldr	r0, [r6, r2]
	rsb	r3, r3, r3, lsl #3
	add	r2, r6, r2
	lsl	r3, r3, #3
	ldr	r2, [r2, #4]
	str	r0, [r10, r3]
	add	r3, r10, r3
	str	r2, [r3, #4]
	str	r1, [r3, #44]
.L121:
	mov	r3, #1
	str	r3, [r6, #52]
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L152:
	.align	2
.L151:
	.word	enemies
	.word	player
	.word	.LANCHOR1
	.word	enemies+4
	.word	1717986919
	.word	bullets
	.word	enemyBullets
	.word	healthBar
	.word	rand
	.word	1374389535
	.size	updateGame, .-updateGame
	.align	2
	.global	initEnemies
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemies, %function
initEnemies:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, r7, r8, r9, r10, lr}
	mov	r5, #0
	mov	r4, #40
	mov	r6, r5
	mov	r7, #101
	mov	lr, #2
	mov	r0, #1
	mov	ip, #16
	ldr	r8, .L159
	ldr	r9, .L159+4
.L154:
	smull	r2, r3, r5, r9
	mov	r1, r7
	sub	r10, r3, r5, asr #31
	mov	r2, #10
	mov	r3, r8
	add	r10, r10, r10, lsl #1
	sub	r10, r5, r10
.L155:
	str	r2, [r3]
	add	r2, r2, #20
	cmp	r2, #110
	str	r1, [r3, #48]
	stmib	r3, {r4, lr}
	str	r0, [r3, #12]
	str	ip, [r3, #16]
	str	ip, [r3, #20]
	str	r0, [r3, #28]
	str	r10, [r3, #36]
	str	r0, [r3, #44]
	str	lr, [r3, #40]
	str	r6, [r3, #52]
	add	r1, r1, #1
	add	r3, r3, #56
	bne	.L155
	add	r7, r7, #5
	cmp	r7, #126
	add	r5, r5, #1
	add	r8, r8, #280
	add	r4, r4, #35
	bne	.L154
	pop	{r4, r5, r6, r7, r8, r9, r10, lr}
	bx	lr
.L160:
	.align	2
.L159:
	.word	enemies
	.word	1431655766
	.size	initEnemies, .-initEnemies
	.align	2
	.global	initGame
	.syntax unified
	.arm
	.fpu softvfp
	.type	initGame, %function
initGame:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	ldr	r2, .L167
	ldr	r4, .L167+4
	mov	r3, #256
	ldr	r1, .L167+8
	mov	r0, #3
	mov	lr, pc
	bx	r4
	mov	r0, #3
	mov	r3, #16384
	ldr	r2, .L167+12
	ldr	r1, .L167+16
	mov	lr, pc
	bx	r4
	mov	r7, #16
	mov	r4, #0
	mov	r1, #135
	mov	r2, #112
	mov	r5, #1
	mov	r8, #2
	ldr	r3, .L167+20
	stm	r3, {r1, r2, r4}
	str	r4, [r3, #28]
	str	r4, [r3, #36]
	str	r8, [r3, #12]
	str	r7, [r3, #16]
	str	r7, [r3, #20]
	str	r5, [r3, #44]
	str	r5, [r3, #40]
	bl	initEnemies
	mov	r2, r4
	mov	r1, #21
	mvn	ip, #1
	ldr	r3, .L167+24
	add	r0, r3, #1120
.L162:
	str	r1, [r3, #48]
	str	r7, [r3, #20]
	str	r7, [r3, #16]
	str	ip, [r3, #8]
	str	r2, [r3, #12]
	str	r8, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	r5, [r3, #40]
	add	r3, r3, #56
	cmp	r3, r0
	add	r1, r1, #1
	bne	.L162
	mov	r3, #32
	mov	fp, #5
	mov	r10, #205
	mov	r9, #100
	mov	r1, #41
	mov	r4, #16
	mov	lr, #2
	mov	ip, #0
	mov	r0, #1
	ldr	r6, .L167+28
	str	r3, [r6, #16]
	ldr	r3, .L167+32
	str	fp, [r6]
	str	r7, [r6, #20]
	str	r8, [r6, #28]
	str	r5, [r6, #44]
	str	r10, [r6, #4]
	str	r9, [r6, #48]
	str	r2, [r6, #36]
	add	r2, r3, #1120
.L163:
	str	r1, [r3, #48]
	str	r4, [r3, #20]
	str	r4, [r3, #16]
	str	lr, [r3, #8]
	str	ip, [r3, #12]
	str	lr, [r3, #28]
	str	r0, [r3, #36]
	str	ip, [r3, #44]
	str	r0, [r3, #40]
	add	r3, r3, #56
	cmp	r3, r2
	add	r1, r1, #1
	bne	.L163
	pop	{r3, r4, r5, r6, r7, r8, r9, r10, fp, lr}
	bx	lr
.L168:
	.align	2
.L167:
	.word	83886592
	.word	DMANow
	.word	spriteSheetPal
	.word	100728832
	.word	spriteSheetTiles
	.word	player
	.word	bullets
	.word	healthBar
	.word	enemyBullets
	.size	initGame, .-initGame
	.align	2
	.global	drawEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawEnemy, %function
drawEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bne	.L171
	mov	r1, #512
	ldr	r3, [r0, #48]
	ldr	r2, .L172
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L171:
	b	drawEnemy.part.0
.L173:
	.align	2
.L172:
	.word	shadowOAM
	.size	drawEnemy, .-drawEnemy
	.align	2
	.global	updateEnemy
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemy, %function
updateEnemy:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemy.part.1
	.size	updateEnemy, .-updateEnemy
	.align	2
	.global	updateEnemyPos
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyPos, %function
updateEnemyPos:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, .L178
	ldr	r3, .L178+4
	ldr	r2, [r2, #4]
	smull	r0, r1, r2, r3
	asr	r3, r2, #31
	rsb	r3, r3, r1, asr #2
	add	r3, r3, r3, lsl #2
	cmp	r2, r3, lsl #1
	bxne	lr
	b	updateEnemyPos.part.2
.L179:
	.align	2
.L178:
	.word	.LANCHOR1
	.word	1717986919
	.size	updateEnemyPos, .-updateEnemyPos
	.align	2
	.global	initBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initBullets, %function
initBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, lr}
	mov	r1, #21
	mov	r0, #16
	mvn	r5, #1
	mov	r2, #0
	mov	r4, #2
	mov	lr, #1
	ldr	r3, .L184
	add	ip, r3, #1120
.L181:
	str	r1, [r3, #48]
	str	r0, [r3, #20]
	str	r0, [r3, #16]
	str	r5, [r3, #8]
	str	r2, [r3, #12]
	str	r4, [r3, #28]
	str	r2, [r3, #36]
	str	r2, [r3, #44]
	str	lr, [r3, #40]
	add	r3, r3, #56
	cmp	r3, ip
	add	r1, r1, #1
	bne	.L181
	pop	{r4, r5, lr}
	bx	lr
.L185:
	.align	2
.L184:
	.word	bullets
	.size	initBullets, .-initBullets
	.align	2
	.global	initEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	initEnemyBullets, %function
initEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, lr}
	mov	r2, #41
	mov	lr, #16
	mov	ip, #2
	mov	r0, #0
	mov	r1, #1
	ldr	r3, .L190
	add	r4, r3, #1120
.L187:
	str	r2, [r3, #48]
	str	lr, [r3, #20]
	str	lr, [r3, #16]
	str	ip, [r3, #8]
	str	r0, [r3, #12]
	str	ip, [r3, #28]
	str	r1, [r3, #36]
	str	r0, [r3, #44]
	str	r1, [r3, #40]
	add	r3, r3, #56
	cmp	r3, r4
	add	r2, r2, #1
	bne	.L187
	pop	{r4, lr}
	bx	lr
.L191:
	.align	2
.L190:
	.word	enemyBullets
	.size	initEnemyBullets, .-initEnemyBullets
	.align	2
	.global	drawBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawBullet, %function
drawBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r2, [r0, #44]
	cmp	r2, #0
	bne	.L194
	mov	r1, #512
	ldr	r3, [r0, #48]
	ldr	r2, .L195
	lsl	r3, r3, #3
	strh	r1, [r2, r3]	@ movhi
	bx	lr
.L194:
	b	drawBullet.part.3
.L196:
	.align	2
.L195:
	.word	shadowOAM
	.size	drawBullet, .-drawBullet
	.align	2
	.global	fireBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireBullet, %function
fireBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r0, .L207
	mov	r3, #0
	mov	r2, r0
	b	.L200
.L198:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	bxeq	lr
.L200:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	bne	.L198
	mov	r1, #1
	ldr	r2, .L207+4
	rsb	r3, r3, r3, lsl #3
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldr	lr, [r2]
	ldr	ip, [r2, #4]
	add	r2, r0, r3
	str	lr, [r0, r3]
	str	ip, [r2, #4]
	str	r1, [r2, #44]
	ldr	lr, [sp], #4
	bx	lr
.L208:
	.align	2
.L207:
	.word	bullets
	.word	player
	.size	fireBullet, .-fireBullet
	.align	2
	.global	fireEnemyBullet
	.syntax unified
	.arm
	.fpu softvfp
	.type	fireEnemyBullet, %function
fireEnemyBullet:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	ip, .L219
	mov	r3, #0
	mov	r2, ip
	b	.L212
.L210:
	add	r3, r3, #1
	cmp	r3, #20
	add	r2, r2, #56
	bxeq	lr
.L212:
	ldr	r1, [r2, #44]
	cmp	r1, #0
	bne	.L210
	mov	r1, #1
	rsb	r3, r3, r3, lsl #3
	str	lr, [sp, #-4]!
	lsl	r3, r3, #3
	ldm	r0, {r0, lr}
	add	r2, ip, r3
	str	lr, [r2, #4]
	str	r0, [ip, r3]
	str	r1, [r2, #44]
	ldr	lr, [sp], #4
	bx	lr
.L220:
	.align	2
.L219:
	.word	enemyBullets
	.size	fireEnemyBullet, .-fireEnemyBullet
	.align	2
	.global	updateBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateBullets, %function
updateBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	b	updateBullets.part.4
	.size	updateBullets, .-updateBullets
	.align	2
	.global	updateEnemyBullets
	.syntax unified
	.arm
	.fpu softvfp
	.type	updateEnemyBullets, %function
updateEnemyBullets:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	@ link register save eliminated.
	ldr	r3, [r0, #44]
	cmp	r3, #0
	bxeq	lr
	b	updateEnemyBullets.part.5
	.size	updateEnemyBullets, .-updateEnemyBullets
	.align	2
	.global	initHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	initHealth, %function
initHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	push	{r4, r5, r6, lr}
	mov	ip, #2
	mov	r6, #5
	mov	r5, #205
	mov	r4, #32
	mov	lr, #16
	mov	r0, #0
	mov	r1, #1
	mov	r2, #100
	ldr	r3, .L227
	str	r6, [r3]
	str	r5, [r3, #4]
	str	r4, [r3, #16]
	str	lr, [r3, #20]
	str	ip, [r3, #28]
	str	r0, [r3, #36]
	str	r1, [r3, #44]
	str	r2, [r3, #48]
	pop	{r4, r5, r6, lr}
	bx	lr
.L228:
	.align	2
.L227:
	.word	healthBar
	.size	initHealth, .-initHealth
	.align	2
	.global	drawHealth
	.syntax unified
	.arm
	.fpu softvfp
	.type	drawHealth, %function
drawHealth:
	@ Function supports interworking.
	@ args = 0, pretend = 0, frame = 0
	@ frame_needed = 0, uses_anonymous_args = 0
	ldr	r2, [r0, #4]
	mvn	r2, r2, lsl #17
	mvn	r2, r2, lsr #17
	push	{r4, lr}
	ldr	r1, [r0, #48]
	ldr	r4, [r0, #36]
	ldr	r3, [r0, #28]
	ldr	ip, [r0]
	ldr	lr, .L231
	lsl	r1, r1, #3
	add	r3, r3, r4, lsl #4
	orr	r0, ip, #16384
	lsl	r3, r3, #2
	add	ip, lr, r1
	strh	r0, [lr, r1]	@ movhi
	strh	r2, [ip, #2]	@ movhi
	strh	r3, [ip, #4]	@ movhi
	pop	{r4, lr}
	bx	lr
.L232:
	.align	2
.L231:
	.word	shadowOAM
	.size	drawHealth, .-drawHealth
	.global	enemiesRemaining
	.global	livesRemaining
	.global	movingLeft
	.global	frameCount
	.comm	healthBar,56,4
	.comm	enemyBullets,1120,4
	.comm	bullets,1120,4
	.comm	enemies,1400,4
	.comm	player,56,4
	.data
	.align	2
	.set	.LANCHOR0,. + 0
	.type	livesRemaining, %object
	.size	livesRemaining, 4
livesRemaining:
	.word	4
	.type	enemiesRemaining, %object
	.size	enemiesRemaining, 4
enemiesRemaining:
	.word	25
	.bss
	.align	2
	.set	.LANCHOR1,. + 0
	.type	movingLeft, %object
	.size	movingLeft, 4
movingLeft:
	.space	4
	.type	frameCount, %object
	.size	frameCount, 4
frameCount:
	.space	4
	.ident	"GCC: (devkitARM release 47) 7.1.0"

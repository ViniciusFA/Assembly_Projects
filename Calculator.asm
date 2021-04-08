#PROJETO DE UMA CALCULADORA

.data
	menu: .asciiz "***** MENU ***** \n1 - Somar\n2 - Subtrair\n3 - Multiplicar\n4 - Dividir\n0 - Sair\n\nOp��o:"
	n1:   .asciiz "Digite o primeiro n�mero: "
	n2:   .asciiz "Digite o segundo n�mero: "
	r:    .asciiz "Resultado: "
	pula: .asciiz "\n\n"
	fim:  .asciiz "\n Fim do programa....\n"

.macro pula_linha     # Macro para pular duas linhas
	li $v0, 4     # Imprime uma string
	la $a0, pula  # Carrega a string de pula
	syscall       # Executa a instru��o
.end_macro

.macro menu
	li $v0, 4     # Imprime uma string
	la $a0, menu  # Carrega menu na tela
	syscall       # Executa a instru��o
	
	li $v0, 5     # Prepare para ler um n�mero inteiro
	syscall       # Executa a instru��o	
	move $t0, $v0 # Salva o n�mero digitado em $t0
.end_macro

.text                 # Diretiva de dados
.globl principal      # Diretiva global

principal:
	
	menu  # Chama a macro menu
	# Condi��es
	beq $t0, 1, somar        # Se $ts- tover o valor 1 cai no  bloco somar
	beq $t0, 2, subtrair     # Se $ts- tover o valor 2 cai no  bloco subtrair
	beq $t0, 3, multiplicar  # Se $ts- tover o valor 3 cai no  bloco multiplicar
	beq $t0, 4, dividir      # Se $ts- tover o valor 4 cai no  bloco di
	beq $t0, 0, sair         # Se $ts- tover o valor 0 cai no  bloco sair

somar:                # Bloco somar
	# Pede o prmeiro n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n1    # Carrega n1 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t1, $v0 # Salva o n�mero digitado em $t1
	
	# Pede o segundo n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n2    # Carrega n2 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t2, $v0 # Salva o n�mero digitado em $t2
	
	# Soma
	add $t3, $t1, $t2 # SOMA: $t3 = $t1 + $t2
	
	# Mostra o resultado na tela  
	li $v0, 4     # Imprime uma string
	la $a0, r     # Carrega r no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 1     # Imprime uma n�mero inteiro
	la $a0, ($t3) # Carrega o inteiro de $t3 em $a0
	syscall       # Executa a instru��o
	
	pula_linha    # Executa o macro pula_linha
	j principal   # Executa o bloco principal
	
subtrair:     # Bloco subtrair
	# Pede o prmeiro n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n1    # Carrega n1 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t1, $v0 # Salva o n�mero digitado em $t1
	
	# Pede o segundo n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n2    # Carrega n2 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t2, $v0 # Salva o n�mero digitado em $t2
	
	# Subtrai
	sub $t3, $t1, $t2 # Subtrair: $t3 = $t1 - $t2
	
	# Mostra o resultado na tela  
	li $v0, 4     # Imprime uma string
	la $a0, r     # Carrega r no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 1     # Imprime uma n�mero inteiro
	la $a0, ($t3) # Carrega o inteiro de $t3 em $a0
	syscall       # Executa a instru��o
	
	pula_linha    # Executa o macro pula_linha
	j principal   # Executa o bloco principal
	
	
multiplicar:  # Bloco multiplicar
	# Pede o prmeiro n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n1    # Carrega n1 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t1, $v0 # Salva o n�mero digitado em $t1
	
	# Pede o segundo n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n2    # Carrega n2 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t2, $v0 # Salva o n�mero digitado em $t2
	
	# multiplica
	mul $t3, $t1, $t2 # Multiplica: $t3 = $t1 * $t2
	
	# Mostra o resultado na tela  
	li $v0, 4     # Imprime uma string
	la $a0, r     # Carrega r no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 1     # Imprime uma n�mero inteiro
	la $a0, ($t3) # Carrega o inteiro de $t3 em $a0
	syscall       # Executa a instru��o
	
	pula_linha    # Executa o macro pula_linha
	j principal   # Executa o bloco principal
	
dividir: # Bloco dividir
	# Pede o prmeiro n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n1    # Carrega n1 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t1, $v0 # Salva o n�mero digitado em $t1
	
	# Pede o segundo n�mero
	li $v0, 4     # Imprime uma string
	la $a0, n2    # Carrega n2 no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 5     # L� um n�mero inteiro
	syscall       # Executa a instru��o
	
	move $t2, $v0 # Salva o n�mero digitado em $t2
	
	# dividi
	div $t3, $t1, $t2 # Divide: $t3 = $t1 / $t2
	
	# Mostra o resultado na tela  
	li $v0, 4     # Imprime uma string
	la $a0, r     # Carrega r no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 1     # Imprime uma n�mero inteiro
	la $a0, ($t3) # Carrega o inteiro de $t3 em $a0
	syscall       # Executa a instru��o
	
	pula_linha    # Executa o macro pula_linha
	j principal   # Executa o bloco principal
	
sair:   # Bloco sair
	
	li $v0, 4     # Imprime uma string
	la $a0, fim   # Carrega fim no registrador $a0
	syscall       # Executa a instru��o
	
	li $v0, 10    # Finalizar programa
	syscall       # Executa a instru��o
	
	
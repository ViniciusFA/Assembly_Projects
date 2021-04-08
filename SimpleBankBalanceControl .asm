# Projeto para gerenciar dep�sitos e saques

.data 		         # Diretiva de dados
	sal:	 .asciiz  "Informe o Saldo Inicial (inteiro): "
	menu:	 .asciiz  "\n##### MENU #####\n1 - Mostrar o saldo\n2 - Depositar\n3 - Efetuar saque\n0 - Sair\nOp��o: "
	outsal:  .asciiz  "Saldo: "
	outdep:  .asciiz  "Seu NOVO SALDO ap�s o dep�sito �: "
	outdep2: .asciiz  "Informe o seu dep�sito: "
	outsaq:  .asciiz  "Seu NOVO SALDO ap�s o saque �: "
	outsaq2: .asciiz  "Informe o seu saque: "
	out:	 .asciiz  "\nSistema finalizado\n"
	pula:     .asciiz  "\n"
	
.text 		          # Diretiva de texto
.globl main 	          # Diretorio global

main: 		          # Bloco main
	li $v0, 4         # Imprime uma string
	la $a0, sal       # Carrega sal no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 5         # Ler um n�mero inteiro 
	syscall           # Executa a instru��o
	
	move $t0, $v0     # Move o valor de $v0 para $t0
	
rep:		          # Bloco rep
	li $v0, 4         # Imprime uma string
	la $a0, menu      # Carrega menu no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 5         # Ler um n�mero inteiro 
	syscall           # Executa a instru��o
	
	move $t1, $v0     # Move o valor de $v0 para $t1
	beq $t1, 0, sair  # Se o valor de $tl for 0 ent�o cai no bloco sair
	jal opmenu	  # Se chegar nessa linha, chama o bloco opmenu
	j rep		  # se chegar nessa linha chama volta para o bloco rep (linha26)

opmenu:	                      # Bloco opmenu
	beq $t1, 1, saldo     # Se $t1 for igual a 1, cai no bloco saldo
	beq $t1, 2, deposito  # Se $t1 for igual a 2, cai no bloco deposito
	beq $t1, 3, saque     # Se $t1 for igual a 3, cai no bloco saque
	
saldo:
	li $v0, 4         # Imprime uma string
	la $a0, outsal    # Carrega outsal no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 1         # Ler um n�mero inteiro 
	move $a0, $t0	  # Carrega $a0 com o valor em $t0
	syscall           # Executa a instru��o
	
	li $v0, 4        # Imprime uma string
	la $a0, pula	 # Pula uma linha
	syscall           # Executa a instru��o
	
	jr $ra		  # Volta para quem o chamou (jal) - linha 36	
	
deposito:
	li $v0, 4         # Imprime uma string
	la $a0, outdep2   # Carrega outdep2 no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 5         # Ler um n�mero inteiro 
	syscall           # Executa a instru��o
	
	move $t2, $v0	  # Carrega $v0 com o valor em $t2
	add $t0, $t0, $t2 # SOMA: $t0 = $t0 + $t2
	li $v0, 4         # Imprime uma string
	la $a0, outdep    # Carrega outdep no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 1         # Ler um n�mero inteiro 
	move $a0, $t0	  # Carrega $v0 com o valor em $t2
	syscall           # Executa a instru��o
	
	li $v0, 4        # Imprime uma string
	la $a0, pula	 # Pula uma linha
	syscall           # Executa a instru��o
	
	jr $ra		  # Volta para quem o chamou (jal) - linha 36
	
saque:	
	li $v0, 4         # Imprime uma string
	la $a0, outsaq2   # Carrega outsaq2 no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 5         # Ler um n�mero inteiro 
	syscall           # Executa a instru��o
	
	move $t4, $v0	  # Carrega $v0 com o valor em $t4
	sub $t0, $t0, $t4 # SOMA: $t0 = $t0 + $t2
	li $v0, 4         # Imprime uma string
	la $a0, outsaq    # Carrega outsaq no registrador $a0
	syscall           # Executa a instru��o
	
	li $v0, 1         # Ler um n�mero inteiro 
	move $a0, $t0	  # Carrega $v0 com o valor em $t2
	syscall           # Executa a instru��o	
	
	li $v0, 4        # Imprime uma string
	la $a0, pula	 # Pula uma linha
	syscall           # Executa a instru��o
	
	jr $ra		  # Volta para quem o chamou (jal) - linha 36
	
sair:
	li $v0, 4	  # Imprime uma string
	la $a0, out       # Carrega out no registrador $a0
	syscall           # Executa a instru��o	
	
	li $v0, 10	  # Finalizando o programa
	syscall           # Executa a instru��o



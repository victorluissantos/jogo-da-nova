Algoritmo "jogodavelha"
//
//
// Descri��o   : Aqui voc� descreve o que o programa faz! (fun��o)
// Autor(a)    : Santos L. Victor
// Data atual  : 20/06/2020

Var
   // Se��o de Declara��es das vari�veis
   tabuleiro: vetor[0..2,0..2] de caracter
   linha,coluna: inteiro
   fim:logico
   jogadal, jogadac:inteiro
   nomeJogador, resultado:caracter

Procedimento desenhaTabuleiro
Inicio
   escreval("    1  2  3")
   para coluna de 0 ate 2 faca
      escreva(coluna+1,":")
      para linha de 0 ate 2 faca
         escreva("[",tabuleiro[coluna, linha],"]")
         se (linha=1) e (tabuleiro[coluna, linha]<>"-") entao
            se (tabuleiro[coluna, linha]=tabuleiro[coluna, linha-1]) e (tabuleiro[coluna, linha]=tabuleiro[coluna, linha+1]) entao
               fim<-Verdadeiro
               se tabuleiro[coluna,linha]="O" entao
                  resultado<-"Detonator e o ganhador"
               senao
                  resultado<-"O jogador "+  nomeJogador+" e o ganhador"
               fimse
            fimse
         fimse

         se (coluna=1) e (tabuleiro[coluna, linha]<>"-") entao
            se (tabuleiro[coluna, linha]=tabuleiro[coluna-1, linha]) e (tabuleiro[coluna, linha]=tabuleiro[coluna+1, linha]) entao
               fim<-Verdadeiro
               se tabuleiro[coluna,linha]="O" entao
                  resultado<-"Detonator e o ganhador"
               senao
                  resultado<-"O jogador "+nomeJogador+" e o ganhador"
               fimse
            fimse
         fimse
      fimpara
      escreval()
   fimpara
   escreval("_____________")
FimProcedimento

procedimento apresentacao
inicio
escreval("")
escreval("    #                                                #     #                      ")
escreval("      #  ####   ####   ####        #####    ##         ##    #  ####  #    #   ##   ")
escreval("      # #    # #    # #    #       #    #  #  #        # #   # #    # #    #  #  #  ")
escreval("      # #    # #      #    # ##### #    # #    # ##### #  #  # #    # #    # #    # ")
escreval("#     # #    # #  ### #    #       #    # ######       #   # # #    # #    # ###### ")
escreval("#     # #    # #    # #    #       #    # #    #       #    ## #    #  #  #  #    # ")
escreval(" #####   ####   ####   ####        #####  #    #       #     #  ####    ##   #    # ")
escreval("")
escreval("")
fimprocedimento

// Valida a jogada do Detonator
Procedimento jogadaDetonator
Var
   isValid:logico
Inicio
   isValid<-Falso
   enquanto isValid=Falso faca
      jogadal<-randi(3)
      jogadac<-randi(3)
      se tabuleiro[jogadal,jogadac]="-" entao
         tabuleiro[jogadal,jogadac]<-"O"
         isValid<-Verdadeiro
      fimse
   fimenquanto
FimProcedimento

Inicio
   apresentacao()
   fim<-Falso
   resultado<-"Impate geral"
   escreval("===> Jogo da Nova Turbo <===")
   escreval("")
   escreval("Desafiante, diga-nos teu nome:")
   leia(nomeJogador)
   escreval()

   para coluna de 0 ate 2 faca
      para linha de 0 ate 2 faca
         tabuleiro[coluna,linha]<-"-"
      fimpara
   fimpara

   desenhaTabuleiro()

   enquanto fim=Falso faca

      escreval("Digite a linha")
      leia(jogadal)
      jogadal<-jogadal-1
      escreval("Digite a coluna")
      leia(jogadac)
      jogadac<-jogadac-1

      se (tabuleiro[jogadal, jogadac]="X") ou (tabuleiro[jogadal,jogadac]="O") entao
         escreval("Posicao ja ocupada")
      senao
         tabuleiro[jogadal, jogadac]<-"X"
      fimse

      escreval("Jodaga do Detonator")
      jogadaDetonator()
      desenhaTabuleiro()
   fimenquanto

   // exibe quem foi o ganhador
   escreval(resultado)

Fimalgoritmo
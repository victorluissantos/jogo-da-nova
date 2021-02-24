algoritmo "Jogo da Nova"
// Função : Jogo da Nova
// Autor : Santos L. Victor
// Data : 22/2/2021
// Seção de Declarações

procedimento verificaGanhador()
var
item:inteiro
a:vetor[1..3]de caracter
b:vetor[1..3]de caracter
c:vetor[1..3]de caracter
d:vetor[1..3]de caracter
ee:vetor[1..3]de caracter
f:vetor[1..3]de caracter
g:vetor[1..3]de caracter
h:vetor[1..3]de caracter
inicio
item<-1

enquanto item<=9 faca
   se posicoes[item]<>"[ ]" entao
      se item=1 entao
         a[1]<-posicoes[item]
         d[1]<-posicoes[item]
         d[1]<-posicoes[item]
         g[1]<-posicoes[item]
      fimse

      se item=2 entao
         a[2]<-posicoes[item]
         ee[1]<-posicoes[item]
      fimse

      se item=3 entao
         a[3]<-posicoes[item]
         f[1]<-posicoes[item]
         h[1]<-posicoes[item]
      fimse

      se item=4 entao
         d[2]<-posicoes[item]
         b[1]<-posicoes[item]
      fimse

      se item=5 entao
         b[2]<-posicoes[item]
         ee[2]<-posicoes[item]
         h[2]<-posicoes[item]
         g[2]<-posicoes[item]
      fimse

      se item=6 entao
         b[3]<-posicoes[item]
         f[2]<-posicoes[item]
      fimse

      se item=7 entao
         c[1]<-posicoes[item]
         d[3]<-posicoes[item]
         h[3]<-posicoes[item]
      fimse

      se item=8 entao
         ee[3]<-posicoes[item]
         c[2]<-posicoes[item]
      fimse

      se item=9 entao
         f[3]<-posicoes[item]
         g[3]<-posicoes[item]
         c[3]<-posicoes[item]
      fimse

   fimse
   item<-item+1
fimenquanto

se (a[1]<>"") e (a[1]=a[2]) e (a[2]=a[3]) entao
   se a[1]="[x]" entao
      ganhador<-jogador
   senao
      ganhador<-"Computador"
   fimse
senao
   se (b[1]<>"") e (b[1]=b[2]) e (b[2]=b[3]) entao
      se b[1]="[x]" entao
         ganhador<-jogador
      senao
         ganhador<-"Computador"
      fimse
   senao
      se (c[1]<>"") e (c[1]=c[2]) e (c[2]=c[3]) entao
         se c[1]="[x]" entao
            ganhador<-jogador
         senao
            ganhador<-"Computador"
         fimse
      senao
         se (g[1]<>"") e (g[1]=g[2]) e (g[2]=g[3]) ou (h[1]<>"") e (h[1]=h[2]) e (h[2]=h[3]) entao
            se (g[1]="[x]") ou (h[1]="[x]") entao
               ganhador<-jogador
            senao
               ganhador<-"Computador"
            fimse
         senao // inicia vericação vertical
            se (d[1]<>"") e (d[1]=d[2]) e (d[2]=d[3]) ou (ee[1]<>"") e (ee[1]=ee[2]) e (ee[2]=ee[3])  ou (f[1]<>"") e (f[1]=f[2]) e (f[2]=f[3]) entao
               se (d[1]="[x]") ou (ee[1]="[x]") ou (f[1]="[x]") entao
                  ganhador<-jogador
               senao
                  ganhador<-"Computador"
               fimse
            fimse
         fimse
      fimse
   fimse
fimse

fimprocedimento

procedimento buildPosicoesLivres()
inicio
// inicia a jogada do PC
ind<-1
rind<-0
enquanto ind<=9 faca
   se posicoes[ind]="[ ]" entao
      posicoesLivres[rind]<-ind
      rind<-rind+1
   fimse
   ind<-ind+1
fimenquanto
fimprocedimento

procedimento desenhaTabula()
var
inicio

escreval("____1___2___3___")
escreval("1| ",posicoes[1]," ",posicoes[2]," ",posicoes[3])
escreval("2| ",posicoes[4]," ",posicoes[5]," ",posicoes[6])
escreval("3| ",posicoes[7]," ",posicoes[8]," ",posicoes[9])
escreval("|____________|")

fimprocedimento

var
posicoes:vetor[1..9] de caracter
posicoesLivres:vetor[0..8] de inteiro
jLinha:inteiro
jColuna:inteiro
ganhador:caracter
jogadaValida:inteiro // 0 se a jogada for invalida e 1 se for valida

ind:inteiro // controla o vetor sequencial
rind:inteiro // controla o vetor inverso
escambo:caracter
jogadaPC:inteiro // posição que o pc ira jogar
posibilidades:inteiro
jogador:caracter
inicio

escreval("Informe seu nome(desafiante):")
leia(jogador)
enquanto jogador="" faca
   escreval("Informe um nome valido:")
   leia(jogador)
fimenquanto

posibilidades<-9
ganhador<-""
// inicia tabuleito em branco
posicoes[1]<-"[ ]"
posicoes[2]<-"[ ]"
posicoes[3]<-"[ ]"
posicoes[4]<-"[ ]"
posicoes[5]<-"[ ]"
posicoes[6]<-"[ ]"
posicoes[7]<-"[ ]"
posicoes[8]<-"[ ]"
posicoes[9]<-"[ ]"

desenhaTabula() // desenha tabula em branco
enquanto ganhador="" faca
   jogadaValida<-0
   enquanto jogadaValida=0 faca
      escreval("Digite a Linha:")
      leia(jLinha)
      escreval("Digite a coluna:")
      leia(jColuna)

      se (jLinha=1) e (jColuna=1) entao
         se posicoes[1]="[ ]" entao
            posicoes[1]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=1) e (jColuna=2) entao
         se posicoes[2]="[ ]" entao
            posicoes[2]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=1) e (jColuna=3) entao
         se posicoes[3]="[ ]" entao
            posicoes[3]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=2) e (jColuna=1) entao
         se posicoes[4]="[ ]" entao
            posicoes[4]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=2) e (jColuna=2) entao
         se posicoes[5]="[ ]" entao
            posicoes[5]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=2) e (jColuna=3) entao
         se posicoes[6]="[ ]" entao
            posicoes[6]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=3) e (jColuna=1) entao
         se posicoes[7]="[ ]" entao
            posicoes[7]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=3) e (jColuna=2) entao
         se posicoes[8]="[ ]" entao
            posicoes[8]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se (jLinha=3) e (jColuna=3) entao
         se posicoes[9]="[ ]" entao
            posicoes[9]<-"[x]"
            jogadaValida<-1
         fimse
      fimse

      se jogadaValida=0 entao
         escreval("Jogada Invalida, tente novamente!")
      senao
         buildPosicoesLivres()
         limpatela
         desenhaTabula()
      fimse

   fimenquanto // fim da jogada do Usuário
   verificaGanhador()

   se ganhador="" entao
      buildPosicoesLivres()
      jogadaPC<-(randi(rind))+1

      se posicoesLivres[jogadaPC]=0 entao
         ind<-0
         enquanto ind<rind faca
            se posicoes[ind]="[ ]" enao
               posicoesLivres[jogadaPC]=ind
            fimse
            ind<-ind+1
         fimenquanto
      fimse

      posicoes[posicoesLivres[jogadaPC]]<-"[0]"
      limpatela
      desenhaTabula()
      verificaGanhador()
   fimse
fimenquanto

escreval("O ganhador foi:",ganhador)

fimalgoritmo
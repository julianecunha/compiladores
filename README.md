Richard Anemam Da Costa RA 11049114
Juliane Dias Cunha RA 11076415

## 1 Objetivos
Desenvolvimento de um analisador sintático e um analisador semântico para auxiliar na interpretação da linguagem de programação Ariel, baseada nos mais básicos conceitos de C.

## 2 Observações
Para efeitos de testes foi utilizado o ambiente Linux.
Após baixar os arquivos, compilar o arquivo calc02.y utiizando a linha de comando 

  bison -d calc02.y

Serão gerados os arquivos com extenão .tab.c e .tab.h.
Serão exibidos alguns warnings que popdem ser ignorados para o uso da ferramenta.

Em seguida, compilar o arquivo ariel.l:

  flex ariel.l

Será gerado o arquivo lex.yy.c.

Para continuar, utilizar o comando abaixo para compilar o arquivo gerado no passo anterior.

  gcc -o exec calc02.tab.c lex.yy.c -lfl -lm

Agora o executável fooi gerado, sendo possível testá-lo com os exemplos disponiblizados.

./exec "exemplo01.txt"

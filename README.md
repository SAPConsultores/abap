# ALV
Repositório ABAP com os melhores exemplos práticos de ALVs.

## ZF_ALV_SIMPLE - Simples Relatório ALV
Esse código exemplifica uma simples função capaz de gerar um Relatório ALV em popup ou janela inteira (full screen) a partir de **QUALQUER** tabela interna!

Este exemplo é ideal para construir popups informativas de logs, itens de algum documento etc.

Veja como é simples:

* Crie uma função pela transação SE37 (sugestão ZF_ALV_SIMPLE) - você irá precisar de um grupo de funções (pode ser facilmente criado na transação SE80)
* Crie os parâmetros de importação a seguir:

  | Parâmetro     | Tipo | Elemento | Valor Padrão        | Opcional? | Descrição                                         |
  |---------------|------|----------|---------------------|-----------|---------------------------------------------------|
  | I_COLSTART    | TYPE | I        | 15                  |     X     | Coluna inicial do popup na tela                   |
  | I_COLEND      | TYPE | I        | 100                 |     X     | Coluna final do popup na tela (largura)           |
  | I_LINESTART   | TYPE | I        | 8                   |     X     | Linha inicial do popup na tela                    |
  | I_LINEEND     | TYPE | I        | 28                  |     X     | Linha final do popup na tela (altura)             |
  | I_POPUP       | TYPE | I        |                     |     X     | (X) Exibição em POPUP ( ) ALV em tela inteira     |

* Defina a tabela na guia Tabelas:

  | Parâmetro | Tipo | Tipo associado  | Opcional? | Descrição                                         |
  |-----------|------|-----------------|-----------|---------------------------------------------------|
  | T_DATA    | TYPE | STANDARD TABLE  |           | Tabela utilizada para impressão do relatório ALV  |

* Cole o código contido no arquivo [ZF_ALV_SIMPLE.abap](https://github.com/SAPConsultores/alv/blob/master/ZF_ALV_SIMPLE.abap)
* Ative a função
* Faça um teste qualquer. Segue um report de exemplo que irá listar a tabela SFLIGHT em tela inteira (para exibir em popup utilize o parâmetro I_POPUP = 'X'):

```abap
DATA: t_sflights TYPE STANDARD TABLE OF sflights.
SELECT * FROM sflights INTO TABLE t_sflights.
CALL FUNCTION 'ZF_ALV_SIMPLE'
  TABLES
    t_data = t_sflights.
```

Et voilà! Em **Simples e Rápidos 6 Passos você criou uma Função UNIVERSAL** no seu ambiente para gerar um ALV com qualquer tabela!

## ALV Fácil Orientado a Objetos - Desmistificando o ALV OO

** TO-DO... **

## ALV via Função REUSE_ALV_GRID

** TO-DO... **

## ALV Interativo - REUSE_ALV_GRID

** TO-DO... **

## ALV Interativo - ALV OO

** TO-DO... **

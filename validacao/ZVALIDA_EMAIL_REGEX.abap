REPORT zvalida_email_regex.

DATA: o_regex   TYPE REF TO cl_abap_regex,    " Objeto que cria uma combinação usando Expressões Regulares
      o_matcher TYPE REF TO cl_abap_matcher.  " Objeto que resolve determinada combinação

PARAMETERS: p_email TYPE c LENGTH 254. " Campo para Email

START-OF-SELECTION.

*--# Instacia o objeto O_REGEX
  CREATE OBJECT o_regex
    EXPORTING
      pattern     = '\b[A-Z0-9._%+-]+@[A-Z0-9.-]+\.[A-Z]{2,4}\b' " Expressão Regular para validação de email
      ignore_case = abap_true.                                   " Flag para ignorar maiúsculas e minúsculas

*--# Após instanciar o objecto O_REGEX com a Expressão Regular que queremos usar,
*--# instanciamos o objeto O_MATCHER com a Expressão e o dado a ser validado
  o_matcher = o_regex->create_matcher( text = p_email ).

*--# Executa o método que resolve a Expressão Regular e checamos seu resultado
  IF o_matcher->match( ) EQ 'X'.  " Retorno 'X', a informação é válida
    WRITE: 'Email: ', p_email, ' é válido'.
  ELSE. " Retorno diferente de 'X', a informação é inválida
    WRITE: 'Email: ', p_email, ' é inválido'.
  ENDIF.
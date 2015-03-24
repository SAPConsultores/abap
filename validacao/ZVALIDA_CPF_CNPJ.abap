REPORT zvalida_cpf_cnpj.

PARAMETERS:
p_cpf  TYPE c LENGTH 11,   " Campo para CPF
p_cnpj TYPE c LENGTH 14.   " Campo para CNPJ

START-OF-SELECTION.

* Validação do CPF
  IF p_cpf IS NOT INITIAL.

* Validação para números repetidos
    IF p_cpf CO '0'
      OR p_cpf CO '1'
      OR p_cpf CO '2'
      OR p_cpf CO '3'
      OR p_cpf CO '4'
      OR p_cpf CO '5'
      OR p_cpf CO '6'
      OR p_cpf CO '7'
      OR p_cpf CO '8'
      OR p_cpf CO '9'.
      MESSAGE 'CPF Inválido' TYPE 'E'.
    ENDIF.

* Função para Validar CPF
    CALL FUNCTION 'CONVERSION_EXIT_CPFBR_INPUT'
      EXPORTING
        input     = p_cpf
      EXCEPTIONS
        not_valid = 1
        OTHERS    = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

  ENDIF.

* Validação do CPF
  IF p_cnpj IS NOT INITIAL.

* Validação para números repetidos
    IF p_cnpj CO '0'
      OR p_cnpj CO '1'
      OR p_cnpj CO '2'
      OR p_cnpj CO '3'
      OR p_cnpj CO '4'
      OR p_cnpj CO '5'
      OR p_cnpj CO '6'
      OR p_cnpj CO '7'
      OR p_cnpj CO '8'
      OR p_cnpj CO '9'.
      MESSAGE 'CNPJ Inválido' TYPE 'E'.
    ENDIF.

* Função para Validar CNPJ
    CALL FUNCTION 'CONVERSION_EXIT_CGCBR_INPUT'
      EXPORTING
        input     = p_cnpj
      EXCEPTIONS
        not_valid = 1
        OTHERS    = 2.
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
        WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.

  ENDIF.

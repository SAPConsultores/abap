FUNCTION zf_alv_simple.
*"----------------------------------------------------------------------
*"*"Local interface:
*"  IMPORTING
*"    REFERENCE(I_COLSTART) TYPE  I DEFAULT 25
*"    REFERENCE(I_COLEND) TYPE  I DEFAULT 100
*"    REFERENCE(I_LINESTART) TYPE  I DEFAULT 6
*"    REFERENCE(I_LINEEND) TYPE  I DEFAULT 10
*"    REFERENCE(I_TITLE) TYPE  STRING DEFAULT 'Relatório Simples'
*"    REFERENCE(I_POPUP) TYPE  FLAG DEFAULT ' '
*"  TABLES
*"      IT_DATA TYPE  STANDARD TABLE
*"----------------------------------------------------------------------
 
  DATA: o_alv TYPE REF TO cl_salv_table.
  DATA: o_functions TYPE REF TO cl_salv_functions_list.
 
  TRY.
      cl_salv_table=>factory(
        IMPORTING
          r_salv_table = o_alv
        CHANGING
          t_table      = it_data[] ).
    CATCH cx_salv_msg.
  ENDTRY.

  o_functions = go_alv->get_functions( ).
  o_functions->set_all( 'X' ).

  IF o_alv IS BOUND.
    IF i_popup = 'X'.
      o_alv->set_screen_popup(
        start_column = i_colstart
        end_column  = i_colend
        start_line  = i_linestart
        end_line    = i_lineend ).
    ENDIF.
 
    o_alv->display( ).
  ENDIF.
 
ENDFUNCTION.

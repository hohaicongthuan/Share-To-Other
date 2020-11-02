/*=========================================================
The code in this module is from https://www.intel.com/conten
t/www/us/en/programmable/support/support-resources/design-ex
amples/design-software/verilog/ver_tristate.html
===========================================================*/

module TriState (data_i, oe, data_o);

    input   data_i, oe;
    output  data_o;
    tri     data_o;

    bufif1  b1(data_o, data_i, oe);

endmodule
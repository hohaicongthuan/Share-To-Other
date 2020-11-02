module FullSubtractor (A_i, B_i, Ri_i, D_o, Ro_o);
    // declare ports
    input A_i; // so bi tru
    input B_i; // so tru
    input Ri_i;  // nho
    output D_o;  // ket qua
    output Ro_o; // ket qua nho

    // declare data type of ports
    // leave by default because all are wires

    // declare wires
    wire xor1; // output cua xor ben trai
    wire nxor1; // not cua output xor ben trai
    wire and1; // output cua and ben trai
    wire and2; // output cua and ben phai
    wire na; // not cua a

    // function description
    xor(xor1, A_i, B_i);
    xor(D_o, Ri_i, xor1);

    not(nxor1, xor1);
    not(na, A_i);

    and(and1, na, B_i);
    and(and2, nxor1, Ri_i);
    or(Ro_o, and1, and2);

endmodule
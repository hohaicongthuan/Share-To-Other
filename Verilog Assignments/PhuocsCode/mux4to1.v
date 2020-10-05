module mux4to1 (I0,I1,I2,I3, s0,s1, q);

//io ports
input I0,I1,I2,I3;
input s0,s1;
output q;

//internal net

wire sn0,sn1, and_0,and_1,and_2,and_3;
//description
not not0(sn0, s0);
not not1(sn1, s1);
and and0(and_0, I0,sn0,sn1);
and and1(and_1, I1,sn1,s0);
and and2(and_2, I2,s1,sn0);
and and3(and_3, I3,s1,s0);

or or0(q, and_0, and_1, and_2,and_3);
endmodule

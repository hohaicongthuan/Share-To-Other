* ALU HAS been tested
* FP_Div HAS NOT been tested thoroughly, there're some cases that it'll give incorrect answers, though it basically works
* FP_Add HAS been tested

```diff
FP_Datapath test status:
+ Mux2To1_32bit.v: done.
+ register_OE.v: done.
+ RegisterFile.v: done.
! datapath.v: ongoing.
```
```diff
FP_Controller test status:
+ register.v: done.
+ next_state.v: done.
+ outputs.v: done.
```

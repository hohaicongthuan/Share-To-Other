* ALU HAS NOT been tested
* FP_Div HAS NOT been tested thoroughly, there're some cases that it'll give incorrect answers, though it basically works

```diff
FP_Datapath test status:
+ Mux2To1_32bit.v: done.
+ register_OE.v: done.
+ RegisterFile.v: done.
! datapath.v: on going.
```
```diff
FP_Controller
+ register.v: done.
+ next_state.v: done.
+ outputs.v: done.
```

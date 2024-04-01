
%define nthreads    2
%define t2_repeat1  40
%define t2_repeat2  10
%define repeat1  1
%define repeat2  1
%define repeat0 10000
%define WARMUPCOUNT 1<<31
; %define codealign 64
%define noptype 2
; Define any undefined macros


%include "nops.inc"
%include "lfsr.inc"



%ifdef all_zeros
  %define ZERO_ITR 100
%else 
  %define ZERO_ITR 20
%endif 


%ifdef all_ones 
  %define ONE_ITR 100
%else 
  %define ONE_ITR 50
%endif 

%macro send_zero 0
; should not modify edx
  mov ebx, ZERO_ITR
  %%loop1:
     %REP 1000
        nop
    %ENDREP
   dec ebx
   jnz %%loop1

%endmacro 

%macro send_small_zero 0 
; should not modify edx

  mov ebx, 10
  %%loop1:
  %rep 1000
   nop
  %endrep
  dec ebx
  jnz %%loop1

%endmacro


%macro send_one 0
  mov ebx, ONE_ITR

  %%loop1: 
    %REP 100
       vmovdqa ymm1, [rdi] 
    %ENDREP
   dec ebx
   jnz %%loop1
%endmacro

%macro testcode 0
  lfsr
%endmacro

%macro t2_testcode 0
vmovdqa ymm1, [rdi]
%endmacro

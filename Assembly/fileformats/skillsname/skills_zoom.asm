;;----------------------------------------------------------------------------;;
;;  Use the skill long name in Zoom menu
;;  Copyright 2014 Benito Palacios (aka pleonex)
;;
;;  Licensed under the Apache License, Version 2.0 (the "License");
;;  you may not use this file except in compliance with the License.
;;  You may obtain a copy of the License at
;;
;;      http://www.apache.org/licenses/LICENSE-2.0
;;
;;  Unless required by applicable law or agreed to in writing, software
;;  distributed under the License is distributed on an "AS IS" BASIS,
;;  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;;  See the License for the specific language governing permissions and
;;  limitations under the License.
;;----------------------------------------------------------------------------;;

@LongNameOffset    equ 0x3C


;; Prints skill name in "zoom" menu in the top screen after selecting it
.thumb
.org 0x0215BAA6
  ADD    r0, @LongNameOffset
  STR    R0, [SP,#0x18]
  LDRSH  r1, [r5,r4]

.org 0x0215BA9A
  ; Just to get some space for above code
  ADD    r4, r4, #4
  MOV    R6, R0
  LDRSH  r1, [r5,r4]

.org 0x0215BAB4
  ; Just to get some space for above code
  MOV    r1, R4

.org 0x0215BAC2
  ; Just to get some space for above code
  SUB    r4, #0xC


;; Familiar skill name in the stop screen list
.thumb
.org 0x0215B974
  MOV r2, r4

.org 0x0215B97A
  LSL r7, r4, 4

.org 0x0215B992
  BLX 0x0210CBD4 ; skills_getPtr_wr
  MOV r3, r0
  ADD r3, @LongNameOffset

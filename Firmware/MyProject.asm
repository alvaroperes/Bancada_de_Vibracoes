
_TCC_NoDisplay:

;lcd_alvaro.h,33 :: 		void TCC_NoDisplay(){
;lcd_alvaro.h,34 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_alvaro.h,35 :: 		Lcd_Chr(1,1,0);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,36 :: 		Lcd_Chr(2,1,1);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,37 :: 		Lcd_Chr(2,2,1);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,38 :: 		Lcd_Chr(1,2,1);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,39 :: 		Lcd_Chr(1,3,2);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,40 :: 		Lcd_Chr(2,3,2);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,41 :: 		Lcd_Out(1,4,"TCC");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr1_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr1_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd_alvaro.h,42 :: 		Lcd_Chr(2,4,4);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,43 :: 		Lcd_Out(2,5,"lvaro Peres");
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       5
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr2_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr2_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd_alvaro.h,44 :: 		}
L_end_TCC_NoDisplay:
	RETURN      0
; end of _TCC_NoDisplay

_IFAM_NoDisplay:

;lcd_alvaro.h,46 :: 		void IFAM_NoDisplay(){
;lcd_alvaro.h,48 :: 		Lcd_Cmd(64);
	MOVLW       64
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_alvaro.h,49 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM1[i]);
	CLRF        IFAM_NoDisplay_i_L0+0 
L_IFAM_NoDisplay0:
	MOVF        IFAM_NoDisplay_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_IFAM_NoDisplay1
	MOVLW       _IFAM1+0
	ADDWF       IFAM_NoDisplay_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_IFAM1+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_IFAM1+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        IFAM_NoDisplay_i_L0+0, 1 
	GOTO        L_IFAM_NoDisplay0
L_IFAM_NoDisplay1:
;lcd_alvaro.h,50 :: 		Lcd_Cmd(72);
	MOVLW       72
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_alvaro.h,51 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM2[i]);
	CLRF        IFAM_NoDisplay_i_L0+0 
L_IFAM_NoDisplay3:
	MOVF        IFAM_NoDisplay_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_IFAM_NoDisplay4
	MOVLW       _IFAM2+0
	ADDWF       IFAM_NoDisplay_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_IFAM2+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_IFAM2+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        IFAM_NoDisplay_i_L0+0, 1 
	GOTO        L_IFAM_NoDisplay3
L_IFAM_NoDisplay4:
;lcd_alvaro.h,52 :: 		Lcd_Cmd(80);
	MOVLW       80
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_alvaro.h,53 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM3[i]);
	CLRF        IFAM_NoDisplay_i_L0+0 
L_IFAM_NoDisplay6:
	MOVF        IFAM_NoDisplay_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_IFAM_NoDisplay7
	MOVLW       _IFAM3+0
	ADDWF       IFAM_NoDisplay_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_IFAM3+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_IFAM3+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        IFAM_NoDisplay_i_L0+0, 1 
	GOTO        L_IFAM_NoDisplay6
L_IFAM_NoDisplay7:
;lcd_alvaro.h,54 :: 		Lcd_Cmd(88);
	MOVLW       88
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_alvaro.h,55 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM4[i]);
	CLRF        IFAM_NoDisplay_i_L0+0 
L_IFAM_NoDisplay9:
	MOVF        IFAM_NoDisplay_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_IFAM_NoDisplay10
	MOVLW       _IFAM4+0
	ADDWF       IFAM_NoDisplay_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_IFAM4+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_IFAM4+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        IFAM_NoDisplay_i_L0+0, 1 
	GOTO        L_IFAM_NoDisplay9
L_IFAM_NoDisplay10:
;lcd_alvaro.h,56 :: 		Lcd_Cmd(96);
	MOVLW       96
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;lcd_alvaro.h,57 :: 		for (i = 0; i<=7; i++) Lcd_Chr_CP(A_acento[i]);
	CLRF        IFAM_NoDisplay_i_L0+0 
L_IFAM_NoDisplay12:
	MOVF        IFAM_NoDisplay_i_L0+0, 0 
	SUBLW       7
	BTFSS       STATUS+0, 0 
	GOTO        L_IFAM_NoDisplay13
	MOVLW       _A_acento+0
	ADDWF       IFAM_NoDisplay_i_L0+0, 0 
	MOVWF       TBLPTRL 
	MOVLW       hi_addr(_A_acento+0)
	MOVWF       TBLPTRH 
	MOVLW       0
	ADDWFC      TBLPTRH, 1 
	MOVLW       higher_addr(_A_acento+0)
	MOVWF       TBLPTRU 
	MOVLW       0
	ADDWFC      TBLPTRU, 1 
	TBLRD*+
	MOVFF       TABLAT+0, FARG_Lcd_Chr_CP_out_char+0
	CALL        _Lcd_Chr_CP+0, 0
	INCF        IFAM_NoDisplay_i_L0+0, 1 
	GOTO        L_IFAM_NoDisplay12
L_IFAM_NoDisplay13:
;lcd_alvaro.h,59 :: 		Lcd_Chr(1,1,0);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	CLRF        FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,60 :: 		Lcd_Chr(2,1,1);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,61 :: 		Lcd_Chr(2,2,1);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,62 :: 		Lcd_Chr(1,2,1);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,63 :: 		Lcd_Chr(1,3,2);
	MOVLW       1
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,64 :: 		Lcd_Chr(2,3,2);
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_row+0 
	MOVLW       3
	MOVWF       FARG_Lcd_Chr_column+0 
	MOVLW       2
	MOVWF       FARG_Lcd_Chr_out_char+0 
	CALL        _Lcd_Chr+0, 0
;lcd_alvaro.h,65 :: 		Lcd_Out(1,4,"AM - CMDI");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       4
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr3_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr3_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;lcd_alvaro.h,66 :: 		}
L_end_IFAM_NoDisplay:
	RETURN      0
; end of _IFAM_NoDisplay

_Bancada_Init:

;MyProject.c,11 :: 		void Bancada_Init(void){
;MyProject.c,12 :: 		ADCON1     = 0X0F;           // Configura todos os pinos analógicos como digitais
	MOVLW       15
	MOVWF       ADCON1+0 
;MyProject.c,13 :: 		TRISA      = 0x1F;
	MOVLW       31
	MOVWF       TRISA+0 
;MyProject.c,15 :: 		TRISC      = TRISC & ~(1<<2);// Configura o TRISC RC2 como 0 para PWM output
	BCF         TRISC+0, 2 
;MyProject.c,16 :: 		TRISC      = TRISC & ~(1<<1);// Saída digital para controle de posição do motor
	BCF         TRISC+0, 1 
;MyProject.c,17 :: 		TRISC      = TRISC & ~(1<<5);// Saída digital para controle de posição do motor
	BCF         TRISC+0, 5 
;MyProject.c,19 :: 		CMCON      = 0X07;           // Desabilita os comparadores
	MOVLW       7
	MOVWF       CMCON+0 
;MyProject.c,20 :: 		CCP1CON    = 0x0F;           // Configura o registrador CCP1 no modo PWM
	MOVLW       15
	MOVWF       CCP1CON+0 
;MyProject.c,22 :: 		T0CON      = 0x88;           // Inicializa do Timer0 com 16 bits
	MOVLW       136
	MOVWF       T0CON+0 
;MyProject.c,23 :: 		TMR0H      = 0x9E;           // Configura o flag do Timer0 para estourar em 5ms para a configuração do período de amostragem
	MOVLW       158
	MOVWF       TMR0H+0 
;MyProject.c,24 :: 		TMR0L      = 0x58;
	MOVLW       88
	MOVWF       TMR0L+0 
;MyProject.c,26 :: 		horario    = 0;
	BCF         PORTC+0, 1 
;MyProject.c,27 :: 		antihora   = 0;
	BCF         PORTC+0, 5 
;MyProject.c,34 :: 		PR2 = 0xff;            // Registrador de estouro do Timer2
	MOVLW       255
	MOVWF       PR2+0 
;MyProject.c,35 :: 		T2CON =  0x06;         // Inicializa o Timer2 com presacaler de 1:16 e com 8 bits
	MOVLW       6
	MOVWF       T2CON+0 
;MyProject.c,36 :: 		CCPR1L  = 0x00;        // Configura o Duty Cycle do PWM para 0
	CLRF        CCPR1L+0 
;MyProject.c,39 :: 		}
L_end_Bancada_Init:
	RETURN      0
; end of _Bancada_Init

_Bancada_Frequecy_Out:

;MyProject.c,41 :: 		void Bancada_Frequecy_Out(float freq){
;MyProject.c,42 :: 		output = 1023*sin(2*3.1415*freq*tempo);
	MOVLW       86
	MOVWF       R0 
	MOVLW       14
	MOVWF       R1 
	MOVLW       73
	MOVWF       R2 
	MOVLW       129
	MOVWF       R3 
	MOVF        FARG_Bancada_Frequecy_Out_freq+0, 0 
	MOVWF       R4 
	MOVF        FARG_Bancada_Frequecy_Out_freq+1, 0 
	MOVWF       R5 
	MOVF        FARG_Bancada_Frequecy_Out_freq+2, 0 
	MOVWF       R6 
	MOVF        FARG_Bancada_Frequecy_Out_freq+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        _tempo+0, 0 
	MOVWF       R4 
	MOVF        _tempo+1, 0 
	MOVWF       R5 
	MOVF        _tempo+2, 0 
	MOVWF       R6 
	MOVF        _tempo+3, 0 
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       FARG_sin_f+0 
	MOVF        R1, 0 
	MOVWF       FARG_sin_f+1 
	MOVF        R2, 0 
	MOVWF       FARG_sin_f+2 
	MOVF        R3, 0 
	MOVWF       FARG_sin_f+3 
	CALL        _sin+0, 0
	MOVLW       0
	MOVWF       R4 
	MOVLW       192
	MOVWF       R5 
	MOVLW       127
	MOVWF       R6 
	MOVLW       136
	MOVWF       R7 
	CALL        _Mul_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _output+0 
	MOVF        R1, 0 
	MOVWF       _output+1 
	MOVF        R2, 0 
	MOVWF       _output+2 
	MOVF        R3, 0 
	MOVWF       _output+3 
;MyProject.c,43 :: 		if(output > 0){
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	CLRF        R0 
	CLRF        R1 
	CLRF        R2 
	CLRF        R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Bancada_Frequecy_Out15
;MyProject.c,44 :: 		horario    = 1;              // Sentido horário
	BSF         PORTC+0, 1 
;MyProject.c,45 :: 		antihora   = 0;              // Sentido anti horário
	BCF         PORTC+0, 5 
;MyProject.c,46 :: 		}
	GOTO        L_Bancada_Frequecy_Out16
L_Bancada_Frequecy_Out15:
;MyProject.c,48 :: 		horario    = 0;              // Sentido horário
	BCF         PORTC+0, 1 
;MyProject.c,49 :: 		antihora   = 1;              // Sentido anti horário
	BSF         PORTC+0, 5 
;MyProject.c,50 :: 		}
L_Bancada_Frequecy_Out16:
;MyProject.c,51 :: 		DC1B0_bit = (unsigned long) output & 0x01;
	MOVF        _output+0, 0 
	MOVWF       R0 
	MOVF        _output+1, 0 
	MOVWF       R1 
	MOVF        _output+2, 0 
	MOVWF       R2 
	MOVF        _output+3, 0 
	MOVWF       R3 
	CALL        _double2longword+0, 0
	MOVLW       1
	ANDWF       R0, 0 
	MOVWF       R4 
	BTFSC       R4, 0 
	GOTO        L__Bancada_Frequecy_Out74
	BCF         DC1B0_bit+0, BitPos(DC1B0_bit+0) 
	GOTO        L__Bancada_Frequecy_Out75
L__Bancada_Frequecy_Out74:
	BSF         DC1B0_bit+0, BitPos(DC1B0_bit+0) 
L__Bancada_Frequecy_Out75:
;MyProject.c,52 :: 		DC1B1_bit = (unsigned long) output & 0x02;
	MOVLW       2
	ANDWF       R0, 0 
	MOVWF       R4 
	BTFSC       R4, 0 
	GOTO        L__Bancada_Frequecy_Out76
	BCF         DC1B1_bit+0, BitPos(DC1B1_bit+0) 
	GOTO        L__Bancada_Frequecy_Out77
L__Bancada_Frequecy_Out76:
	BSF         DC1B1_bit+0, BitPos(DC1B1_bit+0) 
L__Bancada_Frequecy_Out77:
;MyProject.c,53 :: 		CCPR1L = (unsigned long) output >> 2;
	MOVF        R0, 0 
	MOVWF       R4 
	MOVF        R1, 0 
	MOVWF       R5 
	MOVF        R2, 0 
	MOVWF       R6 
	MOVF        R3, 0 
	MOVWF       R7 
	RRCF        R7, 1 
	RRCF        R6, 1 
	RRCF        R5, 1 
	RRCF        R4, 1 
	BCF         R7, 7 
	RRCF        R7, 1 
	RRCF        R6, 1 
	RRCF        R5, 1 
	RRCF        R4, 1 
	BCF         R7, 7 
	MOVF        R4, 0 
	MOVWF       CCPR1L+0 
;MyProject.c,55 :: 		}
L_end_Bancada_Frequecy_Out:
	RETURN      0
; end of _Bancada_Frequecy_Out

_Interrupt:

;MyProject.c,57 :: 		void Interrupt(void){
;MyProject.c,58 :: 		if(TMR0IF_bit){
	BTFSS       TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
	GOTO        L_Interrupt17
;MyProject.c,59 :: 		TMR0H         = 0x9E;
	MOVLW       158
	MOVWF       TMR0H+0 
;MyProject.c,60 :: 		TMR0L         = 0x58;
	MOVLW       88
	MOVWF       TMR0L+0 
;MyProject.c,62 :: 		tempo=tempo+0.005;
	MOVF        _tempo+0, 0 
	MOVWF       R0 
	MOVF        _tempo+1, 0 
	MOVWF       R1 
	MOVF        _tempo+2, 0 
	MOVWF       R2 
	MOVF        _tempo+3, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       119
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _tempo+0 
	MOVF        R1, 0 
	MOVWF       _tempo+1 
	MOVF        R2, 0 
	MOVWF       _tempo+2 
	MOVF        R3, 0 
	MOVWF       _tempo+3 
;MyProject.c,64 :: 		TMR0IF_bit = 0;
	BCF         TMR0IF_bit+0, BitPos(TMR0IF_bit+0) 
;MyProject.c,65 :: 		}
L_Interrupt17:
;MyProject.c,66 :: 		if(INT0IF_bit){
	BTFSS       INT0IF_bit+0, BitPos(INT0IF_bit+0) 
	GOTO        L_Interrupt18
;MyProject.c,67 :: 		if (!OnOff){
	BTFSC       PORTE+0, 3 
	GOTO        L_Interrupt19
;MyProject.c,68 :: 		On = ~On;
	COMF        _On+0, 0 
	MOVWF       R0 
	MOVF        R0, 0 
	MOVWF       _On+0 
;MyProject.c,69 :: 		LATC.RC0 = On;
	BTFSC       R0, 0 
	GOTO        L__Interrupt80
	BCF         LATC+0, 0 
	GOTO        L__Interrupt81
L__Interrupt80:
	BSF         LATC+0, 0 
L__Interrupt81:
;MyProject.c,70 :: 		if(!On){
	MOVF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt20
;MyProject.c,71 :: 		T2CON   = 0x00;
	CLRF        T2CON+0 
;MyProject.c,72 :: 		CCP1CON = 0x00;
	CLRF        CCP1CON+0 
;MyProject.c,73 :: 		}
	GOTO        L_Interrupt21
L_Interrupt20:
;MyProject.c,75 :: 		T2CON   = 0x06;
	MOVLW       6
	MOVWF       T2CON+0 
;MyProject.c,76 :: 		CCP1CON = 0x0F;
	MOVLW       15
	MOVWF       CCP1CON+0 
;MyProject.c,77 :: 		}
L_Interrupt21:
;MyProject.c,78 :: 		}
	GOTO        L_Interrupt22
L_Interrupt19:
;MyProject.c,79 :: 		else if(!enter & On){
	BTFSC       PORTA+0, 4 
	GOTO        L__Interrupt82
	BSF         4056, 0 
	GOTO        L__Interrupt83
L__Interrupt82:
	BCF         4056, 0 
L__Interrupt83:
	CLRF        R0 
	BTFSC       4056, 0 
	INCF        R0, 1 
	MOVF        _On+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt23
;MyProject.c,80 :: 		ent = 1;
	MOVLW       1
	MOVWF       _ent+0 
;MyProject.c,81 :: 		if(index == 0) index=1;
	MOVF        _index+0, 0 
	XORLW       0
	BTFSS       STATUS+0, 2 
	GOTO        L_Interrupt24
	MOVLW       1
	MOVWF       _index+0 
	GOTO        L_Interrupt25
L_Interrupt24:
;MyProject.c,82 :: 		else index=0;
	CLRF        _index+0 
L_Interrupt25:
;MyProject.c,83 :: 		}
	GOTO        L_Interrupt26
L_Interrupt23:
;MyProject.c,84 :: 		else if(!cima & index != 0 & On){
	BTFSC       PORTA+0, 0 
	GOTO        L__Interrupt84
	BSF         R4, 0 
	GOTO        L__Interrupt85
L__Interrupt84:
	BCF         R4, 0 
L__Interrupt85:
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R1 
	CLRF        R0 
	BTFSC       R4, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	MOVF        _On+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt27
;MyProject.c,85 :: 		cim = 1;
	MOVLW       1
	MOVWF       _cim+0 
;MyProject.c,86 :: 		}
	GOTO        L_Interrupt28
L_Interrupt27:
;MyProject.c,87 :: 		else if(!baixo & index != 0 & On){
	BTFSC       PORTA+0, 1 
	GOTO        L__Interrupt86
	BSF         R4, 0 
	GOTO        L__Interrupt87
L__Interrupt86:
	BCF         R4, 0 
L__Interrupt87:
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R1 
	CLRF        R0 
	BTFSC       R4, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	MOVF        _On+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt29
;MyProject.c,88 :: 		baix = 1;
	MOVLW       1
	MOVWF       _baix+0 
;MyProject.c,89 :: 		}
	GOTO        L_Interrupt30
L_Interrupt29:
;MyProject.c,90 :: 		else if(!direita & index != 0 & On){
	BTFSC       PORTA+0, 2 
	GOTO        L__Interrupt88
	BSF         R4, 0 
	GOTO        L__Interrupt89
L__Interrupt88:
	BCF         R4, 0 
L__Interrupt89:
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R1 
	CLRF        R0 
	BTFSC       R4, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	MOVF        _On+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt31
;MyProject.c,91 :: 		dire = 1;
	MOVLW       1
	MOVWF       _dire+0 
;MyProject.c,92 :: 		}
	GOTO        L_Interrupt32
L_Interrupt31:
;MyProject.c,93 :: 		else if(!esquerda & index != 0 & On){
	BTFSC       PORTA+0, 3 
	GOTO        L__Interrupt90
	BSF         R4, 0 
	GOTO        L__Interrupt91
L__Interrupt90:
	BCF         R4, 0 
L__Interrupt91:
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R1 
	CLRF        R0 
	BTFSC       R4, 0 
	INCF        R0, 1 
	MOVF        R1, 0 
	ANDWF       R0, 1 
	MOVF        _On+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_Interrupt33
;MyProject.c,94 :: 		esque = 1;
	MOVLW       1
	MOVWF       _esque+0 
;MyProject.c,95 :: 		}
L_Interrupt33:
L_Interrupt32:
L_Interrupt30:
L_Interrupt28:
L_Interrupt26:
L_Interrupt22:
;MyProject.c,96 :: 		INT0IF_bit = 0;
	BCF         INT0IF_bit+0, BitPos(INT0IF_bit+0) 
;MyProject.c,97 :: 		}
L_Interrupt18:
;MyProject.c,98 :: 		}
L_end_Interrupt:
L__Interrupt79:
	RETFIE      1
; end of _Interrupt

_main:

;MyProject.c,100 :: 		void main(){
;MyProject.c,101 :: 		TRISC      = TRISC & ~(1<<0);// Configura o TRISC RC0 como 0 para a saída digital
	BCF         TRISC+0, 0 
;MyProject.c,102 :: 		LATC.RC0  = 0;
	BCF         LATC+0, 0 
;MyProject.c,103 :: 		INT0IE_bit = 0X01;           // Habilita a interrupção externa 0
	BSF         INT0IE_bit+0, BitPos(INT0IE_bit+0) 
;MyProject.c,104 :: 		INTEDG0_bit= 0X00;           // Configura a interrupção externa 0 para a borda de descida
	BCF         INTEDG0_bit+0, BitPos(INTEDG0_bit+0) 
;MyProject.c,105 :: 		GIE_bit    = 1;              // Ativa as interrupções globais
	BSF         GIE_bit+0, BitPos(GIE_bit+0) 
;MyProject.c,107 :: 		reset:
___main_reset:
;MyProject.c,108 :: 		horario    = 0;              // Sentido horário
	BCF         PORTC+0, 1 
;MyProject.c,109 :: 		antihora   = 0;              // Sentido anti horário
	BCF         PORTC+0, 5 
;MyProject.c,111 :: 		Lcd_Init();
	CALL        _Lcd_Init+0, 0
;MyProject.c,112 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,113 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,114 :: 		while(!On);
L_main34:
	MOVF        _On+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main35
	GOTO        L_main34
L_main35:
;MyProject.c,117 :: 		IFAM_NoDisplay();
	CALL        _IFAM_NoDisplay+0, 0
;MyProject.c,118 :: 		Delay_ms(3000);
	MOVLW       77
	MOVWF       R11, 0
	MOVLW       25
	MOVWF       R12, 0
	MOVLW       79
	MOVWF       R13, 0
L_main36:
	DECFSZ      R13, 1, 1
	BRA         L_main36
	DECFSZ      R12, 1, 1
	BRA         L_main36
	DECFSZ      R11, 1, 1
	BRA         L_main36
	NOP
	NOP
;MyProject.c,119 :: 		TCC_NoDisplay();
	CALL        _TCC_NoDisplay+0, 0
;MyProject.c,121 :: 		Delay_ms(2000);
	MOVLW       51
	MOVWF       R11, 0
	MOVLW       187
	MOVWF       R12, 0
	MOVLW       223
	MOVWF       R13, 0
L_main37:
	DECFSZ      R13, 1, 1
	BRA         L_main37
	DECFSZ      R12, 1, 1
	BRA         L_main37
	DECFSZ      R11, 1, 1
	BRA         L_main37
	NOP
	NOP
;MyProject.c,123 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW       1
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,125 :: 		Bancada_Init();
	CALL        _Bancada_Init+0, 0
;MyProject.c,126 :: 		Lcd_Out(1,1,"Frequencia");
	MOVLW       1
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       ?lstr4_MyProject+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(?lstr4_MyProject+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,127 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_5_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_5_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_5_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _frequencia+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _frequencia+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _frequencia+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _frequencia+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,128 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,130 :: 		Delay_ms(3);
	MOVLW       20
	MOVWF       R12, 0
	MOVLW       121
	MOVWF       R13, 0
L_main38:
	DECFSZ      R13, 1, 1
	BRA         L_main38
	DECFSZ      R12, 1, 1
	BRA         L_main38
	NOP
	NOP
;MyProject.c,131 :: 		TMR0IE_bit = 1;              // Ativa a interrupção do Timer 0
	BSF         TMR0IE_bit+0, BitPos(TMR0IE_bit+0) 
;MyProject.c,133 :: 		while(1){
L_main39:
;MyProject.c,134 :: 		if(!On){
	MOVF        _On+0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main41
;MyProject.c,135 :: 		ent = 0;
	CLRF        _ent+0 
;MyProject.c,136 :: 		goto reset;
	GOTO        ___main_reset
;MyProject.c,137 :: 		}
L_main41:
;MyProject.c,138 :: 		if(active){
	MOVF        _active+0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main42
;MyProject.c,139 :: 		Bancada_Frequecy_Out(frequencia);
	MOVF        _frequencia+0, 0 
	MOVWF       FARG_Bancada_Frequecy_Out_freq+0 
	MOVF        _frequencia+1, 0 
	MOVWF       FARG_Bancada_Frequecy_Out_freq+1 
	MOVF        _frequencia+2, 0 
	MOVWF       FARG_Bancada_Frequecy_Out_freq+2 
	MOVF        _frequencia+3, 0 
	MOVWF       FARG_Bancada_Frequecy_Out_freq+3 
	CALL        _Bancada_Frequecy_Out+0, 0
;MyProject.c,140 :: 		}
L_main42:
;MyProject.c,141 :: 		if(ent & index!=0){
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        _ent+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main43
;MyProject.c,142 :: 		Lcd_Cmd(_LCD_UNDERLINE_ON);
	MOVLW       14
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,143 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,144 :: 		active = 0;
	CLRF        _active+0 
;MyProject.c,145 :: 		output = 0;
	CLRF        _output+0 
	CLRF        _output+1 
	CLRF        _output+2 
	CLRF        _output+3 
;MyProject.c,146 :: 		ent = 0;
	CLRF        _ent+0 
;MyProject.c,147 :: 		T2CON =  0x00;
	CLRF        T2CON+0 
;MyProject.c,148 :: 		CCP1CON    = 0x00;
	CLRF        CCP1CON+0 
;MyProject.c,149 :: 		horario    = 0;
	BCF         PORTC+0, 1 
;MyProject.c,150 :: 		antihora   = 0;
	BCF         PORTC+0, 5 
;MyProject.c,151 :: 		}
	GOTO        L_main44
L_main43:
;MyProject.c,152 :: 		else if(ent & index == 0){
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _ent+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main45
;MyProject.c,153 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW       12
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,154 :: 		ent = 0;
	CLRF        _ent+0 
;MyProject.c,155 :: 		active = 1;
	MOVLW       1
	MOVWF       _active+0 
;MyProject.c,156 :: 		T2CON =  0x06;
	MOVLW       6
	MOVWF       T2CON+0 
;MyProject.c,157 :: 		CCP1CON    = 0x0F;
	MOVLW       15
	MOVWF       CCP1CON+0 
;MyProject.c,158 :: 		}
L_main45:
L_main44:
;MyProject.c,159 :: 		if(cim & index==1){
	MOVF        _index+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _cim+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main46
;MyProject.c,160 :: 		frequencia = frequencia + 1.0;
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _frequencia+0 
	MOVF        R1, 0 
	MOVWF       _frequencia+1 
	MOVF        R2, 0 
	MOVWF       _frequencia+2 
	MOVF        R3, 0 
	MOVWF       _frequencia+3 
;MyProject.c,161 :: 		cim=0;
	CLRF        _cim+0 
;MyProject.c,162 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_6_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_6_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_6_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _frequencia+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _frequencia+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _frequencia+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _frequencia+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,163 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,164 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,165 :: 		}
	GOTO        L_main47
L_main46:
;MyProject.c,166 :: 		else if(cim & index ==2){
	MOVF        _index+0, 0 
	XORLW       2
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _cim+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main48
;MyProject.c,167 :: 		frequencia = frequencia + 0.1;
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _frequencia+0 
	MOVF        R1, 0 
	MOVWF       _frequencia+1 
	MOVF        R2, 0 
	MOVWF       _frequencia+2 
	MOVF        R3, 0 
	MOVWF       _frequencia+3 
;MyProject.c,168 :: 		cim=0;
	CLRF        _cim+0 
;MyProject.c,169 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_7_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_7_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_7_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,170 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,171 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,172 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,173 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,174 :: 		}
	GOTO        L_main49
L_main48:
;MyProject.c,175 :: 		else if(cim & index == 3){
	MOVF        _index+0, 0 
	XORLW       3
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _cim+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main50
;MyProject.c,176 :: 		frequencia = frequencia + 0.01;
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       120
	MOVWF       R7 
	CALL        _Add_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _frequencia+0 
	MOVF        R1, 0 
	MOVWF       _frequencia+1 
	MOVF        R2, 0 
	MOVWF       _frequencia+2 
	MOVF        R3, 0 
	MOVWF       _frequencia+3 
;MyProject.c,177 :: 		cim=0;
	CLRF        _cim+0 
;MyProject.c,178 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_8_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_8_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_8_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        R0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        R1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        R2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        R3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,179 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,180 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,181 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,182 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,183 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,184 :: 		}
L_main50:
L_main49:
L_main47:
;MyProject.c,186 :: 		if(baix & index==1){
	MOVF        _index+0, 0 
	XORLW       1
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _baix+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main51
;MyProject.c,187 :: 		if(frequencia > 1) frequencia = frequencia - 1.0;
	MOVF        _frequencia+0, 0 
	MOVWF       R4 
	MOVF        _frequencia+1, 0 
	MOVWF       R5 
	MOVF        _frequencia+2, 0 
	MOVWF       R6 
	MOVF        _frequencia+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main52
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _frequencia+0 
	MOVF        R1, 0 
	MOVWF       _frequencia+1 
	MOVF        R2, 0 
	MOVWF       _frequencia+2 
	MOVF        R3, 0 
	MOVWF       _frequencia+3 
L_main52:
;MyProject.c,188 :: 		if(frequencia < 1) frequencia = 1;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main53
	MOVLW       0
	MOVWF       _frequencia+0 
	MOVLW       0
	MOVWF       _frequencia+1 
	MOVLW       0
	MOVWF       _frequencia+2 
	MOVLW       127
	MOVWF       _frequencia+3 
L_main53:
;MyProject.c,189 :: 		baix=0;
	CLRF        _baix+0 
;MyProject.c,190 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_9_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_9_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_9_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _frequencia+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _frequencia+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _frequencia+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _frequencia+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,191 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,192 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,193 :: 		}
	GOTO        L_main54
L_main51:
;MyProject.c,194 :: 		else if(baix & index ==2){
	MOVF        _index+0, 0 
	XORLW       2
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _baix+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main55
;MyProject.c,195 :: 		if(frequencia > 1) frequencia = frequencia - 0.1;
	MOVF        _frequencia+0, 0 
	MOVWF       R4 
	MOVF        _frequencia+1, 0 
	MOVWF       R5 
	MOVF        _frequencia+2, 0 
	MOVWF       R6 
	MOVF        _frequencia+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main56
	MOVLW       205
	MOVWF       R4 
	MOVLW       204
	MOVWF       R5 
	MOVLW       76
	MOVWF       R6 
	MOVLW       123
	MOVWF       R7 
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _frequencia+0 
	MOVF        R1, 0 
	MOVWF       _frequencia+1 
	MOVF        R2, 0 
	MOVWF       _frequencia+2 
	MOVF        R3, 0 
	MOVWF       _frequencia+3 
L_main56:
;MyProject.c,196 :: 		if(frequencia < 1) frequencia = 1;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main57
	MOVLW       0
	MOVWF       _frequencia+0 
	MOVLW       0
	MOVWF       _frequencia+1 
	MOVLW       0
	MOVWF       _frequencia+2 
	MOVLW       127
	MOVWF       _frequencia+3 
L_main57:
;MyProject.c,197 :: 		baix=0;
	CLRF        _baix+0 
;MyProject.c,198 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_10_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_10_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_10_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _frequencia+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _frequencia+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _frequencia+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _frequencia+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,199 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,200 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,201 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,202 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,203 :: 		}
	GOTO        L_main58
L_main55:
;MyProject.c,204 :: 		else if(baix & index == 3){
	MOVF        _index+0, 0 
	XORLW       3
	MOVLW       1
	BTFSS       STATUS+0, 2 
	MOVLW       0
	MOVWF       R0 
	MOVF        _baix+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main59
;MyProject.c,205 :: 		if(frequencia > 1) frequencia = frequencia - 0.01;
	MOVF        _frequencia+0, 0 
	MOVWF       R4 
	MOVF        _frequencia+1, 0 
	MOVWF       R5 
	MOVF        _frequencia+2, 0 
	MOVWF       R6 
	MOVF        _frequencia+3, 0 
	MOVWF       R7 
	MOVLW       0
	MOVWF       R0 
	MOVLW       0
	MOVWF       R1 
	MOVLW       0
	MOVWF       R2 
	MOVLW       127
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main60
	MOVLW       10
	MOVWF       R4 
	MOVLW       215
	MOVWF       R5 
	MOVLW       35
	MOVWF       R6 
	MOVLW       120
	MOVWF       R7 
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	CALL        _Sub_32x32_FP+0, 0
	MOVF        R0, 0 
	MOVWF       _frequencia+0 
	MOVF        R1, 0 
	MOVWF       _frequencia+1 
	MOVF        R2, 0 
	MOVWF       _frequencia+2 
	MOVF        R3, 0 
	MOVWF       _frequencia+3 
L_main60:
;MyProject.c,206 :: 		if(frequencia < 1) frequencia = 1;
	MOVLW       0
	MOVWF       R4 
	MOVLW       0
	MOVWF       R5 
	MOVLW       0
	MOVWF       R6 
	MOVLW       127
	MOVWF       R7 
	MOVF        _frequencia+0, 0 
	MOVWF       R0 
	MOVF        _frequencia+1, 0 
	MOVWF       R1 
	MOVF        _frequencia+2, 0 
	MOVWF       R2 
	MOVF        _frequencia+3, 0 
	MOVWF       R3 
	CALL        _Compare_Double+0, 0
	MOVLW       1
	BTFSC       STATUS+0, 0 
	MOVLW       0
	MOVWF       R0 
	MOVF        R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main61
	MOVLW       0
	MOVWF       _frequencia+0 
	MOVLW       0
	MOVWF       _frequencia+1 
	MOVLW       0
	MOVWF       _frequencia+2 
	MOVLW       127
	MOVWF       _frequencia+3 
L_main61:
;MyProject.c,207 :: 		baix=0;
	CLRF        _baix+0 
;MyProject.c,208 :: 		sprintf(f_char,"%.2f Hz ", frequencia);
	MOVLW       _f_char+0
	MOVWF       FARG_sprintf_wh+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_sprintf_wh+1 
	MOVLW       ?lstr_11_MyProject+0
	MOVWF       FARG_sprintf_f+0 
	MOVLW       hi_addr(?lstr_11_MyProject+0)
	MOVWF       FARG_sprintf_f+1 
	MOVLW       higher_addr(?lstr_11_MyProject+0)
	MOVWF       FARG_sprintf_f+2 
	MOVF        _frequencia+0, 0 
	MOVWF       FARG_sprintf_wh+5 
	MOVF        _frequencia+1, 0 
	MOVWF       FARG_sprintf_wh+6 
	MOVF        _frequencia+2, 0 
	MOVWF       FARG_sprintf_wh+7 
	MOVF        _frequencia+3, 0 
	MOVWF       FARG_sprintf_wh+8 
	CALL        _sprintf+0, 0
;MyProject.c,209 :: 		Lcd_Out(2,1,f_char);
	MOVLW       2
	MOVWF       FARG_Lcd_Out_row+0 
	MOVLW       1
	MOVWF       FARG_Lcd_Out_column+0 
	MOVLW       _f_char+0
	MOVWF       FARG_Lcd_Out_text+0 
	MOVLW       hi_addr(_f_char+0)
	MOVWF       FARG_Lcd_Out_text+1 
	CALL        _Lcd_Out+0, 0
;MyProject.c,210 :: 		Lcd_Cmd(_LCD_SECOND_ROW);
	MOVLW       192
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,211 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,212 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,213 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,214 :: 		}
L_main59:
L_main58:
L_main54:
;MyProject.c,216 :: 		if(dire & index != 0){
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        _dire+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main62
;MyProject.c,217 :: 		if(index<3){
	MOVLW       3
	SUBWF       _index+0, 0 
	BTFSC       STATUS+0, 0 
	GOTO        L_main63
;MyProject.c,218 :: 		if(index == 1){
	MOVF        _index+0, 0 
	XORLW       1
	BTFSS       STATUS+0, 2 
	GOTO        L_main64
;MyProject.c,219 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,220 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,221 :: 		}
	GOTO        L_main65
L_main64:
;MyProject.c,222 :: 		else Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
	MOVLW       20
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
L_main65:
;MyProject.c,223 :: 		index++;
	INCF        _index+0, 1 
;MyProject.c,225 :: 		}
L_main63:
;MyProject.c,226 :: 		dire = 0;
	CLRF        _dire+0 
;MyProject.c,227 :: 		}
L_main62:
;MyProject.c,229 :: 		if(esque & index != 0){
	MOVF        _index+0, 0 
	XORLW       0
	MOVLW       0
	BTFSS       STATUS+0, 2 
	MOVLW       1
	MOVWF       R0 
	MOVF        _esque+0, 0 
	ANDWF       R0, 1 
	BTFSC       STATUS+0, 2 
	GOTO        L_main66
;MyProject.c,230 :: 		if(index>1){
	MOVF        _index+0, 0 
	SUBLW       1
	BTFSC       STATUS+0, 0 
	GOTO        L_main67
;MyProject.c,231 :: 		if(index == 2){
	MOVF        _index+0, 0 
	XORLW       2
	BTFSS       STATUS+0, 2 
	GOTO        L_main68
;MyProject.c,232 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW       16
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,233 :: 		Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW       16
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
;MyProject.c,234 :: 		}
	GOTO        L_main69
L_main68:
;MyProject.c,235 :: 		else Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
	MOVLW       16
	MOVWF       FARG_Lcd_Cmd_out_char+0 
	CALL        _Lcd_Cmd+0, 0
L_main69:
;MyProject.c,236 :: 		index--;
	DECF        _index+0, 1 
;MyProject.c,237 :: 		}
L_main67:
;MyProject.c,238 :: 		esque = 0;
	CLRF        _esque+0 
;MyProject.c,239 :: 		}
L_main66:
;MyProject.c,240 :: 		}
	GOTO        L_main39
;MyProject.c,241 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

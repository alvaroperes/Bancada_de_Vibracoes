 #ifndef __LCD_ALVARO_H
 #define __LCD_ALVARO_H
 
 #define cima      PORTA.RA0
 #define baixo     PORTA.RA1
 #define direita   PORTA.RA2
 #define esquerda  PORTA.RA3
 #define enter     PORTA.RA4
 #define OnOff     PORTE.RE3
 #define horario   PORTC.RC1
 #define antihora  PORTC.RC5
 
 sbit LCD_RS at RB7_bit;
 sbit LCD_EN at RB6_bit;
 sbit LCD_D4 at RB5_bit;
 sbit LCD_D5 at RB4_bit;
 sbit LCD_D6 at RB3_bit;
 sbit LCD_D7 at RB2_bit;

 sbit LCD_RS_Direction at TRISB7_bit;
 sbit LCD_EN_Direction at TRISB6_bit;
 sbit LCD_D4_Direction at TRISB5_bit;
 sbit LCD_D5_Direction at TRISB4_bit;
 sbit LCD_D6_Direction at TRISB3_bit;
 sbit LCD_D7_Direction at TRISB2_bit;
 
 const char IFAM1[] = {14,31,14,0,31,31,31,31};
 const char IFAM2[] = {31,31,31,0,31,31,31,31};
 const char IFAM3[] = {31,31,31,0,0,0,0,0};
 const char IFAM4[] = {0,0,0,0,12,18,30,18};
 const char A_acento[] = {1,2,0,14,17,31,17,0};
 
 void TCC_NoDisplay(){
     Lcd_Cmd(_LCD_CLEAR);
     Lcd_Chr(1,1,0);
     Lcd_Chr(2,1,1);
     Lcd_Chr(2,2,1);
     Lcd_Chr(1,2,1);
     Lcd_Chr(1,3,2);
     Lcd_Chr(2,3,2);
     Lcd_Out(1,4,"TCC");
     Lcd_Chr(2,4,4);
     Lcd_Out(2,5,"lvaro Peres");
 }

 void IFAM_NoDisplay(){
     char i;
     Lcd_Cmd(64);
     for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM1[i]);
     Lcd_Cmd(72);
     for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM2[i]);
     Lcd_Cmd(80);
     for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM3[i]);
     Lcd_Cmd(88);
     for (i = 0; i<=7; i++) Lcd_Chr_CP(IFAM4[i]);
     Lcd_Cmd(96);
     for (i = 0; i<=7; i++) Lcd_Chr_CP(A_acento[i]);

     Lcd_Chr(1,1,0);
     Lcd_Chr(2,1,1);
     Lcd_Chr(2,2,1);
     Lcd_Chr(1,2,1);
     Lcd_Chr(1,3,2);
     Lcd_Chr(2,3,2);
     Lcd_Out(1,4,"AM - CMDI");
}


 
 #endif
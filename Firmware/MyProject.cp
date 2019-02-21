#line 1 "C:/Users/Administrador/Documents/Álvaro/TCC/Aqui/LCD - uC/MyProject.c"
#line 1 "c:/users/administrador/documents/Álvaro/tcc/aqui/lcd - uc/lcd_alvaro.h"
#line 13 "c:/users/administrador/documents/Álvaro/tcc/aqui/lcd - uc/lcd_alvaro.h"
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
#line 3 "C:/Users/Administrador/Documents/Álvaro/TCC/Aqui/LCD - uC/MyProject.c"
float frequencia = 1.00;
char f_char[20];

int cont = 0;
float tempo = 0;
float output;
char ent=0,cim=0,dire=0,esque=0,baix=0,index=0,active=1,On=0;

void Bancada_Init(void){
 ADCON1 = 0X0F;
 TRISA = 0x1F;

 TRISC = TRISC & ~(1<<2);
 TRISC = TRISC & ~(1<<1);
 TRISC = TRISC & ~(1<<5);

 CMCON = 0X07;
 CCP1CON = 0x0F;

 T0CON = 0x88;
 TMR0H = 0x9E;
 TMR0L = 0x58;

  PORTC.RC1  = 0;
  PORTC.RC5  = 0;
#line 34 "C:/Users/Administrador/Documents/Álvaro/TCC/Aqui/LCD - uC/MyProject.c"
 PR2 = 0xff;
 T2CON = 0x06;
 CCPR1L = 0x00;


}

void Bancada_Frequecy_Out(float freq){
 output = 1023*sin(2*3.1415*freq*tempo);
 if(output > 0){
  PORTC.RC1  = 1;
  PORTC.RC5  = 0;
 }
 else{
  PORTC.RC1  = 0;
  PORTC.RC5  = 1;
 }
 DC1B0_bit = (unsigned long) output & 0x01;
 DC1B1_bit = (unsigned long) output & 0x02;
 CCPR1L = (unsigned long) output >> 2;

}

void Interrupt(void){
 if(TMR0IF_bit){
 TMR0H = 0x9E;
 TMR0L = 0x58;

 tempo=tempo+0.005;

 TMR0IF_bit = 0;
 }
 if(INT0IF_bit){
 if (! PORTE.RE3 ){
 On = ~On;
 LATC.RC0 = On;
 if(!On){
 T2CON = 0x00;
 CCP1CON = 0x00;
 }
 else{
 T2CON = 0x06;
 CCP1CON = 0x0F;
 }
 }
 else if(! PORTA.RA4  & On){
 ent = 1;
 if(index == 0) index=1;
 else index=0;
 }
 else if(! PORTA.RA0  & index != 0 & On){
 cim = 1;
 }
 else if(! PORTA.RA1  & index != 0 & On){
 baix = 1;
 }
 else if(! PORTA.RA2  & index != 0 & On){
 dire = 1;
 }
 else if(! PORTA.RA3  & index != 0 & On){
 esque = 1;
 }
 INT0IF_bit = 0;
 }
}

void main(){
 TRISC = TRISC & ~(1<<0);
 LATC.RC0 = 0;
 INT0IE_bit = 0X01;
 INTEDG0_bit= 0X00;
 GIE_bit = 1;

 reset:
  PORTC.RC1  = 0;
  PORTC.RC5  = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 while(!On);


 IFAM_NoDisplay();
 Delay_ms(3000);
 TCC_NoDisplay();

 Delay_ms(2000);

 Lcd_Cmd(_LCD_CLEAR);

 Bancada_Init();
 Lcd_Out(1,1,"Frequencia");
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);

 Delay_ms(3);
 TMR0IE_bit = 1;

 while(1){
 if(!On){
 ent = 0;
 goto reset;
 }
 if(active){
 Bancada_Frequecy_Out(frequencia);
 }
 if(ent & index!=0){
 Lcd_Cmd(_LCD_UNDERLINE_ON);
 Lcd_Cmd(_LCD_SECOND_ROW);
 active = 0;
 output = 0;
 ent = 0;
 T2CON = 0x00;
 CCP1CON = 0x00;
  PORTC.RC1  = 0;
  PORTC.RC5  = 0;
 }
 else if(ent & index == 0){
 Lcd_Cmd(_LCD_CURSOR_OFF);
 ent = 0;
 active = 1;
 T2CON = 0x06;
 CCP1CON = 0x0F;
 }
 if(cim & index==1){
 frequencia = frequencia + 1.0;
 cim=0;
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);
 Lcd_Cmd(_LCD_SECOND_ROW);
 }
 else if(cim & index ==2){
 frequencia = frequencia + 0.1;
 cim=0;
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
 else if(cim & index == 3){
 frequencia = frequencia + 0.01;
 cim=0;
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }

 if(baix & index==1){
 if(frequencia > 1) frequencia = frequencia - 1.0;
 if(frequencia < 1) frequencia = 1;
 baix=0;
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);
 Lcd_Cmd(_LCD_SECOND_ROW);
 }
 else if(baix & index ==2){
 if(frequencia > 1) frequencia = frequencia - 0.1;
 if(frequencia < 1) frequencia = 1;
 baix=0;
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
 else if(baix & index == 3){
 if(frequencia > 1) frequencia = frequencia - 0.01;
 if(frequencia < 1) frequencia = 1;
 baix=0;
 sprintf(f_char,"%.2f Hz ", frequencia);
 Lcd_Out(2,1,f_char);
 Lcd_Cmd(_LCD_SECOND_ROW);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }

 if(dire & index != 0){
 if(index<3){
 if(index == 1){
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 }
 else Lcd_Cmd(_LCD_MOVE_CURSOR_RIGHT);
 index++;

 }
 dire = 0;
 }

 if(esque & index != 0){
 if(index>1){
 if(index == 2){
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 }
 else Lcd_Cmd(_LCD_MOVE_CURSOR_LEFT);
 index--;
 }
 esque = 0;
 }
 }
}

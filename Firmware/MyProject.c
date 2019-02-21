#include "LCD_Alvaro.h"

float frequencia = 1.00;
char f_char[20];

int cont = 0;
float tempo = 0;
float output;
char ent=0,cim=0,dire=0,esque=0,baix=0,index=0,active=1,On=0;

void Bancada_Init(void){
      ADCON1     = 0X0F;           // Configura todos os pinos analógicos como digitais
      TRISA      = 0x1F;
      
      TRISC      = TRISC & ~(1<<2);// Configura o TRISC RC2 como 0 para PWM output
      TRISC      = TRISC & ~(1<<1);// Saída digital para controle de posição do motor
      TRISC      = TRISC & ~(1<<5);// Saída digital para controle de posição do motor

      CMCON      = 0X07;           // Desabilita os comparadores
      CCP1CON    = 0x0F;           // Configura o registrador CCP1 no modo PWM
      
      T0CON      = 0x88;           // Inicializa do Timer0 com 16 bits
      TMR0H      = 0x9E;           // Configura o flag do Timer0 para estourar em 5ms para a configuração do período de amostragem
      TMR0L      = 0x58;
      
      horario    = 0;
      antihora   = 0;
/**************************************************************************************************
// Ciclo de máquina (Tosc): Fosc = F / 4 = 20 MHz / 4 = 5 MHz ; Tosc = 1/5MHz = 0.2 us            /
//   Período do PWM: Tpwm =    (PR2 + 1) * Ciclo de Máquina * prescaler                           /
//                        =     256  * 0.2us * 16 =  0,8192 ms                                    /
//   Frequência PWM: fpwm =     1/Tpwm =~ 1,22 kHz                                                /
**************************************************************************************************/
      PR2 = 0xff;            // Registrador de estouro do Timer2
      T2CON =  0x06;         // Inicializa o Timer2 com presacaler de 1:16 e com 8 bits
      CCPR1L  = 0x00;        // Configura o Duty Cycle do PWM para 0
// Regra do PWM (10 bits) : 8 bits mais significativos = CCPR1L
//                          2 bits menos significativos= CCP1CON < 5:4>
}

void Bancada_Frequecy_Out(float freq){
     output = 1023*sin(2*3.1415*freq*tempo);
     if(output > 0){
         horario    = 1;              // Sentido horário
         antihora   = 0;              // Sentido anti horário
     }
     else{
         horario    = 0;              // Sentido horário
         antihora   = 1;              // Sentido anti horário
     }
     DC1B0_bit = (unsigned long) output & 0x01;
     DC1B1_bit = (unsigned long) output & 0x02;
     CCPR1L = (unsigned long) output >> 2;
//     CCP1CON = CCP1CON | ((unsigned long) (output )) & 0x30;
}

void Interrupt(void){
  if(TMR0IF_bit){
    TMR0H         = 0x9E;
    TMR0L         = 0x58;

    tempo=tempo+0.005;
    
    TMR0IF_bit = 0;
  }
  if(INT0IF_bit){
      if (!OnOff){
          On = ~On;
          LATC.RC0 = On;
          if(!On){
                T2CON   = 0x00;
                CCP1CON = 0x00;
          }
          else{
                T2CON   = 0x06;
                CCP1CON = 0x0F;
          }
      }
      else if(!enter & On){
          ent = 1;
          if(index == 0) index=1;
          else index=0;
      }
      else if(!cima & index != 0 & On){
          cim = 1;
      }
      else if(!baixo & index != 0 & On){
         baix = 1;
      }
      else if(!direita & index != 0 & On){
         dire = 1;
      }
      else if(!esquerda & index != 0 & On){
         esque = 1;
      }
      INT0IF_bit = 0;
  }
}

void main(){
      TRISC      = TRISC & ~(1<<0);// Configura o TRISC RC0 como 0 para a saída digital
      LATC.RC0  = 0;
      INT0IE_bit = 0X01;           // Habilita a interrupção externa 0
      INTEDG0_bit= 0X00;           // Configura a interrupção externa 0 para a borda de descida
      GIE_bit    = 1;              // Ativa as interrupções globais

      reset:
      horario    = 0;              // Sentido horário
      antihora   = 0;              // Sentido anti horário

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
      TMR0IE_bit = 1;              // Ativa a interrupção do Timer 0

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
                T2CON =  0x00;
                CCP1CON    = 0x00;
                horario    = 0;
                antihora   = 0;
            }
            else if(ent & index == 0){
                Lcd_Cmd(_LCD_CURSOR_OFF);
                ent = 0;
                active = 1;
                T2CON =  0x06;
                CCP1CON    = 0x0F;
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
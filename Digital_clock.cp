#line 1 "C:/Users/Isuru/Desktop/AA2163_Assignment1/Examples/Digital_Clock/Digital_clock.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for pic/include/string.h"





void * memchr(void *p, char n, unsigned int v);
int memcmp(void *s1, void *s2, int n);
void * memcpy(void * d1, void * s1, int n);
void * memmove(void * to, void * from, int n);
void * memset(void * p1, char character, int n);
char * strcat(char * to, char * from);
char * strchr(char * ptr, char chr);
int strcmp(char * s1, char * s2);
char * strcpy(char * to, char * from);
int strlen(char * s);
char * strncat(char * to, char * from, int size);
char * strncpy(char * to, char * from, int size);
int strspn(char * str1, char * str2);
char strcspn(char * s1, char * s2);
int strncmp(char * s1, char * s2, char len);
char * strpbrk(char * s1, char * s2);
char * strrchr(char *ptr, char chr);
char * strstr(char * s1, char * s2);
char * strtok(char * s1, char * s2);
#line 4 "C:/Users/Isuru/Desktop/AA2163_Assignment1/Examples/Digital_Clock/Digital_clock.c"
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;


sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;

char time[9]= "hh:mm";

char date[12] = "dd:mm:yyyy";


char text1[] = "  DIGITAL CLOCK  ";
char text2[] = "DESIGNED BY AA2163   ";


int sec = 0, min = 0, hrs = 0;
int day = 27, month = 2, year = 2023;
int i;
int overflows = 0;

void set_time_string(){

 time[4] = min%10 + 48;
 time[3] = min/10 + 48;

 time[1] = hrs%10 + 48;
 time[0] = hrs/10 + 48;
}

void set_time(){
 if(sec==60){
 min++;
 sec = 0;
 }
 if(min==60){
 hrs++;
 min = 0;
 }
 if(hrs==24){
 day++;
 hrs = 0;
 }
}
void set_date_string(){
 date[0] = day/10 + 48;
 date[1] = day%10 + 48;

 date[3] = month/10 + 48;
 date[4] = month%10 + 48;

 date[6] = (year/1000) + 48;
 date[7] = ((year/100)%10) + 48;
 date[8] = ((year/10)%10) + 48;
 date[9] = (year%10) + 48;
}

void set_date(){

 if (day > 31) {
 month++;
 day = 1;
 }
 else if (day == 31 && (month == 4 || month == 6 || month == 9 || month == 11)) {
 month++;
 day = 1;
 }
 else if (day == 30 && month == 2) {
 month++;
 day = 1;
 }
 else if (day == 29 && month == 2 && (year%4 != 0 || (year%100 == 0 && year%400 != 0))) {
 month++;
 day = 1;
 }
 if(month == 13){
 year++;
 month = 1;
 }
}

void adjust_Time_n_Date(){
 if(PORTC.B0 == 1){
 delay_ms(500);
 min++;
 }
 if(PORTC.B1 == 1) {
 hrs++;
 }
 if(PORTC.B2 == 1) {
 day++;
 }
 if(PORTC.B3 == 1) {
 month++;
 }
 if(PORTC.B4 == 1) {
 year++;
 }

}


void initialize_code(){
 TRISC = 1;
 PORTC = 0;

 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);

 for(i=0;i<20;i++){
 Lcd_Out(1,16,text1);
 Lcd_Out(2,16,text2);
 Lcd_Cmd(_LCD_SHIFT_LEFT);
 delay_ms(50);
 }

 Lcd_Cmd( _LCD_CLEAR );
 Lcd_out(1,5," Set the ");
 Lcd_out(2,4,"Date & Time");
 delay_ms(1000);

 Lcd_Cmd( _LCD_CLEAR );
 Lcd_Out(1,1, "Time");
 Lcd_Out(2,1, "Date");

 T0CS_bit = 0;
 PSA_bit = 0;
 PS0_bit = 1;
 PS1_bit = 1;
 PS2_bit = 1;

 TMR0 = 190;
 TMR0IF_bit = 0;
 TMR0IE_bit = 1;
 GIE_bit = 1;
}

void interrupt(){
 if(TMR0IF_bit == 1){
 overflows++;
 if(overflows ==16){
 sec++;
 overflows = 0;
 TMR0 = 190;
 }
 TMR0IF_bit = 0;
 }
}



void main() {
 initialize_code();
 while(1){
 set_time();
 set_time_string();
 set_date();
 set_date_string();

 adjust_Time_n_Date();

 Lcd_Out(1,6,time);
 Lcd_Out(2,6,date);
 Lcd_Chr(1, 8, ' ');
 Delay_ms(250);
 Lcd_Chr(1, 8, ':');
 Delay_ms(250);
 }

}

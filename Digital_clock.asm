
_set_time_string:

;Digital_clock.c,33 :: 		void set_time_string(){
;Digital_clock.c,35 :: 		time[4] = min%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _min+0, 0
	MOVWF      R0+0
	MOVF       _min+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+4
;Digital_clock.c,36 :: 		time[3] = min/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _min+0, 0
	MOVWF      R0+0
	MOVF       _min+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+3
;Digital_clock.c,38 :: 		time[1] = hrs%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	MOVF       _hrs+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+1
;Digital_clock.c,39 :: 		time[0] = hrs/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _hrs+0, 0
	MOVWF      R0+0
	MOVF       _hrs+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _time+0
;Digital_clock.c,40 :: 		}
L_end_set_time_string:
	RETURN
; end of _set_time_string

_set_time:

;Digital_clock.c,42 :: 		void set_time(){
;Digital_clock.c,43 :: 		if(sec==60){
	MOVLW      0
	XORWF      _sec+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_time48
	MOVLW      60
	XORWF      _sec+0, 0
L__set_time48:
	BTFSS      STATUS+0, 2
	GOTO       L_set_time0
;Digital_clock.c,44 :: 		min++;
	INCF       _min+0, 1
	BTFSC      STATUS+0, 2
	INCF       _min+1, 1
;Digital_clock.c,45 :: 		sec = 0;
	CLRF       _sec+0
	CLRF       _sec+1
;Digital_clock.c,46 :: 		}
L_set_time0:
;Digital_clock.c,47 :: 		if(min==60){
	MOVLW      0
	XORWF      _min+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_time49
	MOVLW      60
	XORWF      _min+0, 0
L__set_time49:
	BTFSS      STATUS+0, 2
	GOTO       L_set_time1
;Digital_clock.c,48 :: 		hrs++;
	INCF       _hrs+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hrs+1, 1
;Digital_clock.c,49 :: 		min = 0;
	CLRF       _min+0
	CLRF       _min+1
;Digital_clock.c,50 :: 		}
L_set_time1:
;Digital_clock.c,51 :: 		if(hrs==24){
	MOVLW      0
	XORWF      _hrs+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_time50
	MOVLW      24
	XORWF      _hrs+0, 0
L__set_time50:
	BTFSS      STATUS+0, 2
	GOTO       L_set_time2
;Digital_clock.c,52 :: 		day++;
	INCF       _day+0, 1
	BTFSC      STATUS+0, 2
	INCF       _day+1, 1
;Digital_clock.c,53 :: 		hrs = 0;
	CLRF       _hrs+0
	CLRF       _hrs+1
;Digital_clock.c,54 :: 		}
L_set_time2:
;Digital_clock.c,55 :: 		}
L_end_set_time:
	RETURN
; end of _set_time

_set_date_string:

;Digital_clock.c,56 :: 		void set_date_string(){
;Digital_clock.c,57 :: 		date[0] = day/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _day+0, 0
	MOVWF      R0+0
	MOVF       _day+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+0
;Digital_clock.c,58 :: 		date[1] = day%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _day+0, 0
	MOVWF      R0+0
	MOVF       _day+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+1
;Digital_clock.c,60 :: 		date[3] = month/10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _month+0, 0
	MOVWF      R0+0
	MOVF       _month+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+3
;Digital_clock.c,61 :: 		date[4] = month%10 + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _month+0, 0
	MOVWF      R0+0
	MOVF       _month+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+4
;Digital_clock.c,63 :: 		date[6] = (year/1000) + 48;
	MOVLW      232
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+6
;Digital_clock.c,64 :: 		date[7] = ((year/100)%10) + 48;
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+7
;Digital_clock.c,65 :: 		date[8] = ((year/10)%10) + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+8
;Digital_clock.c,66 :: 		date[9] = (year%10) + 48;
	MOVLW      10
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      48
	ADDWF      R0+0, 0
	MOVWF      _date+9
;Digital_clock.c,67 :: 		}
L_end_set_date_string:
	RETURN
; end of _set_date_string

_set_date:

;Digital_clock.c,69 :: 		void set_date(){
;Digital_clock.c,71 :: 		if (day > 31) {
	MOVLW      128
	MOVWF      R0+0
	MOVLW      128
	XORWF      _day+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date53
	MOVF       _day+0, 0
	SUBLW      31
L__set_date53:
	BTFSC      STATUS+0, 0
	GOTO       L_set_date3
;Digital_clock.c,72 :: 		month++;
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
;Digital_clock.c,73 :: 		day = 1; // reset to 1 after 31
	MOVLW      1
	MOVWF      _day+0
	MOVLW      0
	MOVWF      _day+1
;Digital_clock.c,74 :: 		}
	GOTO       L_set_date4
L_set_date3:
;Digital_clock.c,75 :: 		else if (day == 31 && (month == 4 || month == 6 || month == 9 || month == 11)) {
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date54
	MOVLW      31
	XORWF      _day+0, 0
L__set_date54:
	BTFSS      STATUS+0, 2
	GOTO       L_set_date9
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date55
	MOVLW      4
	XORWF      _month+0, 0
L__set_date55:
	BTFSC      STATUS+0, 2
	GOTO       L__set_date45
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date56
	MOVLW      6
	XORWF      _month+0, 0
L__set_date56:
	BTFSC      STATUS+0, 2
	GOTO       L__set_date45
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date57
	MOVLW      9
	XORWF      _month+0, 0
L__set_date57:
	BTFSC      STATUS+0, 2
	GOTO       L__set_date45
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date58
	MOVLW      11
	XORWF      _month+0, 0
L__set_date58:
	BTFSC      STATUS+0, 2
	GOTO       L__set_date45
	GOTO       L_set_date9
L__set_date45:
L__set_date44:
;Digital_clock.c,76 :: 		month++;
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
;Digital_clock.c,77 :: 		day = 1; // reset to 1 after 30 for months with 30 days
	MOVLW      1
	MOVWF      _day+0
	MOVLW      0
	MOVWF      _day+1
;Digital_clock.c,78 :: 		}
	GOTO       L_set_date10
L_set_date9:
;Digital_clock.c,79 :: 		else if (day == 30 && month == 2) {
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date59
	MOVLW      30
	XORWF      _day+0, 0
L__set_date59:
	BTFSS      STATUS+0, 2
	GOTO       L_set_date13
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date60
	MOVLW      2
	XORWF      _month+0, 0
L__set_date60:
	BTFSS      STATUS+0, 2
	GOTO       L_set_date13
L__set_date43:
;Digital_clock.c,80 :: 		month++;
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
;Digital_clock.c,81 :: 		day = 1; // reset to 1 after 29 for February
	MOVLW      1
	MOVWF      _day+0
	MOVLW      0
	MOVWF      _day+1
;Digital_clock.c,82 :: 		}
	GOTO       L_set_date14
L_set_date13:
;Digital_clock.c,83 :: 		else if (day == 29 && month == 2 && (year%4 != 0 || (year%100 == 0 && year%400 != 0))) {
	MOVLW      0
	XORWF      _day+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date61
	MOVLW      29
	XORWF      _day+0, 0
L__set_date61:
	BTFSS      STATUS+0, 2
	GOTO       L_set_date21
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date62
	MOVLW      2
	XORWF      _month+0, 0
L__set_date62:
	BTFSS      STATUS+0, 2
	GOTO       L_set_date21
	MOVLW      4
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date63
	MOVLW      0
	XORWF      R0+0, 0
L__set_date63:
	BTFSS      STATUS+0, 2
	GOTO       L__set_date41
	MOVLW      100
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date64
	MOVLW      0
	XORWF      R0+0, 0
L__set_date64:
	BTFSS      STATUS+0, 2
	GOTO       L__set_date42
	MOVLW      144
	MOVWF      R4+0
	MOVLW      1
	MOVWF      R4+1
	MOVF       _year+0, 0
	MOVWF      R0+0
	MOVF       _year+1, 0
	MOVWF      R0+1
	CALL       _Div_16x16_S+0
	MOVF       R8+0, 0
	MOVWF      R0+0
	MOVF       R8+1, 0
	MOVWF      R0+1
	MOVLW      0
	XORWF      R0+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date65
	MOVLW      0
	XORWF      R0+0, 0
L__set_date65:
	BTFSC      STATUS+0, 2
	GOTO       L__set_date42
	GOTO       L__set_date41
L__set_date42:
	GOTO       L_set_date21
L__set_date41:
L__set_date40:
;Digital_clock.c,84 :: 		month++;
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
;Digital_clock.c,85 :: 		day = 1; // reset to 1 after 28 for non-leap years
	MOVLW      1
	MOVWF      _day+0
	MOVLW      0
	MOVWF      _day+1
;Digital_clock.c,86 :: 		}
L_set_date21:
L_set_date14:
L_set_date10:
L_set_date4:
;Digital_clock.c,87 :: 		if(month == 13){
	MOVLW      0
	XORWF      _month+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__set_date66
	MOVLW      13
	XORWF      _month+0, 0
L__set_date66:
	BTFSS      STATUS+0, 2
	GOTO       L_set_date22
;Digital_clock.c,88 :: 		year++;                    //Increase no. of years after 12 months
	INCF       _year+0, 1
	BTFSC      STATUS+0, 2
	INCF       _year+1, 1
;Digital_clock.c,89 :: 		month = 1;
	MOVLW      1
	MOVWF      _month+0
	MOVLW      0
	MOVWF      _month+1
;Digital_clock.c,90 :: 		}
L_set_date22:
;Digital_clock.c,91 :: 		}
L_end_set_date:
	RETURN
; end of _set_date

_adjust_Time_n_Date:

;Digital_clock.c,93 :: 		void adjust_Time_n_Date(){
;Digital_clock.c,94 :: 		if(PORTC.B0 == 1){        //Button for adjust minitues
	BTFSS      PORTC+0, 0
	GOTO       L_adjust_Time_n_Date23
;Digital_clock.c,95 :: 		delay_ms(500);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_adjust_Time_n_Date24:
	DECFSZ     R13+0, 1
	GOTO       L_adjust_Time_n_Date24
	DECFSZ     R12+0, 1
	GOTO       L_adjust_Time_n_Date24
	DECFSZ     R11+0, 1
	GOTO       L_adjust_Time_n_Date24
	NOP
	NOP
;Digital_clock.c,96 :: 		min++;
	INCF       _min+0, 1
	BTFSC      STATUS+0, 2
	INCF       _min+1, 1
;Digital_clock.c,97 :: 		}
L_adjust_Time_n_Date23:
;Digital_clock.c,98 :: 		if(PORTC.B1 == 1) {        //Button for adjust hours
	BTFSS      PORTC+0, 1
	GOTO       L_adjust_Time_n_Date25
;Digital_clock.c,99 :: 		hrs++;
	INCF       _hrs+0, 1
	BTFSC      STATUS+0, 2
	INCF       _hrs+1, 1
;Digital_clock.c,100 :: 		}
L_adjust_Time_n_Date25:
;Digital_clock.c,101 :: 		if(PORTC.B2 == 1) {       //Button for adjust days
	BTFSS      PORTC+0, 2
	GOTO       L_adjust_Time_n_Date26
;Digital_clock.c,102 :: 		day++;
	INCF       _day+0, 1
	BTFSC      STATUS+0, 2
	INCF       _day+1, 1
;Digital_clock.c,103 :: 		}
L_adjust_Time_n_Date26:
;Digital_clock.c,104 :: 		if(PORTC.B3 == 1) {        //Button for adjust months
	BTFSS      PORTC+0, 3
	GOTO       L_adjust_Time_n_Date27
;Digital_clock.c,105 :: 		month++;
	INCF       _month+0, 1
	BTFSC      STATUS+0, 2
	INCF       _month+1, 1
;Digital_clock.c,106 :: 		}
L_adjust_Time_n_Date27:
;Digital_clock.c,107 :: 		if(PORTC.B4 == 1) {       //Button for adjust years
	BTFSS      PORTC+0, 4
	GOTO       L_adjust_Time_n_Date28
;Digital_clock.c,108 :: 		year++;
	INCF       _year+0, 1
	BTFSC      STATUS+0, 2
	INCF       _year+1, 1
;Digital_clock.c,109 :: 		}
L_adjust_Time_n_Date28:
;Digital_clock.c,111 :: 		}
L_end_adjust_Time_n_Date:
	RETURN
; end of _adjust_Time_n_Date

_initialize_code:

;Digital_clock.c,114 :: 		void initialize_code(){
;Digital_clock.c,115 :: 		TRISC = 1;   //portC - Inputs
	MOVLW      1
	MOVWF      TRISC+0
;Digital_clock.c,116 :: 		PORTC = 0;   //Value of PortC 0
	CLRF       PORTC+0
;Digital_clock.c,118 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Digital_clock.c,119 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  //Curser Off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital_clock.c,121 :: 		for(i=0;i<20;i++){
	CLRF       _i+0
	CLRF       _i+1
L_initialize_code29:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__initialize_code69
	MOVLW      20
	SUBWF      _i+0, 0
L__initialize_code69:
	BTFSC      STATUS+0, 0
	GOTO       L_initialize_code30
;Digital_clock.c,122 :: 		Lcd_Out(1,16,text1);                         // Write text in first row
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text1+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,123 :: 		Lcd_Out(2,16,text2);                        // Write text in second row
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      16
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _text2+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,124 :: 		Lcd_Cmd(_LCD_SHIFT_LEFT);                   // Move text to the left
	MOVLW      24
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital_clock.c,125 :: 		delay_ms(50);                               //shifting speed
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_initialize_code32:
	DECFSZ     R13+0, 1
	GOTO       L_initialize_code32
	DECFSZ     R12+0, 1
	GOTO       L_initialize_code32
	NOP
	NOP
;Digital_clock.c,121 :: 		for(i=0;i<20;i++){
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Digital_clock.c,126 :: 		}
	GOTO       L_initialize_code29
L_initialize_code30:
;Digital_clock.c,128 :: 		Lcd_Cmd( _LCD_CLEAR );                          //clear the display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital_clock.c,129 :: 		Lcd_out(1,5," Set the ");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Digital_clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,130 :: 		Lcd_out(2,4,"Date & Time");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Digital_clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,131 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_initialize_code33:
	DECFSZ     R13+0, 1
	GOTO       L_initialize_code33
	DECFSZ     R12+0, 1
	GOTO       L_initialize_code33
	DECFSZ     R11+0, 1
	GOTO       L_initialize_code33
	NOP
	NOP
;Digital_clock.c,133 :: 		Lcd_Cmd( _LCD_CLEAR );
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Digital_clock.c,134 :: 		Lcd_Out(1,1, "Time");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Digital_clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,135 :: 		Lcd_Out(2,1, "Date");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr4_Digital_clock+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,137 :: 		T0CS_bit = 0;    // Set the clock source to internal clock cycle
	BCF        T0CS_bit+0, BitPos(T0CS_bit+0)
;Digital_clock.c,138 :: 		PSA_bit = 0;     // Assign the pre-scaler to Timer0
	BCF        PSA_bit+0, BitPos(PSA_bit+0)
;Digital_clock.c,139 :: 		PS0_bit = 1;     // Assign pre-scaler as 256
	BSF        PS0_bit+0, BitPos(PS0_bit+0)
;Digital_clock.c,140 :: 		PS1_bit = 1;
	BSF        PS1_bit+0, BitPos(PS1_bit+0)
;Digital_clock.c,141 :: 		PS2_bit = 1;
	BSF        PS2_bit+0, BitPos(PS2_bit+0)
;Digital_clock.c,143 :: 		TMR0 = 190;          //cause of parital overflow
	MOVLW      190
	MOVWF      TMR0+0
;Digital_clock.c,144 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Digital_clock.c,145 :: 		TMR0IE_bit = 1;
	BSF        TMR0IE_bit+0, BitPos(TMR0IE_bit+0)
;Digital_clock.c,146 :: 		GIE_bit = 1;
	BSF        GIE_bit+0, BitPos(GIE_bit+0)
;Digital_clock.c,147 :: 		}
L_end_initialize_code:
	RETURN
; end of _initialize_code

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Digital_clock.c,149 :: 		void interrupt(){
;Digital_clock.c,150 :: 		if(TMR0IF_bit == 1){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_interrupt34
;Digital_clock.c,151 :: 		overflows++;
	INCF       _overflows+0, 1
	BTFSC      STATUS+0, 2
	INCF       _overflows+1, 1
;Digital_clock.c,152 :: 		if(overflows ==16){      // including the partial overflow it is required to complete 16 overflows for a 1 s period
	MOVLW      0
	XORWF      _overflows+1, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt72
	MOVLW      16
	XORWF      _overflows+0, 0
L__interrupt72:
	BTFSS      STATUS+0, 2
	GOTO       L_interrupt35
;Digital_clock.c,153 :: 		sec++;
	INCF       _sec+0, 1
	BTFSC      STATUS+0, 2
	INCF       _sec+1, 1
;Digital_clock.c,154 :: 		overflows = 0;
	CLRF       _overflows+0
	CLRF       _overflows+1
;Digital_clock.c,155 :: 		TMR0 = 190;
	MOVLW      190
	MOVWF      TMR0+0
;Digital_clock.c,156 :: 		}
L_interrupt35:
;Digital_clock.c,157 :: 		TMR0IF_bit = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;Digital_clock.c,158 :: 		}
L_interrupt34:
;Digital_clock.c,159 :: 		}
L_end_interrupt:
L__interrupt71:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Digital_clock.c,163 :: 		void main() {
;Digital_clock.c,164 :: 		initialize_code();
	CALL       _initialize_code+0
;Digital_clock.c,165 :: 		while(1){
L_main36:
;Digital_clock.c,166 :: 		set_time();
	CALL       _set_time+0
;Digital_clock.c,167 :: 		set_time_string();
	CALL       _set_time_string+0
;Digital_clock.c,168 :: 		set_date();
	CALL       _set_date+0
;Digital_clock.c,169 :: 		set_date_string();
	CALL       _set_date_string+0
;Digital_clock.c,171 :: 		adjust_Time_n_Date();  //adjust date and time
	CALL       _adjust_Time_n_Date+0
;Digital_clock.c,173 :: 		Lcd_Out(1,6,time);   //display time
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _time+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,174 :: 		Lcd_Out(2,6,date);    //display date
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      6
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _date+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Digital_clock.c,175 :: 		Lcd_Chr(1, 8, ' ');  // clear the colon
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      32
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Digital_clock.c,176 :: 		Delay_ms(250);       // delay for 250 ms
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main38:
	DECFSZ     R13+0, 1
	GOTO       L_main38
	DECFSZ     R12+0, 1
	GOTO       L_main38
	DECFSZ     R11+0, 1
	GOTO       L_main38
	NOP
	NOP
;Digital_clock.c,177 :: 		Lcd_Chr(1, 8, ':');
	MOVLW      1
	MOVWF      FARG_Lcd_Chr_row+0
	MOVLW      8
	MOVWF      FARG_Lcd_Chr_column+0
	MOVLW      58
	MOVWF      FARG_Lcd_Chr_out_char+0
	CALL       _Lcd_Chr+0
;Digital_clock.c,178 :: 		Delay_ms(250);
	MOVLW      3
	MOVWF      R11+0
	MOVLW      138
	MOVWF      R12+0
	MOVLW      85
	MOVWF      R13+0
L_main39:
	DECFSZ     R13+0, 1
	GOTO       L_main39
	DECFSZ     R12+0, 1
	GOTO       L_main39
	DECFSZ     R11+0, 1
	GOTO       L_main39
	NOP
	NOP
;Digital_clock.c,179 :: 		}
	GOTO       L_main36
;Digital_clock.c,181 :: 		}
L_end_main:
	GOTO       $+0
; end of _main

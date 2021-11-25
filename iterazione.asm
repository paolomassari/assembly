.stack 64h

.data
; legge in input un carattere maiuscolo e stampa a video i suoi successivi fino al carattere Z

var1 DB ?
carattere DB ?                          
minor db "inserisci un carattere maiuscolo", 24h


.code

    MOV ax, @data
    MOV ds, ax
     
    
    mov dx, offset minor
    mov ah, 09h
    int 21h
    
    
    MOV DL, 10d    ; line feed
    MOV ah, 02h
    int 21h 
    
    MOV DL, 13d    ; carriage return = inizio riga
    MOV ah, 02h
    int 21h 
    

    
    MOV AH, 01h
    INT 21h
    mov carattere, AL 
    
    CMP carattere, 'A'
    JL  fine


ciclo:    
    ; controllare se maggiore di 'Z'
    CMP carattere, 'Z'
    JG  fine            ; great maggiore JG , less minore JL 
    

    
    ; visualizzare carattere
    
    MOV DL, carattere
    MOV AH, 02h
    INT 21h
    
    ; incrementare di 1 il carattere
    
    INC carattere ; ADD carattere, 1  
    JMP ciclo

fine:    
    
       
    
    mov AH, 00h 
    int 21h 
    
    

.exit  

.stack 64h

.data
; legge in input un carattere e visualizza a video 
; la  sequenza dei precedenti 10 nella tab ascii 

conta DB ?
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
    
    MOV conta, 0d
    
    MOV AH, 01h
    INT 21h
    mov carattere, AL 
    


ciclo:    
    ; controllare se maggiore di 'Z'
    CMP conta, 10d
    JGE  fine            ; great maggiore JG , less minore JL 
    
    ; visualizzare carattere
    
    MOV DL, carattere
    MOV AH, 02h
    INT 21h
    
    ; incrementare di 1 il carattere
    
    ADD carattere, 3  
    
    INC conta
    
jmp ciclo 

fine:    
    
       
    
    mov AH, 00h 
    int 21h 
    
    

.exit  

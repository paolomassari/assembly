.stack 64h

.data


    VAR1 db ?
    VAR2 db ?


.code

    MOV ax, @data
    MOV ds, ax
   
    
    MOV AH, 01H   ;   chiamo il servizio 1 del bios , che corrisponde a leggi un carattere da tastiera.
    INT 21H    
    
    MOV VAR1, AL
    
    MOV AH, 01H   ;   chiamo il servizio 1 del bios , che corrisponde a leggi un carattere da tastiera.
    INT 21H    
   
    SUB AL, 48d
    
    ADD var1, AL
    
    MOV DL, VAR1
    
    MOV AH, 02H        ;   chiamo il servizio 2 del bios , che corrisponde a visualizza un carattere a video.
    INT 21H            
    
    mov AH, 00h 
    int 21h 
    
    

.exit
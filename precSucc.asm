.stack 64h

.data

    var1 db ?


.code

    MOV ax, @data
    MOV ds, ax
   
    
    MOV AH, 01H   ;   chiamo il servizio 1 del bios , che corrisponde a leggi un carattere da tastiera.
    INT 21H    
    MOV var1, AL     ; il valore letto in input  va nel registro AL ( obbligatorio ).
    
   
    ADD var1, 1     ; var1 = var1 + 1  

    MOV DL, var1
    MOV AH, 02H        ;   chiamo il servizio 2 del bios , che corrisponde a visualizza un carattere a video.
    INT 21H  



    SUB var1, 2
    
    MOV DL, var1
    MOV AH, 02H        ;   chiamo il servizio 2 del bios , che corrisponde a visualizza un carattere a video.
    INT 21H  





    mov AH, 00h 
    int 21h 
    
    
.exit
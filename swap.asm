.stack 64h

.data
; verificare se il carattere letto in input da tastiera e un numero. ( '0', .. , '9')


.code

    MOV ax, @data
    MOV ds, ax
   
    
    
    MOV AH, 01h
    INT 21h
    mov var1, AL
    
    
    
    
    
              
    
    mov AH, 00h 
    int 21h 
    
    

.exit
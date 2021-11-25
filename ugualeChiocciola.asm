.stack 64h

.data
; verificare se il carattere letto in input da tastiera = un numero. ( 'a', .. , 'z')

var1 DB ?

.code

    MOV ax, @data
    MOV ds, ax
     
    
    MOV AH, 01h         ; servizio 1, ossia leggi un carattere da tastiera
    INT 21h             ; chiamata al dos con il numero di servizio indicato in ah
    MOV var1, AL
    
    
    CMP var1, 'a'
    JE  letteraA            ; se = 'a'   jump equal
      
    jmp diverso    
    
    

letteraA:
    
    MOV AH, 01h         ; servizio 1, ossia leggi un carattere da tastiera
    INT 21h             ; chiamata al dos con il numero di servizio indicato in ah
    MOV var1, AL
    
    CMP var1, 'b'
    JE uguale
    jmp diverso
         
uguale:
    MOV DL, '1' ; 1 equivale a vero.
    MOV AH, 02h
    INT 21h
    JMP fine

diverso:  
    MOV DL, '0' ; 0 equivale a falso.
    MOV AH, 02h
    INT 21h

fine:    
              
    
    mov AH, 00h 
    int 21h 
    
    

.exit
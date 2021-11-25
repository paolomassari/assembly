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
    
    
    CMP var1, '9'
    JG  altro            ; se > '9'   jump great jg

    
    cmp var1, '0'        ; se arrivo qui vuol dire che minore di 9
    JL altro             ; jump less jl 
    
    jmp numero    
    
    

altro:     MOV DL, '1' ; 1 equivale a no.
    MOV AH, 02h
    INT 21h
    JMP fine

numero:  MOV DL, '0' ; 0 equivale a si.
    MOV AH, 02h
    INT 21h

fine:    
              
    
    mov AH, 00h 
    int 21h 
    
    

.exit
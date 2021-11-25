.stack 64h

.data
; verificare se il carattere letto in input da tastiera e un numero. ( '0', .. , '9')

var1 DB ?

.code

    MOV ax, @data
    MOV ds, ax
     
    
    MOV AH, 01h
    INT 21h
    MOV var1, AL
    
    
    CMP var1, '9'
    JG  altro            ; se > '9' 
    
    cmp var1, '0'        ; se arrivo qui vuol dire che minore di 9
    JL altro
    
    jmp numero    
    
    

altro:     MOV DL, '1' ; 1 equivale a no.
    MOV AH, 02h
    INT 21h
    

numero:  MOV DL, '0' ; 0 equivale a si.
    MOV AH, 02h
    INT 21h

fine:    
              
    
    mov AH, 00h 
    int 21h 
    
    

.exit
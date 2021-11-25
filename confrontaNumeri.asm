.stack 64h

.data
; letti due valori in input, verificare se il primo e minore del secondo

var1 DB ?
var2 DB ?                          
minor db "minore", 24h
maggi db "maggiore", 24h

.code

    MOV ax, @data
    MOV ds, ax
     
    
    MOV AH, 01h
    INT 21h
    MOV var1, AL
    
    
    MOV AH, 01h
    INT 21h
    mov var2, AL
    
    
    CMP var1, AL
    JG  maggiore            ; var1 > AL
      
    

minore:     
    mov dx, offset minor
    mov ah, 9
    int 21h

    JMP fine

maggiore:  
    mov dx, offset maggi
    mov ah, 9
    int 21h



fine:    
              
    
    mov AH, 00h 
    int 21h 
    
    

.exit
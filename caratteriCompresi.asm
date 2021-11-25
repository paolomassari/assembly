.stack 64h

.data
; legge in input un carattere maiuscolo e stampa a video i suoi successivi fino al carattere Z

car1 DB ? 
car2 DB ?
trovato DB ?
cont DB ?

inserisci db "inserisci  carattere ", 24h                          
stampasi db "trovato  ", 24h
stampano db "non trovato ", 24h

; leggi 10 caratteri in input e verifica se fra questi è presente la lettera 'p'


.code

    MOV ax, @data
    MOV ds, ax
     
    mov dx, offset inserisci
    mov ah, 09h
    int 21h                
    

    mov trovato, 1d
    mov cont, 0
    
    
    MOV ah, 01h
    int 21h
    mov car1, al
   
    mov dx, offset inserisci
    mov ah, 09h
    int 21h  

    MOV ah, 01h
    int 21h
    mov car2, al  ; 'z'
    
    mov BL, car1 ; 'a'
    
        
ciclo:    
    ; controllare se maggiore di 'Z'
           ; great maggiore JG , less minore JL 

    cmp BL, car2
    jg esci   ; se car1 >= car2 esci
    
    
    cmp BL, 'a' 
    jl incrementa   ; caso 1 
    
    
    ; passa da qui se > di 'a'
    CMP BL, 'z'
    jg incrementa ; caso 3
        
lettera:        
    inc cont
    
    
    
incrementa:    
    mov DL, BL 
    mov ah, 02h
    int 21h
    
    inc BL 
JMP ciclo



esci:

    MOV DL, 10d
    MOV ah, 02h
    int 21h
    
    MOV DL, 13d
    MOV ah, 02h
    int 21h
    
    
    add cont, '0'
    
    MOV DL, cont
    MOV ah, 02h
    int 21h

    CMP trovato, 1d
    JE fine
    
    mov dx, offset stampano
    mov ah, 09h
    int 21h                
    jmp fine

stampaok:
    mov dx, offset stampasi
    mov ah, 09h
    int 21h        
        

fine:    
    mov AH, 00h 
    int 21h 
    
    

.exit  

.stack 64h

.data
; legge in input un carattere maiuscolo e stampa a video i suoi successivi fino al carattere Z

i DB ? 
num DB ?
trovato DB ?

inserisci db "inserisci 10 caratteri ", 24h                          
stampasi db "trovato  ", 24h
stampano db "non trovato ", 24h

; leggi 10 caratteri in input e verifica se fra questi è presente la lettera 'p'


.code

    MOV ax, @data
    MOV ds, ax
     
    mov dx, offset inserisci
    mov ah, 09h
    int 21h                
    

    mov trovato, 0d
    MOV i, 0d
    
    
ciclo:    
    ; controllare se maggiore di 'Z'
           ; great maggiore JG , less minore JL 
    
    CMP i, 10d 
    JE esci    
    
    ; eseguo le seguenti  istruzioni 
    
    MOV ah, 01h
    int 21h
    mov num, al
     
    CMP num, 'p'
    JNE incrementa 

    mov trovato, 1 

    incrementa:    
        INC i
    
JMP ciclo



esci:

    MOV DL, 10d
    MOV ah, 02h
    int 21h
    
    MOV DL, 13d
    MOV ah, 02h
    int 21h
    
    

    CMP trovato, 1d
    JE stampaok
    
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

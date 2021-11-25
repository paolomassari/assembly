.stack 64h

.data
; legge in input un carattere maiuscolo e stampa a video i suoi successivi fino al carattere Z


inserisci db "inserisci 10 caratteri ", 24h                          
stampasi db "crescente  ", 24h
stampano db "decrescente ", 24h

prec DB ?
succ DB ?
flag DB ?
cont DB ?

; leggi 4 caratteri in input e verifica che siano disposti in ordine crescente sulla tabella dei codici ascii.
; 0, 3, A, F sono crescente
; 0, A, 3, 9 non crescente


.code

    MOV ax, @data
    MOV ds, ax
     
    mov dx, offset inserisci
    mov ah, 09h
    int 21h                
    
    mov ah, 01h
    int 21h
    mov prec, al

    mov cont, 0    ; cont = 0
    mov flag, 1    ; flag = 1
    
ciclo:    
    ; controllare se minore di 4
           
    CMP cont, 04d     ; if ( cont ==  4 )   
    JE esci           ; esci
    
    mov ah, 01h
    int 21h
    mov succ, al      ; scanf ( "%d ", &succ );
    
    cmp al, prec      ; if ( succ < prec ) 
    jl decrescente    ; 

    jmp incrementa

decrescente:
    mov flag, 0     
    
incrementa: 
    mov bl, succ      ; prec = succ
    mov prec, bl 
       
    INC cont          ; cont++
    
JMP ciclo



esci:


    CMP flag, 1d
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

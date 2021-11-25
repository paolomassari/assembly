.stack 64h

.data
; legge in input un carattere maiuscolo e stampa a video i suoi successivi fino al carattere Z

i DB ?
carattere DB ?                          
minor db "inserisci un carattere maiuscolo", 24h

; leggi 10 caratteri in input e verifica se fra questi è presente la lettera 'p'


.code

    MOV ax, @data
    MOV ds, ax
     
    
    mov dx, offset minor
    mov ah, 09h
    int 21h        

    
    MOV i, 0d
    
    
ciclo:    
    ; controllare se maggiore di 'Z'
           ; great maggiore JG , less minore JL 
    

    
    ; visualizzare carattere
    

    
    inc i
    
JMP ciclo

fine:    
    
       
    
    mov AH, 00h 
    int 21h 
    
    

.exit  

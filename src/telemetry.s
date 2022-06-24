
.bss
str_ecx:
.string ""

valore_tempo:
.string ""

.section .data

#conterra il massimo rmp raggiunto dal nostro guarrirero 
max_rpm:
.long 0

max_temperatura:
.long 0


max_velocita:
    .long 0

num_velocita:
    .long 0
somma_velocita:
    .long 0

val_id:
.long 0


nome:
.string "                "
nome_len:
.long . - nome
pilot_0_str:
    .string   "Pierre Gasly\0"
pilot_1_str:
    .string   "Charles Leclerc\0"
pilot_2_str:
    .string   "Max Verstappen\0"
pilot_3_str:                       
    .string   "Lando Norris\0"
pilot_4_str:
    .string   "Sebastian Vettel\0"
pilot_5_str:
    .string   "Daniel Ricciardo\0"
pilot_6_str: 
    .string   "Lance Stroll\0"
pilot_7_str:
    .string   "Carlos Sainz\0"
pilot_8_str:
    .string   "Antonio Giovinazzi\0"
pilot_9_str:
    .string   "Kevin Magnussen\0"
pilot_10_str:
    .string  "Alexander Albon\0"
pilot_11_str:
    .string  "Nicholas Latifi\0"
pilot_12_str:
    .string  "Lewis Hamilton\0"
pilot_13_str:
    .string  "Romain Grosjean\0"
pilot_14_str:
    .string  "George Russell\0" 
pilot_15_str:
    .string  "Sergio Perez\0"    #non funge
pilot_16_str:
    .string  "Daniil Kvyat\0"   # non funge
pilot_17_str:
    .string  "Kimi Raikkonen\0"
pilot_18_str:
    .string  "Esteban Ocon\0"   #non funge
pilot_19_str:
    .string  "Valtteri Bottas\0"

invalid_pilot_str:	
.string "Invalid\n\0"


.section .text
.global telemetry

telemetry:
    movl 4(%esp),%esi 
    movl 8(%esp), %edi


pushl %eax
pushl %ebx
pushl %ecx
pushl %edx

xorl %ecx, %ecx
xorl %eax, %eax
leal nome, %eax
leggi_intero_pilota_dal_file:
 movb (%esi,%ecx),  %bl
 movb %bl,(%eax,%ecx) 
 incl %ecx
 cmpb $10,%bl
 jne leggi_intero_pilota_dal_file


xorl %ecx, %ecx
xorl %edx, %edx
xorl %ebx,%ebx

 leal nome, %ecx
 #ebx indice
 #sto spostando il nome del pilota al indirizzo di nome
c:
 movb (%eax,%ebx),%dl
 movb %dl, (%ecx,%ebx)
 inc %ebx
 cmp $10, %dl
 je f
 jmp c

f:
xorl %ecx, %ecx
xorl %edx, %edx
xorl %ebx,%ebx
xorl %eax,%eax

p_0:
    #spostare uno alla volta (di nome) dentro di un registro, la stessa cosa per il (pilot)
    #finche non troviamo il \0 e dopo  commparison di tutti due registri
    #amen    
ciclo0:  #cambio 1

    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_0_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input        #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare0   #cambio 3                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input:
    cmpb $10,%dl
    je stampa
    jne p_1

continua_cilare0:       #cambio 4
    cmp %dl, %cl
    je ciclo0           #cambio 5
    jmp p_1             #cambio

p_1:
    #popl %ecx
    xorl %ecx,%ecx
    incl val_id
      
ciclo1:  #cambio 1

    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_1_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input1        #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare1   #cambio 3                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input1:
    cmpb $10,%dl
    je stampa
    jne p_2             #cambio 4

continua_cilare1:       #cambio 5
    cmp %dl, %cl
    je ciclo1           #cambio 6
    jmp p_2             #cambio 7
    
p_2:
    xorl %ecx,%ecx
    incl val_id

     ciclo2:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_2_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input2        #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare2   #cambio 3                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input2:
    cmpb $10,%dl
    je stampa
    jne p_3             #cambio 5

continua_cilare2:       #cambio 6
    cmp %dl, %cl
    je ciclo2           #cambio 7
    jmp p_3            #cambio 8

p_3:
    xorl %ecx,%ecx
    incl val_id


    ciclo3:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_3_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input3        #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare3   #cambio 3                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input3:
    cmpb $10,%dl
    je stampa
    jne p_4             #cambio 5

continua_cilare3:       #cambio 6
    cmp %dl, %cl
    je ciclo3           #cambio 7
    jmp p_4             #cambio 8

p_4:
    xorl %ecx,%ecx
    incl val_id

    ciclo4:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_4_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input4        #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare4   #cambio 3                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input4:
    cmpb $10,%dl
    je stampa
    jne p_5             #cambio 5

continua_cilare4:       #cambio 6
    cmp %dl, %cl
    je ciclo4           #cambio 7
    jmp p_5             #cambio 8
p_5:
    xorl %ecx,%ecx
    incl val_id


     ciclo5:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_5_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input5        #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare5   #cambio 3                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input5:
    cmpb $10,%dl
    je stampa
    jne p_6             #cambio 5

continua_cilare5:       #cambio 6
    cmp %dl, %cl
    je ciclo5           #cambio 7
    jmp p_6             #cambio 8
p_6:
    xorl %ecx,%ecx
    incl val_id


    ciclo6:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_6_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input6  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare6   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input6: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_7             #cambio 6

continua_cilare6:       #cambio 7
    cmp %dl, %cl
    je ciclo6           #cambio 8
    jmp p_7             #cambio 9
p_7:
    xorl %ecx,%ecx
    incl val_id


    ciclo7:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_7_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input7  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare7   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input7: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_8             #cambio 6

continua_cilare7:       #cambio 7
    cmp %dl, %cl
    je ciclo7           #cambio 8
    jmp p_8             #cambio 9
p_8:
    xorl %ecx,%ecx
    incl val_id
    
    ciclo8:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_8_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input8  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare8   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input8: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_9             #cambio 6

continua_cilare8:       #cambio 7
    cmp %dl, %cl
    je ciclo8           #cambio 8
    jmp p_9             #cambio 9
p_9:
    xorl %ecx,%ecx
    incl val_id

   
    ciclo9:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_9_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input9  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare9   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input9: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_10             #cambio 6

continua_cilare9:       #cambio 7
    cmp %dl, %cl
    je ciclo9           #cambio 8
    jmp p_10             #cambio 9
p_10:
    xorl %ecx,%ecx
    incl val_id


    ciclo10:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_10_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input10  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare10   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input10: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_11             #cambio 6

continua_cilare10:       #cambio 7
    cmp %dl, %cl
    je ciclo10           #cambio 8
    jmp p_11             #cambio 9
p_11:
    xorl %ecx,%ecx
    incl val_id


    ciclo11:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_11_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input11  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare11   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input11: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_12             #cambio 6

continua_cilare11:       #cambio 7
    cmp %dl, %cl
    je ciclo11           #cambio 8
    jmp p_12             #cambio 9
p_12:
    xorl %ecx,%ecx
    incl val_id


    ciclo12:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_12_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input12  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare12   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input12: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_13             #cambio 6

continua_cilare12:       #cambio 7
    cmp %dl, %cl
    je ciclo12           #cambio 8
    jmp p_13             #cambio 9
p_13:
     xorl %ecx,%ecx
     xorl %eax,%eax
     xorl %ebx,%ebx
     xorl %edx,%edx
    incl val_id


    ciclo13:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_13_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input13  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare13   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input13: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_14             #cambio 6

continua_cilare13:       #cambio 7
    cmp %dl, %cl
    je ciclo13           #cambio 8
    jmp p_14             #cambio 9




p_14:


     xorl %ecx,%ecx
     xorl %eax,%eax
     xorl %ebx,%ebx
     xorl %edx,%edx
    incl val_id


    ciclo14:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota del file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_14_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input14  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare14   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input14: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_15             #cambio 6

continua_cilare14:       #cambio 7
    cmp %dl, %cl
    je ciclo15           #cambio 8
    jmp p_15             #cambio 9




p_15:
    xorl %ecx,%ecx
    incl val_id


    ciclo15:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_15_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input15  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare15   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input15: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_16             #cambio 6

continua_cilare15:       #cambio 7
    cmp %dl, %cl
    je ciclo15           #cambio 8
    jmp p_16             #cambio 9
p_16:
    xorl %ecx,%ecx
    incl val_id


    ciclo16:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota del file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_16_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input16  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare16   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input16: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_17             #cambio 6

continua_cilare16:       #cambio 7
    cmp %dl, %cl
    je ciclo16           #cambio 8
    jmp p_17             #cambio 9
p_17:
    xorl %ecx,%ecx
    incl val_id


    ciclo17:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_17_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input17  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare17   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input17: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_18             #cambio 6

continua_cilare17:       #cambio 7
    cmp %dl, %cl
    je ciclo17           #cambio 8
    jmp p_18             #cambio 9
p_18:
    xorl %ecx,%ecx
    incl val_id


      ciclo18:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_18_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input18  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare18   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input18: #cambio 5
    cmpb $10,%dl
    je stampa
    jne p_19             #cambio 6

continua_cilare18:       #cambio 7
    cmp %dl, %cl
    je ciclo18           #cambio 8
    jmp p_19             #cambio 9
p_19:
    xorl %ecx,%ecx
    incl val_id


     ciclo19:  #cambio 1
    leal nome,%eax                          #sposto indirizzo del nome pilota nel file 
                                            #input  in eax
    movb (%eax,%ebx),%dl                    #ebx fa da contatore
    
    xorl %eax, %eax                         #azzero eax per riutilizzarlo
    leal pilot_19_str, %eax    #cambio 2              #sposto nome pilota con id 0 in eax

    movb (%eax, %ebx),%cl
    incl %ebx
    cmpb $0, %cl
    je compara_anche_nome_file_input19  #cambio 3      #se arrivo a fine stringa, controllo la fine anche dell'altra parola
    jmp continua_cilare19   #cambio 4                 #altrimenti salto la prossima etichetta
compara_anche_nome_file_input19: #cambio 5
    cmpb $10,%dl
    je stampa
    jne invalid             #cambio 6

continua_cilare19:       #cambio 7
    cmp %dl, %cl
    je ciclo19           #cambio 8
    jmp invalid             #cambio 9

invalid:
 xorl %ecx, %ecx
 xorl %edx, %edx
 xorl %ebx,%ebx
 xorl %eax,%eax

 leal invalid_pilot_str, %eax
    stampa_invalid:
        movb (%eax, %ecx), %bl
        movb %bl, (%edi,%ecx)

        inc %ecx
        cmp $0, %bl
        je end
        jmp stampa_invalid 



#salta a questa etichetta quando trova un nome giusto 
stampa:
    # ID pilota si trova dentro val_id
   xorl %ebx,%ebx           #dai azzeriamo sto ebx
   
   # salto il nome per andare ai dati 
    movb (%esi,%ecx),  %al       #prendo il contenuto esi in pos ecx lo metto in al       
    incl %ecx                    #incremento ecx
    

    cmpb $10,%al                 
    jne stampa
    je modifica_esi

#modifico esi cosi parte da dopo il nome
modifica_esi:
    addl %ecx,%esi


#lavoro con i dati ora che ho saltato il nome
elaborazione_dati:
                                #in esi,ecx ce' il dato saltando il nome
                                #ricorda che esi e edi puntano a due posti avanti 

    xorl %ebx,%ebx              #dai azzeriamo sto ebx

    cmpb $0, (%esi)
    je stampa_ultima_riga
    movl %esi, %ebx
trova_prima_virgola:
    addl $1, %ebx
	cmpb $44, (%ebx)
    jne trova_prima_virgola
    
    #continuo dopo che ho trovato la prima virgola
    xorl %ecx,%ecx
    xorl %eax,%eax
    xorl %edx,%edx
    movl val_id,%ecx


converti_in_num_id_file_input:
    addl $1,%ebx            #punto avanti
    movb (%ebx), %dl        #metto dentro dl incontenuto di dove punto
    subb $48,%dl            #tolgo 48 per avere il numero 
    addl $1,%ebx    
    cmpb $44,(%ebx) 
    je controlliamo_id   
    movb $10,%al                # in questo modo se id >=10 sara in eax
    mulb %dl                    # se id minore di 10 sara in edx
    movb (%ebx), %dl
    subb $48,%dl
    addb %dl,%al





    
controlliamo_id:
    #in eax ho id input file input se ecx > 10
    # in edx ho id input file input se ecx < 10      >
    #in ecx ho id da me cercato attualmente
    

    cmpl $10,%ecx                        #se ecx e' maggiore o uguale a 10 
                                            #salta in ecx_maggiore_uguale_10
                                            #altrimenti ecx_minore_di_10
    jge ecx_maggiore_uguale_10
    jmp ecx_minore_di_10


ecx_maggiore_uguale_10:  
    cmpl $10,%eax
    jge eax_maggiore_ugale_10
    jmp eax_minore_di_10
eax_maggiore_ugale_10:
    cmpl %eax,%ecx
    je finaimo_riga_sapendo_id
    jmp finiamo_riga_con_id_no_uguale
eax_minore_di_10:
    jmp finiamo_riga_con_id_no_uguale



ecx_minore_di_10:
    cmpl $10,%eax
    jge con_eax_maggiore_ugale_10
    jmp edx_minore_di_10            # seguendo questo ragionamento edx sara' sempre minore di 10
con_eax_maggiore_ugale_10:
    jmp finiamo_riga_con_id_no_uguale
edx_minore_di_10:
    cmpl %edx,%ecx
    je finaimo_riga_sapendo_id
    jmp finiamo_riga_con_id_no_uguale






finiamo_riga_con_id_no_uguale:
    #faro concludere la riga fino a \n (cioe portero esi fino a \n)
    addl $1,%esi
    cmpb $10,(%esi)
    jne salta_a_end_da_ultima_riga_no_uguale
    je elaborazione_dati
salta_a_end_da_ultima_riga_no_uguale:
    cmpb $0,(%esi)
    je stampa_ultima_riga
    jne finiamo_riga_con_id_no_uguale


#faro operazioni sulla riga perche id e' quello cercato
finaimo_riga_sapendo_id:

stampiamo_tempo:

    jmp salta_togli_la_capo
togli_la_capo:
    addl $1,%esi
salta_togli_la_capo:

    # stampo il tempo della riga corretta
    xorl %ebx,%ebx
    
    movb (%esi),  %bl
    cmpb $10,%bl 
    je togli_la_capo
    movb %bl,(%edi)
    addl $1,%edi
    addl $1,%esi
    cmpb $44,(%esi)
    jne stampiamo_tempo
    jmp salta_stampa_id
salta_stampa_id:


    #stampo il tempo del id corretto evviva :)
    addl $1,%esi
    cmpb $44,(%esi)
    jne salta_stampa_id
    
  #stampiamo una cara virgola
    movb $44,(%edi)
    addl $1,%edi   


salta_velocita:
    
    xorl %ebx,%ebx
    xorl %eax,%eax
    xorl %ecx,%ecx
    addl $1,%esi
livello_velocita_interno:
   xorl %ebx,%ebx

    movb (%esi), %bl
    subb $48,%bl
    movl $10,%eax
    addl %ecx,%ebx
    mull %ebx
    addl $1,%esi
    cmpb $44,(%esi)
    je salva_in_stack_la_velocita
    movl %eax,%ecx
    jmp livello_velocita_interno


###########################################
#   ricordati di pushare da bravo pusher  #
###########################################
salva_in_stack_la_velocita:
    #la velocita si trova in %ebx
    pushl %ebx
    xorl %ebx,%ebx

livello_rpm:

    #esi punta dopo la virgola della velocita'
controlliamo_rpm:
    #prendo da bl
    #li sottraggo 48
    #lo moltiplico * 10
    xorl %ebx,%ebx
    xorl %eax,%eax
    xorl %ecx,%ecx
    addl $1,%esi
controlliamo_rpm_interno  :
    #in ebx ci sara' il rpm in numero evviva!
    xorl %ebx,%ebx
    movb (%esi), %bl
    subb $48,%bl
    movl $10,%eax
    addl %ecx,%ebx
    mull %ebx
    addl $1,%esi
    cmpb $44,(%esi)
    je confronta_rmp
    movl %eax,%ecx
    jmp controlliamo_rpm_interno

confronta_rmp:
    #si trova in ebx rpm
    cmpl %ebx,max_rpm
    #se %ebx < rmp >
    jl imposta_max_rpm
    jmp continua_rpm
imposta_max_rpm:
    movl %ebx,max_rpm

continua_rpm:
      cmpl $5000,%ebx
      jle rpm_low
      cmpl $10000,%ebx
      jle rpm_medium
      jmp rpm_high

rpm_low:
    #stampa LOW
    movb $76,(%edi) #L
    addl $1,%edi             #guadagniamo terreno
    movb $79,(%edi) #O
    addl $1,%edi             #guadagniamo terreno
    movb $87,(%edi) #W
    
    #ricordati di saltare medium e high
    jmp continua_con_temp                   #mi serve per evitare di stampare anche medium

rpm_medium:
    #stampa MEDIUM
    movb $77,(%edi) #M
    addl $1,%edi             #guadagniamo terreno
    movb $69,(%edi) #E       #scriviamo sul terreno guadagnato
    addl $1,%edi
    movb $68,(%edi) #D
    addl $1,%edi
    movb $73,(%edi) #I
    addl $1,%edi
    movb $85,(%edi) #U
    addl $1,%edi
    movb $77,(%edi) #M

    jmp continua_con_temp       #mi serve per evitare di stampare anche high

rpm_high:
    #stampa HIGH
    movb $72,(%edi) #H
    addl $1,%edi                #guadagniamo terreno
    movb $73,(%edi) #I          #scriviamo sul terreno guadagnato
    addl $1,%edi
    movb $71,(%edi) #G
    addl $1,%edi
    movb $72,(%edi) #H
    
    jmp continua_con_temp

 # esi punta alla virgola dopo rpm
 # ad edi serve aggiugnre +1 per poterci scrivere 

 
continua_con_temp:
    #stampo la virgola 
    addl $1,%edi
    movb $44,(%edi)
  

livello_temperatura:
    xorl %ebx,%ebx
    xorl %eax,%eax
    xorl %ecx,%ecx
    addl $1,%esi

livello_temperatura_interno:
                                        #dovrei aggiungere in controllo se e' anche \0
    xorl %ebx,%ebx
    movb (%esi), %bl
    subb $48,%bl
    movl $10,%eax
    addl %ecx,%ebx
    mull %ebx
    addl $1,%esi
    cmpb $10,(%esi)                 #qua invece della virgola conparo l'acapo (\n)
    je confronta_temperatura
    cmpb $0,(%esi)
    je confronta_temperatura
    movl %eax,%ecx
    jmp livello_temperatura_interno
    
confronta_temperatura:
    #in ebx avro' la Temperatura
    cmpl %ebx, max_temperatura
    jl  imposta_max_temperatura
    jmp continua_temperatura
imposta_max_temperatura:
    movl %ebx, max_temperatura      # imposto la temperatura massima
continua_temperatura:
     cmpl $90,%ebx
      jle temp_low
      cmpl $110,%ebx
      jle temp_medium
      jmp temp_high

temp_low:
    #stampo LOW
    addl $1,%edi            #aggiungo 1 per guadagnare terreno per la stampa
    movb $76,(%edi) #L
    addl $1,%edi             #guadagniamo terreno
    movb $79,(%edi) #O
    addl $1,%edi             #guadagniamo terreno
    movb $87,(%edi) #W
    
    jmp continuamo_con_velocita         #mi serve per non stampare medium e high
temp_medium:
    addl $1,%edi            #aggiungo 1 per guadagnare terreno per la stampa
   #stampa MEDIUM
    movb $77,(%edi) #M
    addl $1,%edi             #guadagniamo terreno
    movb $69,(%edi) #E       #scriviamo sul terreno guadagnato
    addl $1,%edi
    movb $68,(%edi) #D
    addl $1,%edi
    movb $73,(%edi) #I
    addl $1,%edi
    movb $85,(%edi) #U
    addl $1,%edi
    movb $77,(%edi) #M

    jmp continuamo_con_velocita       #mi serve per evitare di stampare anche high
temp_high:
    addl $1,%edi            #aggiungo 1 per guadagnare terreno per la stampa
    #stampo HIGH
    movb $72,(%edi) #H
    addl $1,%edi                #guadagniamo terreno
    movb $73,(%edi) #I          #scriviamo sul terreno guadagnato
    addl $1,%edi
    movb $71,(%edi) #G
    addl $1,%edi
    movb $72,(%edi) #H
    
    jmp continuamo_con_velocita



continuamo_con_velocita:
    #stampiamo la virgola
    addl $1,%edi
    movb $44,(%edi)

################################################
#   ricordati di poppare da bravo non so cosa  #
################################################
    xorl %ebx,%ebx
    popl %ebx
livello_velocita: 
   #faccio cose con la velocita
    cmp %ebx, max_velocita
      jl  imposta_max_velocita
      jmp confronta_velocita
imposta_max_velocita:
      movl %ebx, max_velocita


confronta_velocita:
        #incrementiamo contatore num di velocita
        #sommiamo velocita alla somma delle velocita del nostro pilota cercato
   addl %ebx,somma_velocita
   incl num_velocita

   cmpl $100,%ebx
      jle vel_low
      cmpl $250,%ebx
      jle vel_medium
      jmp vel_high

vel_low:
    #stampo LOW
    addl $1,%edi            #aggiungo 1 per guadagnare terreno per la stampa
    movb $76,(%edi) #L
    addl $1,%edi             #guadagniamo terreno
    movb $79,(%edi) #O
    addl $1,%edi             #guadagniamo terreno
    movb $87,(%edi) #W
    jmp controllo_se_sono_ultima_riga
vel_medium:
      addl $1,%edi            #aggiungo 1 per guadagnare terreno per la stampa
   #stampa MEDIUM
    movb $77,(%edi) #M
    addl $1,%edi             #guadagniamo terreno
    movb $69,(%edi) #E       #scriviamo sul terreno guadagnato
    addl $1,%edi
    movb $68,(%edi) #D
    addl $1,%edi
    movb $73,(%edi) #I
    addl $1,%edi
    movb $85,(%edi) #U
    addl $1,%edi
    movb $77,(%edi) #M
    jmp controllo_se_sono_ultima_riga
vel_high:

      addl $1,%edi            #aggiungo 1 per guadagnare terreno per la stampa
    #stampo HIGH
    movb $72,(%edi) #H
    addl $1,%edi                #guadagniamo terreno
    movb $73,(%edi) #I          #scriviamo sul terreno guadagnato
    addl $1,%edi
    movb $71,(%edi) #G
    addl $1,%edi
    movb $72,(%edi) #H
jmp controllo_se_sono_ultima_riga

controllo_se_sono_ultima_riga:
    #stampo un a capo dopo la fine della riga
    addl $1,%edi
    movb $10,(%edi) #stampo un a capo
     addl $1,%edi


    #esi dovrebbe contenre \n oppure \0
    cmpb $10,(%esi)
    je elaborazione_dati
    cmpb $0,(%esi)
    je stampa_ultima_riga


#stampia l'ultia riga
stampa_ultima_riga:

    #max_rpm #max_temperatura #max_velocita #velocita_media
    #output ultima riga deve essere:
    # <rpm max>,<temp max>,<velocità max>,<velocità media>

##########################################
# stampiamo rpm max
##########################################
    movl max_rpm, %eax
    call itoa       #in edx avro convertito in stringa quello che e' in max_rpm
    xorl %ecx, %ecx
    xorl %ebx, %ebx
    #questo pezzo di codice serve cosi con una lettera rimpiazzo un elemento presente in quel punto nel edi 
    movb (%edx,%ecx),%bl
    addb $1,(%edi)
    movb %bl,(%edi)
    incl %ecx
stampa_rpm_max:
    movb (%edx,%ecx),%bl
    addl $1,%edi
    movb %bl,(%edi)
    incl %ecx
    cmp $0, %bl
  jne stampa_rpm_max

  #stampaimo la cara virgola
    addl $1,(%edi)
    movb $44,(%edi)
##########################################
# stampiamo temperatura max
##########################################
    movl max_temperatura,%eax
    call itoa 
  xorl %ecx, %ecx
  xorl %ebx, %ebx

stampaimo_temp_max:
    movb (%edx,%ecx),%bl
    addl $1,%edi
    movb %bl,(%edi)
    incl %ecx
    cmp $0, %bl
    jne stampaimo_temp_max

#stampaimo la cara virgola
    addl $1,(%edi)
    movb $44,(%edi)

##########################################
# stampiamo velocita max
##########################################
    movl max_velocita,%eax
    call itoa 
    xorl %ecx, %ecx
    xorl %ebx, %ebx
stampiamo_vel_max:
    movb (%edx,%ecx),%bl
    addl $1,%edi
    movb %bl,(%edi)
    incl %ecx
    cmp $0, %bl
    jne stampiamo_vel_max

    #stampaimo la cara virgola
    addl $1,(%edi)
    movb $44,(%edi)

##########################################
# stampiamo la velocita media
##########################################
    movl somma_velocita, %eax
    movl num_velocita, %ebx
    xorl %edx, %edx
    divl %ebx
    call itoa
    xorl %ecx, %ecx
    xorl %ebx, %ebx
stampiamo_vel_media:
    movb (%edx,%ecx),%bl
    addl $1,%edi
    movb %bl,(%edi)
    incl %ecx
    cmp $0, %bl
    jne stampiamo_vel_media

#etichetta dove salto  per conludere il programma
end:

popl %edx
popl %ecx
popl %ebx
popl %eax

ret

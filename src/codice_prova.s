.section .data


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
    .string  "Sergio Perez\0"
pilot_16_str:
    .string  "Daniil Kvyat\0"
pilot_17_str:
    .string  "Kimi Raikkonen\0"
pilot_18_str:
    .string  "Esteban Ocon\0"
pilot_19_str:
    .string  "Valtteri Bottas\0"


offeset:
    .long 0

invalid_pilot_str:	
.string "Invalid\0"


.section .text
.global telemetry

telemetry:
    movl 4(%esp),%esi 
    movl 8(%esp), %edi


pushl %eax
pushl %ebx
pushl %ecx
pushl %edx


xorl %ecx,%ecx                   #azzero il registro %ecx

     

#############################################
#pusho tutti i nomi dei piloti nello stack
#############################################

pushl pilot_0_str
pushl pilot_1_str
pushl pilot_2_str
pushl pilot_3_str
pushl pilot_4_str
pushl pilot_5_str
pushl pilot_6_str
pushl pilot_7_str
pushl pilot_8_str
pushl pilot_9_str
pushl pilot_10_str
pushl pilot_11_str
pushl pilot_12_str
pushl pilot_13_str 
pushl pilot_14_str
pushl pilot_15_str
pushl pilot_16_str
pushl pilot_17_str
pushl pilot_18_str
pushl pilot_19_str

#################################################


    #movl $20,%ecx               #imposta num piloti
    xorl %eax,%eax              #azzero per sicurezza %eax
    xorl %ebx,%ebx
    xorl %edx,%edx
lettura_piloti:

    #popl %ebx                   #prendo l'ultimo elmento dallo stack
    

    

loop lettura_piloti




invalid_pilota:
    #operazioni per la stampa di invalid\n

continua_con_id:
    #continuo le operazioni avendo id




    


######################################################################
#                           CODICE PROVA                             #
######################################################################

    xorl %eax,%eax              #azzero per sicurezza tutti i registri
    xorl %ebx,%ebx
    xorl %edx,%edx
    xorl %ecx,%ecx
    
leggi_intero_pilota:
    
                                       #leal pilot_0_str,%ebx
    

                                       # movl $0,%ecx
                                       # movl $12,offeset
                                        
                                        #movl offeset,%edx
                                        #movb (%ebx,%edx), %al
                                        #movb %al,(%edi,%ecx)
                                        #incl offeset
                                        #inc %ecx
                                        #cmpb $0,%al
                                       #jne leggi_intero_pilota

    xorl %eax,%eax              #azzero per sicurezza tutti i registri
    xorl %ebx,%ebx
    xorl %edx,%edx
    xorl %ecx,%ecx

leggi_intero_pilota_dal_file:
    #movb (%esi,%ecx),  %bl
    #movb %bl,(%edi,%ecx) 
    #incl %ecx
    #cmpb $10,%bl
    #jne leggi_intero_pilota_dal_file

############################################################################

    xorl %eax,%eax                  #azzero per sicurezza tutti i registri
    xorl %ebx,%ebx
    xorl %edx,%edx
    xorl %ecx,%ecx
cicla_piloti:

    leal pilot_9_str,%ebx
    #movl offeset,%ecx
    movb (%ebx,%ecx), %al           #prendo una lettera dal nome pilota
    
    movb (%esi,%ecx),  %dl
   
    #incl offeset
    inc %ecx

    cmpb $0,%al
    je salta_qui
    #cmpb %al,%dl
    jmp cicla_piloti
    

##################################################
    #quando avro' finito di cilare
##################################################
salta_qui:
    xorl %eax,%eax                  #azzero per sicurezza tutti i registri
    xorl %ebx,%ebx
    xorl %edx,%edx
   # xorl %ecx,%ecx
    
    addl $48,%ecx
    movl %ecx,(%edi,%eax)







ciclo_lettura:

    #movb (%esi,%ecx),  %al       #prendo il contenuto esi in pos ecx lo metto in al
    #movb %al,(%edi,%ecx)         #prendo il contenuto in al, lo metto in edi in pos ecx 
                                 #(questo verra' stampato sul file output )
    
    #incl %ecx                    #incremento ecx

    #cmpb $0,%al                  #comparo 0(\0) vedo se sono arrivato alla fine della stringa presa dal file
    #jne ciclo_lettura

popl %edx
popl %ecx
popl %ebx
popl %eax

ret



movl $4, %eax
movl $1, %ebx
leal nome, %ecx
movl nome_len, %edx
int $0x80

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
    
####################################
stama:
 movl val_id,%ecx
    addl $48, %ecx
    movl %ecx, (str_ecx)

    movl $4, %eax
    movl $1, %ebx
    movl $str_ecx, %ecx
    movl $1, %edx
    int $0x80
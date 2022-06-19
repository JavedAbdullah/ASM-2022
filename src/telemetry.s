
.bss
str_ecx:
.string ""

.section .data
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
    .string  "Sergio Perez\0"
pilot_16_str:
    .string  "Daniil Kvyat\0"
pilot_17_str:
    .string  "Kimi Raikkonen\0"
pilot_18_str:
    .string  "Esteban Ocon\0"
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
    movl (nome), %eax
    cmp (pilot_0_str), %eax
    je stampa
p_1:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_1_str), %eax
    je stampa
    
p_2:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_2_str), %eax
    je stampa
p_3:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_3_str), %eax
    je stampa
p_4:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_4_str), %eax
    je stampa
p_5:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_5_str), %eax
    je stampa
p_6:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_6_str), %eax
    je stampa
p_7:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_7_str), %eax
    je stampa
p_8:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_8_str), %eax
    je stampa
p_9:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_9_str), %eax
    je stampa
p_10:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_10_str), %eax
    je stampa
p_11:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_11_str), %eax
    je stampa
p_12:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_12_str), %eax
    je stampa
p_13:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_13_str), %eax
    je stampa
p_14:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_14_str), %eax
    je stampa
p_15:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_15_str), %eax
    je stampa
p_16:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_16_str), %eax
    je stampa
p_17:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_17_str), %eax
    je stampa
p_18:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_18_str), %eax
    je stampa
p_19:
    inc %ecx
    movl (nome), %eax
    cmp (pilot_19_str), %eax
    je stampa
jmp invalid
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

stampa:
    addl $48, %ecx
    movl %ecx, (str_ecx)

 movl $4, %eax
 movl $1, %ebx
 movl $str_ecx, %ecx
 movl $1, %edx
 int $0x80




salta:


end:

popl %edx
popl %ecx
popl %ebx
popl %eax

ret

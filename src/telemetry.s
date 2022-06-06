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


xorl %ecx,%ecx

ciclo_lettura:
    movb (%esi,%ecx),  %al
    movb %al,(%edi,%ecx)
    
    incl %ecx

    cmpb $0,%al
jne ciclo_lettura

popl %edx
popl %ecx
popl %ebx
popl %eax

ret

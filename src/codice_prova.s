; ciclo_lettura:
;     movb (%esi,%ecx),  %al
;     movb %al,(%edi,%ecx)
;     incl %ecx

;     cmpb $0,%al
; jne ciclo_lettura

   movl $4,%ecx #faccio uno spiezzamento di 4
    movb (%esi,%ecx),  %al #muovo muovo il contenuto del indirizzo in al
    movb %al,(%edi) #ora metto quello che ho in al in edi (che corrisponde alla stampa su file)

global _start
extern ft_strlen

section .data
    message db "hello", 0
    len_msg db "La longueur est: ", 0
	newline db 10, 0

section .bss
    buffer resb 20  ; Buffer pour convertir les entiers en chaîne

section .text
_start:
    ; Afficher "La longueur est: "
    mov rdi, len_msg
    call print_string

    ; Calculer la longueur de "hello"
    mov rdi, message
    call ft_strlen
    mov rsi, rax  ; Sauvegarder la longueur dans rsi

    ; Afficher la longueur
    mov rdi, rsi
    call print_int

	mov rdi, newline
    call print_string

    ; Quitter le programme
    mov rax, 60
    xor rdi, rdi
    syscall

; Fonction pour afficher une chaîne
print_string:
    push rdi           ; Sauvegarder rdi (adresse de la chaîne)
    call ft_strlen     ; Calculer la longueur de la chaîne
    mov rdx, rax       ; Longueur de la chaîne
    pop rsi            ; Restaurer rsi (adresse de la chaîne)
    mov rax, 1         ; syscall: write
    mov rdi, 1         ; stdout
    syscall
    ret

; Fonction pour afficher un entier
print_int:
    ; Sauvegarder les registres
    push rdi
    push rsi
    push rdx

    ; Initialiser les variables
    mov rsi, buffer       ; Pointeur vers le buffer
    xor rcx, rcx          ; Compteur de chiffres

.convert_loop:
    xor rdx, rdx          ; RDX = 0 (pour la division)
    mov rbx, 10           ; Diviseur = 10
    div rbx               ; RAX = RAX / 10, RDX = reste
    add dl, '0'           ; Convertir le reste en ASCII
    dec rsi               ; Déplacer le pointeur vers l'arrière
    mov [rsi], dl         ; Stocker le caractère dans le buffer
    inc rcx               ; Incrémenter le compteur de chiffres
    test rax, rax         ; Vérifier si RAX == 0
    jnz .convert_loop     ; Si non, continuer la conversion

    ; Afficher le nombre
    mov rax, 1            ; syscall: write
    mov rdi, 1            ; stdout
    mov rdx, rcx          ; Longueur du nombre
    syscall

    ; Restaurer les registres
    pop rdx
    pop rsi
    pop rdi
    ret
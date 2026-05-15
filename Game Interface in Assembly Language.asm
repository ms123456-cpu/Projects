[org 0x0100]

jmp start

; ===== DATA SECTION =====
title_line1: db '    __   __   __   __    __    ____    __    _      __   ____ ', 0
title_line2: db '   |  | |  | |  | |  \  /  |  /    \  |  \  | |    |  | |_  _|', 0
title_line3: db '   |  | |  | |  | |   \/   | |  __  | |   \ | |    |  |   ||  ', 0
title_line4: db ' __|  | |  |_|  | |  |\/|  | |  __  | | |\ \| |  __|  |  _||_ ', 0
title_line5: db '|_____| |_______| |__|  |__| |_/  \_| |_| \___| |_____| |____|', 0

; Spider web design for bottom-left corner
web_line1: db '      _ _ ',0
web_line2: db '     / | \', 0
web_line3: db '    /\ | /\', 0
web_line4: db '  _/__\|/__\_  ', 0
web_line5: db '   \  /|\  /', 0
web_line6: db '    \/ | \/', 0
web_line7: db '     \_|_/', 0
spider: db '@', 0

; Bat design for bottom-right corner
bat_line1: db '   __     __', 0
bat_line2: db '  /  \___/  \', 0
bat_line3: db '  |  (o.o)  |', 0
bat_line4: db '  \   \_/   /', 0
bat_line5: db '   \_/   \_/', 0

; Menu options
menu_start: db 'START GAME', 0
menu_instructions: db 'INSTRUCTIONS', 0
menu_options: db 'OPTIONS', 0
menu_exit: db 'EXIT', 0

; Messages
loading_msg: db 'Starting Game...', 0
press_enter: db 'Press ENTER to select, UP/DOWN arrows to navigate', 0
instructions_title: db 'INSTRUCTIONS', 0
instructions_text1: db 'Use arrow keys to navigate the menu', 0
instructions_text2: db 'Press ENTER to select an option', 0
instructions_text3: db 'Press ESC to return to menu', 0
options_title: db 'OPTIONS', 0
sound_option: db 'Sound: ', 0
sound_on: db 'ON ', 0
sound_off: db 'OFF', 0
goodbye_msg: db 'Thanks for playing!', 0

; Color attributes
title_color: db 0x1E    ; Yellow text on blue background
menu_normal: db 0x1F    ; White text on blue background  
menu_highlight: db 0x9F ; Bright white text on blue background
bg_color: db 0x17       ; White text on blue background

; Menu state
current_selection: db 0  ; 0=Start, 1=Instructions, 2=Options, 3=Exit
sound_enabled: db 1      ; 1=ON, 0=OFF

; Menu positioning
menu_y_start: db 12
menu_y_instructions: db 14      ;row's position
menu_y_options: db 16
menu_y_exit: db 18

; ===== SUBROUTINES =====

clrscr:
    push es
    push ax
    push si
    push di
    mov ax, 0xb800
    mov di, 0
    mov es, ax
    mov ax, 0x0720
    mov cx, 2000
    cld
    rep stosw
    pop di
    pop si
    pop ax
    pop es
    ret

set_cursor:
    mov ah, 0x02
    mov bh, 0x00
    int 0x10       ;gives call to BIOS
    ret

; Print string with color subroutine
; DH = row, DL = column, SI = string, BL = color
print_colored:
    push ax
    push bx
    push cx
    push dx
    push si
    push es
    push di
    
    call set_cursor
    
    mov ax, 0xB800      
    mov es, ax
    
    mov al, 80          
    mul dh
    add al, dl
    adc ah, 0
    shl ax, 1
    mov di, ax
    
print_loop:
    mov al, [si]       
    cmp al, 0           
    je print_done
    
    mov [es:di], al    
    inc di
    mov [es:di], bl     
    inc di
    
    inc si             
    jmp print_loop
    
print_done:
    pop di
    pop es
    pop si
    pop dx
    pop cx
    pop bx
    pop ax
    ret

; Fill background with color
fill_background:
    push ax
    push cx
    push di
    push es
    
    mov ax, 0xB800
    mov es, ax
    mov di, 0
    mov cx, 2000       
    mov ah, [bg_color]  
    mov al, ' '
         
fill_bg_loop:
    mov [es:di], ax
    add di, 2
    loop fill_bg_loop
    
    pop es
    pop di
    pop cx
    pop ax
    ret

; Print title screen
print_title_screen:
    call clrscr        
    call fill_background
    
    mov dh, 5
    mov dl, 8
    mov si, title_line1
    mov bl, [title_color]
    call print_colored
    
    mov dh, 6
    mov dl, 8
    mov si, title_line2
    mov bl, [title_color]
    call print_colored
    
    mov dh, 7
    mov dl, 8
    mov si, title_line3
    mov bl, [title_color]
    call print_colored
    
    mov dh, 8
    mov dl, 8
    mov si, title_line4
    mov bl, [title_color]
    call print_colored
    
    mov dh, 9
    mov dl, 8
    mov si, title_line5
    mov bl, [title_color]
    call print_colored
    
    mov dh, 22
    mov dl, 15
    mov si, press_enter
    mov bl, 0x1E        
    call print_colored
    
    call draw_spider_web
    call draw_bat  
    ret

; Draw spider web in bottom-left corner
draw_spider_web:
    push ax
    push bx
    push dx
    push si
    
    ; Draw web lines
    mov dh, 17
    mov dl, 1
    mov si, web_line1
    mov bl, 0x18        ; Dark gray on blue
    call print_colored
    mov dh, 18
    mov dl, 1
    mov si, web_line2
    mov bl, 0x18
    call print_colored
    mov dh, 19
    mov dl, 1
    mov si, web_line3
    mov bl, 0x18
    call print_colored
    mov dh, 20
    mov dl, 1
    mov si, web_line4
    mov bl, 0x18
    call print_colored
    mov dh, 21
    mov dl, 1
    mov si, web_line5
    mov bl, 0x18
    call print_colored
    mov dh, 22
    mov dl, 1
    mov si, web_line6
    mov bl, 0x18
    call print_colored
    mov dh, 23
    mov dl, 1
    mov si, web_line7
    mov bl, 0x18
    call print_colored
        
    ; Draw spider
    mov dh, 20
    mov dl, 8
    mov si, spider
    mov bl, 0x10        ; Black spider on blue
    call print_colored
    pop si
    pop dx
    pop bx
    pop ax
    ret

; Draw bat in bottom-right corner
draw_bat:
    push ax
    push bx
    push dx
    push si
    
    ; Draw bat with wings 
    mov dh, 18
    mov dl, 64
    mov si, bat_line1
    mov bl, 0x18        ; Dark gray on blue
    call print_colored
    
    mov dh, 19
    mov dl, 64
    mov si, bat_line2
    mov bl, 0x18
    call print_colored
    
    mov dh, 20
    mov dl, 64
    mov si, bat_line3
    mov bl, 0x18
    call print_colored
    
    mov dh, 21
    mov dl, 64
    mov si, bat_line4
    mov bl, 0x18
    call print_colored
    
    mov dh, 22
    mov dl, 64
    mov si, bat_line5
    mov bl, 0x18
    call print_colored
        
    pop si
    pop dx
    pop bx
    pop ax
    ret

; Delay subroutines
long_delay:
    push cx
    push dx
    mov cx, 0x0100
outer_delay:
    mov dx, 0xFFFF
inner_delay:
    nop
    dec dx
    jnz inner_delay
    loop outer_delay
    pop dx
    pop cx
    ret

short_delay:
    push cx
    mov cx, 0x0FFF
delay_loop:
    nop
    loop delay_loop
    pop cx
    ret

; Print all menu options
print_menu_screen:
    call clrscr        
    call fill_background
        
    ; Print menu options
    mov dh, [menu_y_start]
    mov dl, 35
    mov si, menu_start
    mov bl, [menu_normal]
    call print_colored
    
    mov dh, [menu_y_instructions]
    mov dl, 34
    mov si, menu_instructions
    mov bl, [menu_normal]
    call print_colored
    
    mov dh, [menu_y_options]
    mov dl, 37
    mov si, menu_options
    mov bl, [menu_normal]
    call print_colored
    
    mov dh, [menu_y_exit]
    mov dl, 38
    mov si, menu_exit
    mov bl, [menu_normal]
    call print_colored
    
    call update_menu_highlight
    ret

; Update menu highlighting based on current_selection
update_menu_highlight:
    push ax
    push bx
    push dx
    push si
    
    ; First, redraw ALL menu items in normal color
    mov dh, [menu_y_start]
    mov dl, 35
    mov si, menu_start
    mov bl, [menu_normal]
    call print_colored  
    mov dh, [menu_y_instructions]
    mov dl, 34
    mov si, menu_instructions
    mov bl, [menu_normal]
    call print_colored
    mov dh, [menu_y_options]
    mov dl, 37
    mov si, menu_options
    mov bl, [menu_normal]
    call print_colored
    mov dh, [menu_y_exit]
    mov dl, 38
    mov si, menu_exit
    mov bl, [menu_normal]
    call print_colored
    
    ; Now highlight the selected item
    mov al, [current_selection]
    cmp al, 0
    je highlight_start
    cmp al, 1
    je highlight_instructions
    cmp al, 2
    je highlight_options
    jmp highlight_exit
    
highlight_start:
    mov dh, [menu_y_start]
    mov dl, 35
    mov si, menu_start
    mov bl, [menu_highlight]
    call print_colored
    jmp highlight_done
    
highlight_instructions:
    mov dh, [menu_y_instructions]
    mov dl, 34
    mov si, menu_instructions
    mov bl, [menu_highlight]
    call print_colored
    jmp highlight_done
    
highlight_options:
    mov dh, [menu_y_options]
    mov dl, 37
    mov si, menu_options
    mov bl, [menu_highlight]
    call print_colored
    jmp highlight_done
    
highlight_exit:
    mov dh, [menu_y_exit]
    mov dl, 38
    mov si, menu_exit
    mov bl, [menu_highlight]
    call print_colored
    
highlight_done:
    pop si
    pop dx
    pop bx
    pop ax
    ret

; Show loading animation
show_loading:
    call clrscr        
    call fill_background
    
    mov ax, 0xB800
    mov es, ax
    
    mov dh, 12
    mov dl, 32
    mov si, loading_msg
    
print_loading_loop:
    mov al, [si]
    cmp al, 0
    je loading_animation_done
  
    push si
    push dx
    
    mov al, 80
    mul dh             
    add al, dl         
    adc ah, 0
    shl ax, 1          
    mov di, ax
    
    mov al, [si]       
    mov ah, 0x1F       
    mov [es:di], ax
    
    pop dx
    pop si
    
    inc dl
    inc si
    jmp print_loading_loop
    
loading_animation_done:
    mov cx, 3
final_loading_delay:
    call short_delay
    loop final_loading_delay
    
    ; Clear keyboard buffer first
    mov ah, 0x01
    int 0x16
    jnz clear_buffer
    jmp buffer_cleared

clear_buffer:
    mov ah,0x00
    int 0x16
    mov ah,0x01
    int 0x16
    jnz clear_buffer

buffer_cleared:
    ; Display "Press ESC to return" message
    mov dh, 15
    mov dl, 28
    mov si, instructions_text3    ; "Press ESC to return to menu"
    mov bl, 0x1F
    call print_colored

 ; Wait for ESC key
wait_for_esc_loading:
    mov ah, 0x00       ; Wait for keypress
    int 0x16
    cmp ah, 0x01       ; Check if ESC (scancode 0x01)
    jne wait_for_esc_loading   
    ret

; Show instructions screen
show_instructions:
    call clrscr
    call fill_background
    
    mov dh, 8
    mov dl, 34
    mov si, instructions_title
    mov bl, 0x1E
    call print_colored
    
    mov dh, 11
    mov dl, 20
    mov si, instructions_text1
    mov bl, 0x1F
    call print_colored
    
    mov dh, 13
    mov dl, 20
    mov si, instructions_text2
    mov bl, 0x1F
    call print_colored
    
    mov dh, 15
    mov dl, 20
    mov si, instructions_text3
    mov bl, 0x1F
    call print_colored
    
wait_for_esc:
    mov ah, 0x00
    int 0x16
    cmp ah, 0x01  ; ESC key
    jne wait_for_esc
    ret

; Show options screen
show_options:
    call clrscr
    call fill_background
    mov dh, 8
    mov dl, 37
    mov si, options_title
    mov bl, 0x1E
    call print_colored 
    mov dh, 12
    mov dl, 32
    mov si, sound_option
    mov bl, 0x1F
    call print_colored
    
    ; Show current sound state
    mov dl, 39
    mov al, [sound_enabled]
    cmp al, 1
    je show_sound_on
    mov si, sound_off
    jmp display_sound

show_sound_on:
    mov si, sound_on
display_sound
    mov bl, 0x1E
    call print_colored

wait_for_action:
    mov ah, 0x00
    int 0x16
    cmp ah, 0x01  ; ESC - return
    je exit_options
    cmp ah, 0x1C  ; ENTER - toggle
    jne wait_for_action
    ; Toggle sound
    mov al, [sound_enabled]
    xor al, 1
    mov [sound_enabled], al
    jmp show_options
    
exit_options:
    ret

; Handle keyboard input in menu
check_keyboard:
    mov ah, 0x01
    int 0x16
    jz no_key_pressed

    mov ah, 0x00
    int 0x16
    
    cmp ah, 0x1C  ; ENTER
    je enter_key
    
    cmp ah, 0x48  ; UP arrow
    je up_arrow
    
    cmp ah, 0x50  ; DOWN arrow
    je down_arrow
    
    jmp no_key_pressed
    
up_arrow:
    mov al, [current_selection]
    cmp al, 0
    je no_key_pressed
    dec al
    mov [current_selection], al
    call print_menu_screen
    jmp no_key_pressed
    
down_arrow:
    mov al, [current_selection]
    cmp al, 3
    je no_key_pressed
    inc al
    mov [current_selection], al
    call print_menu_screen
    jmp no_key_pressed
    
enter_key:
    mov al, 1
    ret   
no_key_pressed:
    mov al, 0
    ret

; ===== MAIN PROGRAM =====
start:
    ; Show title screen
    call print_title_screen
    
    ; Wait for key
    mov ah, 0x00
    int 0x16
    
    ; Show menu
    call print_menu_screen
    
menu_loop:
    call check_keyboard
    cmp al, 1
    je process_selection
    
    call short_delay
    jmp menu_loop
    
process_selection:
    mov al, [current_selection]
    
    cmp al, 0
    je start_game
    
    cmp al, 1
    je show_instructions_screen
    
    cmp al, 2
    je show_options_screen
    
    cmp al, 3
    je exit_program
    
start_game:
    call show_loading
    call print_menu_screen
    jmp menu_loop
    
show_instructions_screen:
    call show_instructions
    call print_menu_screen
    jmp menu_loop
    
show_options_screen:
    call show_options
    call print_menu_screen
    jmp menu_loop
    
exit_program:
    call clrscr
    call fill_background
    
    ; Display goodbye message
    mov dh, 12
    mov dl, 32
    mov si, goodbye_msg
    mov bl, 0x1E
    call print_colored
    
    ; Wait a moment
    call long_delay
    call clrscr
    
    ; Return to DOS
    mov ax, 0x4c00
    int 0x21

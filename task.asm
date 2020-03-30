    ; -----------------------------------------------------
    include \masm32\include\masm32rt.inc
    includelib \masm32\lib\masm32.lib
    ; -----------------------------------------------------

    .data?
        num                         dd          ?
        animal                      dd          ?
        color                       dd          ?
        result                      dd          ?

    .data
        GREETING                    equ         "ENTER THE YEAR: "
        START_YEAR                  dd          1984d
        YEAR_CYCLE                  dd          60d
        YEAR_SUBCYCLE               dd          12d
        
        ; ----------------------------------------------------- ANIMALS
        ; ------------------------  NAMES OF ANIMALS
        ANIMAL_MOUSE                equ         "MOUSE"
        ANIMAL_COW                  equ         "COW  "
        ANIMAL_TIGER                equ         "TIGER"
        ANIMAL_RABBIT               equ         "RABBIT"
        ANIMAL_DRAGON               equ         "DRAGON"
        ANIMAL_SNAKE                equ         "SNAKE"
        ANIMAL_HORSE                equ         "HORSE"
        ANIMAL_SHEEP                equ         "SHEEP"
        ANIMAL_MONKEY               equ         "MONKEY"
        ANIMAL_CHICKEN              equ         "CHICKEN"
        ANIMAL_DOG                  equ         "DOG  "
        ANIMAL_PIG                  equ         "PIG  "
        ; ------------------------  MESSAGES WITH ANIMALS
        MES_ANIMAL_MOUSE            db          ANIMAL_MOUSE,10,13,0
        MES_ANIMAL_COW              db          ANIMAL_COW,10,13,0
        MES_ANIMAL_TIGER            db          ANIMAL_TIGER,10,13,0
        MES_ANIMAL_RABBIT           db          ANIMAL_RABBIT,10,13,0
        MES_ANIMAL_DRAGON           db          ANIMAL_DRAGON,10,13,0
        MES_ANIMAL_SNAKE            db          ANIMAL_SNAKE,10,13,0
        MES_ANIMAL_HORSE            db          ANIMAL_HORSE,10,13,0
        MES_ANIMAL_SHEEP            db          ANIMAL_SHEEP,10,13,0
        MES_ANIMAL_MONKEY           db          ANIMAL_MONKEY,10,13,0
        MES_ANIMAL_CHICKEN          db          ANIMAL_CHICKEN,10,13,0
        MES_ANIMAL_DOG              db          ANIMAL_DOG,10,13,0
        MES_ANIMAL_PIG              db          ANIMAL_PIG,10,13,0


        ; ----------------------------------------------------- COLORS
        ; ------------------------  COLOR NAMES
        COLOR_GREEN                 equ         "GREEN "
        COLOR_RED                   equ         "RED  "
        COLOR_YELLOW                equ         "YELLOW "
        COLOR_WHITE                 equ         "WHITE "
        COLOR_BLACK                 equ         "BLACK "
        ; ------------------------  MESSAGES WITH COLORS
        MES_COLOR_GREEN             db          COLOR_GREEN,0
        MES_COLOR_RED               db          COLOR_RED,0
        MES_COLOR_YELLOW            db          COLOR_YELLOW,0
        MES_COLOR_WHITE             db          COLOR_WHITE,0
        MES_COLOR_BLACK             db          COLOR_BLACK,0

    .code

start:   
; -----------------------------------------------------
    call main
    inkey
    exit
; -----------------------------------------------------
main proc
    @_MAIN:

        MOV                         num, input(GREETING)
        .if sval(num) < 1984          
            JMP                     @_ERROR_WRONG_NUMBER
        .else
        
        print   "-------------------------------",13,10

        ; -----------------------------------------------------

        MOV                         EAX, sval(num)      
        SUB                         EAX, 1984d          ; 
        
        ; SUB MOD YEAR_CYCLE                            ; 
        MOV                         EDX, 0
        MOV                         EBX, YEAR_CYCLE
        DIV                         EBX
        ; RESULT = EDX

        ; EDX MOD 12                                    ; 
        MOV                         EAX, EDX
        MOV                         EDX, 0
        MOV                         EBX, YEAR_SUBCYCLE
        DIV                         EBX
        ; RESULT = EDX
        MOV                         animal, EDX
        
        ; EDX / 2                                       ; 
        MOV                         EAX, EDX
        MOV                         EDX, 0
        MOV                         EBX, 2
        DIV                         EBX
        ; RESULT = EAX
        MOV                         color, EAX

        ; -----------------------------------------------------
        
        print "NAME OF THE YEAR: "
 
        @_PRINT_COLOR:

            .if color == 0
                print               addr            MES_COLOR_GREEN
                jmp                 @_PRINT_ANIMAL
            .elseif color == 1
                print               addr            MES_COLOR_RED
                jmp                 @_PRINT_ANIMAL
            .elseif color == 2
                print               addr            MES_COLOR_YELLOW
                jmp                 @_PRINT_ANIMAL
            .elseif color == 3
                print               addr            MES_COLOR_WHITE
                jmp                 @_PRINT_ANIMAL
            .elseif color == 4
                print               addr            MES_COLOR_BLACK
                jmp                 @_PRINT_ANIMAL
            .endif
            
        @_PRINT_ANIMAL:
            
            .if animal == 0
                print               addr            MES_ANIMAL_MOUSE
                jmp                 @_END
            .elseif animal == 1
                print               addr            MES_ANIMAL_COW
                jmp                 @_END
            .elseif animal == 2
                print               addr            MES_ANIMAL_TIGER
                jmp                 @_END
            .elseif animal == 3
                print               addr            MES_ANIMAL_RABBIT
                jmp                 @_END
            .elseif animal == 4
                print               addr            MES_ANIMAL_DRAGON
                jmp                 @_END
            .elseif animal == 5
                print               addr            MES_ANIMAL_SNAKE
                jmp                 @_END
            .elseif animal == 6
                print               addr            MES_ANIMAL_HORSE
                jmp                 @_END
            .elseif animal == 7
                print               addr            MES_ANIMAL_SHEEP
                jmp                 @_END
            .elseif animal == 8
                print               addr            MES_ANIMAL_MONKEY
                jmp                 @_END
            .elseif animal == 9
                print               addr            MES_ANIMAL_CHICKEN
                jmp                 @_END
            .elseif animal == 10
                print               addr            MES_ANIMAL_DOG
                jmp                 @_END
            .elseif animal == 11
                print               addr            MES_ANIMAL_PIG
                jmp                 @_END
            .endif

        @_END:
        
            ; -----------------------------------------------------
        
            print   "-------------------------------",13,10
            print                                   " ",13,10
            jmp main
            
        .endif

    @_ERROR_WRONG_NUMBER:
        print "ERROR: WRONG NUMBER (min 1984)",13,10
        print " ",13,10
        jmp     main
    ret
    
main endp

end start

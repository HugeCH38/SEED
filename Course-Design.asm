;; - - - - - - - - - - - - - - - - Data Segment - - - - - - - - - - - - - - - -
data segment
    DictFile db "Dict", 0 ; Dict File, ASCIZ filename
    DictHandle dw 0 ; Dict File Handle
    
    IdxInfoSize equ 16 ; Index Info Size = 8 words = 16 Bytes
    
    MaxWordNum equ 128
    
    IdxEntrySize equ 32 ; Index Entry Size =  (14 + 2) words = 32 Bytes
    MaxWordSize equ 28 ; 14 words = 28 Bytes (including a "$")
    AddSize equ 4 ; Address Size = 2 words = 4 Bytes
    
    WordIdxTblSize equ 4096 ; Word Index Table Size = 128 * (14 + 2) words = 2048 words = 4096 Bytes
    FreeBlkTblSize equ 512 ; Free Block Table Size = 128 * 2 words = 256 words = 512 Bytes
    
    DataItemSize equ 64 ; 64 Bytes (including a "$")
    DataRecSize equ 384 ; Data Record Size = 64 * (4 + 1 + 1) = 384 Bytes
    
    IdxInfo dw 8 dup(0) ; Index Info
                        ; IdxInfo[0] = Max Word Number
                        ; IdxInfo[2] = Word Number
                        ; IdxInfo[4]:IdxInfo[6] = Word Index Table Address
                        ; IdxInfo[8] = Free Block Number
                        ; IdxInfo[10]:IdxInfo[12] = Free Block Table Address
                        ; IdxInfo[14] (no use)
    
    WordIdxTbl db 4096 dup("$") ; Word Index Table
    FreeBlkTbl db 512 dup("$") ; Free Block Table
    
    DataRec db 384 dup("$")
    DataItem db 64 dup("$")
    
    Word db 27, 00h, 28 dup("$") ; Word
    WordM1 db 63, 00h, 64 dup("$") ; Word Meaning 1
    WordM2 db 63, 00h, 64 dup("$") ; Word Meaning 2
    WordM3 db 63, 00h, 64 dup("$") ; Word Meaning 3
    WordM4 db 63, 00h, 64 dup("$") ; Word Meaning 4
    WordS db 63, 00h, 64 dup("$") ; Word Synonyms
    WordA db 63, 00h, 64 dup("$") ; Word Antonyms
    
    WelMsg db "Welcome to use Simple English-English Dictionary$"
    LoadMsg db "Loading...$"
    PKeyMsg db "Press any key to exit...$"
    
    ChooseMsg db "All ready! Enter an option!$"
    OptErrMsg db "Illegal! Enter again!$"
    
    AddWordMsg1 db "Enter a word!$"
    AddWordMsg2 db "Enter the info of this word!$"
    ModWordMsg1 db "Enter a word!$"
    ModWordMsg2 db "Enter the info of this word!$"
    DelWordMsg db "Enter a word!$"
    FindWordMsg db "Enter the word prefix!$"
    QueryWordMMsg db "Enter a word!$"
    QueryWordSMsg db "Enter a word!$"
    QueryWordAMsg db "Enter a word!$"
    
    NotFoundMsg db "Word Not Found!$"
    ExistMsg db "Word Exists!$"

    DictTip db "Simple English-English Dictionary$" ; Dictionary Tip
    
    MenuTip db "Menu:$" ; Menu Tip
    
    Menu12 db "<1> Add Word      <2> Modify Word$", 0dh, 0ah
    Menu34 db "<3> Delete Word   <4> Find Word$", 0dh, 0ah
    Menu5  db "<5> Query Word Meanings$", 0dh, 0ah
    Menu6  db "<6> Query Word Synonyms$", 0dh, 0ah
    Menu7  db "<7> Query Word Antonyms$", 0dh, 0ah
    Menu0  db "<0> Exit$"
    
    MsgTip db "Massage:$" ; Massage Tip
    
    OptTip db "Input the option (0 ~ 7):$" ; Option Tip
    
    OutTip db "Output:$" ; Output Tip
    
    WordTip   db "    Word: $" ; Word Tip
    
    WordMTip  db " Meaning: $" ; Word Meaning Tip
    WordM1Tip db "       1: $" ; Word Meaning 1 Tip
    WordM2Tip db "       2: $" ; Word Meaning 2 Tip
    WordM3Tip db "       3: $" ; Word Meaning 3 Tip
    WordM4Tip db "       4: $" ; Word Meaning 4 Tip
    
    WordSTip  db "Synonyms: $" ; Word Synonyms Tip
    WordATip  db "Antonyms: $" ; Word Antonyms Tip
    
    MtchTip   db "   Match: $" ; Match Tip
    
    BlackOnWhite db 0f0h ; Black on White
    BlueOnWhite db 0f1h ; Blue on White
    LightRedOnWhite db 0fch ; Light Red on White
    BlackOnYellow db 0e0h ; Black on Yellow
    YellowOnBlue db 1eh ; Yellow on Blue
    DarkGrayOnDarkGray db 88h ; Dark Gray on Dark Gray
    
    ; Welcome Window Upper Left Row / Column, Lower Right Row / Column
    WndWelUlr db 0ah ; 10
    WndWelUlc db 0eh ; 14
    WndWelLrr db 0eh ; 14
    WndWelLrc db 41h ; 65
    
    ; Full Window Upper Left Row / Column, Lower Right Row / Column
    WndFullUlr db 00h ; 0
    WndFullUlc db 00h ; 0
    WndFullLrr db 18h ; 24
    WndFullLrc db 4fh ; 79
    
    ; Menu Window Upper Left Row / Column, Lower Right Row / Column
    WndMenuUlr db 04h ; 4
    WndMenuUlc db 02h ; 2
    WndMenuLrr db 0bh ; 11
    WndMenuLrc db 26h ; 38
    
    ; Massage Window Upper Left Row / Column, Lower Right Row / Column
    WndMsgUlr db 04h ; 4
    WndMsgUlc db 2ah ; 42
    WndMsgLrr db 06h ; 6
    WndMsgLrc db 4dh ; 77
    
    ; Option Window Upper Left Row / Column, Lower Right Row / Column
    WndOptUlr db 09h ; 9
    WndOptUlc db 2ah ; 42
    WndOptLrr db 0bh ; 11
    WndOptLrc db 4dh ; 77
    
    ; Output Window Upper Left Row / Column, Lower Right Row / Column
    WndOutUlr db 0eh ; 14
    WndOutUlc db 02h ; 2
    WndOutLrr db 17h ; 23
    WndOutLrc db 4dh ; 77
    
    ; Bar Upper Left Row / Column, Lower Right Row / Column
    WndBarUlr db 01h ; 1
    WndBarUlc db 00h ; 0
    WndBarLrr db 01h ; 1
    WndBarLrc db 4fh ; 79

    CreFileErrMsg db "ERROR: CreFile()!$" ; Create File Error Massage
    CreFileParm dw 3 dup(0) ; Create File Parameters:
                            ; CreFileParm[0] = ASCIZ filename address
                            ; CreFileParm[2] = file attribution
                            ; CreFileParm[4] = (return) file handle
    
    OpenFileErrMsg db "ERROR: OpenFile()!$" ; Open File Error Massage
    OpenFileParm dw 2 dup(0) ; Open File Parameters:
                             ; OpenFileParm[0] = ASCIZ filename address
                             ; OpenFileParm[2] = (return) file handle
    
    SeekFileErrMsg db "ERROR: SeekFile()!$" ; Seek File Error Massage
    SeekFileParm dw 4 dup(0) ; Seek File Parameters:
                             ; SeekFileParm[0] = 42h + origin of move
                             ; SeekFileParm[2] = file handle
                             ; SeekFileParm[4]:SeekFileParm[6] = offset from origin of new file position                         
    
    WFileErrMsg db "ERROR: WFile()!$" ; Write File Error Massage
    WFileParm dw 3 dup(0) ; Write File Parameters:
                          ; WFileParm[0] = file handle
                          ; WFileParm[2] = number of bytes to write
                          ; WFileParm[4] = address of data to write
                              
    RFileErrMsg db "ERROR: RFile()!$" ; Read File Error Massage
    RFileParm dw 3 dup(0) ; Read File Parameters:
                          ; RFileParm[0] = file handle
                          ; RFileParm[2] = number of bytes to read
                          ; RFileParm[4] = address of buffer for data

    CloseFileErrMsg db "ERROR: CloseFile()!$" ; Close File Error Massage
    CloseFileParm dw 1 dup(0) ; Close File Parameters:
                              ; CloseFileParm[0] = file handle
    
    InsWordIdxParm dw 3 dup(0) ; Insert Word Index Parameters:
                               ; InsWordIdxParm[0] = offset word
                               ; InsWordIdxParm[2]:InsWordIdxParm[4] = (return) word record address
    
    InsWordRecParm dw 8 dup(0) ; Insert Word Record Parameters:
                               ; InsWordRecParm[0] = offset word meaning 1
                               ; InsWordRecParm[2] = offset word meaning 2
                               ; InsWordRecParm[4] = offset word meaning 3
                               ; InsWordRecParm[6] = offset word meaning 4
                               ; InsWordRecParm[8] = offset word synonyms
                               ; InsWordRecParm[10] = offset word antonyms
                               ; InsWordRecParm[12]:InsWordRecParm[14] = word record address
    
    DelWordIdxParm dw 1 dup(0) ; Delete Word Index Parameters:
                               ; DelWordIdxParm[0] = the order of the word index entry
                               ; (the order starting from 0)
    
    RDataRecParm dw 2 dup(0) ; Read Data Record Parameters:
                             ; RDataRecParm[0] = offset word
                             ; RDataRecParm[2] = (return) bool found or not
                             ; return: DataRec (384 Bytes)
    
    CmpWordsParm dw 2 dup(0) ; Compare Words Parameters:
                             ; CmpWordsParm[0] = offset Word01
                             ; CmpWordsParm[2] = offset Word02
                             
    MtchWordPrfxParm dw 2 dup(0) ; Match Word Prefix Parameters:
                                 ; MtchWordPrfxParm[0] = offset Word01
                                 ; MtchWordPrfxParm[2] = offset Word02
    
    Word01 db "enable$" ; Word 01
    Word01M1 db "give someone the opportunity to do something$" ; Word 01 Meaning 1
    Word01M2 db "to make something possible for it to happen$" ; Word 01 Meaning 2
    Word01M3 db "to give someone permission or the right to do something$" ; Word 01 Meaning 3
    Word01M4 db "to make it possible for somebody to do something$" ; Word 01 Meaning 4
    Word01S db "capacitate, empower, authorize, qualify$" ; Word 01 Synonyms
    Word01A db "disable, disallow, inhibit$" ; Word 01 Antonyms
    
    Word02 db "enact$" ; Word 02
    Word02M1 db "make a proposal into a law$" ; Word 02 Meaning 1
    Word02M2 db "perform a story or play by acting$" ; Word 02 Meaning 2
    Word02M3 db "a particular event or situation happens$" ; Word 02 Meaning 3
    Word02M4 db "to put something into action$" ; Word 02 Meaning 4
    Word02S db "play, portray, perform, act$" ; Word 02 Synonyms
    Word02A db "reject$" ; Word 02 Antonyms
    
    Word03 db "accept$" ; Word 03
    Word03M1 db "say yes to something or agree to take something$" ; Word 03 Meaning 1
    Word03M2 db "believe that something is true or valid$" ; Word 03 Meaning 2
    Word03M3 db "agree to something and allow something to happen$" ; Word 03 Meaning 3
    Word03M4 db "agree to do what someone say$" ; Word 03 Meaning 4
    Word03S db "approve, adopt, recognize, admit$" ; Word 03 Synonyms
    Word03A db "refuse, reject, decline, deny$" ; Word 03 Antonyms
    
    Word04 db "win$" ; Word 04
    Word04M1 db "defeat people you are competing or fighting against$" ; Word 04 Meaning 1
    Word04M2 db "do better than everyone else involved$" ; Word 04 Meaning 2
    Word04M3 db "succeed in getting something you want or need$" ; Word 04 Meaning 3
    Word04M4 db "something causes you to get something you want or need$" ; Word 04 Meaning 4
    Word04S db "arrive, purchase, success, victory$" ; Word 04 Synonyms
    Word04A db "lose, beat, downfall, defeat, fall, fail, failure$" ; Word 04 Antonyms
    
    Word05 db "engage$" ; Word 05
    Word05M1 db "do something or be actively involved with something$" ; Word 05 Meaning 1
    Word05M2 db "something keeps you interested in it and thinking about it$" ; Word 05 Meaning 2
    Word05M3 db "have a conversation with someone$" ; Word 05 Meaning 3
    Word05M4 db "appoint someone to do a particular job$" ; Word 05 Meaning 4
    Word05S db "attract, absorb, draw$" ; Word 05 Synonyms
    Word05A db "disentangle, disengage$" ; Word 05 Antonyms
    
    Word06 db "account$" ; Word 06
    Word06M1 db "a regular customer of a company$" ; Word 06 Meaning 1
    Word06M2 db "detailed records of all the money that receives and spends$" ; Word 06 Meaning 2
    Word06M3 db "a written or spoken report of something that has happened$" ; Word 06 Meaning 3
    Word06M4 db "a theory which is intended to explain or describe something$" ; Word 06 Meaning 4
    Word06S db "explanation, construction, interpret, illustrate, clarify$" ; Word 06 Synonyms
    Word06A db "$" ; Word 06 Antonyms
    
    Word07 db "essential$" ; Word 07
    Word07M1 db "be extremely important or absolutely necessary$" ; Word 07 Meaning 1
    Word07M2 db "the things that are absolutely necessary$" ; Word 07 Meaning 2
    Word07M3 db "something's most basic or important aspects$" ; Word 07 Meaning 3
    Word07M4 db "the most important principles, ideas, or facts$" ; Word 07 Meaning 4
    Word07S db "elementary, fundamental, basic, necessary, primary, requirement$" ; Word 07 Synonyms
    Word07A db "unnecessary, inessential$" ; Word 07 Antonyms
    
    Word08 db "far$" ; Word 08
    Word08M1 db "there is a great distance between two places$" ; Word 08 Meaning 1
    Word08M2 db "a long time from the present or from a particular point in time$" ; Word 08 Meaning 2
    Word08M3 db "the extent or degree to which something happens or is true$" ; Word 08 Meaning 3
    Word08M4 db "to describe the progress that someone or something makes$" ; Word 08 Meaning 4
    Word08S db "remote, distant$" ; Word 08 Synonyms
    Word08A db "near, close$" ; Word 08 Antonyms
    
    Word09 db "fat$" ; Word 09
    Word09M1 db "have a lot of flesh on one's body and weigh too much$" ; Word 09 Meaning 1
    Word09M2 db "the extra flesh that animals and humans have under their skin$" ; Word 09 Meaning 2
    Word09M3 db "a solid or liquid substance obtained from animals or vegetables$" ; Word 09 Meaning 3
    Word09M4 db "a substance contained in foods which forms an energy$" ; Word 09 Meaning 4
    Word09S db "plump, corpulent$" ; Word 09 Synonyms
    Word09A db "thin, slim$" ; Word 09 Antonyms
    
    Word10 db "appreciate$" ; Word 10
    Word10M1 db "like something because you recognize its good qualities$" ; Word 10 Meaning 1
    Word10M2 db "understand a situation or problem and know what it involves$" ; Word 10 Meaning 2
    Word10M3 db "be grateful for something$" ; Word 10 Meaning 3
    Word10M4 db "something that you own, its value increases$" ; Word 10 Meaning 4
    Word10S db "enjoy, grasp, see$" ; Word 10 Synonyms
    Word10A db "misunderstand, underrate, disparage, belittle, denigrate$" ; Word 10 Antonyms
    
    Word11 db "general$" ; Word 11
    Word11M1 db "high-ranking officer in the armed forces, usually in the army$" ; Word 11 Meaning 1
    Word11M2 db "describing the situation as a whole$" ; Word 11 Meaning 2
    Word11M3 db "describe something that involves or affects most people$" ; Word 11 Meaning 3
    Word11M4 db "describe something is not restricted to any one thing or area$" ; Word 11 Meaning 4
    Word11S db "strategos, ordinary, average, universal, common, widespread$" ; Word 11 Synonyms
    Word11A db "special, especial, particular, peculiar, individual$" ; Word 11 Antonyms
    
    Word12 db "mean$" ; Word 12
    Word12M1 db "what something refers to or what its message is$" ; Word 12 Meaning 1
    Word12M2 db "describe something is important to someone in some way$" ; Word 12 Meaning 2
    Word12M3 db "describe someone is serious about something$" ; Word 12 Meaning 3
    Word12M4 db "describe someone is unwilling to spend much money$" ; Word 12 Meaning 4
    Word12S db "imply, indicate, represent, denote, signify, suggest$" ; Word 12 Synonyms
    Word12A db "generous, kind$" ; Word 12 Antonyms
ends



;; - - - - - - - - - - - - - - - - Stack Segment - - - - - - - - - - - - - - - -
stack segment
    dw 128 dup(0)
ends



;; - - - - - - - - - - - - - - - - Macros - - - - - - - - - - - - - - - -
;; 保护寄存器
protect5reg macro reg1, reg2, reg3, reg4, reg5
    push reg1
    push reg2
    push reg3
    push reg4
    push reg5
endm

protect4reg macro reg1, reg2, reg3, reg4
    push reg1
    push reg2
    push reg3
    push reg4
endm

protect3reg macro reg1, reg2, reg3
    push reg1
    push reg2
    push reg3
endm

protect2reg macro reg1, reg2
    push reg1
    push reg2
endm

protect1reg macro reg
    push reg
endm

;; 恢复寄存器
restore5reg macro reg1, reg2, reg3, reg4, reg5
    pop reg1
    pop reg2
    pop reg3
    pop reg4
    pop reg5
endm

restore4reg macro reg1, reg2, reg3, reg4
    pop reg1
    pop reg2
    pop reg3
    pop reg4
endm

restore3reg macro reg1, reg2, reg3
    pop reg1
    pop reg2
    pop reg3
endm

restore2reg macro reg1, reg2
    pop reg1
    pop reg2
endm

restore1reg macro reg
    pop reg
endm

;; Wait For Key
WaitForKey macro
    protect1reg ax
    PrnStr PKeyMsg
    ; wait for any key...
    mov ah, 01h ; read character from standard input
    int 21h
    restore1reg ax
endm

;; Welcome
Welcome macro
    DrawFullWnd
    DrawWelWnd
    SetCurPos 0, WndWelUlr, WndWelUlc, 0, 1, 2
    PrnStr WelMsg
    SetCurPos 0, WndWelUlr, WndWelUlc, 0, 3, 21
    PrnStr LoadMsg
endm

;; Init Dict File
InitDict macro
    protect5reg ax, bx, cx, dx, si
    local again, done
    mov CreFileParm[0], offset DictFile
    mov CreFileParm[2], 0000h
    call CreFile
    mov ax, CreFileParm[4]
    ; mov DictHandle, ax
    mov CloseFileParm[0], ax
    call CloseFile
    mov OpenFileParm[0], offset DictFile
    call OpenFile
    mov ax, OpenFileParm[2]
    mov DictHandle, ax
    mov IdxInfo[0], MaxWordNum ; 词典可存最多单词数
    mov IdxInfo[2], 0 ; 词典已存单词数 (索引表中单词数目)
    mov IdxInfo[4], 0000h ; 索引表所在位置 (距文件首的字节数) 的高数
    mov IdxInfo[6], 0010h ; 索引表所在位置 (距文件首的字节数) 的低数
    mov IdxInfo[8], MaxWordNum ; 空闲块数目
    mov IdxInfo[10], 0000h ; 空闲块表所在位置 (距文件首的字节数) 的高数
    mov IdxInfo[12], 1010h ; 空闲块表所在位置 (距文件首的字节数) 的低数
    SyncIdxInfo
    ; SyncWordIdxTbl
    lea bx, FreeBlkTbl
    mov si, 508
    mov ax, 0000h
    mov dx, 1210h
    mov cx, 128
again:
    mov bx[si], ax
    mov bx[si + 2], dx
    add dx, DataRecSize
    adc ax, 0
    sub si, 4     
    loop again
    SyncFreeBlkTbl
    restore5reg si, dx, cx, bx, ax
endm

;; Prestore
Prestore macro
    StoreWord Word01, Word01M1, Word01M2, Word01M3, Word01M4, Word01S, Word01A
    StoreWord Word02, Word02M1, Word02M2, Word02M3, Word02M4, Word02S, Word02A
    StoreWord Word03, Word03M1, Word03M2, Word03M3, Word03M4, Word03S, Word03A
    StoreWord Word04, Word04M1, Word04M2, Word04M3, Word04M4, Word04S, Word04A
    StoreWord Word05, Word05M1, Word05M2, Word05M3, Word05M4, Word05S, Word05A
    StoreWord Word06, Word06M1, Word06M2, Word06M3, Word06M4, Word06S, Word06A
    StoreWord Word07, Word07M1, Word07M2, Word07M3, Word07M4, Word07S, Word07A
    StoreWord Word08, Word08M1, Word08M2, Word08M3, Word08M4, Word08S, Word08A
    StoreWord Word09, Word09M1, Word09M2, Word09M3, Word09M4, Word09S, Word09A
    StoreWord Word10, Word10M1, Word10M2, Word10M3, Word10M4, Word10S, Word10A
    StoreWord Word11, Word11M1, Word11M2, Word11M3, Word11M4, Word11S, Word11A
    StoreWord Word12, Word12M1, Word12M2, Word12M3, Word12M4, Word12S, Word12A
endm

;; 初始化程序界面 Init Interface
InitInterface macro
    DrawFullWnd
    PrnDictTip
    DrawBar
    PrnMenuTip
    DrawMenuWnd
    PrnMenu
    PrnMsgTip
    DrawMsgWnd
    PrnOptTip
    DrawOptWnd
    PrnOutTip
    DrawOutWnd
endm

;; 绘制窗口 Draw Window
DrawWnd macro attribute, ulr, ulc, lrr, lrc ; upper left row / column
                                            ; lower right row / column
    protect4reg ax, bx, cx, dx
    mov bh, attribute ; attribute
    mov ch, ulr
    mov cl, ulc ; from upper left corner
    mov dh, lrr
    mov dl, lrc ; to lower right corner
    mov al, 00h ; number of lines by which to scroll
                ; 00h = clear entire window
    mov ah, 06h ; scroll up window
    int 10h
    restore4reg dx, cx, bx, ax
endm

;; Draw Full Window
DrawFullWnd macro
    DrawWnd YellowOnBlue, WndFullUlr, WndFullUlc, WndFullLrr, WndFullLrc
endm

;; Draw Welcome Window
DrawWelWnd macro
    DrawWnd BlackOnYellow, WndWelUlr, WndWelUlc, WndWelLrr, WndWelLrc
endm

;; Draw Bar
DrawBar macro
    DrawWnd DarkGrayOnDarkGray, WndBarUlr, WndBarUlc, WndBarLrr, WndBarLrc
endm

;; Draw Menu Window
DrawMenuWnd macro
    DrawWnd BlackOnWhite, WndMenuUlr, WndMenuUlc, WndMenuLrr, WndMenuLrc
endm

;; Draw Massage Window
DrawMsgWnd macro
    DrawWnd LightRedOnWhite, WndMsgUlr, WndMsgUlc, WndMsgLrr, WndMsgLrc
endm

;; Draw Option Window
DrawOptWnd macro
    DrawWnd BlueOnWhite, WndOptUlr, WndOptUlc, WndOptLrr, WndOptLrc
endm

;; Draw Output Window
DrawOutWnd macro
    DrawWnd BlueOnWhite, WndOutUlr, WndOutUlc, WndOutLrr, WndOutLrc
endm

;; Set Cursor Position
SetCurPos macro page, row, column, addP, addR, addC
    protect3reg ax, bx, dx
    mov bh, page
    add bh, addP ; page number
    mov dh, row
    add dh, addR ; row
    mov dl, column
    add dl, addC ; column
    mov ah, 02h ; set cursor position
    int 10h
    restore3reg dx, bx, ax
endm

;; Print String
PrnStr macro str
    protect2reg ax, dx
    mov dx, offset str ; string to write
    mov ah, 09h ; output of a string at DS:DX
    int 21h
    restore2reg dx, ax
endm

;; Print Dict Tip
PrnDictTip macro
    SetCurPos 0, 0, 24, 0, 0, 0
    PrnStr DictTip
endm

;; Print Menu Tip
PrnMenuTip macro
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, -1, 0
    PrnStr MenuTip
endm

;; Print Menu
PrnMenu macro
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, 1, 2
    PrnStr Menu12
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, 2, 2
    PrnStr Menu34
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, 3, 2
    PrnStr Menu5
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, 4, 2
    PrnStr Menu6
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, 5, 2
    PrnStr Menu7
    SetCurPos 0, WndMenuUlr, WndMenuUlc, 0, 6, 2
    PrnStr Menu0
endm

;; Print Massage Tip
PrnMsgTip macro
    SetCurPos 0, WndMsgUlr, WndMsgUlc, 0, -1, 0
    PrnStr MsgTip
endm

;; Print Massage
PrnMsg macro msg
    DrawMsgWnd
    SetCurPos 0, WndMsgUlr, WndMsgUlc, 0, 1, 2
    PrnStr msg
endm

;; Print Option Tip
PrnOptTip macro
    SetCurPos 0, WndOptUlr, WndOptUlc, 0, -1, 0
    PrnStr OptTip
endm

;; Print Output Tip
PrnOutTip macro
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, -1, 0
    PrnStr OutTip
endm

;; Print Word Tip
PrnWordTip macro
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, 1, 1
    PrnStr WordTip
endm

;; Print Meaning Tip
PrnWordMTip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordMTip
endm

;; Print Meaning 1 Tip
PrnWordM1Tip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordM1Tip
endm

;; Print Meaning 2 Tip
PrnWordM2Tip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordM2Tip
endm

;; Print Meaning 3 Tip
PrnWordM3Tip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordM3Tip
endm

;; Print Meaning 4 Tip
PrnWordM4Tip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordM4Tip
endm

;; Print Synonyms Tip
PrnWordSTip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordSTip
endm

;; Print Antonyms Tip
PrnWordATip macro addR
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 1
    PrnStr WordATip
endm

;; Print Word Not Found Massage
PrnNotFoundMsg macro
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, 3, 5
    PrnStr NotFoundMsg
endm

;; Print Word Exist Message
PrnExistMsg macro
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, 3, 5
    PrnStr ExistMsg
endm

;; Print Match Tip
PrnMtchTip macro
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, 3, 1
    PrnStr MtchTip
endm

;; Print Word
PrnWord macro addR, wordOffset
    protect2reg ax, dx
    SetCurPos 0, WndOutUlr, WndOutUlc, 0, addR, 11
    mov dx, wordOffset ; string to write
    mov ah, 09h ; output of a string at DS:DX
    int 21h
    restore2reg dx, ax
endm

;; Sync Index Info
SyncIdxInfo macro
    protect1reg ax
    mov SeekFileParm[0], 4200h
    mov ax, DictHandle
    mov SeekFileParm[2], ax
    mov SeekFileParm[4], 0000h
    mov SeekFileParm[6], 0000h
    call SeekFile
    mov ax, DictHandle
    mov WFileParm[0], ax
    mov WFileParm[2], IdxInfoSize
    mov WFileParm[4], offset IdxInfo
    call WFile
    restore1reg ax
endm

;; Sync Word Index Table
SyncWordIdxTbl macro
    protect2reg ax, dx
    mov SeekFileParm[0], 4200h
    mov ax, DictHandle
    mov SeekFileParm[2], ax
    mov ax, IdxInfo[4]
    mov SeekFileParm[4], ax
    mov ax, IdxInfo[6]
    mov SeekFileParm[6], ax
    call SeekFile
    mov ax, DictHandle
    mov WFileParm[0], ax
    ; mov WFileParm[2], WordIdxTblSize
    mov ax, IdxInfo[2]
    mov dl, IdxEntrySize
    mul dl
    mov WFileParm[2], ax
    mov WFileParm[4], offset WordIdxTbl
    call WFile
    restore2reg dx, ax
endm

;; Sync Free Block Table
SyncFreeBlkTbl macro
    protect2reg ax, dx
    mov SeekFileParm[0], 4200h
    mov ax, DictHandle
    mov SeekFileParm[2], ax
    mov ax, IdxInfo[10]
    mov SeekFileParm[4], ax
    mov ax, IdxInfo[12]
    mov SeekFileParm[6], ax
    call SeekFile
    mov ax, DictHandle
    mov WFileParm[0], ax
    ; mov WFileParm[2], FreeBlkTblSize
    mov ax, IdxInfo[8]
    mov dl, AddSize
    mul dl
    mov WFileParm[2], ax
    mov WFileParm[4], offset FreeBlkTbl
    call WFile
    restore2reg dx, ax
endm

;; Store Word
StoreWord macro word, m1, m2, m3, m4, synonyms, antonyms
    protect1reg ax
    mov InsWordIdxParm[0], offset word
    call InsWordIdx
    mov ax, InsWordIdxParm[2]
    mov InsWordRecParm[12], ax
    mov ax, InsWordIdxParm[4]
    mov InsWordRecParm[14], ax
    mov InsWordRecParm[0], offset m1
    mov InsWordRecParm[2], offset m2
    mov InsWordRecParm[4], offset m3
    mov InsWordRecParm[6], offset m4
    mov InsWordRecParm[8], offset synonyms
    mov InsWordRecParm[10], offset antonyms
    call InsWordRec
    restore1reg ax
endm

;; Input Word
InputWord macro word
    protect2reg ax, dx
    PrnWordTip
    mov dx, offset word
    mov ah, 0ah ; input of a string to DS:DX
    int 21h
    xor bx, bx
    mov bl, byte ptr word[1]
    mov word[bx+2], '$'
    restore2reg dx, ax
endm

;; Input Word Info
InputWordInfo macro m1, m2, m3, m4, synonyms, antonyms
    PrnWordMTip 2
    PrnWordM1Tip 3
    InputDataItem m1
    PrnWordM2Tip 4
    InputDataItem m2
    PrnWordM3Tip 5
    InputDataItem m3
    PrnWordM4Tip 6
    InputDataItem m4
    PrnWordSTip 7
    InputDataItem synonyms
    PrnWordATip 8
    InputDataItem antonyms
endm

;; Input Data Item
InputDataItem macro item
    protect2reg ax, dx
    mov dx, offset item
    mov ah, 0ah ; input of a string to DS:DX
    int 21h
    xor bx, bx
    mov bl, item[1]
    mov item[bx+2], '$'
    restore2reg dx, ax
endm

;; Write Data Item
WDataItem macro item
    protect1reg ax
    mov ax, DictHandle
    mov WFileParm[0], ax
    mov WFileParm[2], DataItemSize
    mov ax, item
    mov WFileParm[4], ax
    call WFile
    restore1reg ax
endm



;; - - - - - - - - - - - - - - - - Code Segment - - - - - - - - - - - - - - - -
code segment
start:
    ; set segment registers:
    mov ax, data
    mov ds, ax
    mov es, ax
    mov ah, 03h ; get cursor position and size
    int 10h ; Screen Initialize
    Welcome
    InitDict
    Prestore
    InitInterface
    PrnMsg ChooseMsg
again:
    DrawOptWnd
    SetCurPos 0, WndOptUlr, WndOptUlc, 0, 1, 2
    mov ah, 01h ; read character from standard input
    int 21h
    cmp al, "1"
    jne next2
    call AddWord
    PrnMsg ChooseMsg
    jmp again
next2:
    cmp al, "2"
    jne next3
    call ModWord
    PrnMsg ChooseMsg
    jmp again
next3:
    cmp al, "3"
    jne next4
    call DelWord
    PrnMsg ChooseMsg
    jmp again
next4:
    cmp al, "4"
    jne next5
    call FindWord
    PrnMsg ChooseMsg
    jmp again
next5:
    cmp al, "5"
    jne next6
    call QueryWordM
    PrnMsg ChooseMsg
    jmp again
next6:
    cmp al, "6"
    jne next7
    call QueryWordS
    PrnMsg ChooseMsg
    jmp again
next7:
    cmp al, "7"
    jne next0
    call QueryWordA
    PrnMsg ChooseMsg
    jmp again
next0:
    cmp al, "0"
    je exit
    PrnMsg OptErrMsg
    jmp again
exit:
    mov ax, DictHandle
    mov CloseFileParm[0], ax
    call CloseFile
    DrawFullWnd
    DrawWelWnd
    SetCurPos 0, WndWelUlr, WndWelUlc, 0, 2, 2
    WaitForKey    
    mov ax, 4c00h ; exit to operating system.
    int 21h    
ends



;; - - - - - - - - - - - - - - - - Functions - - - - - - - - - - - - - - - -
;; Add Word
AddWord proc near
    protect4reg ax, cx, di, si
    DrawMsgWnd
    PrnMsg AddWordMsg1
    DrawOutWnd
    InputWord Word
    ; Search
    mov cx, IdxInfo[2]
    cmp cx, 0
    je done_AddWord ; cx = 0 (单词索引表为空，单词不可能存在)
    mov di, 0
    mov ax, offset Word[2]
    mov CmpWordsParm[0], ax
again_AddWord:
    protect1reg di
    add di, offset WordIdxTbl
    mov CmpWordsParm[2], di
    restore1reg di
    call CmpWords
    jz exist_AddWord ; 在索引表当中找到了该单词 (单词已存在)
    jc done_AddWord ; 后面的单词都不可能是该单词了 (单词不可能存在)
    add di, IdxEntrySize
    loop again_AddWord
done_AddWord:
    PrnMsg AddWordMsg2
    InputWordInfo WordM1, WordM2, WordM3, WordM4, WordS, WordA
    StoreWord Word[2], WordM1[2], WordM2[2], WordM3[2], WordM4[2], WordS[2], WordA[2]
    jmp exit_AddWord
exist_AddWord:
    PrnExistMsg
exit_AddWord:
    restore4reg si, di, cx, ax
    ret
AddWord endp

;; Modify Word
ModWord proc near
    protect4reg ax, cx, di, si
    DrawMsgWnd
    PrnMsg ModWordMsg1
    DrawOutWnd
    InputWord Word
    ; Search
    mov cx, IdxInfo[2]
    cmp cx, 0
    je notfound_ModWord ; cx = 0
    mov di, 0
    mov ax, offset Word[2]
    mov CmpWordsParm[0], ax
again_ModWord:
    protect1reg di
    add di, offset WordIdxTbl
    mov CmpWordsParm[2], di
    restore1reg di
    call CmpWords
    jz done_ModWord ; WordIdxTbl[di] 是所要找的索引项
    jc notfound_ModWord
    add di, IdxEntrySize
    loop again_ModWord
    jmp notfound_ModWord ; cx = 0
done_ModWord:
    PrnMsg ModWordMsg2
    InputWordInfo WordM1, WordM2, WordM3, WordM4, WordS, WordA
    add di, offset WordIdxTbl ; di 指向所要找的索引项
    add di, MaxWordSize ; di 指向所要找的索引项的地址位
    mov si, offset InsWordRecParm[12] ; si 指向 InsWordRec 子程序的第 7 个参数
    xchg di, si ; di 指向 InsWordRec 子程序的第 7 个参数
                ; si 指向所插入的索引项的地址位
    mov cx, AddSize
    cld
    rep movsb
    mov InsWordRecParm[0], offset WordM1[2]
    mov InsWordRecParm[2], offset WordM2[2]
    mov InsWordRecParm[4], offset WordM3[2]
    mov InsWordRecParm[6], offset WordM4[2]
    mov InsWordRecParm[8], offset WordS[2]
    mov InsWordRecParm[10], offset WordA[2]
    call InsWordRec
    jmp exit_ModWord
notfound_ModWord:
    PrnNotFoundMsg
exit_ModWord:
    restore4reg si, di, cx, ax
    ret
ModWord endp

;; Delete Word
DelWord proc near
    protect4reg ax, cx, di, si
    DrawMsgWnd
    PrnMsg DelWordMsg
    DrawOutWnd
    InputWord Word
    ; Search
    mov cx, IdxInfo[2]
    cmp cx, 0
    je notfound_DelWord ; cx = 0
    mov di, 0
    mov ax, offset Word[2]
    mov CmpWordsParm[0], ax
again_DelWord:
    protect1reg di
    add di, offset WordIdxTbl
    mov CmpWordsParm[2], di
    restore1reg di
    call CmpWords
    jz done_DelWord ; WordIdxTbl[di] 是所要找的索引项
    jc notfound_DelWord
    add di, IdxEntrySize
    loop again_DelWord
    jmp notfound_DelWord ; cx = 0
done_DelWord:
    mov ax, di ; WordIdxTbl[ax] 是所要找的索引项
    mov dl, IdxEntrySize
    div dl
    mov ah, 00h
    mov DelWordIdxParm[0], ax
    call DelWordIdx
    jmp exit_DelWord
notfound_DelWord:
    PrnNotFoundMsg
exit_DelWord:
    restore4reg si, di, cx, ax
    ret
DelWord endp

;; Find Word
FindWord proc near
    protect4reg ax, cx, dx, di
    DrawMsgWnd
    PrnMsg FindWordMsg
    DrawOutWnd
    InputWord Word
    mov cx, IdxInfo[2]
    cmp cx, 0
    je notfound_FindWord
    mov dl, 0 ; 计数
    mov di, 0
    mov ax, offset Word[2]
    mov MtchWordPrfxParm[0], ax
again_FindWord:
    protect1reg di
    add di, offset WordIdxTbl
    mov MtchWordPrfxParm[2], di
    restore1reg di
    call MtchWordPrfx
    jc done_FindWord
    jnz notmatch_FindWord
    ; match_FindWord
    inc dl
    cmp dl, 1
    jne notfirst_FindWord
    ; first_FindWord
    PrnMtchTip
notfirst_FindWord:
    add dl, 2
    add di, offset WordIdxTbl
    PrnWord dl, di
    sub dl, 2
    sub di, offset WordIdxTbl
notmatch_FindWord:
    add di, IdxEntrySize
    loop again_FindWord
done_FindWord:
    cmp dl, 0
    je notfound_FindWord
    jne exit_FindWord
notfound_FindWord:
    PrnNotFoundMsg
exit_FindWord:
    restore4reg di, dx, cx, ax
    ret
FindWord endp

;; Query Word Meanings
QueryWordM proc near
    protect1reg ax
    DrawMsgWnd
    PrnMsg QueryWordMMsg
    DrawOutWnd
    InputWord Word
    mov RDataRecParm[0], offset Word[2]
    call RDataRec
    mov ax, RDataRecParm[2]
    cmp ax, 0
    je notfound_QueryWordM
    PrnWordMTip 3
    PrnWordM1Tip 4
    PrnStr DataRec[0]
    PrnWordM2Tip 5
    PrnStr DataRec[64]
    PrnWordM3Tip 6
    PrnStr DataRec[128]
    PrnWordM4Tip 7
    PrnStr DataRec[192]
    jmp exit_QueryWordM
notfound_QueryWordM:
    PrnNotFoundMsg
exit_QueryWordM:
    restore1reg ax
    ret
QueryWordM endp

;; Query Word Synonyms
QueryWordS proc near
    protect1reg ax
    DrawMsgWnd
    PrnMsg QueryWordSMsg
    DrawOutWnd
    InputWord Word
    mov RDataRecParm[0], offset Word[2]
    call RDataRec
    mov ax, RDataRecParm[2]
    cmp ax, 0
    je notfound_QueryWordS
    PrnWordSTip 3
    PrnStr DataRec[256]
    jmp exit_QueryWordS
notfound_QueryWordS:
    PrnNotFoundMsg
exit_QueryWordS:
    restore1reg ax
    ret
QueryWordS endp

;; Query Word Antonyms
QueryWordA proc near
    protect1reg ax
    DrawMsgWnd
    PrnMsg QueryWordAMsg
    DrawOutWnd
    InputWord Word
    mov RDataRecParm[0], offset Word[2]
    call RDataRec
    mov ax, RDataRecParm[2]
    cmp ax, 0
    je notfound_QueryWordA
    PrnWordATip 3
    PrnStr DataRec[320]
    jmp exit_QueryWordA
notfound_QueryWordA:
    PrnNotFoundMsg
exit_QueryWordA:
    restore1reg ax
    ret
QueryWordA endp

;; Read Data Record
RDataRec proc near ; Read Data Record Parameters:
                   ; RDataRecParm[0] = offset word
                   ; RDataRecParm[2] = (return) bool found or not
                   ; return: DataRec (384 Bytes)
    protect4reg ax, cx, di, si
    mov cx, IdxInfo[2]
    cmp cx, 0
    je notfound_RDataRec
    mov di, 0
    mov ax, RDataRecParm[0]
    mov CmpWordsParm[0], ax
again_RDataRec:
    protect1reg di
    add di, offset WordIdxTbl
    mov CmpWordsParm[2], di
    restore1reg di
    call CmpWords
    jc notfound_RDataRec
    jz found_RDataRec ; WordIdxTbl[di] 是所要找的索引项的首位
    add di, IdxEntrySize
    loop again_RDataRec
    jmp notfound_RDataRec
found_RDataRec:
    add di, MaxWordSize ; WordIdxTbl[di] 是所要找的索引项的地址位
    add di, offset WordIdxTbl ; di 指向所要找的索引项的地址位
    mov si, offset SeekFileParm[4] ; si 指向 SeekFile 子程序的第 3 个入口参数
    xchg di, si ; si 指向所要找的索引项的地址位
                ; di 指向 SeekFile 子程序的第 3 个入口参数
    mov cx, AddSize
    cld
    rep movsb
    mov SeekFileParm[0], 4200h
    mov ax, DictHandle
    mov SeekFileParm[2], ax
    call SeekFile
    mov ax, DictHandle
    mov RFileParm[0], ax
    mov RFileParm[2], DataRecSize
    mov RFileParm[4], offset DataRec
    call RFile
    mov RDataRecParm[2], 1
    jmp exit_RDataRec
notfound_RDataRec:
    mov RDataRecParm[2], 0
exit_RDataRec:
    restore4reg si, di, cx, ax
    ret
RDataRec endp

;; Insert Word Index
InsWordIdx proc near ; Insert Word Index Parameters:
                     ; InsWordIdxParm[0] = offset word
                     ; InsWordIdxParm[2]:InsWordIdxParm[4] = (return) word record address
    protect5reg ax, cx, dx, si, di
    ; Search
    mov cx, IdxInfo[2]
    cmp cx, 0
    je done_move ; cx = 0
    mov di, 0
    mov ax, InsWordIdxParm[0]
    mov CmpWordsParm[0], ax
again_search:
    protect1reg di
    add di, offset WordIdxTbl
    mov CmpWordsParm[2], di
    restore1reg di
    call CmpWords
    jc done_search ; cx = 需要移动的索引项数目，WordIdxTbl[di] 是需要移动的索引项的首位
    add di, IdxEntrySize
    loop again_search
    jmp done_move ; cx = 0
    ; Move
done_search:
    mov ax, cx
    mov dl, IdxEntrySize
    mul dl
    add di, ax ; WordIdxTbl[di] 是需要移动的索引项的最后一位的后一位
    mov si, di
    sub si, IdxEntrySize ; WordIdxTbl[si] 是需要移动的索引项的最后一位
    protect1reg cx
again_move:
    protect3reg cx, di, si
    add di, offset WordIdxTbl
    add si, offset WordIdxTbl
    mov cx, IdxEntrySize
    cld
    rep movsb
    restore3reg si, di, cx
    sub si, IdxEntrySize
    sub di, IdxEntrySize
    loop again_move
    restore1reg cx
    ; Insert (Word)
done_move:
    mov ax, IdxInfo[2]
    sub ax, cx
    mov dl, IdxEntrySize
    mul dl
    mov di, ax
    protect1reg di
    add di, offset WordIdxTbl
    mov si, InsWordIdxParm[0]
    mov cx, MaxWordSize
    cld
    rep movsb
    restore1reg di
    ; Insert (Address) && Assign Function Return Values
    add di, MaxWordSize ; WordIdxTbl[di] 是所插入的索引项的地址位
    mov ax, IdxInfo[8]
    dec ax
    mov dl, AddSize
    mul dl
    mov si, ax ; FreeBlkTbl[si] 是空闲块表的最后一项
    add di, offset WordIdxTbl ; di 指向所插入的索引项的地址位
    add si, offset FreeBlkTbl ; si 指向空闲块表的最后一项
    protect1reg di
    mov cx, AddSize
    cld
    rep movsb
    restore1reg di ; di 指向所插入的索引项的地址位
    mov si, offset InsWordIdxParm[2] ; si 指向 InsWordIdx 子程序的第 2 个参数 (出口参数)
    xchg di, si ; di 指向 InsWordIdx 子程序的第 2 个参数 (出口参数)
                ; si 指向所插入的索引项的地址位
    mov cx, AddSize
    cld
    rep movsb
    ; Sync Index Info && Word Index Table && Free Block Table
    inc IdxInfo[2]
    dec IdxInfo[8]
    SyncIdxInfo
    SyncWordIdxTbl
    ; SyncFreeBlkTbl
    restore5reg di, si, dx, cx, ax
exit_InsWordIdx:
    ret
InsWordIdx endp

;; Insert Word Record
InsWordRec proc near ; Insert Word Record Parameters:
                     ; InsWordRecParm[0] = offset word meaning 1
                     ; InsWordRecParm[2] = offset word meaning 2
                     ; InsWordRecParm[4] = offset word meaning 3
                     ; InsWordRecParm[6] = offset word meaning 4
                     ; InsWordRecParm[8] = offset word synonyms
                     ; InsWordRecParm[10] = offset word antonyms
                     ; InsWordRecParm[12]:InsWordRecParm[14] = word record address
    protect1reg ax
    ; Write Meaning 1
    mov SeekFileParm[0], 4200h
    mov ax, DictHandle
    mov SeekFileParm[2], ax
    mov ax, InsWordRecParm[12]
    mov SeekFileParm[4], ax
    mov ax, InsWordRecParm[14]
    mov SeekFileParm[6], ax
    call SeekFile
    WDataItem InsWordRecParm[0]
    ; Write Meaning 2
    WDataItem InsWordRecParm[2]
    ; Write Meaning 3
    WDataItem InsWordRecParm[4]
    ; Write Meaning 4
    WDataItem InsWordRecParm[6]
    ; Write Synonyms
    WDataItem InsWordRecParm[8]
    ; Write Antonyms
    WDataItem InsWordRecParm[10]
    restore1reg ax
exit_InsWordRec:
    ret
InsWordRec endp

;; Delete Word Index
DelWordIdx proc near ; Delete Word Index Parameters:
                     ; DelWordIdxParm[0] = the order of the word index entry
                     ; (the order starting from 0)
    protect5reg ax, cx, dx, di, si
    ; Restore One Free Block
    mov ax, DelWordIdxParm[0]
    mov dl, IdxEntrySize
    mul dl
    mov si, ax
    add si, offset WordIdxTbl ; si 指向所要删除的索引项
    protect1reg si ; si 指向所要删除的索引项
    add si, MaxWordSize ; si 指向所要删除的索引项的地址位
    mov ax, IdxInfo[8]
    mov dl, AddSize
    mul dl
    mov di, ax
    add di, offset FreeBlkTbl ; di 指向空闲块表当中最后一个空闲块地址的后一个单元
    mov cx, AddSize
    cld
    rep movsb
    ; Delete Word Index
    restore1reg di ; di 指向所要删除的索引项
    mov si, di
    add si, IdxEntrySize ; si 指向所要删除的索引项的后一个索引项
    mov ax, IdxInfo[2]
    sub ax, DelWordIdxParm[0]
    dec ax ; ax = 需要移动的索引项个数
    mov dl, IdxEntrySize
    mul dl ; ax = 需要移动的索引项个数 * 索引项大小 = 需要移动的字节数
    mov cx, ax
    cld
    rep movsb
    ; Update Index Info
    dec IdxInfo[2]
    inc IdxInfo[8]
    ; Sync Index Info && Word Index Table && Free Block Table
    SyncIdxInfo
    SyncWordIdxTbl
    SyncFreeBlkTbl
exit_DelWordIdx:
    restore5reg si, di, dx, cx, ax
    ret
DelWordIdx endp

;; Compare Words
CmpWords proc near ; Compare Words Parameters:
                   ; CmpWordsParm[0] = offset Word01
                   ; CmpWordsParm[2] = offset Word02
                   ; Return:
                   ; Word01 < Word02 -> cf = 1 && zf = 0
                   ; Word01 = Word02 -> zf = 1
                   ; Word01 > Word02 -> cf = 0 && zf = 0
    protect4reg ax, cx, si, di
    mov si, CmpWordsParm[0]
    mov di, CmpWordsParm[2]
    mov cx, MaxWordSize
again_CmpWords:
    mov ah, byte ptr [si]
    mov al, byte ptr [di]
    cmp ah, al
    jne exit_CmpWords
    cmp ah, "$"
    je exit_CmpWords
    inc si
    inc di
    loop again_CmpWords
exit_CmpWords:
    restore4reg di, si, cx, ax
    ret
CmpWords endp

;; Match Word Prefix
MtchWordPrfx proc near ; Match Word Prefix Parameters:
                       ; MtchWordPrfxParm[0] = offset Word01
                       ; MtchWordPrfxParm[2] = offset Word02
                       ; Return:
                       ; Word01 不是 Word02 的前缀 -> zf = 0
                       ; (Word01 < Word02 -> cf = 1)
                       ; (Word01 > Word02 -> cf = 0)
                       ; Word01 是 Word02 的前缀 -> zf = 1
    protect4reg ax, cx, si, di
    mov si, MtchWordPrfxParm[0]
    mov di, MtchWordPrfxParm[2]
    mov cx, MaxWordSize
again_MtchWordPrfx:
    mov ah, byte ptr [si]
    mov al, byte ptr [di]
    cmp ah, "$"
    je exit_MtchWordPrfx
    cmp ah, al
    jne exit_MtchWordPrfx
    inc si
    inc di
    loop again_MtchWordPrfx
exit_MtchWordPrfx:
    restore4reg di, si, cx, ax
    ret
MtchWordPrfx endp

;; Create File
CreFile proc near ; Create File Parameters:
                  ; CreFileParm[0] = ASCIZ filename address
                  ; CreFileParm[2] = file attribution
                  ; CreFileParm[4] = (return) file handle
    protect3reg ax, cx, dx
    mov dx, CreFileParm[0] ; DS:DX -> ASCIZ filename
    mov cx, CreFileParm[2] ; file attribution
    mov ah, 3ch ; create or truncate file
    int 21h ; cf = 0，则创建成功，ax = file handle
            ; cf = 1，则创建失败，ax = error code
    jnc done_CreFile ; cf = 0，创建成功
    ; cf = 1，创建失败
    PrnMsg CreFileErrMsg
done_CreFile:
    mov CreFileParm[4], ax
    restore3reg dx, cx, ax
exit_CreFile:
    ret
CreFile endp

;; Open File
OpenFile proc near ; Open File Parameters:
                   ; OpenFileParm[0] = ASCIZ filename address
                   ; OpenFileParm[2] = (return) file handle
    protect2reg ax, dx
    mov dx, OpenFileParm[0] ; DS:DX -> ASCIZ filename
    mov al, 02h ; access and sharing mode, read/write
    mov ah, 3dh ; open existing file
    int 21h ; cf = 0，则打开成功，ax = file handle
            ; cf = 1，则打开失败，ax = error code
    jnc done_OpenFile ; cf = 0，打开成功
    ; cf = 1，打开失败
    PrnMsg OpenFileErrMsg
done_OpenFile:
    mov OpenFileParm[2], ax
    restore2reg dx, ax
exit_OpenFile:
    ret
OpenFile endp

;; Seek File
SeekFile proc near ; Seek File Parameters:
                   ; SeekFileParm[0] = 42h + origin of move
                   ; SeekFileParm[2] = file handle
                   ; SeekFileParm[4]:SeekFileParm[6] = offset from origin of new file position
    protect4reg ax, bx, cx, dx
    mov ax, SeekFileParm[0] ; ah = 42h
                            ; al = origin of move:
                            ; 0 - start of file
                            ; 1 - current file position
                            ; 2 - end of file
    mov bx, SeekFileParm[2] ; file handle
    mov cx, SeekFileParm[4]
    mov dx, SeekFileParm[6] ; CX:DX = offset from origin of new file position
    ; mov ah, 42h ; set current file position
    int 21h ; cf = 0，则移动成功，dx:ax = new file position in bytes from start of file
            ; cf = 1，则移动失败，ax = error code
    jnc done_SeekFile ; cf = 0，移动成功
    ; cf = 1，移动失败
    PrnMsg SeekFileErrMsg
done_SeekFile:
    restore4reg dx, cx, bx, ax
exit_SeekFile:
    ret
SeekFile endp

;; Write File
WFile proc near ; Write File Parameters:
                ; WFileParm[0] = file handle
                ; WFileParm[2] = number of bytes to write
                ; WFileParm[4] = address of data to write
    protect4reg ax, bx, cx, dx
    mov bx, WFileParm[0] ; file handle
    mov cx, WFileParm[2] ; number of bytes to write
    mov dx, WFileParm[4] ; address of data to write
    mov ah, 40h ; write to file
    int 21h ; cf = 0，则写入成功，ax = number of bytes actually written
            ; cf = 1，则写入失败，ax = error code
    jnc done_WFile ; cf = 0，写入成功
    ; cf = 1，写入失败
    PrnMsg WFileErrMsg
done_WFile:
    cmp ax, WFileParm[2]
    je exit_WFile ; ax == number of bytes to write，写入成功
    ; ax != number of bytes to write，写入失败
    PrnMsg WFileErrMsg
exit_WFile:
    restore4reg dx, cx, bx, ax
    ret
WFile endp

;; Read File
RFile proc near ; Read File Parameters:
                ; RFileParm[0] = file handle
                ; RFileParm[2] = number of bytes to read
                ; RFileParm[4] = address of buffer for data
    protect4reg ax, bx, cx, dx
    mov bx, RFileParm[0] ; file handle
    mov cx, RFileParm[2] ; number of bytes to read
    mov dx, RFileParm[4] ; address of buffer for data
    mov ah, 3fh ; read from file
    int 21h ; cf = 0，则读取成功，ax = number of bytes actually read
            ; cf = 1，则读取失败，ax = error code
    jnc done_RFile ; cf = 0，读取成功
    ; cf = 1，读取失败
    PrnMsg RFileErrMsg
done_RFile:
    cmp ax, RFileParm[2]
    je exit_RFile ; ax == number of bytes to read，读取成功
    ; ax != number of bytes to read，读取失败
    PrnMsg RFileErrMsg
exit_RFile:
    restore4reg dx, cx, bx, ax
    ret
RFile endp

;; Close File
CloseFile proc near ; Close File Parameters:
                    ; CloseFileParm[0] = file handle
    protect2reg ax, bx
    mov bx, CloseFileParm[0] ; file handle
    mov ah, 3eh ; close file
    int 21h ; cf = 0，则关闭成功
            ; cf = 1，则关闭失败，ax = error code (06h)
    jnc done_CloseFile ; cf = 0，关闭成功
    ; cf = 1，关闭失败
    PrnMsg CloseFileErrMsg
done_CloseFile:
    restore2reg bx, ax
exit_CloseFile:
    ret
CloseFile endp



end start ; set entry point and stop the assembler.

[org 0x0100]
                jmp start
track:
        db    5,  3, 0x10, 3, 1   , 0xff, 0xff, 0
        db    5,  4, 0xc4, 0, 2   , 0xff, 0xff, 0
        db    5,  5, 0xc4, 0, 3   , 0xff, 0xff, 0
        db    5,  6, 0xc4, 0, 4   , 0xff, 0xff, 0
        db    5,  7, 0xc4, 0, 5   , 0xff, 0xff, 0
        db    5,  8, '1' , 1, 6   , 52  , 0   , 0
        db    4,  8, 0xb3, 0, 7   , 0xff, 0xff, 0
        db    3,  8, 0xda, 0, 8   , 0xff, 0xff, 0
        db    3,  9, 0xc4, 0, 9   , 0xff, 0xff, 0
        db    3, 10, 0xc4, 0, 10  , 0xff, 0xff, 0
        db    3, 11, 0xc4, 0, 11  , 0xff, 0xff, 0
        db    3, 12, 0xc4, 0, 12  , 0xff, 0xff, 0
        db    3, 13, 0xc4, 0, 13  , 0xff, 0xff, 0
        db    3, 14, 0xc4, 0, 14  , 0xff, 0xff, 0
        db    3, 15, 0xc4, 0, 15  , 0xff, 0xff, 0
        db    3, 16, 0xc4, 0, 16  , 0xff, 0xff, 0
        db    3, 17, 0xc4, 0, 17  , 0xff, 0xff, 0
        db    3, 18, 0xc4, 0, 18  , 0xff, 0xff, 0
        db    3, 19, 0xc4, 0, 19  , 0xff, 0xff, 0
        db    3, 20, 0xc4, 0, 20  , 0xff, 0xff, 0
        db    3, 21, 0xc4, 0, 21  , 0xff, 0xff, 0
        db    3, 22, 0xc4, 0, 22  , 0xff, 0xff, 0
        db    3, 23, 0xc4, 0, 23  , 0xff, 0xff, 0
        db    3, 24, 0xc4, 0, 24  , 0xff, 0xff, 0
        db    3, 25, 0xc4, 0, 25  , 0xff, 0xff, 0
        db    3, 26, 0xc4, 0, 26  , 0xff, 0xff, 0
        db    3, 27, 0xc4, 0, 27  , 0xff, 0xff, 0
        db    3, 28, 0xc4, 0, 28  , 0xff, 0xff, 0
        db    3, 29, 0xc4, 0, 29  , 0xff, 0xff, 0
        db    3, 30, 0xc4, 0, 30  , 0xff, 0xff, 0
        db    3, 31, 0xc4, 0, 31  , 0xff, 0xff, 0
        db    3, 32, 0xc4, 0, 32  , 0xff, 0xff, 0
        db    3, 33, 0xc4, 0, 33  , 0xff, 0xff, 0
        db    3, 34, 0xc4, 0, 34  , 0xff, 0xff, 0
        db    3, 35, 0xc4, 0, 35  , 0xff, 0xff, 0
        db    3, 36, 0xc4, 0, 36  , 0xff, 0xff, 0
        db    3, 37, 0xc4, 0, 37  , 0xff, 0xff, 0
        db    3, 38, 0xc4, 0, 38  , 0xff, 0xff, 0
        db    3, 39, 0xc4, 0, 39  , 0xff, 0xff, 0
        db    3, 40, 0xc4, 0, 40  , 0xff, 0xff, 0
        db    3, 41, 0xc4, 0, 41  , 0xff, 0xff, 0
        db    3, 42, 0xc4, 0, 42  , 0xff, 0xff, 0
        db    3, 43, 0xc4, 0, 43  , 0xff, 0xff, 0
        db    3, 44, 0xc4, 0, 44  , 0xff, 0xff, 0
        db    3, 45, 0xc4, 0, 45  , 0xff, 0xff, 0
        db    3, 46, 0xc4, 0, 46  , 0xff, 0xff, 0
        db    3, 47, 0xc4, 0, 47  , 0xff, 0xff, 0
        db    3, 48, 0xc4, 0, 48  , 0xff, 0xff, 0
        db    3, 49, 0xc4, 0, 49  , 0xff, 0xff, 0
        db    3, 50, 0xc4, 0, 50  , 0xff, 0xff, 0
        db    3, 51, 0xc4, 0, 51  , 0xff, 0xff, 0
        db    3, 52, 'A' , 2, 0xff, 0xff, 0xff, 'A'
        db    6,  8, 0xb3, 0, 53  , 0xff, 0xff, 0
        db    7,  8, 0xb3, 0, 54  , 0xff, 0xff, 0
        db    8,  8, 0xc3, 0, 109 , 0xff, 0xff, 0
        db   11,  3, 0x10, 3, 56  , 0xff, 0xff, 0
        db   11,  4, 0xc4, 0, 57  , 0xff, 0xff, 0
        db   11,  5, 0xc4, 0, 58  , 0xff, 0xff, 0
        db   11,  6, 0xc4, 0, 59  , 0xff, 0xff, 0
        db   11,  7, 0xc4, 0, 60  , 0xff, 0xff, 0
        db   11,  8, '2' , 1, 63  , 61  , 1   , 0
        db   10,  8, 0xb3, 0, 62  , 0xff, 0xff, 0
        db    9,  8, 0xb3, 0, 54  , 0xff, 0xff, 0
        db   12,  8, 0xb3, 0, 64  , 0xff, 0xff, 0
        db   13,  8, 0xc0, 0, 65  , 0xff, 0xff, 0
        db   13,  9, 0xc4, 0, 66  , 0xff, 0xff, 0
        db   13, 10, 0xc4, 0, 67  , 0xff, 0xff, 0
        db   13, 11, 0xc4, 0, 68  , 0xff, 0xff, 0
        db   13, 12, 0xc4, 0, 69  , 0xff, 0xff, 0
        db   13, 13, 0xc4, 0, 70  , 0xff, 0xff, 0
        db   13, 14, 0xc4, 0, 71  , 0xff, 0xff, 0
        db   13, 15, 0xc4, 0, 72  , 0xff, 0xff, 0
        db   13, 16, 0xc4, 0, 73  , 0xff, 0xff, 0
        db   13, 17, 0xc4, 0, 74  , 0xff, 0xff, 0
        db   13, 18, 0xc4, 0, 75  , 0xff, 0xff, 0
        db   13, 19, 0xc4, 0, 76  , 0xff, 0xff, 0
        db   13, 20, 0xc4, 0, 77  , 0xff, 0xff, 0
        db   13, 21, 0xc4, 0, 78  , 0xff, 0xff, 0
        db   13, 22, 0xc4, 0, 79  , 0xff, 0xff, 0
        db   13, 23, 0xc4, 0, 80  , 0xff, 0xff, 0
        db   13, 24, 0xc4, 0, 81  , 0xff, 0xff, 0
        db   13, 25, 0xc4, 0, 82  , 0xff, 0xff, 0
        db   13, 26, 0xc4, 0, 83  , 0xff, 0xff, 0
        db   13, 27, 0xc4, 0, 84  , 0xff, 0xff, 0
        db   13, 28, 0xc4, 0, 85  , 0xff, 0xff, 0
        db   13, 29, 0xc4, 0, 86  , 0xff, 0xff, 0
        db   13, 30, 0xc4, 0, 87  , 0xff, 0xff, 0
        db   13, 31, 0xc4, 0, 88  , 0xff, 0xff, 0
        db   13, 32, 0xc4, 0, 89  , 0xff, 0xff, 0
        db   13, 33, 0xc4, 0, 90  , 0xff, 0xff, 0
        db   13, 34, 0xc4, 0, 91  , 0xff, 0xff, 0
        db   13, 35, 0xc4, 0, 92  , 0xff, 0xff, 0
        db   13, 36, 0xc4, 0, 93  , 0xff, 0xff, 0
        db   13, 37, 0xc4, 0, 94  , 0xff, 0xff, 0
        db   13, 38, 0xc4, 0, 95  , 0xff, 0xff, 0
        db   13, 39, 0xc4, 0, 96  , 0xff, 0xff, 0
        db   13, 40, 0xc4, 0, 97  , 0xff, 0xff, 0
        db   13, 41, 0xc4, 0, 98  , 0xff, 0xff, 0
        db   13, 42, 0xc4, 0, 99  , 0xff, 0xff, 0
        db   13, 43, 0xc4, 0, 100 , 0xff, 0xff, 0
        db   13, 44, 0xc4, 0, 101 , 0xff, 0xff, 0
        db   13, 45, 0xc4, 0, 102 , 0xff, 0xff, 0
        db   13, 46, 0xc4, 0, 103 , 0xff, 0xff, 0
        db   13, 47, 0xc4, 0, 104 , 0xff, 0xff, 0
        db   13, 48, 0xc4, 0, 105 , 0xff, 0xff, 0
        db   13, 49, 0xc4, 0, 106 , 0xff, 0xff, 0
        db   13, 50, 0xc4, 0, 107 , 0xff, 0xff, 0
        db   13, 51, 0xc4, 0, 108 , 0xff, 0xff, 0
        db   13, 52, 'D' , 2, 0xff, 0xff, 0xff, 'D'
        db    8,  9, 0xc4, 0, 110 , 0xff, 0xff, 0
        db    8, 10, 0xc4, 0, 111 , 0xff, 0xff, 0
        db    8, 11, 0xc4, 0, 112 , 0xff, 0xff, 0
        db    8, 12, 0xc4, 0, 113 , 0xff, 0xff, 0
        db    8, 13, 0xc4, 0, 114 , 0xff, 0xff, 0
        db    8, 14, 0xc4, 0, 115 , 0xff, 0xff, 0
        db    8, 15, 0xc4, 0, 116 , 0xff, 0xff, 0
        db    8, 16, 0xc4, 0, 117 , 0xff, 0xff, 0
        db    8, 17, 0xc4, 0, 118 , 0xff, 0xff, 0
        db    8, 18, 0xc4, 0, 119 , 0xff, 0xff, 0
        db    8, 19, 0xc4, 0, 120 , 0xff, 0xff, 0
        db    8, 20, 0xc4, 0, 121 , 0xff, 0xff, 0
        db    8, 21, 0xc4, 0, 122 , 0xff, 0xff, 0
        db    8, 22, 0xc4, 0, 123 , 0xff, 0xff, 0
        db    8, 23, 0xc4, 0, 124 , 0xff, 0xff, 0
        db    8, 24, '3' , 1, 153 , 125 , 2   , 0
        db    8, 25, 0xc4, 0, 126 , 0xff, 0xff, 0
        db    8, 26, 0xc4, 0, 127 , 0xff, 0xff, 0
        db    8, 27, 0xc4, 0, 128 , 0xff, 0xff, 0
        db    8, 28, 0xc4, 0, 129 , 0xff, 0xff, 0
        db    8, 29, 0xc4, 0, 130 , 0xff, 0xff, 0
        db    8, 30, 0xc4, 0, 131 , 0xff, 0xff, 0
        db    8, 31, 0xc4, 0, 132 , 0xff, 0xff, 0
        db    8, 32, 0xc4, 0, 133 , 0xff, 0xff, 0
        db    8, 33, 0xc4, 0, 134 , 0xff, 0xff, 0
        db    8, 34, 0xc4, 0, 135 , 0xff, 0xff, 0
        db    8, 35, 0xc4, 0, 136 , 0xff, 0xff, 0
        db    8, 36, 0xc4, 0, 137 , 0xff, 0xff, 0
        db    8, 37, 0xc4, 0, 138 , 0xff, 0xff, 0
        db    8, 38, 0xc4, 0, 139 , 0xff, 0xff, 0
        db    8, 39, 0xc4, 0, 140 , 0xff, 0xff, 0
        db    8, 40, '4' , 1, 141 , 184 , 3   , 0
        db    8, 41, 0xc4, 0, 142 , 0xff, 0xff, 0
        db    8, 42, 0xc4, 0, 143 , 0xff, 0xff, 0
        db    8, 43, 0xc4, 0, 144 , 0xff, 0xff, 0
        db    8, 44, 0xc4, 0, 145 , 0xff, 0xff, 0
        db    8, 45, 0xc4, 0, 146 , 0xff, 0xff, 0
        db    8, 46, 0xc4, 0, 147 , 0xff, 0xff, 0
        db    8, 47, 0xc4, 0, 148 , 0xff, 0xff, 0
        db    8, 48, 0xc4, 0, 149 , 0xff, 0xff, 0
        db    8, 49, 0xc4, 0, 150 , 0xff, 0xff, 0
        db    8, 50, 0xc4, 0, 151 , 0xff, 0xff, 0
        db    8, 51, 0xc4, 0, 152 , 0xff, 0xff, 0
        db    8, 52, 'C' , 2, 0xff, 0xff, 0xff, 'C'
        db    7, 24, 0xb3, 0, 154 , 0xff, 0xff, 0
        db    6, 24, 0xb3, 0, 155 , 0xff, 0xff, 0
        db    5, 24, 0xda, 0, 156 , 0xff, 0xff, 0
        db    5, 25, 0xc4, 0, 157 , 0xff, 0xff, 0
        db    5, 26, 0xc4, 0, 158 , 0xff, 0xff, 0
        db    5, 27, 0xc4, 0, 159 , 0xff, 0xff, 0
        db    5, 28, 0xc4, 0, 160 , 0xff, 0xff, 0
        db    5, 29, 0xc4, 0, 161 , 0xff, 0xff, 0
        db    5, 30, 0xc4, 0, 162 , 0xff, 0xff, 0
        db    5, 31, 0xc4, 0, 163 , 0xff, 0xff, 0
        db    5, 32, 0xc4, 0, 164 , 0xff, 0xff, 0
        db    5, 33, 0xc4, 0, 165 , 0xff, 0xff, 0
        db    5, 34, 0xc4, 0, 166 , 0xff, 0xff, 0
        db    5, 35, 0xc4, 0, 167 , 0xff, 0xff, 0
        db    5, 36, 0xc4, 0, 168 , 0xff, 0xff, 0
        db    5, 37, 0xc4, 0, 169 , 0xff, 0xff, 0
        db    5, 38, 0xc4, 0, 170 , 0xff, 0xff, 0
        db    5, 39, 0xc4, 0, 171 , 0xff, 0xff, 0
        db    5, 40, 0xc4, 0, 172 , 0xff, 0xff, 0
        db    5, 41, 0xc4, 0, 173 , 0xff, 0xff, 0
        db    5, 42, 0xc4, 0, 174 , 0xff, 0xff, 0
        db    5, 43, 0xc4, 0, 175 , 0xff, 0xff, 0
        db    5, 44, 0xc4, 0, 176 , 0xff, 0xff, 0
        db    5, 45, 0xc4, 0, 177 , 0xff, 0xff, 0
        db    5, 46, 0xc4, 0, 178 , 0xff, 0xff, 0
        db    5, 47, 0xc4, 0, 179 , 0xff, 0xff, 0
        db    5, 48, 0xc4, 0, 180 , 0xff, 0xff, 0
        db    5, 49, 0xc4, 0, 181 , 0xff, 0xff, 0
        db    5, 50, 0xc4, 0, 182 , 0xff, 0xff, 0
        db    5, 51, 0xc4, 0, 183 , 0xff, 0xff, 0
        db    5, 52, 'B' , 2, 0xff, 0xff, 0xff, 'B'
        db    9, 40, 0xb3, 0, 185 , 0xff, 0xff, 0
        db   10, 40, 0xc0, 0, 186 , 0xff, 0xff, 0
        db   10, 41, 0xc4, 0, 187 , 0xff, 0xff, 0
        db   10, 42, 0xc4, 0, 188 , 0xff, 0xff, 0
        db   10, 43, 0xc4, 0, 189 , 0xff, 0xff, 0
        db   10, 44, 0xc4, 0, 190 , 0xff, 0xff, 0
        db   10, 45, 0xc4, 0, 191 , 0xff, 0xff, 0
        db   10, 46, 0xc4, 0, 192 , 0xff, 0xff, 0
        db   10, 47, 0xc4, 0, 193 , 0xff, 0xff, 0
        db   10, 48, 0xc4, 0, 194 , 0xff, 0xff, 0
        db   10, 49, 0xc4, 0, 195 , 0xff, 0xff, 0
        db   10, 50, 0xc4, 0, 196 , 0xff, 0xff, 0
        db   10, 51, 0xc4, 0, 197 , 0xff, 0xff, 0
        db   10, 52, 'D' , 2, 0xff, 0xff, 0xff, 'D'
switchnode:     db 5, 60, 124, 140
entrances:      db 0, 55
switchstate:    db 0, 0, 0, 0
attrtable:      db 0x07, 0x0e, 0x0a, 0x0b
score:        dw 0
mistakes:     dw 0
seconds:      dw 0
lblentry1:    db 'Entry 1', 0
lblentry2:    db 'Entry 2', 0
lblstA:       db 'Station A', 0
lblstB:       db 'Station B', 0
lblstC:       db 'Station C', 0
lblstD:       db 'Station D', 0
msgscore:     db 'Score: ', 0
msgmist:      db 'Mistakes: ', 0
msgtime:      db 'Time: ', 0
tickcount:    dw 0
elapsedticks: dw 0
redrawflag:   dw 0
quitflag:     dw 0
mode:         dw 1
oldtimer:     dd 0
oldkb:        dd 0
normalinterval: db 6
trains:       db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
              db 0, 0, 0, 0, 0
occupied:     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
claimed:      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
seed:         dw 0
msgr4:        db 'random 0-3: ', 0
msgr2:        db 'random 0-1: ', 0
spawntimer:   dw 0
spawngap      equ 25
dests:        db 'A', 'B', 'C', 'D'
              db 'D', 'B', 'C', 'D'
moved:        db 0
gameover:     dw 0
msgwin:       db 'YOU WIN!', 0
msglose:      db 'GAME OVER - too many mistakes', 0
msgkeys:      db 'R = Replay, ESC = Exit', 0
speedupdone:  dw 0
msgtitle:     db 'SWITCHYARD', 0
msgopt1:      db '1. Single Player', 0
msgopt2:      db '2. Two-Player Co-op', 0
msgpress:     db 'Press 1 or 2 (Esc = exit)', 0
clrscr:         push es
                push ax
                push cx
                push di
                mov    ax, 0xb800
                mov    es, ax
                xor    di, di
                mov    ax, 0x0720
                mov    cx, 2000
                cld
                rep    stosw
                pop    di
                pop    cx
                pop    ax
                pop    es
                ret
drawtrack:      push es
                push ax
                push bx
                push cx
                push dx
                push si
                push di
                mov    ax, 0xb800
                mov    es, ax
                mov    si, track
                mov    cx, 198
nextnode:       mov    al, [si]
                mov    bl, 80
                mul    bl
                mov    dl, [si+1]
                xor    dh, dh
                add    ax, dx
                shl    ax, 1
                mov    di, ax
                mov    al, [si+2]
                mov    bl, [si+3]
                xor    bh, bh
                mov    ah, [attrtable+bx]
                mov    [es:di], ax
                add    si, 8
                loop   nextnode
                pop    di
                pop    si
                pop    dx
                pop    cx
                pop    bx
                pop    ax
                pop    es
                ret
putchar:      push bp
              mov  bp, sp
              push es
              push ax
              push bx
              push dx
              push di
              mov  ax, 0xb800
              mov  es, ax
              mov  ax, [bp+10]
              mov  bx, 80
              mul  bx
              add  ax, [bp+8]
              shl  ax, 1
              mov  di, ax
              mov  al, [bp+6]
              mov  ah, [bp+4]
              mov  [es:di], ax
              pop  di
              pop  dx
              pop  bx
              pop  ax
              pop  es
              pop  bp
              ret  8
printstr:     push bp
              mov  bp, sp
              push es
              push ax
              push bx
              push dx
              push si
              push di
              mov  ax, 0xb800
              mov  es, ax
              mov  ax, [bp+8]
              mov  bx, 80
              mul  bx
              add  ax, [bp+10]
              shl  ax, 1
              mov  di, ax
              mov  si, [bp+4]
              mov  ah, [bp+6]
psnext:       mov  al, [si]
              cmp  al, 0
              je   psend
              mov  [es:di], ax
              add  di, 2
              inc  si
              jmp  psnext
psend:        pop  di
              pop  si
              pop  dx
              pop  bx
              pop  ax
              pop  es
              pop  bp
              ret  8
printnum:     push bp
              mov  bp, sp
              push es
              push ax
              push bx
              push cx
              push dx
              push di
              mov  ax, 0xb800
              mov  es, ax
              mov  ax, [bp+10]
              mov  bx, 80
              mul  bx
              add  ax, [bp+12]
              shl  ax, 1
              mov  di, ax
              mov  ax, [bp+6]
              mov  bx, 10
              mov  cx, [bp+4]
pndivide:     xor  dx, dx
              div  bx
              add  dl, 0x30
              push dx
              loop pndivide
              mov  cx, [bp+4]
              mov  ah, [bp+8]
pnprint:      pop  dx
              mov  al, dl
              mov  [es:di], ax
              add  di, 2
              loop pnprint
              pop  di
              pop  dx
              pop  cx
              pop  bx
              pop  ax
              pop  es
              pop  bp
              ret  10
drawnode:     push bp
              mov  bp, sp
              push ax
              push bx
              push dx
              push si
              mov  ax, [bp+6]
              mov  bx, 8
              mul  bx
              add  ax, track
              mov  si, ax
              mov  al, [si]
              xor  ah, ah
              push ax
              mov  al, [si+1]
              xor  ah, ah
              push ax
              mov  al, [si+2]
              xor  ah, ah
              push ax
              push word [bp+4]
              call putchar
              pop  si
              pop  dx
              pop  bx
              pop  ax
              pop  bp
              ret  4
drawlabels:   push ax
              mov  ax, 1
              push ax
              mov  ax, 4
              push ax
              mov  ax, 0x0b
              push ax
              mov  ax, lblentry1
              push ax
              call printstr
              mov  ax, 1
              push ax
              mov  ax, 10
              push ax
              mov  ax, 0x0b
              push ax
              mov  ax, lblentry2
              push ax
              call printstr
              mov  ax, 54
              push ax
              mov  ax, 3
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstA
              push ax
              call printstr
              mov  ax, 54
              push ax
              mov  ax, 5
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstB
              push ax
              call printstr
              mov  ax, 54
              push ax
              mov  ax, 8
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstC
              push ax
              call printstr
              mov  ax, 54
              push ax
              mov  ax, 10
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstD
              push ax
              call printstr
              mov  ax, 54
              push ax
              mov  ax, 13
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstD
              push ax
              call printstr
              pop  ax
              ret
drawswitches: push ax
              push bx
              push cx
              push si
              xor  bx, bx
nextswitch:
              xor  ah, ah
              mov  al, [switchnode+bx]
              push ax
              mov  ax, 0x1e
              push ax
              call drawnode
              xor  ah, ah
              mov  al, [switchnode+bx]
              mov  cl, 3
              shl  ax, cl
              add  ax, track
              mov  si, ax
              xor  ah, ah
              mov  al, [si+4]
              push ax
              mov  ax, 0x04
              cmp  byte [switchstate+bx], 0
              jne  exit0done
              mov  ax, 0x0a
exit0done:    push ax
              call drawnode
              xor  ah, ah
              mov  al, [si+5]
              push ax
              mov  ax, 0x04
              cmp  byte [switchstate+bx], 1
              jne  exit1done
              mov  ax, 0x0a
exit1done:    push ax
              call drawnode
              inc  bx
              cmp  bx, 4
              jne  nextswitch
              pop  si
              pop  cx
              pop  bx
              pop  ax
              ret
drawstatus:   push ax
              push cx
              push di
              push es
              mov  ax, 0xb800
              mov  es, ax
              mov  di, 3840
              mov  ax, 0x1f20
              mov  cx, 80
              cld
              rep  stosw
              mov  ax, 2
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1f
              push ax
              mov  ax, msgscore
              push ax
              call printstr
              mov  ax, 9
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1e
              push ax
              push word [score]
              mov  ax, 2
              push ax
              call printnum
              mov  ax, 14
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1f
              push ax
              mov  ax, msgmist
              push ax
              call printstr
              mov  ax, 24
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1e
              push ax
              push word [mistakes]
              mov  ax, 1
              push ax
              call printnum
              mov  ax, 28
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1f
              push ax
              mov  ax, msgtime
              push ax
              call printstr
              mov  ax, 34
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1e
              push ax
              push word [seconds]
              mov  ax, 3
              push ax
              call printnum
              pop  es
              pop  di
              pop  cx
              pop  ax
              ret
timer:        push ax
              inc  word [cs:tickcount]
              inc  word [cs:elapsedticks]
              mov  al, 0x20
              out  0x20, al
              pop  ax
              iret
kbisr:        push ax
              push bx
              in   al, 0x60
              cmp  al, 0x02
              je   isw0
              cmp  al, 0x03
              je   isw1
              cmp  al, 0x04
              je   isw2single
              cmp  al, 0x05
              je   isw3single
              cmp  al, 0x24
              je   isw2coop
              cmp  al, 0x25
              je   isw3coop
              cmp  al, 0x01
              je   iquit
              jmp  nomatch
isw0:         mov  bx, 0
              jmp  dotoggle
isw1:         mov  bx, 1
              jmp  dotoggle
isw2single:   cmp  word [cs:mode], 1
              jne  nomatch
              mov  bx, 2
              jmp  dotoggle
isw3single:   cmp  word [cs:mode], 1
              jne  nomatch
              mov  bx, 3
              jmp  dotoggle
isw2coop:     cmp  word [cs:mode], 2
              jne  nomatch
              mov  bx, 2
              jmp  dotoggle
isw3coop:     cmp  word [cs:mode], 2
              jne  nomatch
              mov  bx, 3
              jmp  dotoggle
dotoggle:     xor  byte [cs:switchstate+bx], 1
              mov  word [cs:redrawflag], 1
              jmp  kbexit
iquit:        mov  word [cs:quitflag], 1
              jmp  kbexit
nomatch:      pop  bx
              pop  ax
              jmp  far [cs:oldkb]
kbexit:       mov  al, 0x20
              out  0x20, al
              pop  bx
              pop  ax
              iret
hookints:     push ax
              push es
              xor  ax, ax
              mov  es, ax
              mov  ax, [es:8*4]
              mov  [oldtimer], ax
              mov  ax, [es:8*4+2]
              mov  [oldtimer+2], ax
              mov  ax, [es:9*4]
              mov  [oldkb], ax
              mov  ax, [es:9*4+2]
              mov  [oldkb+2], ax
              cli
              mov  word [es:8*4], timer
              mov  [es:8*4+2], cs
              mov  word [es:9*4], kbisr
              mov  [es:9*4+2], cs
              sti
              pop  es
              pop  ax
              ret
unhookints:   push ax
              push es
              xor  ax, ax
              mov  es, ax
              cli
              mov  ax, [oldtimer]
              mov  [es:8*4], ax
              mov  ax, [oldtimer+2]
              mov  [es:8*4+2], ax
              mov  ax, [oldkb]
              mov  [es:9*4], ax
              mov  ax, [oldkb+2]
              mov  [es:9*4+2], ax
              sti
              pop  es
              pop  ax
              ret
cleartrains:  push ax
              push cx
              push di
              push es
              push ds
              pop  es
              cld
              xor  al, al
              mov  di, trains
              mov  cx, 40
              rep  stosb
              mov  di, occupied
              mov  cx, 198
              rep  stosb
              mov  di, claimed
              mov  cx, 198
              rep  stosb
              pop  es
              pop  di
              pop  cx
              pop  ax
              ret
snapshot:     push ax
              push bx
              push cx
              push si
              push di
              push es
              push ds
              pop  es
              cld
              xor  al, al
              mov  di, claimed
              mov  cx, 198
              rep  stosb
              mov  di, occupied
              mov  cx, 198
              rep  stosb
              mov  si, trains
              mov  cx, 8
snloop:       cmp  byte [si], 0
              je   snnext
              xor  bx, bx
              mov  bl, [si+1]
              mov  byte [occupied+bx], 1
snnext:       add  si, 5
              loop snloop
              pop  es
              pop  di
              pop  si
              pop  cx
              pop  bx
              pop  ax
              ret
drawtrains:   push ax
              push bx
              push cx
              push dx
              push si
              mov  si, trains
              mov  cx, 8
dtloop:       cmp  byte [si], 0
              je   dtnext
              xor  ax, ax
              mov  al, [si+1]
              mov  bx, 8
              mul  bx
              add  ax, track
              mov  bx, ax
              xor  ax, ax
              mov  al, [bx]
              push ax
              xor  ax, ax
              mov  al, [bx+1]
              push ax
              xor  ax, ax
              mov  al, [si+2]
              push ax
              mov  ax, 0x5f
              push ax
              call putchar
dtnext:       add  si, 5
              loop dtloop
              pop  si
              pop  dx
              pop  cx
              pop  bx
              pop  ax
              ret
seedrandom:   push ax
              push cx
              push dx
              mov  ah, 0
              int  0x1a
              xor  dx, cx
              mov  [seed], dx
              pop  dx
              pop  cx
              pop  ax
              ret
random:       push bx
              push dx
              mov  ax, [seed]
              mov  bx, 25173
              mul  bx
              add  ax, 13849
              mov  [seed], ax
              pop  dx
              pop  bx
              ret
randrange:    push bp
              mov  bp, sp
              push bx
              push cx
              push dx
              call random
              mov  cl, 8
              shr  ax, cl
              xor  dx, dx
              mov  bx, [bp+4]
              div  bx
              mov  ax, dx
              pop  dx
              pop  cx
              pop  bx
              pop  bp
              ret  2
spawntrain:   push ax
              push bx
              push cx
              push dx
              push si
              call snapshot
              mov  ax, 2
              push ax
              call randrange
              mov  bx, ax
              mov  dh, [entrances+bx]
              mov  al, dh
              xor  ah, ah
              mov  si, ax
              cmp  byte [occupied+si], 0
              jne  spdone
              mov  ax, 4
              push ax
              call randrange
              shl  bx, 1
              shl  bx, 1
              add  bx, ax
              mov  dl, [dests+bx]
              mov  si, trains
              mov  cx, 8
spfind:       cmp  byte [si], 0
              je   spfound
              add  si, 5
              loop spfind
              jmp  spdone
spfound:      mov  byte [si], 1
              mov  [si+1], dh
              mov  [si+2], dl
              mov  al, [normalinterval]
              mov  [si+3], al
              mov  [si+4], al
              call drawtrains
spdone:       pop  si
              pop  dx
              pop  cx
              pop  bx
              pop  ax
              ret
movetrain:    push ax
              push bx
              push di
              dec  byte [si+4]
              jz   mvgo
              jmp  mvdone
mvgo:
              mov  al, [si+3]
              mov  [si+4], al
              xor  ax, ax
              mov  al, [si+1]
              mov  di, ax
              shl  di, 1
              shl  di, 1
              shl  di, 1
              add  di, track
              mov  al, [di+4]
              cmp  byte [di+3], 1
              jne  mvhavenext
              xor  bx, bx
              mov  bl, [di+6]
              cmp  byte [switchstate+bx], 0
              je   mvhavenext
              mov  al, [di+5]
mvhavenext:   xor  ah, ah
              mov  bx, ax
              mov  di, ax
              shl  di, 1
              shl  di, 1
              shl  di, 1
              add  di, track
              cmp  byte [di+3], 2
              jne  mvcell
              mov  al, [di+7]
              cmp  al, [si+2]
              jne  mvwrong
              inc  word [score]
              jmp  mvarrived
mvwrong:      inc  word [mistakes]
mvarrived:    mov  byte [si], 0
              mov  byte [moved], 1
              call drawstatus
              jmp  mvdone
mvcell:       cmp  byte [occupied+bx], 0
              jne  mvdone
              cmp  byte [claimed+bx], 0
              jne  mvdone
              mov  byte [claimed+bx], 1
              mov  [si+1], bl
              mov  byte [moved], 1
mvdone:       pop  di
              pop  bx
              pop  ax
              ret
movetrains:   push cx
              push si
              call snapshot
              mov  byte [moved], 0
              mov  si, trains
              mov  cx, 8
mtloop:       cmp  byte [si], 0
              je   mtnext
              call movetrain
mtnext:       add  si, 5
              loop mtloop
              cmp  byte [moved], 0
              je   mtend
              call drawtrack
              call drawswitches
              call drawtrains
mtend:        pop  si
              pop  cx
              ret
checkspeedup: push ax
              push cx
              push si
              cmp  word [speedupdone], 0
              jne  csdone
              mov  ax, 6
              cmp  word [mode], 1
              je   cshavetarget
              mov  ax, 12
cshavetarget: cmp  [score], ax
              jb   csdone
              mov  word [speedupdone], 1
              mov  si, trains
              mov  cx, 8
csloop:       cmp  byte [si], 0
              je   csnext
              mov  al, [si+3]
              shr  al, 1
              cmp  al, 1
              jae  csstore
              mov  al, 1
csstore:      mov  [si+3], al
csnext:       add  si, 5
              loop csloop
              mov  al, [normalinterval]
              shr  al, 1
              cmp  al, 1
              jae  csnormal
              mov  al, 1
csnormal:     mov  [normalinterval], al
csdone:       pop  si
              pop  cx
              pop  ax
              ret
checkresult:  push ax
              mov  ax, 10
              cmp  word [mode], 1
              je   crcheckwin
              mov  ax, 20
crcheckwin:   cmp  [score], ax
              jb   crcheklose
              mov  word [gameover], 1
              jmp  crdone
crcheklose:   cmp  word [mistakes], 5
              jb   crdone
              mov  word [gameover], 2
crdone:       pop  ax
              ret
showresult:   push ax
              call clrscr
              mov  ax, 30
              push ax
              mov  ax, 10
              push ax
              mov  ax, 0x0e
              push ax
              cmp  word [gameover], 1
              jne  rsshowlose
              mov  ax, msgwin
              jmp  rsshowmsg
rsshowlose:   mov  ax, msglose
rsshowmsg:    push ax
              call printstr
              mov  ax, 27
              push ax
              mov  ax, 13
              push ax
              mov  ax, 0x0b
              push ax
              mov  ax, msgkeys
              push ax
              call printstr
rswait:       cmp  word [quitflag], 0
              jne  rsdone
              mov  ah, 1
              int  0x16
              jz   rswait
              xor  ah, ah
              int  0x16
              cmp  al, 'r'
              je   rsdone
              cmp  al, 'R'
              je   rsdone
              jmp  rswait
rsdone:       pop  ax
              ret
resetgame:    push ax
              mov  word [score], 0
              mov  word [mistakes], 0
              mov  word [seconds], 0
              mov  word [elapsedticks], 0
              mov  word [tickcount], 0
              mov  word [spawntimer], 0
              mov  word [gameover], 0
              mov  word [speedupdone], 0
              mov  byte [normalinterval], 6
              mov  word [redrawflag], 0
              mov  word [switchstate], 0
              mov  word [switchstate+2], 0
              call cleartrains
              call clrscr
              call drawtrack
              call drawlabels
              call drawswitches
              call drawstatus
              pop  ax
              ret
showmenu:     push ax
              call clrscr
              mov  ax, 35
              push ax
              mov  ax, 5
              push ax
              mov  ax, 0x0e
              push ax
              mov  ax, msgtitle
              push ax
              call printstr
              mov  ax, 30
              push ax
              mov  ax, 9
              push ax
              mov  ax, 0x07
              push ax
              mov  ax, msgopt1
              push ax
              call printstr
              mov  ax, 30
              push ax
              mov  ax, 11
              push ax
              mov  ax, 0x07
              push ax
              mov  ax, msgopt2
              push ax
              call printstr
              mov  ax, 25
              push ax
              mov  ax, 15
              push ax
              mov  ax, 0x0b
              push ax
              mov  ax, msgpress
              push ax
              call printstr
menuask:      xor  ax, ax
              int  0x16
              cmp  al, '1'
              je   menusingle
              cmp  al, '2'
              je   menucoop
              cmp  al, 27
              je   menuesc
              jmp  menuask
menusingle:   mov  word [mode], 1
              jmp  menudone
menucoop:     mov  word [mode], 2
              jmp  menudone
menuesc:      mov  ax, 0x4c00
              int  0x21
menudone:     call clrscr
              pop  ax
              ret
 start:        call   showmenu
              call   seedrandom
              call   hookints
newgame:      call   resetgame
mainloop:     cmp    word [redrawflag], 0
              je     noredraw
              mov    word [redrawflag], 0
              call   drawswitches
              call   drawtrains
noredraw:     cmp    word [tickcount], 0
              je     notick
              dec    word [tickcount]
              call   movetrains
              call   checkspeedup
              call   checkresult
              cmp    word [gameover], 0
              je     keepplaying
              call   showresult
              cmp    word [quitflag], 0
              jne    notick
              call   resetgame
              jmp    notick
keepplaying:
              inc    word [spawntimer]
              cmp    word [spawntimer], spawngap
              jb     notick
              mov    word [spawntimer], 0
              call   spawntrain
notick:       mov    ax, [elapsedticks]
              xor    dx, dx
              mov    bx, 18
              div    bx
              cmp    ax, [seconds]
              je     nosecchange
              mov    [seconds], ax
              call   drawstatus
nosecchange:  cmp    word [quitflag], 0
              je     mainloop
              jmp    exitgame
exitgame:     call   unhookints
              mov    ax, 0x0003
              int    0x10
              mov    ax, 0x4c00
              int    0x21
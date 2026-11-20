; step 1: track table (198 nodes) and a small routine to draw it
; the whole game will walk over this table, so every other step uses it
[org 0x0100]
                jmp start

; ---------------------------------------------------------------
; one node = 8 bytes, the byte positions inside a node are:
;   +0 row         screen row of the cell (0-24)
;   +1 col         screen column of the cell (0-79)
;   +2 char        ascii value of the character used to draw the cell
;   +3 type        0 normal, 1 switch, 2 station, 3 entrance
;   +4 next0       node number to go to next (switch state 0)
;   +5 next1       node number for switch state 1 (0xff if not a switch)
;   +6 switchID    0-3 for switches 1-4 (0xff if not a switch)
;   +7 letter      'A'-'D' on a station, 0 everywhere else
; the node number is its position in the table, first node is 0.
; example: node 6 starts at track + 6*8 = track + 48
;
; values used in the table:
;   0xff = no next node / not a switch
;   0xc4 = horizontal line char    0xb3 = vertical line char
;   0xda = corner (down and right) 0xc0 = corner (up and right)
;   0xc3 = junction (line with branch to right)
;   0x10 = right arrow (entrance)
; ---------------------------------------------------------------

; ---------------------------------------------------------------
; the track on screen (exact rows: A=3, B=5, C=8, D=10, D=13)
;
;          +-------------------------------------------A
;          |
;     >----1               +---------------------------B
;          |               |
;          |               |
;          +---------------3---------------4-----------C
;          |                               |
;          |                               +-----------D
;     >----2
;          |
;          +-------------------------------------------D
;
; entry 1 is on row 5, entry 2 is on row 11
; switch 1: state 0 goes up (direct route to A), state 1 goes down
; switch 2: state 0 goes down (direct route to D), state 1 goes up
;           (the down and up lines of switch 1 and 2 meet at the + on row 8)
; switch 3: state 0 goes up to B,       state 1 goes on to switch 4
; switch 4: state 0 goes straight to C, state 1 goes down to D
; ---------------------------------------------------------------
track:
        db    5,  3, 0x10, 3, 1   , 0xff, 0xff, 0   ;   0: entrance 1
        db    5,  4, 0xc4, 0, 2   , 0xff, 0xff, 0   ;   1: entry 1 track
        db    5,  5, 0xc4, 0, 3   , 0xff, 0xff, 0   ;   2: entry 1 track
        db    5,  6, 0xc4, 0, 4   , 0xff, 0xff, 0   ;   3: entry 1 track
        db    5,  7, 0xc4, 0, 5   , 0xff, 0xff, 0   ;   4: entry 1 track
        db    5,  8, '1' , 1, 6   , 52  , 0   , 0   ;   5: switch 1: 0->A (up), 1->shared (down)
        db    4,  8, 0xb3, 0, 7   , 0xff, 0xff, 0   ;   6: branch up to A
        db    3,  8, 0xda, 0, 8   , 0xff, 0xff, 0   ;   7: corner, turn right to A
        db    3,  9, 0xc4, 0, 9   , 0xff, 0xff, 0   ;   8: direct route to A
        db    3, 10, 0xc4, 0, 10  , 0xff, 0xff, 0   ;   9: direct route to A
        db    3, 11, 0xc4, 0, 11  , 0xff, 0xff, 0   ;  10: direct route to A
        db    3, 12, 0xc4, 0, 12  , 0xff, 0xff, 0   ;  11: direct route to A
        db    3, 13, 0xc4, 0, 13  , 0xff, 0xff, 0   ;  12: direct route to A
        db    3, 14, 0xc4, 0, 14  , 0xff, 0xff, 0   ;  13: direct route to A
        db    3, 15, 0xc4, 0, 15  , 0xff, 0xff, 0   ;  14: direct route to A
        db    3, 16, 0xc4, 0, 16  , 0xff, 0xff, 0   ;  15: direct route to A
        db    3, 17, 0xc4, 0, 17  , 0xff, 0xff, 0   ;  16: direct route to A
        db    3, 18, 0xc4, 0, 18  , 0xff, 0xff, 0   ;  17: direct route to A
        db    3, 19, 0xc4, 0, 19  , 0xff, 0xff, 0   ;  18: direct route to A
        db    3, 20, 0xc4, 0, 20  , 0xff, 0xff, 0   ;  19: direct route to A
        db    3, 21, 0xc4, 0, 21  , 0xff, 0xff, 0   ;  20: direct route to A
        db    3, 22, 0xc4, 0, 22  , 0xff, 0xff, 0   ;  21: direct route to A
        db    3, 23, 0xc4, 0, 23  , 0xff, 0xff, 0   ;  22: direct route to A
        db    3, 24, 0xc4, 0, 24  , 0xff, 0xff, 0   ;  23: direct route to A
        db    3, 25, 0xc4, 0, 25  , 0xff, 0xff, 0   ;  24: direct route to A
        db    3, 26, 0xc4, 0, 26  , 0xff, 0xff, 0   ;  25: direct route to A
        db    3, 27, 0xc4, 0, 27  , 0xff, 0xff, 0   ;  26: direct route to A
        db    3, 28, 0xc4, 0, 28  , 0xff, 0xff, 0   ;  27: direct route to A
        db    3, 29, 0xc4, 0, 29  , 0xff, 0xff, 0   ;  28: direct route to A
        db    3, 30, 0xc4, 0, 30  , 0xff, 0xff, 0   ;  29: direct route to A
        db    3, 31, 0xc4, 0, 31  , 0xff, 0xff, 0   ;  30: direct route to A
        db    3, 32, 0xc4, 0, 32  , 0xff, 0xff, 0   ;  31: direct route to A
        db    3, 33, 0xc4, 0, 33  , 0xff, 0xff, 0   ;  32: direct route to A
        db    3, 34, 0xc4, 0, 34  , 0xff, 0xff, 0   ;  33: direct route to A
        db    3, 35, 0xc4, 0, 35  , 0xff, 0xff, 0   ;  34: direct route to A
        db    3, 36, 0xc4, 0, 36  , 0xff, 0xff, 0   ;  35: direct route to A
        db    3, 37, 0xc4, 0, 37  , 0xff, 0xff, 0   ;  36: direct route to A
        db    3, 38, 0xc4, 0, 38  , 0xff, 0xff, 0   ;  37: direct route to A
        db    3, 39, 0xc4, 0, 39  , 0xff, 0xff, 0   ;  38: direct route to A
        db    3, 40, 0xc4, 0, 40  , 0xff, 0xff, 0   ;  39: direct route to A
        db    3, 41, 0xc4, 0, 41  , 0xff, 0xff, 0   ;  40: direct route to A
        db    3, 42, 0xc4, 0, 42  , 0xff, 0xff, 0   ;  41: direct route to A
        db    3, 43, 0xc4, 0, 43  , 0xff, 0xff, 0   ;  42: direct route to A
        db    3, 44, 0xc4, 0, 44  , 0xff, 0xff, 0   ;  43: direct route to A
        db    3, 45, 0xc4, 0, 45  , 0xff, 0xff, 0   ;  44: direct route to A
        db    3, 46, 0xc4, 0, 46  , 0xff, 0xff, 0   ;  45: direct route to A
        db    3, 47, 0xc4, 0, 47  , 0xff, 0xff, 0   ;  46: direct route to A
        db    3, 48, 0xc4, 0, 48  , 0xff, 0xff, 0   ;  47: direct route to A
        db    3, 49, 0xc4, 0, 49  , 0xff, 0xff, 0   ;  48: direct route to A
        db    3, 50, 0xc4, 0, 50  , 0xff, 0xff, 0   ;  49: direct route to A
        db    3, 51, 0xc4, 0, 51  , 0xff, 0xff, 0   ;  50: direct route to A
        db    3, 52, 'A' , 2, 0xff, 0xff, 0xff, 'A' ;  51: station A
        db    6,  8, 0xb3, 0, 53  , 0xff, 0xff, 0   ;  52: shared track down
        db    7,  8, 0xb3, 0, 54  , 0xff, 0xff, 0   ;  53: shared track down
        db    8,  8, 0xc3, 0, 109 , 0xff, 0xff, 0   ;  54: JUNCTION: start of shared track (both entries join)
        db   11,  3, 0x10, 3, 56  , 0xff, 0xff, 0   ;  55: entrance 2
        db   11,  4, 0xc4, 0, 57  , 0xff, 0xff, 0   ;  56: entry 2 track
        db   11,  5, 0xc4, 0, 58  , 0xff, 0xff, 0   ;  57: entry 2 track
        db   11,  6, 0xc4, 0, 59  , 0xff, 0xff, 0   ;  58: entry 2 track
        db   11,  7, 0xc4, 0, 60  , 0xff, 0xff, 0   ;  59: entry 2 track
        db   11,  8, '2' , 1, 63  , 61  , 1   , 0   ;  60: switch 2: 0->D (down), 1->shared (up)
        db   10,  8, 0xb3, 0, 62  , 0xff, 0xff, 0   ;  61: shared track up
        db    9,  8, 0xb3, 0, 54  , 0xff, 0xff, 0   ;  62: shared track up
        db   12,  8, 0xb3, 0, 64  , 0xff, 0xff, 0   ;  63: branch down to D
        db   13,  8, 0xc0, 0, 65  , 0xff, 0xff, 0   ;  64: corner, turn right to D
        db   13,  9, 0xc4, 0, 66  , 0xff, 0xff, 0   ;  65: direct route to D
        db   13, 10, 0xc4, 0, 67  , 0xff, 0xff, 0   ;  66: direct route to D
        db   13, 11, 0xc4, 0, 68  , 0xff, 0xff, 0   ;  67: direct route to D
        db   13, 12, 0xc4, 0, 69  , 0xff, 0xff, 0   ;  68: direct route to D
        db   13, 13, 0xc4, 0, 70  , 0xff, 0xff, 0   ;  69: direct route to D
        db   13, 14, 0xc4, 0, 71  , 0xff, 0xff, 0   ;  70: direct route to D
        db   13, 15, 0xc4, 0, 72  , 0xff, 0xff, 0   ;  71: direct route to D
        db   13, 16, 0xc4, 0, 73  , 0xff, 0xff, 0   ;  72: direct route to D
        db   13, 17, 0xc4, 0, 74  , 0xff, 0xff, 0   ;  73: direct route to D
        db   13, 18, 0xc4, 0, 75  , 0xff, 0xff, 0   ;  74: direct route to D
        db   13, 19, 0xc4, 0, 76  , 0xff, 0xff, 0   ;  75: direct route to D
        db   13, 20, 0xc4, 0, 77  , 0xff, 0xff, 0   ;  76: direct route to D
        db   13, 21, 0xc4, 0, 78  , 0xff, 0xff, 0   ;  77: direct route to D
        db   13, 22, 0xc4, 0, 79  , 0xff, 0xff, 0   ;  78: direct route to D
        db   13, 23, 0xc4, 0, 80  , 0xff, 0xff, 0   ;  79: direct route to D
        db   13, 24, 0xc4, 0, 81  , 0xff, 0xff, 0   ;  80: direct route to D
        db   13, 25, 0xc4, 0, 82  , 0xff, 0xff, 0   ;  81: direct route to D
        db   13, 26, 0xc4, 0, 83  , 0xff, 0xff, 0   ;  82: direct route to D
        db   13, 27, 0xc4, 0, 84  , 0xff, 0xff, 0   ;  83: direct route to D
        db   13, 28, 0xc4, 0, 85  , 0xff, 0xff, 0   ;  84: direct route to D
        db   13, 29, 0xc4, 0, 86  , 0xff, 0xff, 0   ;  85: direct route to D
        db   13, 30, 0xc4, 0, 87  , 0xff, 0xff, 0   ;  86: direct route to D
        db   13, 31, 0xc4, 0, 88  , 0xff, 0xff, 0   ;  87: direct route to D
        db   13, 32, 0xc4, 0, 89  , 0xff, 0xff, 0   ;  88: direct route to D
        db   13, 33, 0xc4, 0, 90  , 0xff, 0xff, 0   ;  89: direct route to D
        db   13, 34, 0xc4, 0, 91  , 0xff, 0xff, 0   ;  90: direct route to D
        db   13, 35, 0xc4, 0, 92  , 0xff, 0xff, 0   ;  91: direct route to D
        db   13, 36, 0xc4, 0, 93  , 0xff, 0xff, 0   ;  92: direct route to D
        db   13, 37, 0xc4, 0, 94  , 0xff, 0xff, 0   ;  93: direct route to D
        db   13, 38, 0xc4, 0, 95  , 0xff, 0xff, 0   ;  94: direct route to D
        db   13, 39, 0xc4, 0, 96  , 0xff, 0xff, 0   ;  95: direct route to D
        db   13, 40, 0xc4, 0, 97  , 0xff, 0xff, 0   ;  96: direct route to D
        db   13, 41, 0xc4, 0, 98  , 0xff, 0xff, 0   ;  97: direct route to D
        db   13, 42, 0xc4, 0, 99  , 0xff, 0xff, 0   ;  98: direct route to D
        db   13, 43, 0xc4, 0, 100 , 0xff, 0xff, 0   ;  99: direct route to D
        db   13, 44, 0xc4, 0, 101 , 0xff, 0xff, 0   ; 100: direct route to D
        db   13, 45, 0xc4, 0, 102 , 0xff, 0xff, 0   ; 101: direct route to D
        db   13, 46, 0xc4, 0, 103 , 0xff, 0xff, 0   ; 102: direct route to D
        db   13, 47, 0xc4, 0, 104 , 0xff, 0xff, 0   ; 103: direct route to D
        db   13, 48, 0xc4, 0, 105 , 0xff, 0xff, 0   ; 104: direct route to D
        db   13, 49, 0xc4, 0, 106 , 0xff, 0xff, 0   ; 105: direct route to D
        db   13, 50, 0xc4, 0, 107 , 0xff, 0xff, 0   ; 106: direct route to D
        db   13, 51, 0xc4, 0, 108 , 0xff, 0xff, 0   ; 107: direct route to D
        db   13, 52, 'D' , 2, 0xff, 0xff, 0xff, 'D' ; 108: station D (bottom one)
        db    8,  9, 0xc4, 0, 110 , 0xff, 0xff, 0   ; 109: shared track
        db    8, 10, 0xc4, 0, 111 , 0xff, 0xff, 0   ; 110: shared track
        db    8, 11, 0xc4, 0, 112 , 0xff, 0xff, 0   ; 111: shared track
        db    8, 12, 0xc4, 0, 113 , 0xff, 0xff, 0   ; 112: shared track
        db    8, 13, 0xc4, 0, 114 , 0xff, 0xff, 0   ; 113: shared track
        db    8, 14, 0xc4, 0, 115 , 0xff, 0xff, 0   ; 114: shared track
        db    8, 15, 0xc4, 0, 116 , 0xff, 0xff, 0   ; 115: shared track
        db    8, 16, 0xc4, 0, 117 , 0xff, 0xff, 0   ; 116: shared track
        db    8, 17, 0xc4, 0, 118 , 0xff, 0xff, 0   ; 117: shared track
        db    8, 18, 0xc4, 0, 119 , 0xff, 0xff, 0   ; 118: shared track
        db    8, 19, 0xc4, 0, 120 , 0xff, 0xff, 0   ; 119: shared track
        db    8, 20, 0xc4, 0, 121 , 0xff, 0xff, 0   ; 120: shared track
        db    8, 21, 0xc4, 0, 122 , 0xff, 0xff, 0   ; 121: shared track
        db    8, 22, 0xc4, 0, 123 , 0xff, 0xff, 0   ; 122: shared track
        db    8, 23, 0xc4, 0, 124 , 0xff, 0xff, 0   ; 123: shared track
        db    8, 24, '3' , 1, 153 , 125 , 2   , 0   ; 124: switch 3: 0->B (up), 1->switch 4
        db    8, 25, 0xc4, 0, 126 , 0xff, 0xff, 0   ; 125: track to switch 4
        db    8, 26, 0xc4, 0, 127 , 0xff, 0xff, 0   ; 126: track to switch 4
        db    8, 27, 0xc4, 0, 128 , 0xff, 0xff, 0   ; 127: track to switch 4
        db    8, 28, 0xc4, 0, 129 , 0xff, 0xff, 0   ; 128: track to switch 4
        db    8, 29, 0xc4, 0, 130 , 0xff, 0xff, 0   ; 129: track to switch 4
        db    8, 30, 0xc4, 0, 131 , 0xff, 0xff, 0   ; 130: track to switch 4
        db    8, 31, 0xc4, 0, 132 , 0xff, 0xff, 0   ; 131: track to switch 4
        db    8, 32, 0xc4, 0, 133 , 0xff, 0xff, 0   ; 132: track to switch 4
        db    8, 33, 0xc4, 0, 134 , 0xff, 0xff, 0   ; 133: track to switch 4
        db    8, 34, 0xc4, 0, 135 , 0xff, 0xff, 0   ; 134: track to switch 4
        db    8, 35, 0xc4, 0, 136 , 0xff, 0xff, 0   ; 135: track to switch 4
        db    8, 36, 0xc4, 0, 137 , 0xff, 0xff, 0   ; 136: track to switch 4
        db    8, 37, 0xc4, 0, 138 , 0xff, 0xff, 0   ; 137: track to switch 4
        db    8, 38, 0xc4, 0, 139 , 0xff, 0xff, 0   ; 138: track to switch 4
        db    8, 39, 0xc4, 0, 140 , 0xff, 0xff, 0   ; 139: track to switch 4
        db    8, 40, '4' , 1, 141 , 184 , 3   , 0   ; 140: switch 4: 0->C (straight), 1->D (down)
        db    8, 41, 0xc4, 0, 142 , 0xff, 0xff, 0   ; 141: track to C
        db    8, 42, 0xc4, 0, 143 , 0xff, 0xff, 0   ; 142: track to C
        db    8, 43, 0xc4, 0, 144 , 0xff, 0xff, 0   ; 143: track to C
        db    8, 44, 0xc4, 0, 145 , 0xff, 0xff, 0   ; 144: track to C
        db    8, 45, 0xc4, 0, 146 , 0xff, 0xff, 0   ; 145: track to C
        db    8, 46, 0xc4, 0, 147 , 0xff, 0xff, 0   ; 146: track to C
        db    8, 47, 0xc4, 0, 148 , 0xff, 0xff, 0   ; 147: track to C
        db    8, 48, 0xc4, 0, 149 , 0xff, 0xff, 0   ; 148: track to C
        db    8, 49, 0xc4, 0, 150 , 0xff, 0xff, 0   ; 149: track to C
        db    8, 50, 0xc4, 0, 151 , 0xff, 0xff, 0   ; 150: track to C
        db    8, 51, 0xc4, 0, 152 , 0xff, 0xff, 0   ; 151: track to C
        db    8, 52, 'C' , 2, 0xff, 0xff, 0xff, 'C' ; 152: station C
        db    7, 24, 0xb3, 0, 154 , 0xff, 0xff, 0   ; 153: exit up to B
        db    6, 24, 0xb3, 0, 155 , 0xff, 0xff, 0   ; 154: exit up to B
        db    5, 24, 0xda, 0, 156 , 0xff, 0xff, 0   ; 155: corner, turn right to B
        db    5, 25, 0xc4, 0, 157 , 0xff, 0xff, 0   ; 156: exit route to B
        db    5, 26, 0xc4, 0, 158 , 0xff, 0xff, 0   ; 157: exit route to B
        db    5, 27, 0xc4, 0, 159 , 0xff, 0xff, 0   ; 158: exit route to B
        db    5, 28, 0xc4, 0, 160 , 0xff, 0xff, 0   ; 159: exit route to B
        db    5, 29, 0xc4, 0, 161 , 0xff, 0xff, 0   ; 160: exit route to B
        db    5, 30, 0xc4, 0, 162 , 0xff, 0xff, 0   ; 161: exit route to B
        db    5, 31, 0xc4, 0, 163 , 0xff, 0xff, 0   ; 162: exit route to B
        db    5, 32, 0xc4, 0, 164 , 0xff, 0xff, 0   ; 163: exit route to B
        db    5, 33, 0xc4, 0, 165 , 0xff, 0xff, 0   ; 164: exit route to B
        db    5, 34, 0xc4, 0, 166 , 0xff, 0xff, 0   ; 165: exit route to B
        db    5, 35, 0xc4, 0, 167 , 0xff, 0xff, 0   ; 166: exit route to B
        db    5, 36, 0xc4, 0, 168 , 0xff, 0xff, 0   ; 167: exit route to B
        db    5, 37, 0xc4, 0, 169 , 0xff, 0xff, 0   ; 168: exit route to B
        db    5, 38, 0xc4, 0, 170 , 0xff, 0xff, 0   ; 169: exit route to B
        db    5, 39, 0xc4, 0, 171 , 0xff, 0xff, 0   ; 170: exit route to B
        db    5, 40, 0xc4, 0, 172 , 0xff, 0xff, 0   ; 171: exit route to B
        db    5, 41, 0xc4, 0, 173 , 0xff, 0xff, 0   ; 172: exit route to B
        db    5, 42, 0xc4, 0, 174 , 0xff, 0xff, 0   ; 173: exit route to B
        db    5, 43, 0xc4, 0, 175 , 0xff, 0xff, 0   ; 174: exit route to B
        db    5, 44, 0xc4, 0, 176 , 0xff, 0xff, 0   ; 175: exit route to B
        db    5, 45, 0xc4, 0, 177 , 0xff, 0xff, 0   ; 176: exit route to B
        db    5, 46, 0xc4, 0, 178 , 0xff, 0xff, 0   ; 177: exit route to B
        db    5, 47, 0xc4, 0, 179 , 0xff, 0xff, 0   ; 178: exit route to B
        db    5, 48, 0xc4, 0, 180 , 0xff, 0xff, 0   ; 179: exit route to B
        db    5, 49, 0xc4, 0, 181 , 0xff, 0xff, 0   ; 180: exit route to B
        db    5, 50, 0xc4, 0, 182 , 0xff, 0xff, 0   ; 181: exit route to B
        db    5, 51, 0xc4, 0, 183 , 0xff, 0xff, 0   ; 182: exit route to B
        db    5, 52, 'B' , 2, 0xff, 0xff, 0xff, 'B' ; 183: station B
        db    9, 40, 0xb3, 0, 185 , 0xff, 0xff, 0   ; 184: branch down to D
        db   10, 40, 0xc0, 0, 186 , 0xff, 0xff, 0   ; 185: corner, turn right to D
        db   10, 41, 0xc4, 0, 187 , 0xff, 0xff, 0   ; 186: branch to D
        db   10, 42, 0xc4, 0, 188 , 0xff, 0xff, 0   ; 187: branch to D
        db   10, 43, 0xc4, 0, 189 , 0xff, 0xff, 0   ; 188: branch to D
        db   10, 44, 0xc4, 0, 190 , 0xff, 0xff, 0   ; 189: branch to D
        db   10, 45, 0xc4, 0, 191 , 0xff, 0xff, 0   ; 190: branch to D
        db   10, 46, 0xc4, 0, 192 , 0xff, 0xff, 0   ; 191: branch to D
        db   10, 47, 0xc4, 0, 193 , 0xff, 0xff, 0   ; 192: branch to D
        db   10, 48, 0xc4, 0, 194 , 0xff, 0xff, 0   ; 193: branch to D
        db   10, 49, 0xc4, 0, 195 , 0xff, 0xff, 0   ; 194: branch to D
        db   10, 50, 0xc4, 0, 196 , 0xff, 0xff, 0   ; 195: branch to D
        db   10, 51, 0xc4, 0, 197 , 0xff, 0xff, 0   ; 196: branch to D
        db   10, 52, 'D' , 2, 0xff, 0xff, 0xff, 'D' ; 197: station D (upper one)

; node numbers of the four switches, in switch order 1,2,3,4
; used later to find a switch cell quickly when it is toggled
switchnode:     db 5, 60, 124, 140

; node numbers of the two entrances, in entrance order 1,2
; used later when a train is spawned
entrances:      db 0, 55

; switch state of each switch, 0 or 1 (all start at state 0)
switchstate:    db 0, 0, 0, 0

; attribute (colour) used when drawing, indexed by the node type
;                normal switch station entrance
attrtable:      db 0x07, 0x0e, 0x0a, 0x0b ; grey, yellow, green, cyan

; subroutine to clear the screen
clrscr:         push es
                push ax
                push cx
                push di

                mov    ax, 0xb800
                mov    es, ax             ; point es to video base
                xor    di, di             ; point di to top left column
                mov    ax, 0x0720         ; space char in normal attribute
                mov    cx, 2000           ; number of screen locations

                cld                       ; auto increment mode
                rep    stosw              ; clear the whole screen

                pop    di
                pop    cx
                pop    ax
                pop    es
                ret

; subroutine to draw every node of the track table on the screen
; takes no parameters, it walks over the whole table
drawtrack:      push es
                push ax
                push bx
                push cx
                push dx
                push si
                push di

                mov    ax, 0xb800
                mov    es, ax             ; point es to video base
                mov    si, track          ; si points to the first node
                mov    cx, 198            ; number of nodes to draw

nextnode:       mov    al, [si]           ; load the row of this node
                mov    bl, 80             ; 80 columns in a row
                mul    bl                 ; ax = row * 80
                mov    dl, [si+1]         ; load the column of this node
                xor    dh, dh             ; zero the upper half of dx
                add    ax, dx             ; ax = row * 80 + col
                shl    ax, 1              ; 2 bytes per screen location
                mov    di, ax             ; di = offset in video memory

                mov    al, [si+2]         ; load the character of this node
                mov    bl, [si+3]         ; load the type of this node
                xor    bh, bh             ; bx = type, used as table index
                mov    ah, [attrtable+bx] ; pick the attribute for this type
                mov    [es:di], ax        ; print char and attribute

                add    si, 8              ; move to the next node (8 bytes)
                loop   nextnode           ; repeat for all nodes

                pop    di
                pop    si
                pop    dx
                pop    cx
                pop    bx
                pop    ax
                pop    es
                ret

start:          call   clrscr             ; clear the screen
                call   drawtrack          ; draw the track from the table

                mov    ah, 0              ; wait for a key so we can look
                int    0x16               ; at the screen

                mov    ax, 0x4c00         ; terminate program
                int    0x21
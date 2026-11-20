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

;----step 2-----
; ---------------------------------------------------------------
; step 2 data: numbers shown on the status bar
; ---------------------------------------------------------------
score:        dw 0                  ; correct deliveries so far
mistakes:     dw 0                  ; wrong deliveries so far
seconds:      dw 0                  ; elapsed time in seconds

; ---------------------------------------------------------------
; step 2 data: text strings, every string ends with a zero byte
; so that printstr knows where the string stops
; ---------------------------------------------------------------
lblentry1:    db 'Entry 1', 0       ; label drawn above entrance 1
lblentry2:    db 'Entry 2', 0       ; label drawn above entrance 2
lblstA:       db 'Station A', 0     ; label drawn next to station A
lblstB:       db 'Station B', 0     ; label drawn next to station B
lblstC:       db 'Station C', 0     ; label drawn next to station C
lblstD:       db 'Station D', 0     ; used twice, both D stations
msgscore:     db 'Score: ', 0       ; status bar text
msgmist:      db 'Mistakes: ', 0    ; status bar text
msgtime:      db 'Time: ', 0        ; status bar text

; ---------------------------------------------------------------
; step 3 data: interrupt related variables
; ---------------------------------------------------------------
tickcount:    dw 0                  ; ticks waiting to be used by the game
                                    ; (timer ISR adds 1, main loop takes 1)
elapsedticks: dw 0                  ; total ticks since the game started
                                    ; (only grows, used for the clock)
redrawflag:   dw 0                  ; 1 = a switch was toggled, so the
                                    ; main loop must redraw the switches
quitflag:     dw 0                  ; 1 = Esc was pressed, leave the game
mode:         dw 1                  ; 1 = single player, 2 = two player co-op
oldtimer:     dd 0                  ; old INT 08h vector (offset then segment)
oldkb:        dd 0                  ; old INT 09h vector (offset then segment)

;-------step 3-----
;-------step 4-----

; ---------------------------------------------------------------
; step 4 data: the trains
; there are at most 8 trains on screen at the same time.
; every train takes 5 bytes, so the whole array is 8 * 5 = 40 bytes.
; the byte positions inside one train are:
;   +0 active    1 = this slot holds a train, 0 = slot is free
;   +1 node      node number where the train is standing right now
;   +2 dest      the destination station, stored as a letter 'A'-'D'
;                (the same letter is drawn on screen for this train)
;   +3 interval  how many timer ticks between two moves of this train
;   +4 counter   ticks left before the next move, counts down to 0
; the slot number is the position in the array (first slot is 0).
; example: slot 2 starts at trains + 2*5 = trains + 10
; ---------------------------------------------------------------
normalinterval: db 6                ; interval given to every NEW train
                                    ; (halved once at the speed-up)
trains:       db 0, 0, 0, 0, 0      ; slot 0, all zeros = free slot
              db 0, 0, 0, 0, 0      ; slot 1
              db 0, 0, 0, 0, 0      ; slot 2
              db 0, 0, 0, 0, 0      ; slot 3
              db 0, 0, 0, 0, 0      ; slot 4
              db 0, 0, 0, 0, 0      ; slot 5
              db 0, 0, 0, 0, 0      ; slot 6
              db 0, 0, 0, 0, 0      ; slot 7

; ---------------------------------------------------------------
; step 4 data: helper arrays, one byte for EVERY node (198 nodes)
; the byte at position n belongs to node number n
;   occupied[n] = 1 if a train was standing on node n when the
;                 movement update started (a snapshot, never changed
;                 during the update)
;   claimed[n]  = 1 if some train already moved INTO node n during
;                 this update (so a second train must wait)
; both arrays are cleared at the start of every movement update
; ---------------------------------------------------------------
occupied:     db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 0 to 17
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 18 to 35
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 36 to 53
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 54 to 71
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 72 to 89
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 90 to 107
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 108 to 125
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 126 to 143
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 144 to 161
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 162 to 179
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 180 to 197

claimed:      db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 0 to 17
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 18 to 35
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 36 to 53
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 54 to 71
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 72 to 89
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 90 to 107
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 108 to 125
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 126 to 143
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 144 to 161
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 162 to 179
              db 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0  ; nodes 180 to 197
;-------step 4-----

;----step 2-----
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


;----step 2---

; ===============================================================
; subroutine putchar
; puts ONE character with ONE attribute at (row, col) on screen
; parameters pushed in this order: row, col, char, attribute
;   [bp+10] = row    [bp+8] = col    [bp+6] = char    [bp+4] = attribute
; screen offset formula: offset = (row * 80 + col) * 2
; ===============================================================
putchar:      push bp
              mov  bp, sp           ; bp now points to our stack frame
              push es               ; save every register we are going
              push ax               ; to change, so the caller does
              push bx               ; not lose its values
              push dx
              push di

              mov  ax, 0xb800
              mov  es, ax           ; es points to video memory

              mov  ax, [bp+10]      ; ax = row
              mov  bx, 80           ; 80 columns in every row
              mul  bx               ; ax = row * 80 (dx is destroyed,
                                    ; that is why we saved it above)
              add  ax, [bp+8]       ; ax = row * 80 + col
              shl  ax, 1            ; multiply by 2, every screen
                                    ; location takes 2 bytes
              mov  di, ax           ; di = offset inside video memory

              mov  al, [bp+6]       ; al = character (low byte of word)
              mov  ah, [bp+4]       ; ah = attribute (colour)
              mov  [es:di], ax      ; write char and attribute together

              pop  di
              pop  dx
              pop  bx
              pop  ax
              pop  es
              pop  bp
              ret  8                ; 4 parameters x 2 bytes = 8 bytes

; ===============================================================
; subroutine printstr
; prints a zero terminated string at (x, y) on screen
; parameters pushed in this order: x, y, attribute, string offset
;   [bp+10] = x (col)   [bp+8] = y (row)
;   [bp+6]  = attribute [bp+4] = offset of the string
; ===============================================================
printstr:     push bp
              mov  bp, sp
              push es
              push ax
              push bx
              push dx
              push si
              push di

              mov  ax, 0xb800
              mov  es, ax           ; es points to video memory

              mov  ax, [bp+8]       ; ax = y (row)
              mov  bx, 80
              mul  bx               ; ax = row * 80
              add  ax, [bp+10]      ; ax = row * 80 + x
              shl  ax, 1            ; 2 bytes per screen location
              mov  di, ax           ; di = where the first char goes

              mov  si, [bp+4]       ; si points to the first char
              mov  ah, [bp+6]       ; ah = attribute for every char

psnext:       mov  al, [si]         ; load one character of the string
              cmp  al, 0            ; is it the zero at the end?
              je   psend            ; yes, string finished
              mov  [es:di], ax      ; no, print char and attribute
              add  di, 2            ; move to the next screen location
              inc  si               ; move to the next char of string
              jmp  psnext           ; repeat for the next char

psend:        pop  di
              pop  si
              pop  dx
              pop  bx
              pop  ax
              pop  es
              pop  bp
              ret  8                ; 4 parameters x 2 bytes = 8 bytes

; ===============================================================
; subroutine printnum
; prints a number with a FIXED count of digits (leading zeros)
; fixed width means old digits never stay on screen
; parameters pushed in this order: x, y, attribute, number, digits
;   [bp+12] = x   [bp+10] = y   [bp+8] = attribute
;   [bp+6]  = the number to print   [bp+4] = how many digits
; ===============================================================
printnum:     push bp
              mov  bp, sp
              push es
              push ax
              push bx
              push cx
              push dx
              push di

              mov  ax, 0xb800
              mov  es, ax           ; es points to video memory

              mov  ax, [bp+10]      ; ax = y (row)
              mov  bx, 80
              mul  bx               ; ax = row * 80
              add  ax, [bp+12]      ; ax = row * 80 + x
              shl  ax, 1            ; 2 bytes per screen location
              mov  di, ax           ; di = where the first digit goes

              mov  ax, [bp+6]       ; ax = the number to print
              mov  bx, 10           ; we divide by 10 again and again
              mov  cx, [bp+4]       ; cx = number of digits to make

pndivide:     xor  dx, dx           ; zero the upper half of dividend
              div  bx               ; ax = ax / 10, dx = remainder
              add  dl, 0x30         ; turn the digit into its ascii char
              push dx               ; save the digit on the stack
              loop pndivide         ; repeat cx times (cx goes down)

              mov  cx, [bp+4]       ; cx = number of digits again
              mov  ah, [bp+8]       ; ah = attribute for every digit

pnprint:      pop  dx               ; digits come out in correct order
              mov  al, dl           ; al = the digit char
              mov  [es:di], ax      ; print digit and attribute
              add  di, 2            ; next screen location
              loop pnprint          ; repeat for all digits

              pop  di
              pop  dx
              pop  cx
              pop  bx
              pop  ax
              pop  es
              pop  bp
              ret  10               ; 5 parameters x 2 bytes = 10 bytes

; ===============================================================
; subroutine drawnode
; draws ONE node of the track table using putchar
; the row, col and char are read from the table, only the
; attribute (colour) is given by the caller
; parameters pushed in this order: node number, attribute
;   [bp+6] = node number    [bp+4] = attribute
; ===============================================================
drawnode:     push bp
              mov  bp, sp
              push ax
              push bx
              push dx
              push si

              mov  ax, [bp+6]       ; ax = node number
              mov  bx, 8            ; every node is 8 bytes
              mul  bx               ; ax = node number * 8
              add  ax, track        ; ax = address of this node
              mov  si, ax           ; si points to the node

              mov  al, [si]         ; al = row of the node
              xor  ah, ah           ; make it a full 16 bit word
              push ax               ; parameter 1 of putchar: row
              mov  al, [si+1]       ; al = col of the node
              xor  ah, ah
              push ax               ; parameter 2 of putchar: col
              mov  al, [si+2]       ; al = char of the node
              xor  ah, ah
              push ax               ; parameter 3 of putchar: char
              push word [bp+4]      ; parameter 4 of putchar: attribute
              call putchar          ; draw it

              pop  si
              pop  dx
              pop  bx
              pop  ax
              pop  bp
              ret  4                ; 2 parameters x 2 bytes = 4 bytes

; ===============================================================
; subroutine drawlabels
; writes the names Entry 1, Entry 2 and Station A, B, C, D
; takes no parameters. only needs to be called once per game
; each printstr call needs: x, y, attribute, string offset
; ===============================================================
drawlabels:   push ax

              ; ---- Entry 1 label, above the arrow on row 5
              mov  ax, 1
              push ax               ; x = 1
              mov  ax, 4
              push ax               ; y = 4
              mov  ax, 0x0b
              push ax               ; attribute = light cyan
              mov  ax, lblentry1
              push ax               ; offset of the string
              call printstr

              ; ---- Entry 2 label, above the arrow on row 11
              mov  ax, 1
              push ax               ; x = 1
              mov  ax, 10
              push ax               ; y = 10
              mov  ax, 0x0b
              push ax
              mov  ax, lblentry2
              push ax
              call printstr

              ; ---- Station A label, to the right of A (row 3)
              mov  ax, 54
              push ax               ; x = 54
              mov  ax, 3
              push ax               ; y = 3
              mov  ax, 0x0a
              push ax               ; attribute = light green
              mov  ax, lblstA
              push ax
              call printstr

              ; ---- Station B label (row 5)
              mov  ax, 54
              push ax
              mov  ax, 5
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstB
              push ax
              call printstr

              ; ---- Station C label (row 8)
              mov  ax, 54
              push ax
              mov  ax, 8
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstC
              push ax
              call printstr

              ; ---- first Station D label (row 10)
              mov  ax, 54
              push ax
              mov  ax, 10
              push ax
              mov  ax, 0x0a
              push ax
              mov  ax, lblstD
              push ax
              call printstr

              ; ---- second Station D label (row 13)
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

; ===============================================================
; subroutine drawswitches
; for every switch: draws the number box, and shows which route
; is selected by colouring the FIRST cell of each exit:
;     green (0x0a) = route is selected (open)
;     red   (0x04) = route is not selected (closed)
; call this once at start, and again ONLY when a switch is toggled
; takes no parameters, it reads switchnode and switchstate
; ===============================================================
drawswitches: push ax
              push bx
              push cx
              push si

              xor  bx, bx           ; bx = switch number, start with 0

nextswitch:   ; ---- step 1: draw the switch box (yellow on blue)
              xor  ah, ah
              mov  al, [switchnode+bx] ; al = node number of this switch
              push ax               ; parameter 1 of drawnode: node
              mov  ax, 0x1e
              push ax               ; parameter 2 of drawnode: attribute
              call drawnode

              ; ---- step 2: find the switch node in the table
              xor  ah, ah
              mov  al, [switchnode+bx] ; al = node number again
              mov  cl, 3
              shl  ax, cl           ; ax = node number * 8
              add  ax, track        ; ax = address of the switch node
              mov  si, ax           ; si points to the switch node

              ; ---- step 3: exit 0 (next0 is at byte +4 of the node)
              xor  ah, ah
              mov  al, [si+4]       ; al = node where state 0 goes
              push ax               ; parameter 1 of drawnode
              mov  ax, 0x04         ; assume red (closed)
              cmp  byte [switchstate+bx], 0 ; is this switch in state 0?
              jne  exit0done        ; no, so exit 0 stays red
              mov  ax, 0x0a         ; yes, exit 0 is open so green
exit0done:    push ax               ; parameter 2 of drawnode
              call drawnode

              ; ---- step 4: exit 1 (next1 is at byte +5 of the node)
              xor  ah, ah
              mov  al, [si+5]       ; al = node where state 1 goes
              push ax               ; parameter 1 of drawnode
              mov  ax, 0x04         ; assume red (closed)
              cmp  byte [switchstate+bx], 1 ; is this switch in state 1?
              jne  exit1done        ; no, so exit 1 stays red
              mov  ax, 0x0a         ; yes, exit 1 is open so green
exit1done:    push ax               ; parameter 2 of drawnode
              call drawnode

              inc  bx               ; go to the next switch
              cmp  bx, 4            ; have we done all 4 switches?
              jne  nextswitch       ; no, repeat for the next one

              pop  si
              pop  cx
              pop  bx
              pop  ax
              ret

; ===============================================================
; subroutine drawstatus
; draws the status bar on the last row (row 24):
;     Score: 00  Mistakes: 0  Time: 000
; the bar is white on blue, the numbers are yellow on blue
; call this again whenever score, mistakes or seconds change
; ===============================================================
drawstatus:   push ax
              push cx
              push di
              push es

              ; ---- fill the whole last row with blue background
              mov  ax, 0xb800
              mov  es, ax           ; es points to video memory
              mov  di, 3840         ; row 24 * 80 columns * 2 bytes
              mov  ax, 0x1f20       ; space char, white on blue
              mov  cx, 80           ; 80 screen locations in a row
              cld                   ; auto increment mode
              rep  stosw            ; paint the whole row

              ; ---- the text "Score: " at x=2
              mov  ax, 2
              push ax               ; x
              mov  ax, 24
              push ax               ; y
              mov  ax, 0x1f
              push ax               ; attribute
              mov  ax, msgscore
              push ax               ; string offset
              call printstr

              ; ---- the score number (2 digits) at x=9
              mov  ax, 9
              push ax               ; x
              mov  ax, 24
              push ax               ; y
              mov  ax, 0x1e
              push ax               ; attribute
              push word [score]     ; the number itself
              mov  ax, 2
              push ax               ; how many digits
              call printnum

              ; ---- the text "Mistakes: " at x=14
              mov  ax, 14
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1f
              push ax
              mov  ax, msgmist
              push ax
              call printstr

              ; ---- the mistakes number (1 digit) at x=24
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

              ; ---- the text "Time: " at x=28
              mov  ax, 28
              push ax
              mov  ax, 24
              push ax
              mov  ax, 0x1f
              push ax
              mov  ax, msgtime
              push ax
              call printstr

              ; ---- the seconds number (3 digits) at x=34
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

 ;-------------step 2-------
 ;-------------step 3-------

 ; ===============================================================
; timer interrupt service routine (hooked on INT 08h)
; the timer chip generates this interrupt about 18.2 times a second
; an ISR must be SHORT, so it only adds 1 to two counters
; ===============================================================
timer:        push ax

              inc  word [cs:tickcount]    ; one more tick for the game
              inc  word [cs:elapsedticks] ; one more tick on the clock
                                          ; [cs:...] is used because ds
                                          ; is not known inside an ISR

              mov  al, 0x20
              out  0x20, al               ; tell the PIC the interrupt
                                          ; is finished (EOI)

              pop  ax
              iret                        ; return from interrupt

; ===============================================================
; keyboard interrupt service routine (hooked on INT 09h)
; runs every time a key is pressed OR released
; scan codes of the keys we care about:
;     1 = 0x02   2 = 0x03   3 = 0x04   4 = 0x05
;     J = 0x24   K = 0x25   Esc = 0x01
; when a key is RELEASED the keyboard sends the same code with bit 7
; set (code + 0x80), so a release never matches our press codes
; and is ignored automatically
; bx is used as the number of the switch to toggle (0 to 3)
; ===============================================================
kbisr:        push ax
              push bx

              in   al, 0x60               ; read the scan code from the
                                          ; keyboard port

              cmp  al, 0x02               ; is it key 1?
              je   isw0                   ; yes, toggle switch 1
              cmp  al, 0x03               ; is it key 2?
              je   isw1                   ; yes, toggle switch 2
              cmp  al, 0x04               ; is it key 3?
              je   isw2single             ; yes, check the mode first
              cmp  al, 0x05               ; is it key 4?
              je   isw3single             ; yes, check the mode first
              cmp  al, 0x24               ; is it key J?
              je   isw2coop               ; yes, check the mode first
              cmp  al, 0x25               ; is it key K?
              je   isw3coop               ; yes, check the mode first
              cmp  al, 0x01               ; is it Esc?
              je   iquit                  ; yes, ask the game to stop
              jmp  nomatch                ; any other key, not ours

isw0:         mov  bx, 0                  ; switch 1 has number 0
              jmp  dotoggle
isw1:         mov  bx, 1                  ; switch 2 has number 1
              jmp  dotoggle

isw2single:   cmp  word [cs:mode], 1      ; key 3 works in single player
              jne  nomatch                ; co-op, so ignore this key
              mov  bx, 2                  ; switch 3 has number 2
              jmp  dotoggle
isw3single:   cmp  word [cs:mode], 1      ; key 4 works in single player
              jne  nomatch                ; co-op, so ignore this key
              mov  bx, 3                  ; switch 4 has number 3
              jmp  dotoggle

isw2coop:     cmp  word [cs:mode], 2      ; J works in co-op only
              jne  nomatch                ; single player, ignore this key
              mov  bx, 2                  ; J toggles switch 3
              jmp  dotoggle
isw3coop:     cmp  word [cs:mode], 2      ; K works in co-op only
              jne  nomatch                ; single player, ignore this key
              mov  bx, 3                  ; K toggles switch 4
              jmp  dotoggle

dotoggle:     xor  byte [cs:switchstate+bx], 1 ; flip 0 to 1, or 1 to 0
              mov  word [cs:redrawflag], 1     ; tell main loop to redraw
              jmp  kbexit

iquit:        mov  word [cs:quitflag], 1  ; tell main loop to quit
              jmp  kbexit

nomatch:      pop  bx                     ; not our key, give back the
              pop  ax                     ; registers and let the old
              jmp  far [cs:oldkb]         ; ISR handle it (chaining)

kbexit:       mov  al, 0x20
              out  0x20, al               ; end of interrupt for the PIC

              pop  bx
              pop  ax
              iret                        ; return from interrupt

; ===============================================================
; subroutine hookints
; saves the old INT 08h and INT 09h vectors, then installs ours
; the interrupt vector table starts at 0000:0000
; vector n lives at address n*4: offset (2 bytes), segment (2 bytes)
; ===============================================================
hookints:     push ax
              push es

              xor  ax, ax
              mov  es, ax                 ; es points to the IVT base

              mov  ax, [es:8*4]           ; old timer offset
              mov  [oldtimer], ax         ; save it
              mov  ax, [es:8*4+2]         ; old timer segment
              mov  [oldtimer+2], ax       ; save it

              mov  ax, [es:9*4]           ; old keyboard offset
              mov  [oldkb], ax            ; save it
              mov  ax, [es:9*4+2]         ; old keyboard segment
              mov  [oldkb+2], ax          ; save it

              cli                         ; stop interrupts while we
                                          ; change the table
              mov  word [es:8*4], timer   ; our timer offset
              mov  [es:8*4+2], cs         ; our timer segment
              mov  word [es:9*4], kbisr   ; our keyboard offset
              mov  [es:9*4+2], cs         ; our keyboard segment
              sti                         ; interrupts allowed again

              pop  es
              pop  ax
              ret

; ===============================================================
; subroutine unhookints
; puts the old INT 08h and INT 09h vectors back
; MUST be called before returning to DOS, and before hooking again
; on replay, otherwise DOS keeps pointing at code that is gone
; ===============================================================
unhookints:   push ax
              push es

              xor  ax, ax
              mov  es, ax                 ; es points to the IVT base

              cli                         ; stop interrupts while we
                                          ; change the table
              mov  ax, [oldtimer]         ; saved timer offset
              mov  [es:8*4], ax           ; put it back
              mov  ax, [oldtimer+2]       ; saved timer segment
              mov  [es:8*4+2], ax         ; put it back

              mov  ax, [oldkb]            ; saved keyboard offset
              mov  [es:9*4], ax           ; put it back
              mov  ax, [oldkb+2]          ; saved keyboard segment
              mov  [es:9*4+2], ax         ; put it back
              sti                         ; interrupts allowed again

              pop  es
              pop  ax
              ret
 ;-------------step 3-------
 ;-------------step 4-------

 ; ===============================================================
; subroutine cleartrains
; makes every train slot free again and wipes both helper arrays
; used when a new game starts (and later on replay)
; takes no parameters
; stosb writes the value in al to [es:di] and moves di forward,
; rep repeats it cx times, so we fill a whole block with zeros
; ===============================================================
cleartrains:  push ax
              push cx
              push di
              push es

              push ds
              pop  es               ; es = ds, because stosb writes at
                                    ; es:di and our data is in ds
              cld                   ; auto increment mode
              xor  al, al           ; al = 0, the value we write

              mov  di, trains       ; start of the trains array
              mov  cx, 40           ; 8 trains * 5 bytes
              rep  stosb            ; all 40 bytes become 0

              mov  di, occupied     ; start of the occupied array
              mov  cx, 198          ; one byte per node
              rep  stosb            ; all 198 bytes become 0

              mov  di, claimed      ; start of the claimed array
              mov  cx, 198          ; one byte per node
              rep  stosb            ; all 198 bytes become 0

              pop  es
              pop  di
              pop  cx
              pop  ax
              ret

; ===============================================================
; subroutine snapshot
; called at the START of every movement update (step 5 will use it)
;   1. clears the claimed array (nobody has claimed anything yet)
;   2. clears the occupied array, then marks every node that has a
;      train standing on it
; after this the occupied array shows who stood where at the start
; takes no parameters
; ===============================================================
snapshot:     push ax
              push bx
              push cx
              push si
              push di
              push es

              push ds
              pop  es               ; es = ds for stosb
              cld                   ; auto increment mode
              xor  al, al           ; al = 0

              mov  di, claimed
              mov  cx, 198
              rep  stosb            ; claimed array becomes all zeros

              mov  di, occupied
              mov  cx, 198
              rep  stosb            ; occupied array becomes all zeros

              mov  si, trains       ; si points to slot 0
              mov  cx, 8            ; we look at all 8 slots

snloop:       cmp  byte [si], 0     ; is this slot free?
              je   snnext           ; yes, nothing to mark
              xor  bx, bx           ; bx = 0, so the upper half is zero
              mov  bl, [si+1]       ; bx = node where this train stands
              mov  byte [occupied+bx], 1 ; mark that node as occupied
snnext:       add  si, 5            ; move to the next slot (5 bytes)
              loop snloop           ; repeat for all 8 slots

              pop  es
              pop  di
              pop  si
              pop  cx
              pop  bx
              pop  ax
              ret

; ===============================================================
; subroutine drawtrains
; draws every active train on screen as its destination letter
; (white letter on magenta background so it stands out)
; the row and col come from the node where the train stands
; takes no parameters
; ===============================================================
drawtrains:   push ax
              push bx
              push cx
              push dx
              push si

              mov  si, trains       ; si points to slot 0
              mov  cx, 8            ; we look at all 8 slots

dtloop:       cmp  byte [si], 0     ; is this slot free?
              je   dtnext           ; yes, nothing to draw

              xor  ax, ax           ; ax = 0
              mov  al, [si+1]       ; ax = node number of the train
              mov  bx, 8            ; every node is 8 bytes
              mul  bx               ; ax = node number * 8
              add  ax, track        ; ax = address of that node
              mov  bx, ax           ; bx points to the node in the table

              xor  ax, ax
              mov  al, [bx]         ; al = row of the node
              push ax               ; parameter 1 of putchar: row
              xor  ax, ax
              mov  al, [bx+1]       ; al = col of the node
              push ax               ; parameter 2 of putchar: col
              xor  ax, ax
              mov  al, [si+2]       ; al = destination letter of the train
              push ax               ; parameter 3 of putchar: char
              mov  ax, 0x5f         ; white on magenta
              push ax               ; parameter 4 of putchar: attribute
              call putchar          ; draw the train

dtnext:       add  si, 5            ; move to the next slot (5 bytes)
              loop dtloop           ; repeat for all 8 slots

              pop  si
              pop  dx
              pop  cx
              pop  bx
              pop  ax
              ret

 ;-------------step 4-------
 ;-------------start-------

 start:        call   clrscr             ; clear the screen
              call   drawtrack          ; draw the track from the table
              call   drawlabels         ; Entry 1, Entry 2, Station A-D
              call   drawswitches       ; switch boxes and route colours
              call   drawstatus         ; status bar on the last row

              ;-------step 4 test----

                            call   cleartrains        ; start with no trains at all

              ; ---- TEMPORARY TEST: put 3 trains by hand, delete later
              mov    byte [trains+0], 1    ; slot 0 is active
              mov    byte [trains+1], 3    ; standing on node 3 (entry 1 track)
              mov    byte [trains+2], 'C'  ; wants to go to station C
              mov    byte [trains+3], 6    ; moves every 6 ticks
              mov    byte [trains+4], 6    ; 6 ticks left before first move

              mov    byte [trains+5], 1    ; slot 1 is active
              mov    byte [trains+6], 57   ; standing on node 57 (entry 2 track)
              mov    byte [trains+7], 'D'  ; wants to go to station D
              mov    byte [trains+8], 6
              mov    byte [trains+9], 6

              mov    byte [trains+10], 1   ; slot 2 is active
              mov    byte [trains+11], 20  ; standing on node 20 (route to A)
              mov    byte [trains+12], 'A' ; wants to go to station A
              mov    byte [trains+13], 6
              mov    byte [trains+14], 6

              call   snapshot           ; fill the occupied array
              call   drawtrains         ; draw the 3 trains on screen
              ; ---- END OF TEMPORARY TEST

              ;-------step 4 test----
              call   hookints           ; install our timer and keyboard ISRs

; ---------------------------------------------------------------
; main loop: the ISRs only set flags and counters,
; the real work (drawing) is done here
; ---------------------------------------------------------------
mainloop:     cmp    word [redrawflag], 0 ; was a switch toggled?
              je     noredraw           ; no, skip the redraw
              mov    word [redrawflag], 0 ; yes, clear the flag first
              call   drawswitches       ; redraw only the switches

noredraw:     cmp    word [tickcount], 0  ; is there a tick waiting?
              je     notick             ; no, skip
              dec    word [tickcount]   ; yes, use up one tick
              ; (step 4: spawn and move the trains will go right here)

notick:       mov    ax, [elapsedticks] ; total ticks so far
              xor    dx, dx             ; zero the upper half of dividend
              mov    bx, 18             ; timer ticks about 18 times a second
              div    bx                 ; ax = seconds
              cmp    ax, [seconds]      ; did the second number change?
              je     nosecchange        ; no, nothing to redraw
              mov    [seconds], ax      ; yes, remember the new seconds
              call   drawstatus         ; redraw the status bar

nosecchange:  cmp    word [quitflag], 0 ; was Esc pressed?
              je     mainloop           ; no, keep running the loop

              call   unhookints         ; restore both old vectors

              mov    ax, 0x4c00         ; terminate program
              int    0x21

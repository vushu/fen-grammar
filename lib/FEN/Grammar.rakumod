# Forsyth-Edwards Notation (FEN)
grammar FEN::Grammar {
    token TOP { 
        <FEN>
    }

    token chess-piece {
        | <pawn>
        | <rook>
        | <king>
        | <queen>
        | <bishop>
        | <knight>
    }

    rule FEN {
        <rank> '/' 
        <rank> '/'
        <rank> '/'
        <rank> '/'
        <rank> '/'
        <rank> '/'
        <rank> '/'
        <rank> 
        <state>?
    }

    token rank {
        <position>*
    }

    token position {
        | <chess-piece>
        | <empty-space>
    }

    token pawn {
        :i 'p'
    }

    token rook {
       :i 'r'
    }

    token king {
       :i 'k'
    }

    token queen {
       :i 'q'
    }

    token bishop {
       :i 'b'
    }

    token knight {
        :i 'n'
    }

    token empty-space {
        <[0..9]>
    }

# STATE
    token state {
        <ws><active-color><ws><castling><ws><en-passant><ws><halfmove-clock><ws><fullmove-number>
    }

    token active-color {
        | <white-turn>
        | <black-turn>
    }

    token black-turn {
        'b'
    }

    token white-turn {
        'w'
    }

    token castling {
        <white-castling><black-castling>
    }

    token white-castling {
        <white-castling-queenside>?<white-castling-kingside>?
    }

    token white-castling-queenside {
        'Q'
    }

    token white-castling-kingside {
        'K'
    }

    token black-castling {
        <black-castling-queenside>?<black-castling-kingside>?
    }

    token black-castling-queenside {
        'q'
    }

    token black-castling-kingside {
        'k'
    }

    token en-passant {
        | <unset>
        | <black-en-passant-pos>
        | <white-en-passant-pos>
    }

    token black-en-passant-pos {
        <letter> '5'
    }

    token white-en-passant-pos {
        <letter> '4'
    }

    token unset {
        '-'
    }

    token letter {
        <[a..h]>
    }

    token halfmove-clock {
        \d+
    }

    token fullmove-number {
        \d+
    }
}
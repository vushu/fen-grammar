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

}
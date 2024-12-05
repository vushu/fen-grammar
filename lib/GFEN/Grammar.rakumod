# Generalized Forsyth-Edwards Notation (GFEN)
use FEN::Grammar;
grammar GFEN::Grammar is FEN::Grammar {

    rule FEN {
        <rank>+ % '/'
    }

    token empty-space {
        <[0..9]>\d*
    }

}
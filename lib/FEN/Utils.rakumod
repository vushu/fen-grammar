unit module FEN::Utils;
my %chess-pieces = :p('♟'), :P('♙'), :r('♜'), :R('♖'), :n('♞'), :N('♘'), :b('♝'), :B('♗'), :q('♛'), :Q('♕'), :k('♚'), :K('♔');

our sub to-matrix(@ranks) {
    my @matrix = [["." xx 8] xx 8];
    for @ranks.kv -> $idx, $rank {
        for $rank -> @chess-pieces {
            for @chess-pieces -> $piece {
                my $pos = $piece[0];
                @matrix[$idx][$pos] = $piece[1];
            }
        }
    }
    return @matrix;
}

our sub to-unicoded-matrix(@ranks) {
    my @matrix = [["." xx 8] xx 8];
    for @ranks.kv -> $idx, $rank {
        for $rank -> @chess-pieces {
            for @chess-pieces -> $piece {
                my $pos = $piece[0];
                my $p = %chess-pieces{$piece[1]};
                @matrix[$idx][$pos] = $p;
            }
        }
    }
    return @matrix;
}
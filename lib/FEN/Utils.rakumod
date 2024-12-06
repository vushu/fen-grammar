unit module FEN::Utils;
my %chess-pieces = :p('♟'), :P('♙'), :r('♜'), :R('♖'), :n('♞'), :N('♘'), :b('♝'), :B('♗'), :q('♛'), :Q('♕'), :k('♚'), :K('♔');

our sub to-matrix(@ranks, $dimension = 8) {
    my @matrix = [["." xx $dimension] xx $dimension];
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

our sub to-unicoded-matrix(@ranks, $dimension = 8) {
    my @matrix = [["." xx $dimension] xx $dimension];
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

our sub ascii-to-fen($ascii-matrix, $dimension = 8){
    my @fen-string;
    for $ascii-matrix.lines -> $line {
        my $stripped-ws = $line.subst(:g, /\s+/,'');
        die "Not valid ascii matrix" if $stripped-ws.chars ne 10;
        my $rank-str = $stripped-ws.comb;
        die "Invalid start or end character must be [ ] " if $rank-str[0] ne '[' && $rank-str[*-1] ne ']' ;
        my $empty-space-counter = 0;
        my $fen-rank-string = '';

        for 1 .. $dimension -> $idx {
            my $char = $rank-str[$idx];
            if $char eq '.' {
                $empty-space-counter++;
                $fen-rank-string ~= $empty-space-counter if $idx eq $dimension;

            }
            else {
                if $empty-space-counter > 0 {
                    $fen-rank-string ~= $empty-space-counter ~ $char;
                }
                else {
                    $fen-rank-string ~= $char;
                }
                $empty-space-counter = 0;
            }
        }
        @fen-string.push($fen-rank-string);

    }
    @fen-string.join('/');
    
}
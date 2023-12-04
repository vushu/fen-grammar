unit class FEN::Actions;
method TOP($/) {
    make $<FEN>.made;
}

method FEN($/) {
    my @ranks;
    for $<rank>.kv -> $number, $rank {
        @ranks.push($rank.made);
    }
    make @ranks;
}

method rank($/) {
    my $offset = 0;
    my @chess-pieces;
    for $<position>.kv -> $idx, $pos {
        if $pos<chess-piece> {
            my $p = $offset > 0 ?? max(($offset + $idx - 1), 0) !! $idx;
            @chess-pieces.push(($p, ~$pos<chess-piece>));
        }
        else { # else is empty-space 
            $offset = +$pos;
        }
    }
    make @chess-pieces;
}
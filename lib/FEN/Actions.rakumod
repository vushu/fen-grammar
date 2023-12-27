use FEN::Result;
unit class FEN::Actions;
method TOP($/) {
    make $<FEN>.made;
}

method FEN($/) {
    my $result = FEN::Result.new;
    $result.ranks = $<rank>.map: *.made;
    $result.state = $<state>.made if $<state>;
    make $result;
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

method state($/) {
    my $state = FEN::State.new;
    $state.active-color = $<active-color>.made;
    if !$<castling><unset> {
        my $castling = $<castling>.made;
        $state.white-castling = $castling[0];
        $state.black-castling = $castling[1];
    }
    $state.en-passant = ~$<en-passant>;
    $state.halfmove-clock = +$<halfmove-clock>;
    $state.fullmove-number = +$<fullmove-number>;
    make $state;
}

method castling($/) {
    make ($<white-castling>.made, $<black-castling>.made);
}

method white-castling($/) {
    make %{'kingside' => so $<white-castling-kingside>, 'queenside' => so $<white-castling-queenside>};
}

method black-castling($/) {
    make %{'kingside' => so $<black-castling-kingside>, 'queenside' => so $<black-castling-queenside>};
}

multi method active-color($/ where $<white>) {
    make $<white>.made;
}

multi method active-color($/ where $<black>) {
    make $<black>.made;
}

method white($/) {
    make 'White';
}

method black($/) {
    make 'Black';
}


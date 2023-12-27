class FEN::State {
    has Str $.active-color is rw = 'white';
    has %.white-castling = 'kingside' => False, 'queenside' => False;
    has %.black-castling = 'kingside' => False, 'queenside' => False;
    has $.en-passant is rw = '-';
    has $.halfmove-clock is rw = 0;
    has $.fullmove-number is rw = 0;

    method state-text {
        my $white-castling = %.white-castling.keys.sort.grep({%.white-castling{$_}}).join(', ');
        my $black-castling = %.black-castling.keys.sort.grep({%.black-castling{$_}}).join(', ');
        my $state-text = q:s:to/SHOW/;
        Active color: $.active-color
        White may castle on: $white-castling
        Black may castle on: $black-castling
        En-passant: $.en-passant
        Halfmove clock: $.halfmove-clock
        Fullmove number: $.fullmove-number
        SHOW
        return $state-text;
    }

}

class FEN::Result {
    has @.ranks is rw;
    has FEN::State $.state is rw;
    method show-state {
        return say "No state was parsed!" if !$.state;
        say $.state.state-text;
    }
}

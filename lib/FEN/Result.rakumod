class FEN::State {
    has Str $.active-color = 'white';
    has %.white-castling = 'kingside' => False, 'queenside' => False;
    has %.black-castling = 'kingside' => False, 'queenside' => False;
    has Str $.en-passant = '-';
    has $.halfmove-clock = 0;
    has $.fullmove-number = 0;

    method show {
        my @white-castling = grep %.white-castling{$_}, %.white-castling.keys;
        my @black-castling = grep %.black-castling{$_}, %.black-castling.keys;

        my $state-text = q:s:to/SHOW/;
        Active color: $.active-color
        White castling: @white-castling
        Black castling: @black-castling
        En-passant: $.en-passant
        Halfmove clock: $.halfmove-clock
        Fullmove number: $.fullmove-number
        SHOW
        $state-text;
    }

}

class FEN::Result {
    has @.ranks is rw;
    has FEN::State $.state is rw;

    method show-state {
        say $.state.show if $.state;
    }
}

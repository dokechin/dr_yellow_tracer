package Dyt::DB::Schema;
use Teng::Schema::Declare;
use DateTime::Format::MySQL;

    table {
        name 'Look';
        pk id;
        columns qw( id looked_at station_id);

        inflate qr/.+_at/ => sub {
            my $value = shift;
            if ( $value ) {
              DateTime::Format::MySQL->parse_datetime($value);
            }
            else{
              return undef;
            }
        };

    };

    table {
        name 'Station';
        pk id;
        columns qw( id name km);
    };


1;

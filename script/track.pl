#!/usr/bin/perl
use strict;
use AnyEvent::Twitter::Stream;
use Config::PL;
use utf8;
use FindBin;
BEGIN { unshift @INC, "$FindBin::Bin/../lib" }
use Dyt::DB;
use Encode;

my $done = AE::cv;

my $config = config_do 'dyt.config';

my $teng = Dyt::DB->new( $config->{db} );
my @stations = $teng->search("Station");

binmode STDOUT, ":utf8";

my $streamer = AnyEvent::Twitter::Stream->new(
    consumer_key    => $config->{consumer_key},
    consumer_secret => $config->{consumer_secret},
    token           => $config->{token},
    token_secret    => $config->{token_secret},
    method   => "filter",
    track    => "ドクターイエロー",
    use_compression => 1,
    on_tweet => sub {
        my $tweet = shift;
        if ($tweet->{retweeted} eq "false"){
            for my $station (@stations){
                my $station_name = decode_utf8($station->name);
                if ($tweet->{text} =~ /$station_name/){
                    $teng->insert("Look", {station_id => $station->id, text => $tweet->{text} , looked_at => \"Now()"});
                    last;
                }
            }
         }
    },
    on_error => sub {
        my $error = shift;
        warn "ERROR: $error";
        $done->send;
    },
    on_eof   => sub {
        $done->send;
    },
);

# uncomment to test undef $streamer
# my $t = AE::timer 1, 0, sub { undef $streamer };

$done->recv;

#!/usr/bin/perl
use strict;
use AnyEvent::Twitter::Stream;
use Config::PL;

my $done = AE::cv;

my $config = config_do 'dyt.config';

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
        print "$tweet->{user}{screen_name}: $tweet->{text}\n";
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

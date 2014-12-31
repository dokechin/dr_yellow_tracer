use Mojo::Server::PSGI;
use File::Spec;
use File::Basename;
use lib File::Spec->catdir(dirname(__FILE__), 'lib');
use Dyt::Web;
use Plack::Builder;
use Plack::Builder::Conditionals;
use Plack::Middleware::AccessLog;
use Plack::Middleware::ReverseProxy;

# ˆø”‚Åw’è‚ào—ˆ‚é
my $web = Dyt::Web->new();
my $server = Mojo::Server::PSGI->new(app => $web);

my $app = sub {
    $server->run(@_);
};

#enable 'Profiler::NYTProf';

builder {
      enable match_if addr(['192.168.0.0/24','127.0.0.1']),
          "Plack::Middleware::ReverseProxy";
      enable "Plack::Middleware::AccessLog::Timed",
           format => '%h %l %u %t "%r" %>s %b "%{Referer}i" "%{User-agent}i" %D';
      $app;
};
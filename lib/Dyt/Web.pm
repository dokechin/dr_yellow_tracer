package Dyt::Web;
use Mojo::Base 'Mojolicious';
use Dyt::DB;

# This method will run once at server start
sub startup {
  my $self = shift;

  $self->secrets(['unko12$#', 'hangu2dj#iq', 'tang#120!e']);

  # Documentation browser under "/perldoc"
  $self->plugin('PODRenderer');

  my $config = $self->plugin( 'Config', { file => 'dyt.config' } );

  $self->helper( db => sub { Dyt::DB->new( $config->{db} ) } );
  $self->plugin(I18N => {namespace => "Dyt::I18N"});

  # Router
  my $r = $self->routes;

  # Normal route to controller
  $r->get('/')->to('root#index');
  $r->get('/detail/:date')->to('root#detail');

}

1;

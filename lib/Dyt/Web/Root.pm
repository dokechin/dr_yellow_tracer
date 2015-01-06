package Dyt::Web::Root;
use Mojo::Base 'Mojolicious::Controller';

# This action will render a template
sub index {

  my $self = shift;

  my $itr = $self->db->search_by_sql('Select distinct date(looked_at) as d from Look order by looked_at desc');
  $itr->suppress_object_creation(1);  
  my @dates = ();
  # $itr->suppress_object_creation(1); ‚à‰Â”\
  while(my $row = $itr->next) {
    warn($row->{d});
    push @dates, {date => $row->{d}};
  }

  $self->stash(dates => \@dates);

  $self->render();

}

# This action will render a template
sub detail {

  my $self = shift;


  my $date = $self->param("date");
  warn($date);
  my @looks;
  my $itr = $self->db->search_joined(Look => [
     Station => {'Look.station_id' => 'Station.id'}],
     { looked_at => { between => [ $date . " 00:00:00",  $date . " 23:59:59" ]}},
     { order_by  => "looked_at"}
  );
  my $first = 1;
  my $data;
  while(my ($look,$station) = $itr->next) {
    if ($first == 1){
      $data = {name => $station->name, start_hh=> $look->looked_at->hour(), start_mi => $look->looked_at->minute()};
      $first = 0;
    }
    else{
      if ($data->{name} ne $station->name){
        if ( !defined $data->{end_hh}){
          $data->{end_hh} = $data->{start_hh};
          $data->{end_mi} = $data->{start_mi};
        }
        push @looks, $data;
        $data = {name => $station->name, start_hh=> $look->looked_at->hour(), start_mi => $look->looked_at->minute()};
      }
      else{
        $data->{end_hh} = $look->looked_at->hour();
        $data->{end_mi} = $look->looked_at->minute();
      }
    }
  }

  if ( !defined $data->{end_hh}){
    $data->{end_hh} = $data->{start_hh};
    $data->{end_mi} = $data->{start_mi};
  }
  push @looks, $data;

  $self->stash(looks => \@looks);

  $self->render();

}


1;

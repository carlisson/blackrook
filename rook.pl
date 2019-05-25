use Mojolicious::Lite;

get '/' => sub {
  my $c = shift;
  $c->render(text => 'Blackrook+');
};

app->start;

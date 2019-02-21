# Run the "webapp"
class profiles::go_webapp::run {
  require ::profiles::go_webapp::build
  exec {'run-go_webapp':
    command => '/vagrant/app/go-webapp.go &',
  }
}

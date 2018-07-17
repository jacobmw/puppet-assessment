# Build the "webapp"
class profiles::go_webapp::build {
  exec {'build-go_webapp':
    command => 'go build /vagrant/app/go-webapp.go',
  }
}

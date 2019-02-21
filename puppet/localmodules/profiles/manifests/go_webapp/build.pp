# Build the "webapp"
class profiles::go_webapp::build {
  require ::profiles::golang

  exec {'build-go_webapp':
    path => ['/usr/bin'],
    command => 'go build /vagrant/app/go-webapp.go',
  }
}

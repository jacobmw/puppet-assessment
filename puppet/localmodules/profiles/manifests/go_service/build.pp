# Build the "service" golang app
class profiles::go_service::build {
  exec {'build-go_service':
    command => 'go build /vagrant/app/go-service.go',
  }
}

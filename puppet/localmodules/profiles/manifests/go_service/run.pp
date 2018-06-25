# Run the "service" golang app
class profiles::go_service::run {
  exec {'run-go_service':
    command => '/vagrant/app/go-service &',
  }
}

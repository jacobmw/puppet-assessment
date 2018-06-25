# puppet-assessment
A simple Puppet assessment skeleton using vagrant.

**Firstly fork this repo, then clone your fork to work on.**

## Software Required

You will need to install Vagrant and either Docker or Virtualbox to run the  
technical assessment. If you have trouble with Docker then try Virtualbox  
instead.

[Git](https://git-scm.com/)  
[Vagrant](https://www.vagrantup.com)  
[Virtualbox](https://www.virtualbox.org/)

## Overview

Running `vagrant up` should build and run an app named `service` which is
written in golang. The app deliberately takes a while to respond to a request
it does this using a `sleep` but imagine in the real world a slow query or some
big data machine learning algorithm is being run.

Everything in this repo works... eventually. There are deliberate problems which
often occur in the real world to solve before things do get up and running.

Once you get `vagrant up` running you should be able to `vagrant ssh` into the
VM instance and `curl localhost:8484` eventually the app will give you some
output.

## Expectations

After overcoming the issues to get things running, there's a few things you
should try to achieve:

### Where am I?

Imagine you have hundreds or even thousands of instances, the larger the number
of instances, the greater the risk of potentially logging into the wrong
instance becomes.

**Add something that will display the hostname and role of the machine on
login. This should be consistent on all future instances.**

### Go faster

The TTFB from requests to the app is very slow. The app is stateless and the
data it returns is the same / only gets updated every 30 minutes. If the app
is down, users want to receive stale or out of data information rather than an
error.

**Add something that will speed up the majority of requests, showing the new
data when it is updated and allowing the app to be down.**

### Keep on running

Currently the application is run with an exec and backgrounds the process.
Although this works it's no a very good thing to do.

**Find a way to run go0service that allows us to check the status of the service
and start, stop or restart it. The go-service should be running and run if the
instance were rebooted. THe go-service should automatically restart on error.**

### Stop repeating yourself

Good puppet code should require only a single run to achieve the desired state
and being idempotent, it should not re-apply changes repetitively on subsequent
runs. You can run Puppet again using the `vagrant provision` command.

**Prevent resources from re-applying or executing every puppet run. Let's assume
that the go-service application only needs to be built once in the lifetime of
the instance.**

## Expected results

On completion of the above (you may need to do one or more extra things), the
expectation is that you should be able to go to http://localhost:8080 in your
web browser and get some output. You should be able to refresh the page and get
an almost instant response back. Stopping the `go-service` process or service
should not stop the output being availalbe to the browser.
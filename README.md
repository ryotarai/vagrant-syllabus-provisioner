# vagrant-syllabus-provisioner [![Build Status](https://travis-ci.org/ryotarai/vagrant-syllabus-provisioner.png?branch=master)](https://travis-ci.org/ryotarai/vagrant-syllabus-provisioner)

This plugin installs a provisioner that allows [Syllabus](https://github.com/serverspec/syllabus) to provision machines.

## Installation

```
$ vagrant plugin install vagrant-syllabus-provisioner
```

## Usage

```ruby
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "your_box"

  config.vm.provision :syllabus do |syllabus|
    # What files does syllabus use for provisioning?
    # (default: ["syllabus.rb"])
    syllabus.files = ["syllabus/default.rb"]
  end
end
```

## TODO

* Add specs

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Development

Create `Vagrantfile`:

```
$ bundle exec vagrant init
```

Require this plugin in `Vagrantfile`:

```ruby
Vagrant.require_plugin "vagrant-syllabus-provisioner"
```

Use vagrant:

```
$ bundle exec vagrant up
$ bundle exec vagrant provision
```


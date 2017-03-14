# Fireflower

This gem meant as a workshop for Rust with Ruby. I would not recommend using this as any kind of base for an actual gem.

---

![](https://brson.github.io/fireflowers/rust-fire-mario-equation.png)

*Image credit https://brson.github.io/fireflowers*


## Development

- If you already have Rust installed and ruby installed with shared extensions or would rather do this without Vagrant skip to **Without vagrant** which will be Linux/OSX only and assumes you're using [rbenv](https://github.com/rbenv/rbenv).

### Vagrant
- Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
- Install [Vagrant](https://www.vagrantup.com/downloads.html)

The super easy way:
- `curl https://raw.githubusercontent.com/whatisinternet/fireflower/master/install -sSf | sh`

The super easy non-curl way:
- Clone the repo `git clone git@github.com:whatisinternet/fireflower.git` or
  `git clone https://github.com/whatisinternet/fireflower.git`
- In command prompt or terminal: `cd fireflower`
- In command prompt or terminal: `vagrant up`
  - This will take a while
- `vagrant ssh`
- You can edit/change/checkout branches locally (in another terminal/program) and it will be reflected in the
  prompt that you ran `vagrant ssh` in.
- On master make sure you run `bundle install`

### Without Vagrant
- Clone the repo `git clone git@github.com:whatisinternet/fireflower.git` or
  `git clone https://github.com/whatisinternet/fireflower.git`
- `cd fireflower`
- `CONFIGURE_OPTS=--enable-shared rbenv install 2.3.0`
- `rbenv global 2.3.0 && ruby -v`
- `gem install bundler`
- `rbenv rehash`
- Go to [rustup.rs](https://rustup.rs/) and install Rust
- `bundle install`


## Tests:
- In vagrant:
  - `bundle exec rake && rspec`

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatisinternet/fireflower. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).


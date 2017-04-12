# Fireflower

This gem meant as a workshop for Rust with Ruby. I would not recommend using this as any kind of base for an actual gem.

---

![](https://brson.github.io/fireflowers/rust-fire-mario-equation.png)

*Image credit https://brson.github.io/fireflowers*


## Getting going:

### All
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads)
2. Install [Vagrant](https://www.vagrantup.com/downloads.html)
3. Skip to either Windows or Mac/Linux

---

### Mac/Linux

The super easy way:
1. `curl https://raw.githubusercontent.com/whatisinternet/fireflower/master/install -sSf | sh`

The super easy non-curl way:
1. Clone the repo `git clone git@github.com:whatisinternet/fireflower.git` or `git clone https://github.com/whatisinternet/fireflower.git`
2. In command prompt or terminal: `cd fireflower`
3. In command prompt or terminal: `vagrant up` (This will take a while)
4. `vagrant ssh`
5. `pwd` if the directory is not `fireflower` then `cd fireflower`
6. `git checkout master`
7. `bundle install`
8. You're now ready.

---

### Windows
1. Clone or download the project `git clone git@github.com:whatisinternet/fireflower.git` or `git clone https://github.com/whatisinternet/fireflower.git`
2. In command prompt or terminal: `cd fireflower`
3. In command prompt or terminal: `vagrant up` (This will take a while)
4. `vagrant ssh`
5. `pwd` if the directory is not `fireflower` then `cd fireflower`
6. `git checkout master`
7. `bundle install`
8. You're now ready.

---

### I know what I'm doing and I don't want Vagrant or VirtualBox
1. Clone the repo `git clone git@github.com:whatisinternet/fireflower.git` or `git clone https://github.com/whatisinternet/fireflower.git`
2. `cd fireflower`
3. `CONFIGURE_OPTS=--enable-shared rbenv install 2.3.0`
4. `rbenv global 2.3.0 && ruby -v`
5. `gem install bundler`
6. `rbenv rehash`
7. Go to [rustup.rs](https://rustup.rs/) and install Rust
8. `bundle install`


---


## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/whatisinternet/fireflower. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

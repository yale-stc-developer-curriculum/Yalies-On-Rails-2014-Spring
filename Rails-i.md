## Creating a New Rails App Using Vagrant

1. Make sure you've followed the [[Computer Setup]] instructions
2. Open your terminal
3. cd to where you keep your code, e.g.:

```
    cd ~/code
```

4. Make a new directory for the project / app

```
    mkdir project_name
    cd project_name
```

5. Initialize the folder for Vagrant 

```
    vagrant init rails
```

6. Open `Vagrantfile` and add the following line within the Vagrant configuration section:

```
    config.vm.network :forwarded_port, guest: 3000, host: 3000
```
7. Save the file.
8. Start Vagrant

```
    vagrant up
```

9. SSH into Vagrant

```
    vagrant ssh
```

10. cd to the vagrant shared folder

```
    cd /vagrant
```

11. Create a new rails app:

```
    rails new app_name
```

12. cd into the rails folder:

```
    cd app_name
```
13. Open the rails app folder in sublime text, and edit the `Gemfile`. Uncomment the line that looks like:

```
    gem 'therubyracer', :platforms => :ruby
```
14. In the vagrant machine, update your bundle:

```
    bundle install
```

That's it!
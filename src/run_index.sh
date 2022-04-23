#!/bin/bash

#installing the bundler gem
gem install bundler
#installing the gems required for the applicaiton
bundle install
clear
#runs the applicaiton
ruby index.rb "Dragons Lair" "ADD YOUR NAME HERE" #Mod this if you wish to overide the ARGV set values.



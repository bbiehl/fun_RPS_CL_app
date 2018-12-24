# ../../RPS/run.rb
#
# Launch this Ruby file from the command line to get started

# Set the absolute path `APP_ROOT`
# what directory is this file in?
# File.dirname(__FILE__)
APP_ROOT = File.dirname(__FILE__)

# require "#{APP_ROOT}/lib/match"
# require File.join(APP_ROOT, 'lib', 'match')

# use Ruby magic variable `$:` that contains an array of all the directories to find files we ask for
#
# `unshift` method to prepend objects to the front of of the array `$:`
$:.unshift(File.join(APP_ROOT, 'lib'))
require 'match'

match = Match.new
match.launch!
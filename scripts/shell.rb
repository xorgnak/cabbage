require 'json'
require 'pry'
require 'paho-mqtt'
require 'awesome_print'

MACHINE = File.read("/etc/machine-id").strip
IP = `hostname -I`.strip.split(" ")
HOSTNAME = `hostname`.strip

Dir["/home/#{ENV['USER']}/cabbage/lib/*.rb"].each { |e| load e; puts "LOADED: #{e}" }

Pry.start

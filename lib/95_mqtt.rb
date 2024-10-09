
module MQTT
  @@M = PahoMqtt::Client.new
  @@M.on_message do |message|
    puts "--[#{message.topic}]"
    ap JSON.parse(message.payload)
  end
  
  @@M.on_suback do
    puts "Subscribed"
  end
  
  @@M.on_puback do
    puts "Message Acknowledged"
  end
  
  @@M.connect('localhost', 1883)
  @@M.subscribe(['#', 2])
  
  def self.publish t, p
    @@M.publish(t, p, false, 1)
  end
end

MQTT.publish('/ok', JSON.generate({ machine: MACHINE, hostname: HOSTNAME, ip: IP }))

# http://en.wikipedia.org/wiki/Diffie–Hellman_key_exchange

class Fixnum
  # (self ** e) % mod
  def modex(e, mod)
    c = 1
    e.times { c = (self * c) % mod }
    c
  end
end

class Client
  def initialize(secret)
    @a      = secret
    @p      = 23    # should be a prime
    @g      = 5     # 
    @big_a  = @g.modex(@a, @p)
  end
  
  def exchange_keys(server)
    server.hello(self, @g, @p, @big_a)
  end
  
  def ok(big_b)
    @big_k = big_b.modex(@a, @p)
    puts "client says key is: #{@big_k}"
  end
end

class Server
  def initialize(secret)
    @b = secret
  end
  
  def hello(client, g, p, big_a)
    @big_b = g.modex(@b, p)
    @big_k = big_a.modex(@b, p)
    puts "server says key is: #{@big_k}"
    client.ok(@big_b)
  end
end

alice = Client.new(5323425)
bob   = Server.new(32299422)

alice.exchange_keys(bob)
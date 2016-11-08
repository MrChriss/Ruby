# secret handshake
class SecretHandshake
  def initialize(dec)
    @dec = dec.to_i
  end

  def commands
    binaries = @dec.to_s(2).chars.map(&:to_i).reverse
    coms = ['wink', 'double blink', 'close your eyes', 'jump']
    arr = []

    binaries.each_with_index do |n, idx|
      arr << coms[idx] unless n.zero? || coms[idx].nil?
      arr.reverse! if coms[idx].nil?
    end

    arr
  end
end

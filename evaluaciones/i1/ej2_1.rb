# NR = No requerido en la respuesta, pero incluido en la pauta por ser buena práctica

# NR
class NotSupportedSequence < StandardError; end

class MathSequence

  SUPPORTED_SEQUENCES = [:fibonacci, :cuadrados, :triangle]

  def initialize(sequence)
    raise NotSupportedSequence unless SUPPORTED_SEQUENCES.include?(sequence) # NR
    @sequence = sequence.to_sym # NR: to_sym por si fuese entregado como string.
  end

  def traverse(n)
    # NR
    raise BlockRequired unless block_given?

    case @sequence
    when :fibonacci
      previouses = [0, 1]
      base_cases = previouses.length
      previouses.each_with_index { |i, value| yield(i, value) if n >= i }
      (n - base_cases).times do |i|
        current = previouses.reduce(:+)
        yield(i + base_cases, current)
        previouses.shift
        previouses << current
      end
    when :cuadrados
      n.times do |i|
        current = i + 1
        yield(current, current ** 2)
      end
    when :triangle
      n.times do |i|
        current = i + 1
        yield(current, current * (current + 1) / 2)
      end
    end
  end

end

# Para probar el código
seq = MathSequence.new(:fibonacci)
seq.traverse(10) do |i, number_i|
  puts "El #{i}-ésimo número es #{number_i}"
end

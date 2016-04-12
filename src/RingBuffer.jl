module RingBuffer

  type Ring{T}
    memory::Array
    read_idx::Int
    write_idx::Int
    size::Int

    function Ring(size::Int)
      new(Array(T, size), 1, 1, size)
    end
  end


  function write!(buffer, value)
    buffer.memory[buffer.write_idx] = value;
    buffer.write_idx = next_index(buffer.write_idx, buffer.size);
  end

  function read(buffer)
    value = buffer.memory[buffer.read_idx]
    buffer.read_idx = next_index(buffer.read_idx, buffer.size)
    return value
  end

  function read_newest(buffer)
    return buffer.memory[buffer.write_idx]


  function read_all(buffer)
    buffer.memory
  end

  function next_index(current, size)
    next = current + 1
    if current%size == 0
      next = 1
    end
    return next
  end

end

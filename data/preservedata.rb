require 'json'

def save_data(data, filename)
  data_array = data.map(&:to_h) # Convert each object to a hash
  File.write(filename, JSON.generate(data_array))
end

def load_data(filename)
  if File.exist?(filename)
    data = File.read(filename)
    JSON.parse(data)
  else
    []
  end
end

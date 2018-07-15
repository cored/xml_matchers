FakeResponse = Struct.new(:body) do
  def to_s
    body
  end
end

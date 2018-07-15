FakeSchema = Struct.new(:name, :xml) do
  def to_s
    xml
  end
end

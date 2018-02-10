describe CheckSum do
  include CheckSum

  describe "sum" do
    context "First example" do
      it "returns good output" do
        expect(sum('foo bar baz wibble fizzbuzz fizz buzz')).to eql('7-4-5-21-37')
      end
    end

    context "Second example" do
      it "returns good output" do
        expect(sum('The quick brown fox jumps over the lazy dog')).to eql('9-4-4-24-43')
      end
    end
  end
end

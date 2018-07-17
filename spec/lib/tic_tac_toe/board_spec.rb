# frozen_string_literal: true

describe TicTacToe::Board do
  subject do
    TicTacToe::Board.new
  end

  describe "#initialize" do
    it "sets the cells" do
      expect(subject.instance_variable_get(:@cells).first.number).to eq(1)
      expect(subject.instance_variable_get(:@cells).last.number).to eq(9)
      expect(subject.instance_variable_get(:@cells).size).to eq(9)
    end
  end

  describe "#play" do
    let(:number) { Random.rand(1..9) }

    context "the value is out of bounds" do
      it "fails" do
        expect{ subject.play(position: 0, symbol: :x) }.to raise_exception(StandardError)
        expect{ subject.play(position: 10, symbol: :x) }.to raise_exception(StandardError)
      end
    end

    it 'changes the value of the right cell' do
      expect{ subject.play(position: number, symbol: :x) }.to change{
        subject.instance_variable_get(:@cells)[number - 1].value
      }.from(nil).to(:x)
    end
  end

  describe "#win?" do
    context "no winning" do
      before do
        subject.play(position: 1, symbol: :o)
        subject.play(position: 2, symbol: :x)
        subject.play(position: 3, symbol: :x)
        subject.play(position: 4, symbol: :x)
        subject.play(position: 7, symbol: :x)
      end

      it "returns false" do
        expect(subject.win?).to be_falsy
      end
    end

    context "line winning" do
      before do
        subject.play(position: 1, symbol: :x)
        subject.play(position: 2, symbol: :x)
        subject.play(position: 3, symbol: :x)
        subject.play(position: 4, symbol: :o)
        subject.play(position: 7, symbol: :x)
      end

      it "returns the right symmbol" do
        expect(subject.win?).to eq(:x)
      end
    end

    context "row winning" do
      before do
        subject.play(position: 1, symbol: :o)
        subject.play(position: 2, symbol: :x)
        subject.play(position: 3, symbol: :x)
        subject.play(position: 4, symbol: :o)
        subject.play(position: 7, symbol: :o)
      end

      it "returns the right symmbol" do
        expect(subject.win?).to eq(:o)
      end
    end

    context "diag winning" do
      before do
        subject.play(position: 3, symbol: :x)
        subject.play(position: 2, symbol: :x)
        subject.play(position: 1, symbol: :o)
        subject.play(position: 5, symbol: :o)
        subject.play(position: 9, symbol: :o)
      end

      it "returns the right symmbol" do
        expect(subject.win?).to eq(:o)
      end
    end
  end
end

# frozen_string_literal: true

describe TicTacToe::Cell do
  let(:number) { Random.rand(1..9) }
  subject do
    TicTacToe::Cell.new(number)
  end

  it "allows read of value and number" do
    expect(subject.value).to be_nil
    expect(subject.number).to eq(number)
  end

  it "allows write of value" do
    expect{ subject.value = :x }.to change(subject, :value).from(nil).to(:x)
  end

  context "a value is already set" do
    before do
      subject.value = :x
    end
    it "fails" do
      expect{ subject.value = :o }.to raise_exception(StandardError)
    end
  end

  describe "#initialize" do
    context "with an invalid number" do
      it 'fails' do
        expect{ TicTacToe::Cell.new(0) }.to raise_exception(StandardError)
        expect{ TicTacToe::Cell.new(10) }.to raise_exception(StandardError)
      end
    end

    it 'sets the number' do
      expect(TicTacToe::Cell.new(8).number).to eq(8)
    end
  end

  describe '#to_s' do
    context "with no value" do
      it "returns the number" do
        expect(subject.to_s).to eq(number.to_s)
      end
    end
    context "with a value" do
      it "returns the value" do
        subject.value = :x
        expect(subject.to_s).to eq('X')
      end
    end
  end
end

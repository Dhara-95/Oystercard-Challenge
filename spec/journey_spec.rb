require "journey.rb"

describe Journey do

  describe "initialize" do
    it "creates an instance of a journey" do
      expect(subject).to be_an_instance_of(Journey)
    end
  end

  describe "#begin_journey" do
    it "journey responds to begin journey" do
      expect(subject).to respond_to(:begin_journey).with(1).argument
    end

    it "stores an entry station" do
      subject.begin_journey("test")
      expect(subject.entry_station).to eq("test")
    end

    it "stores an entry station called test 1" do
      subject.begin_journey("test 1")
      expect(subject.entry_station).to eq("test 1")
    end
  end

  describe '#end_journey' do
    it "journey responds to end journey" do
      expect(subject).to respond_to(:end_journey).with(1).argument
    end

    it "stores an exit station" do
      subject.end_journey("test")
      expect(subject.exit_station).to eq("test")
    end

    it "stores an exit station called test 1" do
      subject.end_journey("test 1")
      expect(subject.exit_station).to eq("test 1")
    end
  end

  describe '#in_journey' do
    it "journey responds to in_journey?" do
      expect(subject).to respond_to(:in_journey?)
    end
    it "is not in journey if neither entry station or exit station exists" do
      expect(subject.in_journey?).to eq(false)
    end
    it "is in journey if entry station exists but exit station doesnt" do
      subject.begin_journey("station")
      expect(subject.in_journey?).to eq(true)
    end
    it "is not in journey if both entry station and exit station exists" do
      expect(subject.in_journey?).to eq(false)
    end
  end

  describe '#fare' do
    it "journey responds to fare" do
      expect(subject).to respond_to(:fare)
    end
    it "returns a minimum fare if @entry_station and @exit_station exists" do
      subject.begin_journey("station")
      subject.end_journey("station")
      expect(subject.fare).to eq(1)
    end
    it "returns a penalty fare of 6 if either @entry_station or @exit_station don't exist" do
      subject.begin_journey("station")
      expect(subject.fare).to eq(6)
    end
    it "returns a penalty fare of 6 if either @entry_station or @exit_station don't exist" do
      subject.end_journey("station")
      expect(subject.fare).to eq(6)
    end
  end
end

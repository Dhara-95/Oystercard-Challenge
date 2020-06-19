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

  describe '#fare' do
    it "journey responds to fare" do
      expect(subject).to respond_to(:fare)
    end
  end
end

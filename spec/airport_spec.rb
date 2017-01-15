require "airport"


describe Airport do

  subject(:airport) { described_class.new} # sunny: true, landed: plane, departure: plane}
  let(:weather) { double :weather, sunshine: true }
  let(:plane) { double :plane }


  it { is_expected.to respond_to(:landed).with(1).argument }

  context 'wether is sunny'do

    before do
      allow(airport).to receive(:sunny).and_return(true)
    end

      describe " when weather is fine" do

        it 'Confirms a plane has landed' do
          airport.landed(plane)
        end

        it { is_expected.to respond_to :departure}

        it 'Plane departs from airport' do
          airport.departure
        end
      end

    it { is_expected.to respond_to :full?}

    it "Gives an error when airport is full" do
      Airport::DEFAULT_CAPACITY.times { airport.landed(plane) }
      expect{airport.landed(plane)}.to raise_error 'Airport full'
    end

      it 'Allow user to set capacity of airport' do
        num = 50
        airport = Airport.new(num)
        expect(airport.capacity).to eq num

        # Create a default airport capacity using the DEFAULT_CAPACITY constant
        airport = Airport.new
        expect(airport.capacity).to eq Airport::DEFAULT_CAPACITY
     end
 end
   before do
     allow(airport).to receive(:sunny).and_return(false)
  end
  it 'prevents planes from departing if stormy' do
    expect{airport.departure}.to raise_error "Unable to depart due to stormy weather"
   end

   it 'prevents planes from landing if stormy' do
     expect{airport.landed(plane)}.to raise_error "Unable to land due to stormy weather"
    end

end

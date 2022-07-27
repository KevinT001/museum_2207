require './lib/exhibit'

RSpec.describe Exhibit do 
    before :each do 
        @exhibit = Exhibit.new({name: "Gems and Minerals", cost: 0})
    end

    it 'exist' do 
        expect(@exhibit).to  be_a(Exhibit)
    end

end
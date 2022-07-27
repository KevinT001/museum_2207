require './lib/museum'
require './lib/patron'
require './lib/exhibit'

RSpec.describe Museum do 
    before :each do 
        @dmns = Museum.new("Denver Museum of Nature and Science")
        @gems_and_minerals = Exhibit.new({name: "Gems and Minerals", cost: 0})
        @dead_sea_scrolls = Exhibit.new({name: "Dead Sea Scrolls", cost: 10})
        @imax = Exhibit.new({name: "IMAX",cost: 15})
        @patron_1 = Patron.new("Bob", 20)
        @patron_2 = Patron.new("Sally", 20)
        @patron_3 = Patron.new("Johnny", 5)
    end

    it 'exists' do
        expect(@dmns).to be_a(Museum)
    end

    it 'has attributes' do 
        expect(@dmns.name).to eq("Denver Museum of Nature and Science")
        expect(@dmns.exhibits).to eq([])
    end

    it 'can add exhibits' do 
        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@imax)

        expect(@dmns.exhibits).to eq([@gems_and_minerals, @dead_sea_scrolls, @imax])
    end

    it 'has patrons with interests and can recommend exhibits' do 
        @patron_1.add_interest("Dead Sea Scrolls")
        @patron_1.add_interest("Gems and Minerals")
        @patron_2.add_interest("IMAX")
        
        @dmns.add_exhibit(@dead_sea_scrolls)
        @dmns.add_exhibit(@gems_and_minerals)
        @dmns.add_exhibit(@imax)

        expect(@dmns.recommend_exhibits(@patron_1)).to eq([@dead_sea_scrolls, @gems_and_minerals])
        expect(@dmns.recommend_exhibits(@patron_2)).to eq([@imax])
    end

    it 'new person has interests' do 
        @patron_3.add_interest("Dead Sea Scrolls")
        expect(@patron_3.interests).to eq(["Dead Sea Scrolls"])
    end

    it 'can admit patrons' do 
        expect(@dmns.patrons).to eq([])
        @dmns.admit(@patron_1)
        @dmns.admit(@patron_2)
        @dmns.admit(@patron_3)

        expect(@dmns.patrons).to eq([@patron_1,@patron_2,@patron_3])
    end

    it 'can organize patrons by exhibit interests' do 
        expect(@dmns.patrons_by_exhibit_interest).to eq({@dead_sea_scrolls => [@patron_1, @patron_3],
                                                         @imax => [@patron_2]
                                                         @gems_and_minerals => []})
    end

end
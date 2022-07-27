class Museum
    attr_reader :name,
                :exhibits
    def initialize(name)
        @name = name 
        @exhibits = []
        @patrons = []
    end

    def add_exhibit(exhibit)
        @exhibits << exhibit
    end 

    def recommend_exhibits(patrons)
      @exhibits.find_all{|exhibit| patrons.interests.include?(exhibit.name)}
    end

    def admit(patron)
        @patrons << patron 
    end

end

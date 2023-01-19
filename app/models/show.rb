class Show < ActiveRecord::Base

    def self.highest_rating
        Show.maximum("rating")
        self.maximum("rating")
    end

    def self.most_popular_show
        self.where("rating = ?", Show.highest_rating).limit(1)
        #by putting coniditions ^^ makes your data more stable

        self.find_by("rating = ?", Show.highest_rating)
    end

    def self.lowest_rating
        Show.minimum(:rating)
    end

    def self.least_popular_show
        self.where("rating = ?", Show.lowest_rating).first
    end

    def self.ratings_sum
        self.sum(:rating)
    end

    def self.popular_shows
        self.where("rating > 5", Show.highest_rating)
    end

    def self.shows_by_alphabetical_order
        Show.order(:name)
    end


end
class Movie < ActiveRecord::Base #thing that goes in the database
    attr_accessible :title, :rating, :release_date, :tags_attributes
    def self.all_ratings
        Array['G', 'PG', 'PG-13', 'R', 'NC-17']
    end
end
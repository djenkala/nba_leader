require 'pry'

class NbaLeader::Leader
  attr_accessor :name, :points

  @@all = []

  def initialize(name, points)
    @name = name
    @points = points
  end

  def self.create(name, points)
    self.new(name, points).tap{|obj| obj.save}
  end

  def save
    @@all << self
  end

  @page = Nokogiri::HTML(URI.open("https://www.newsday.com/sports/basketball/nba-career-scoring-leaders-1.22616900"))

  def self.scrape_leaders
    @page.search("#contentAccess").map do |t|
      text = t.text.strip.split("1986. Credit: Newsday/Jim Cummins")
      newtext = text[1].split(". Credit: ")
        newtext.map do |leader|
          newertext = leader.split("Points: ")
          newesttext = newertext[0].split(". ")
          x = newertext[1].split("Teams: ")
          name = newesttext[1].strip
          points = x[0]
          newleader = self.create(name, points)
        end
    end
  end

end

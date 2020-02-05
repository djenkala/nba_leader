require 'pry'

class NbaLeader::Leader
  attr_accessor :name, :points

  def self.scrape_leaders
    leaders = []

    leaders << self.scrape_leader_1
    leaders << self.scrape_leader_2
    leaders << self.scrape_leader_3
    leaders << self.scrape_leader_4
    leaders << self.scrape_leader_5


    leaders
    #iterating through the leaders  and accomplishing what scrape_lead_no has been doing
    a = @page.search("#contentAccess").each do |t|
      text = t.text.strip.split("1986. Credit: Newsday/Jim Cummins")
      newtext = text[1].split(". Credit: ")
        newtext.each do |leader|
          newertext = leader.split("Points: ")
          x = newertext[1].split("Teams: ")
          name = newertext[0].strip
          points = x[0]
          binding.pry
        end
    end
  end

  @page = Nokogiri::HTML(URI.open("https://www.newsday.com/sports/basketball/nba-career-scoring-leaders-1.22616900"))

  def self.scrape_leader_1
    leader = self.new
    leader.name = @page.search("h4")[0].text.split(". ")[1]
    leader.points = @page.search("p")[6].text.split("T")[0]
    leader
  end

  def self.scrape_leader_2
    leader = self.new
    leader.name = @page.search("h4")[1].text.split(". ")[1]
    leader.points = @page.search("p")[7].text.split("T")[0]
    leader
  end

  def self.scrape_leader_3
    leader = self.new
    leader.name = @page.search("h4")[2].text.split(". ")[1]
    leader.points = @page.search("p")[8].text.split("T")[0]
    leader
  end

  def self.scrape_leader_4
    leader = self.new
    leader.name = @page.search("h4")[3].text.split(". ")[1]
    leader.points = @page.search("p")[9].text.split("T")[0]
    leader
  end

  def self.scrape_leader_5
    leader = self.new
    leader.name = @page.search("h4")[4].text.split(". ")[1]
    leader.points = @page.search("p")[10].text.split("T")[0]
    leader
  end

end

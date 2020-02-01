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

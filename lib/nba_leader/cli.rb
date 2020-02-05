class NbaLeader::CLI

  def call
    list_leaders
    menu
    goodbye
  end

  def list_leaders
    puts "Here are the NBA All-Time Leading Scorers:"
    @leaders = NbaLeader::Leader.scrape_leaders
    @leaders.each do |l|
      l.each.with_index(1) do |leader, i|
        puts "#{i}. #{leader.name}"
      end
    end
  end

  def menu
    input = nil
    while input != "exit"
      puts "Enter the number of the scoring leader you'd like more info on. Type list to see leaders again or type exit..."
      input = gets.strip.downcase

      if input.to_i > 0 && input.to_i < 6
        the_leader = @leaders[input.to_i-1]
        puts "#{the_leader.name} - #{the_leader.points}".red
      elsif input == "list"
        list_leaders
      else
        unless
          input == "exit"
        puts "Invalid selection. Please type list or exit".bold
        end
      end
    end
  end

  def goodbye
    puts "Thanks for stopping by. Now go score buckets!!".yellow
  end

end

def game_hash
  game_hash = {
  :home => {
    :team_name => ["Brooklyn Nets"],
    :colors => ["Black", "White"],
    :players => {
        "Alan Anderson" => {
            :number => 0,
            :shoe => 16,
            :points => 22,
            :rebounds => 12,
            :assists => 12,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 1},
        "Reggie Evans" => {
            :number => 30,
            :shoe => 14,
            :points => 12,
            :rebounds => 12,
            :assists => 12,
            :steals => 12,
            :blocks => 12,
            :slam_dunks => 7},
        "Brook Lopez" => {
            :number => 11,
            :shoe => 17,
            :points => 17,
            :rebounds => 19,
            :assists => 10,
            :steals => 3,
            :blocks => 1,
            :slam_dunks => 15},
        "Mason Plumlee" => {
            :number => 1,
            :shoe => 19,
            :points => 26,
            :rebounds => 12,
            :assists => 6,
            :steals => 3,
            :blocks => 8,
            :slam_dunks => 5},
        "Jason Terry" => {
            :number => 31,
            :shoe => 15,
            :points => 19,
            :rebounds => 2,
            :assists => 2,
            :steals => 4,
            :blocks => 11,
            :slam_dunks => 1}
    }
  },
  :away => {
    :team_name => ["Charlotte Hornets"],
    :colors => ["Turquoise", "Purple"],
    :players => {
        "Jeff Adrien" => {
            :number => 4,
            :shoe => 18,
            :points => 10,
            :rebounds => 1,
            :assists => 1,
            :steals => 2,
            :blocks => 7,
            :slam_dunks => 2},
        "Bismak Biyombo" => {
            :number => 0,
            :shoe => 16,
            :points => 12,
            :rebounds => 4,
            :assists => 7,
            :steals => 7,
            :blocks => 15,
            :slam_dunks => 10},
        "DeSagna Diop" => {
            :number => 2,
            :shoe => 14,
            :points => 24,
            :rebounds => 12,
            :assists => 12,
            :steals => 4,
            :blocks => 5,
            :slam_dunks => 5},
        "Ben Gordon" => {
            :number => 8,
            :shoe => 15,
            :points => 33,
            :rebounds => 3,
            :assists => 2,
            :steals => 1,
            :blocks => 1,
            :slam_dunks => 0},
        "Brendan Haywood" => {
            :number => 33,
            :shoe => 15,
            :points => 6,
            :rebounds => 12,
            :assists => 12,
            :steals => 22,
            :blocks => 5,
            :slam_dunks => 12}
    }
  }
}
end

def num_points_scored(player)
  points = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, stats|
          if data_item == player
            points = stats[:points]
          end
        end
      end
    end
  end
return points
end

def shoe_size(player)
  size = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, stats|
          if data_item == player
            size = stats[:shoe]
          end
        end
      end
    end
  end
return size
end

def team_colors(team)
  if game_hash[:home][:team_name][0] == team
    return game_hash[:home][:colors]
  elsif game_hash[:away][:team_name][0] == team
    return game_hash[:away][:colors]
  end
end

def team_names
  array = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :team_name
            array << data
        end
      end
    end
    return array.flatten
end

def player_numbers(team)
  numbers = []
  if game_hash[:home][:team_name][0] == team
    game_hash[:home][:players].each do |data_item, stats|
      stats.each do |stat, val|
        if stat == :number
            numbers << val
        end
      end
    end
  else
    game_hash[:away][:players].each do |data_item, stats|
      stats.each do |stat, val|
        if stat == :number
            numbers << val
        end
      end
    end
  end
return numbers
end

def player_stats(player)
  list = []
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, stats|
          if data_item == player
            list = stats
          end
        end
      end
    end
  end
  return list
end

def big_shoe_rebounds
  biggestshoe = 0
  rebounds = 0
  game_hash.each do |location, team_data|
    team_data.each do |attribute, data|
      if attribute == :players
        data.each do |data_item, stats|
          stats.each do |stat, value|
            if stat == :shoe
              if value > biggestshoe
                biggestshoe = value
                rebounds = game_hash[location][:players][data_item][:rebounds]
              end
            end
          end
        end
      end
    end
  end
  rebounds
end

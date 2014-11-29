module TestWorld


  def website
    @website ||= Website::Site.new
  end

  
  def world_map
    @world_map ||= OpenStruct.new
  end
end

World(TestWorld)

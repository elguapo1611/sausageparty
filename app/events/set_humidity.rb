class SetHumidity < Resque::Job
  @queue = :venice
  def initialize
    
  end

  def perform
    # do something and keep track of the status
  end
end
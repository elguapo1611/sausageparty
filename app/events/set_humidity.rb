class SetHumidity
  @queue = :sausage_queue

  def perform
    SerialSwitcher.new.set_hardware_status
    # do something and keep track of the status
  end
end
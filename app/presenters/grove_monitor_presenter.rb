class GroveMonitorPresenter
  attr_reader :lost_students, :absent_students, :locations
  def initialize(grove)
    @absent_students = grove.students.absent
    @lost_students = grove.students.lost
    @locations = {}
    grove.locations.each do |location|
      @locations[location.name] = grove.students.location(location.name) || []
    end
  end
end

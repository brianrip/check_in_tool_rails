class UpdateScheduleWorker
  include Sidekiq::Worker

  def self.perform
    Student.all.each do |student|
      UpdateScheduleJob.perform(student)
    end
  end
end

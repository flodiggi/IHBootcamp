class Project < ApplicationRecord
  has_many :time_entries

  validates :name, presence: true,
            uniqueness: true,
            length: {maximum:30}
  validates_associated :time_entries


  def self.clean_old
    projects = Project.where("created_at < ?", 1.week.ago)
    projects.destroy_all
  end

end

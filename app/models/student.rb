# == Schema Information
#
# Table name: students
#
#  id         :integer          not null, primary key
#  name       :string
#  hometown   :string
#  birthday   :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Student < ActiveRecord::Base
  has_many :classroom_students
  has_many :classrooms, through: :classroom_students

  def self.search(query)
    if query.empty?
      self.all
    else
      query_matches = self.all.select { |student| student.name if student.name.downcase.include?(query.downcase) }
      query_matches.map { |query_match| query_match }
    end
  end
end

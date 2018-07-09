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

  def self.search(term)
    if term.present?
      where('NAME like ?', "%#{term}%")
    else
      self.all
    end
  end
end


# search
#     when it receives an empty search argument
#       returns all students (FAILED - 1)
#     when it receives a search query
#       returns all students whose names contain the given string
#
# search
#    when it receives a search query
#      returns all students whose names contain the given string (FAILED - 7)
#      renders the results with a partial (FAILED - 8)

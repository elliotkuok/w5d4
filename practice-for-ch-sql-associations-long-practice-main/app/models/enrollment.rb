# == Schema Information
#
# Table name: enrollments
#
#  id         :bigint           not null, primary key
#  course_id  :bigint           not null
#  student_id :bigint           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Enrollment < ApplicationRecord
    validates :course_id, :student_id, presence: true, uniqueness: true

    belongs_to :course,
        primary_key: :id, 
        foreign_key: :course_id,
        class_name: :Course
    
    belongs_to :student,
        primary_key: :id, 
        foreign_key: :student_id,
        class_name: :User

end


module AnalyticsHelper

  def title
    base_title = "showing all students"
    if @title.nil?
       base_title
    else
      "#{base_title} | #{@title}"
    end
  end

  def gravatar(email, size, border)
    "<img src=\"https://www.gravatar.com/avatar/#{
    Digest::MD5.new.update(
      email.to_s.strip.downcase
    ).hexdigest
    }?f=y=#{size}&r=g\" style=\"height:#{size}px;width:#{size}px;border:#{border}px\">".html_safe
  end
  
  def get_students_by_course(course_type)
    get_course = Course.find_by_course_type(course_type) 
    @all_students = get_course.students
  end
  
  def get_teacher_by_subject(subject_name)
    get_subject = Subject.find_by_subject_name(subject_name)
    all_teachers = get_subject.teachers
  end
end

module AssignmentsHelper
  def max_days assignment
    assignment.due_date - assignment.start_date
  end

  def remaining_days assignment
    if assignment.due_date.future?
      distance_of_time_in_words(Time.zone.now, assignment.due_date)
    else
      o
    end
  end

  def percentage_remaining assignmment
    if assignment.due_date.future?
      percentage = ((assignment.due_date - Time.zonne.now)/ max_days(assignment)) * 100
      if percentage.to_i >= 0
        percentage.to_i
      else
        0
      end
    else
      0
    end
  end

  def coloring assignment
    if assignment.due_date.future?
      percentage = percentage_remaining assignment
      if percentage < 33
        'alert'
      elsif percentage < 66
        'warning'
      else
        'success'
      end
    end
  end

end

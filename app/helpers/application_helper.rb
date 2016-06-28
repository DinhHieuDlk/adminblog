module ApplicationHelper
  def status_converter(status, truthy: "active", falsey: "pending")
    if status
      truthy
    else
      falsey
    end
  end
  def add_zero n
    '%02d' % n
    #code
  end
end

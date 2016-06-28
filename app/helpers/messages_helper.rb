module MessagesHelper
  def message_wight message
      message.status == false ? "font-weight = bold": "font-weight =nornal"
    #code
  end
  def status_link message
    if message.status == true
      link_to "Un-read", admin_message_path(message, status: false), method: :put, class:"btn btn-xs btn-default"
    else
      link_to "read", admin_message_path(message, status: true), method: :put, class:"btn btn-xs btn-default"
    end
    #code
  end
end

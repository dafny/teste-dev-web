module ApplicationHelper

  def render_bootstrap_flash
    flash_messages = []
    flash.each do |type, message|
      type = :success if type.to_sym == :notice
      type = :danger  if type.to_sym == :alert
      text = content_tag(:div,
                         content_tag(:button, raw("&times;"), :class => "close", "data-dismiss" => "alert") +
                         message.split("\n").join("<br/>").html_safe, :class => "alert fade in alert-#{type}")
      flash_messages << text if message
    end
    flash_messages.join("\n").html_safe
  end

end

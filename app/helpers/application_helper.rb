module ApplicationHelper
  def source_helper(styles)
    if session[:source]
      greeting = "Thanks for visiting me from #{session[:source]}, please feel free to #{ link_to 'contact me', contact_path } if you'd like to work together."
      content_tag(:div, greeting.html_safe, class: styles)
    end
  end

  def copyright_generator
    # DevcampViewTool::Renderer.copyright 'Dai Pham', 'All rights reserved'
  end

  def nav_items
    [
      {
        url: blogs_path,
        title: 'Blog'
      },
      {
        url: about_me_path,
        title: 'About Me'
      }
    ]
  end

  def nav_helper style, tag_type
    nav_links = ''

    nav_items.each do |item|
      nav_links << "<#{tag_type}><a href='#{item[:url]}' class='#{style} #{active? item[:url]}'>#{item[:title]}</a></#{tag_type}>"
    end

    nav_links.html_safe
  end

  def active? path
    "active" if current_page? path
  end

  def alerts
    alert = (flash[:alert] || flash[:error] || flash[:notice])

    if alert
      alert_generator alert
    end
  end

  def alert_generator msg
    js add_gritter(msg, title: 'Dai Pham Portfolio', sticky: false)
  end

  def after_sign_in_path_for(resource_or_scope)
    stored_location_for(resource_or_scope) || super
  end

  def blog_path?
    controller_name.eql? 'blogs'
  end
end

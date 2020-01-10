module BlogsHelper
  def github_avatar(user)
    image_tag "https://avatars.githubusercontent.com/#{user.uid}", width: 60
  end

  def github_link(user)
    "https://github.com/#{user.uid}"
  end

  class HTMLwithPygments < Redcarpet::Render::HTML
    def block_code(code, language)
      Pygments.highlight(code, lexer: language)
    end
  end

  def markdown(content)
    renderer = HTMLwithPygments.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_blocks: true,
      strikethrough: true,
      superscript: true
    }
    Redcarpet::Markdown.new(renderer, options).render(content).html_safe
  end

  def blog_status_color(blog)
    'color: red;' if blog.draft?
  end
end

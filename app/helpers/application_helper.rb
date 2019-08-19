module ApplicationHelper
  def year
    Date.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: '_blank'
  end

  def flash_class(level)
    {
      notice: 'alert alert-info',
      success: 'alert alert-success',
      error: 'alert alert-danger',
      alert: 'alert alert-danger'
    }[level.to_sym]
  end
end

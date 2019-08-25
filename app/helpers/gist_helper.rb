module GistHelper
  def gist_hash(gist)
    gist.url.split('/').last
  end
end

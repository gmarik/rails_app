# from http://freelancing-gods.com/posts/versioning_your_ap_is
class ApiVersion
  def initialize(version)
    @version = version
  end

  def matches?(request)
    versioned_accept_header?(request) || version_one?(request)
  end

  private

  def versioned_accept_header?(request)
    accept = request.headers['Accept']
    accept && accept[%r[application/vnd\.rails_app-v#{@version}]]
  end

  def unversioned_accept_header?(request)
    accept = request.headers['Accept']
    accept.blank? || accept[%r[application/vnd\.rails_app]]
  end

  def version_one?(request)
    @version == 1 && unversioned_accept_header?(request)
  end
end

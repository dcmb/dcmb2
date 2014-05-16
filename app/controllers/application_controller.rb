class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do
    access_denied
  end

  protected

  def access_denied(*)
    @cms_site ||= ::Comfy::Cms::Site.find_site(request.host_with_port.downcase, "/")
    @cms_page ||= @cms_site.pages.root if @cms_site
    render "/access_denied", layout: "short"
  end
end

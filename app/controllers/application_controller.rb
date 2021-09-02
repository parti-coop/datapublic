class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  around_action :switch_locale

  def switch_locale(&action)
    I18n.with_locale(http_accept_language.compatible_language_from(I18n.available_locales), &action)
  end

  def render_404
    begin
      self.response_body = nil
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
    rescue AbstractController::DoubleRenderError => e
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end

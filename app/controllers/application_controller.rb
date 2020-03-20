class ApplicationController < ActionController::Base
  around_action :switch_locale

  def switch_locale(&action)
    locale = current_user.try(:locale) || extract_locale_from_accept_language_header || I18n.default_locale
    I18n.with_locale(locale, &action)
  end

  private

  def extract_locale_from_accept_language_header
    request.env['HTTP_ACCEPT_LANGUAGE'].scan(/^[a-z]{2}/).first
  end
end

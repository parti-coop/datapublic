require 'exception_notification/rails'

ExceptionNotification.configure do |config|
  config.ignore_if do |exception, options|
    not(Rails.env.production?) and not(Rails.env.staging?)
  end

  config.add_notifier :slack, {
    username: "Datapublic #{Rails.env}",
    webhook_url: ENV["SLACK_EXCEPTION_WEBHOOK_URL"],
    additional_parameters: {
      mrkdwn: true
    },
    backtrace_lines: 20,
    additional_fields: [{ title: 'Platform', value: '데이터퍼블릭' }]
  }
end

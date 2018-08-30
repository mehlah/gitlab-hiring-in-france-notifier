class GitLab
  COUNTRIES_NO_HIRE_URL = 'https://gitlab.com/gitlab-com/www-gitlab-com/raw/8e17aa630ba08102ef6aa4331f65fa01e119352a/data/country_no_hire.yml'

  def self.no_hire_countries
    YAML.load(Curl.get(COUNTRIES_NO_HIRE_URL).body)
  end
end

class Emailer
  def self.call
    Curl.post(
      "https://api:#{ENV.fetch('MAILGUN_API_KEY')}@api.eu.mailgun.net/v3/#{ENV.fetch('MAILGUN_DOMAIN_NAME')}/messages",
      [
        'from=bot@lahmam.com',
        'to=mehdi@lahmam.com',
        'subject=GitLab%20is%20hiring%20in%20France%20%F0%9F%8E%89',
        'text=Looks%20like%20France%20has%20been%20removed%20from%20the%20no-hire%20list%3A%20https%3A%2F%2Fgitlab.com%2Fgitlab-com%2Fwww-gitlab-com%2Fblob%2Fmaster%2Fdata%2Fcountry_no_hire.yml.'
      ].join('&'),
      {
        'Content-Type' => 'application/x-www-form-urlencoded'
      }
    )

  end
end

unless GitLab.no_hire_countries.include?('France')
  Emailer.call
end

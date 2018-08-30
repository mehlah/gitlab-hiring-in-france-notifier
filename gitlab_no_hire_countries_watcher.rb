require 'yaml'
require 'open-uri'

unless GitLab.no_hire_countries.include?('France')
  Emailer.call
end


BEGIN {

class GitLab
  COUNTRIES_NO_HIRE_URL = 'https://gitlab.com/gitlab-com/www-gitlab-com/raw/8e17aa630ba08102ef6aa4331f65fa01e119352a/data/country_no_hire.yml'

  def self.no_hire_countries
    YAML.load(open(COUNTRIES_NO_HIRE_URL))
  end
end

class Emailer
  def self.call
    Net::HTTP.post_form(
      URI("https://api:#{ENV.fetch('MAILGUN_API_KEY')}@api.eu.mailgun.net/v3/#{ENV.fetch('MAILGUN_DOMAIN_NAME')}/messages"),
      from: 'bot@lahmam.com',
      to: 'mehdi@lahmam.com',
      subject: 'GitLab is hiring in France 🎉',
      text: 'Looks like France has been removed from the no-hire list: https://gitlab.com/gitlab-com/www-gitlab-com/blob/master/data/country_no_hire.yml.'
    )
  end
end

}

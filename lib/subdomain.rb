class Subdomain
  def self.matches?(request)
    request.subdomain.present? && request.subdomain != 'www'
  end
end

class NonSubdomain
  def self.matches?( request )
    request.subdomain == '' || request.subdomain == 'www'
  end
end
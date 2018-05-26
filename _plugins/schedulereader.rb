module ScheduleReader
  class Generator < Jekyll::Generator
    def generate(site)
      # site.pages.each { |page| page.data['schedule'] = 'foo'}
      site.config['schedule'] = 'bar'
    end
  end
end
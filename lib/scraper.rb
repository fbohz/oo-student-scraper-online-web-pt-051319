#https://htmlpreview.github.io/?https://github.com/fbohz/oo-student-scraper-online-web-pt-051319/blob/master/fixtures/student-site/index.html

require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    doc = Nokogiri::HTML(open(index_url))
    students = []
    roster_container = doc.css(".roster-cards-container")
     roster_container.css(".student-card").collect do |student|
       {
      :name => student.css("div>h4").text,
      :location => student.css("div>p").text,
      :profile_url => student.css('a').attribute('href').value
       }
    end 
  end

  def self.scrape_profile_page(profile_url)
    doc = Nokogiri::HTML(open(profile_url))
  # binding.pry
    student = {}
    links = doc.css("div.social-icon-container").children.css("a").collect { |i| i.attribute('href').value}
    links.each do |link|
      if link.include?("linkedin")
        student[:linkedin] = link
      elsif link.include?("github")
        student[:github] = link
      elsif link.include?("twitter")
        student[:twitter] = link
      else
        student[:blog] = link
      end
    end
    student[:profile_quote] = doc.css(".profile-quote").text
    student[:bio] = doc.css("div.bio-content.content-holder div.description-holder p" ).text 
    
    student
  end

 end


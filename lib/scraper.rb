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
  #   case 
  #   when doc.css("div.social-icon-container a")[0].attribute('href').value
  #     student[:twitter] = doc.css("div.social-icon-container a")[0].attribute('href').value
  #   when doc.css("div.social-icon-container a")[1].attribute('href').value   
  #     student[:linkedin] = doc.css("div.social-icon-container a")[1].attribute('href').value
  #   when doc.css("div.social-icon-container a")[2].attribute('href').value  
  #     student[:github] = doc.css("div.social-icon-container a")[2].attribute('href').value
  #   when doc.css("div.social-icon-container a")[3].attribute('href').value    
  #     student[:blog] = doc.css("div.social-icon-container a")[3].attribute('href').value
  #   when doc.css(".profile-quote").text 
  #     student[:profile_quote] = doc.css(".profile-quote").text
  #     #a more specific selector was requiring nesting down css
  #   when doc.css("div.bio-content.content-holder div.description-holder p" )  
  #     student[:bio] = doc.css("div.bio-content.content-holder div.description-holder p" ).text 
  #   end 
    
  #   student
  # end

end


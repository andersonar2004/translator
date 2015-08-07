#coding: utf-8
require 'headless'
require 'watir-webdriver'

url  = 'http://www.bing.com/translator/default.aspx?MKT=pt-br'
#browser = Watir::Browser.new :chrome
headless = Headless.new
    headless.start
browser = Watir::Browser.new
browser.goto url
input = browser.text_field(:id=>"InputText")
output = browser.div(:id=>"OutputText")
button = browser.div(:id => "TranslateButton")



#until input.visible? do sleep 1 end
#until output.visible? do sleep 1 end
#until browser.input(:id=>"InputText").visible? do sleep 1 end

puts "input encontrado #{input.exist?}"
puts "output encontrado #{output.exist?}"
puts "button encontrado #{button.exist?}"

input.set "como vai você meu caro"
input.fire_event :change
button.fire_event :click
sleep  5

puts "#{input.text} => #{output.text}\n"

puts browser.title


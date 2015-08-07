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
loading = browser.div(:id => "ProgressDiv")

# Select language out
language = 'pt' # 'en' for english
browser.span(:id=>"Header_DstLangList").click
browser.link(:id=>"Lang_DstLangList_#{language}").when_present {|link| link.click}


puts "input encontrado #{input.exist?}"
puts "output encontrado #{output.exist?}"
puts "button encontrado #{button.exist?}"

# origin_text = "Como vai você meu caro?"
origin_text = "How are you my dear?"


input.set origin_text
input.fire_event :change
button.fire_event :click
loading.wait_while_present

puts "#{origin_text} => #{output.text}\n"




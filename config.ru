require 'sinatra'

class App < Sinatra::Base
  # Add this line to set the Content-Type header for all responses
  set :default_content_type, "application/json"

  get "/hello" do
    "<h2>Hello <em>World</em>!</h2>"
  end

  get "/potato" do
    "<p>Boil 'em, mash 'em, stick 'em in a stew</p>"
  end

  get "/dice_html" do 
    dice_roll = rand(1..6)
    "<h2>You rolled a #{dice_roll}</h2>"
  end

  get "/dice" do 
    dice_roll = rand(1..6)
    { roll: dice_roll }.to_json()
  end

  # Non-Dynamic Route Example:
  get "/add/1/2" do 
    sum = 1 + 2
    { result: sum }.to_json()
  end

  # Dynamic Route Example Using 'Named Parameters':
  # NOTE: ':num1' and ':num2' are named parameters:
  get "/add/:num1/:num2" do
    num1 = params[:num1].to_i()
    num2 = params[:num2].to_i()

    # Example 'GET' requests:
    # "GET /add/1/2" --> results in: {"num1"=>"1", "num2"=>"2"}
    # "GET /add/2/5" --> results in: {"num1"=>"2", "num2"=>"5"}
    
    sum = num1 + num2
    { result: sum }.to_json()
  end
  
end

run App

class AddCountries < ActiveRecord::Migration
  def up
  	Country.create!({:name => "El Salvador", :code => 503})
  	Country.create!({:name => "USA", :code => 1})
  	Country.create!({:name => "Argentina", :code => 54})
  	Country.create!({:name => "Belize", :code => 1})
  	Country.create!({:name => "Brasil", :code => 55})
  	Country.create!({:name => "Bolivia", :code => 591})
  	Country.create!({:name => "Canada", :code => 1})
  	Country.create!({:name => "Chile", :code => 56})
  	Country.create!({:name => "Colombia", :code => 57})
  	Country.create!({:name => "Costa Rica", :code => 506})
  	Country.create!({:name => "Cuba", :code => 53})
  	Country.create!({:name => "Ecuador", :code => 593})
  	Country.create!({:name => "Guatemala", :code => 502})
  	Country.create!({:name => "Haiti", :code => 509})
  	Country.create!({:name => "Honduras", :code => 504})
  	Country.create!({:name => "Mexico", :code => 52})
  	Country.create!({:name => "Nicaragua", :code => 505})
  	Country.create!({:name => "Panama", :code => 507})
  	Country.create!({:name => "Paraguay", :code => 595})
  	Country.create!({:name => "Peru", :code => 51})
  	Country.create!({:name => "Republica Dominicana", :code => 1})
  	Country.create!({:name => "Uruguay", :code => 598})
  	Country.create!({:name => "Venezuela", :code => 58})
  end

  def down
  end
end

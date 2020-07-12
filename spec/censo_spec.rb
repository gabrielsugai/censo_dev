require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open "db/database.db"
  
  it 'Encortar um estado pelo codigo' do
    uf = '35'
    resultado = Sql.search_uf(uf)
    puts(resultado)
    expect(resultado.first).to include('São Paulo')
  end

  it 'Listar os 10 municipios mais populosos de um estado' do
    uf = '12'
    resultado = Sql.most_populate(uf)
    expect(resultado).to include(["Rio Branco (AC)"], ["Cruzeiro do Sul (AC)"],
                                 ["Sena Madureira (AC)"], ["Tarauacá (AC)"], ["Feijó (AC)"],
                                 ["Senador Guiomard (AC)"], ["Plácido de Castro (AC)"],
                                 ["Xapuri (AC)"], ["Mâncio Lima (AC)"])
  end
end
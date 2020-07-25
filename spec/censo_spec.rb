require 'spec_helper'
require 'sqlite3'

describe Sql do
  db = SQLite3::Database.open "db/database.db"
  
  it 'Deveria encortar o codigo de um estado pelo nome' do
    uf = 'São Paulo'
    resultado = Sql.search_uf(uf)
    expect(resultado.first).to include(35)
  end

  it 'Deveria encortar o codigo de um estado pelo codigo' do
    uf = '35'
    resultado = Sql.search_uf(uf)
    expect(resultado.first).to include(35)
  end

  it 'Listar os 10 municipios mais populosos de um estado' do
    uf = '12'
    resultado = Sql.most_populate(uf)
    expect(resultado).to include(["Rio Branco (AC)"], ["Cruzeiro do Sul (AC)"],
                                 ["Sena Madureira (AC)"], ["Tarauacá (AC)"], ["Feijó (AC)"],
                                 ["Senador Guiomard (AC)"], ["Plácido de Castro (AC)"],
                                 ["Xapuri (AC)"], ["Mâncio Lima (AC)"])
  end

  it 'Deveria buscar um municipio pelo nome e exibir a populacao' do
    mu = 'São Paulo (SP)'
    resultado = Sql.search_mu(mu)
    expect(resultado.first).to include(12252023)
  end

  it 'Deveria buscar um municipio pelo codigo e exibir a populacao' do
    mu = '3550308'
    resultado = Sql.search_mu(mu)
    expect(resultado.first).to include(12252023)
  end

  it 'Deveria informar a populacao total de uma UF buscando pelo codigo' do
    uf = '35'
    resultado = Sql.total_population(uf)
    expect(resultado.first).to include(45919049)
  end

  it 'Deveria informar a populacao total de uma UF buscando pelo nome' do
    uf = 'São Paulo'
    resultado = Sql.total_population(uf)
    expect(resultado.first).to include(45919049)
  end

end
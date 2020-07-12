require 'sqlite3'

class Sql
  def self.search_uf(codigo)
    new(codigo).search
  end

  def self.most_populate(codigo)
    new(codigo).populate
  end
  
  def initialize(codigo)
    @codigo = codigo
    @db = SQLite3::Database.new 'db/database.db'
  end

  def search
   @db.execute "SELECT title FROM UF WHERE code LIKE'#{@codigo}'"
  end
  
  def populate
    @db.execute "SELECT title FROM MU WHERE code LIKE'#{@codigo}%' ORDER BY habitants DESC LIMIT 10"
  end

  def read_file(file)
    File.open(Dir.pwd + "/queries/#{file}").read
  end
end
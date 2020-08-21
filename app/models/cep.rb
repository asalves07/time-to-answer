require 'net/http'
class CEP
  attr_reader :logradouro, :district, :city, :uf
  END_POINT = "https://viacep.com.br/ws/"
  FOMART = "json"

  def initialize(cep)
    foundCep = find_cep(cep)
    fill_data(foundCep)
  end

  def address
    "#{@logradouro}, #{@district}, #{@city}-#{@uf}"
  end

  private
  def fill_data(foundCep)
    @logradouro = foundCep["logradouro"]
    @district   = foundCep["bairro"]
    @city       = foundCep["localidade"]
    @uf         = foundCep["uf"]
    
  end

  def find_cep(cep)
    ActiveSupport::JSON.decode(
      Net::HTTP.get(
        URI("#{END_POINT}#{cep}/#{FOMART}/")
      )
    )
  end

end

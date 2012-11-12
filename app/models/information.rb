class Information < ActiveRecord::Base
  attr_accessible :email, :ac, :assunto, :atividade, :cgc, :empresa, :estado, :fax, :fonte, :linha, :municipio, :produto, :telefone1, :telefone2
  attr_accessible :user_id
  belongs_to :user
end

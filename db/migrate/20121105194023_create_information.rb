class CreateInformation < ActiveRecord::Migration
  def change
    create_table :information do |t|
      t.string :empresa
      t.string :cgc
      t.string :municipio
      t.string :estado
      t.string :telefone1
      t.string :telefone2
      t.string :fax
      t.string :ac
      t.string :assunto
      t.string :atividade
      t.string :produto
      t.string :linha
      t.string :fonte

      t.timestamps
    end
  end
end

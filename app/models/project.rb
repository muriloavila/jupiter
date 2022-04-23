class Project < ApplicationRecord
  belongs_to :status
  has_many :task
  validates :nome, presence: {message: "o campo é obrigatório."}, 
                   length: { minimum: 2, maximum: 60, 
                             too_short: "%{count} é o número mínimo de caracteres para o campo", 
                             too_long: "%{count} é o número máximo de caracteres para o campo"
                            }

  validates :descricao, presence: {message: "o campo é de preenchimento obrigatório."}
end 
class Post < ApplicationRecord
  belongs_to :task
  validates :titulo, presence: {message: 'o campo é obrigatório.'},
                      length: { minimum: 2, maximum: 60, 
                                too_short: "%{count} é o número mínimo de caracteres para o campo", 
                                too_long: "%{count} é o número máximo de caracteres para o campo"
                              }
  validates :texto, presence: {message: 'o campo é obrigatório.'}
end
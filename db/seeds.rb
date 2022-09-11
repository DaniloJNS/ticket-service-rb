# frozen_string_literal: true

Event.find_or_create_by(name: 'RubyConf+') do |event|
  event.description = 'O RubyConf existe para promover a conectividade entre profissionais de internet,'\
    ' estimular a troca de informações e fornecer conteúdos relevantes e de qualidade'\
                      ' sobre o vasto mundo da tecnologia.'
  event.image.attach(io: File.open(Rails.root.join('storage', 'ruby-conf.png')), filename: 'ruby-conf.png')
end

Event.find_or_create_by(name: 'Ruby Summit') do |event|
  event.description = 'A Ruby Summit foi criada com propósito de promover integração das pessoas da comunidade ruby'\
                      ' no Brasil'
end

Event.find_or_create_by(name: 'Ruby Summit') do |event|
  event.description = 'A Ruby Summit foi criada com propósito de promover integração das pessoas da comunidade ruby'\
                      ' no Brasil'
end

Event.find_or_create_by(name: 'Rails Girls') do |event|
  event.description = 'Vamos mergulhar no mundo mágico de Ruby on Rails. Você aprenderá a projetar, prototipar'\
                      ' e codificar com a ajuda de nossos treinadores. Você não precisa de nenhuma experiência'\
                      ' anterior em codificação. Você precisa do seu próprio laptop, curiosidade e uma pitada '\
                      'de imaginação!'
end

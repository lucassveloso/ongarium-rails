class VolunteerMailerController < ApplicationController

	def volunteer_email
		address = Address.new(address:"RUa")
		ngo = Ngo.new(name:"Patas Datas")
		cause = Cause.new(name:"teste")
		@opportunity = Opportunity.find(1)
		#Opportunity.new(title:"Levar cachorros para passear", address:address, ngo:ngo, description:"É um fato conhecido de todos que um leitor se distrairá com o conteúdo de texto legível de uma página quando estiver examinando sua diagramação. A vantagem de usar Lorem Ipsum é que ele tem uma distribuição normal de letras, ao contrário de Conteúdo aqui, conteúdo aqui, fazendo com que ele tenha uma aparência similar a de um texto legível. Muitos softwares de publicação e editores de páginas na internet agora usam Lorem Ipsum como texto-modelo padrão, e uma rápida busca por 'lorem ipsum' mostra vários websites ainda em sua fase de construção. Várias versões novas surgiram ao longo dos anos, eventualmente por acidente, e às vezes de propósito (injetando humor, e coisas do gênero).", cause:cause)
		@volunteer = Volunteer.new(name:"Raphael")
	end
end
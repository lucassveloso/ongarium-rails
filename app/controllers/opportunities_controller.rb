class OpportunitiesController < ApplicationController
	before_action :set_opportunity, only: [:show]

	def index
		if params[:text_search] == nil || params[:text_search] == ""
			@opportunity_search = Opportunity.all
		else
			@opportunity_search = Opportunity.search("#{params[:text_search] }").to_a
			if @opportunity_search.empty? 
				@not_found = "Sua pesquisa não encontrou resultados"
			end
		end
	end

	def show
	end

	private 
		def set_opportunity
			if Opportunity.where(:id => params[:id]).present?
				@Opportunity = Opportunity.find(params[:id])
			else
				redirect_to "/404"
			end
		end

end

class MatchesController < ApplicationController

  def create
    
  end

  private

  def match_params
    params.require(:match).permit(:user_id, :likee_id)
  end

end

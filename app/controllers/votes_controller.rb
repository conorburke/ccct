class VotesController < ApplicationController
  def create
    @student = current_user
    if @student.votes.select { |vote| vote.round_id == @student.current_access[-1].to_i}.count == 3
      flash[:error] = "You already voted."
      return redirect_to ideas_path
    end
    @ideas = session[:selection] || []
    @ideas.each do |idea_id|
      @student.votes.create(idea_id: idea_id, round_id: @student.current_access[-1].to_i)
    end
    session.delete(:selection)
    redirect_to ideas_path
  end
end

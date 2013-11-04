class TrialPartiesController < ApplicationController
  def new
    @trial_party = TrialParty.new
    @trial_party.names = Array.new(6)
  end

  def create
    @trial_party = TrialParty.new(params.require(:trial_party))

    if @trial_party.save
      redirect_to @trial_party.party
    else
      render action: :new
    end
  end
end

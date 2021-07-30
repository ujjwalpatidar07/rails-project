class SportsController < ApplicationController
  def index
    @sports = Sport.all
    @sport = Sport.new
  end

  

  def create

    # @sport = Sport.new(sport_params)
    # @sport.save
    # respond_to do |format|
    #    format.js
    #    format.html    
    # end

    @sport = Sport.new(sport_params)

    respond_to do |format|
      if @sport.save
        format.html { redirect_to @sport, notice: 'Sport was successfully created.' }
        format.js
        format.json { render json: @sport, status: :created, location: @sport }
      else
        format.html { render action: "new" }
        format.json { render json: @sport.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    def sport_params
      params.require(:sport).permit(:name)
    end
end

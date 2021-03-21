class CandidatesController < ApplicationController
  before_action :only_admin!, except: %i[ show index ]
  before_action :set_candidate, only: %i[ show edit update destroy ]

  # GET /candidates or /candidates.json
  def index
    session[:candidate_filter_params] = candidate_filter_params
    @candidate_filter = CandidateFilter.new session[:candidate_filter_params]
    @candidates = policy_scope(Candidate)
    @candidates = @candidate_filter.filter(@candidates)
    @candidates = @candidates.order(dni: :desc)
    @pagy, @candidates = pagy @candidates
  end

  # GET /candidates/1 or /candidates/1.json
  def show
  end

  # GET /candidates/new
  def new
    @candidate = Candidate.new
  end

  # GET /candidates/1/edit
  def edit
  end

  # POST /candidates or /candidates.json
  def create
    @candidate = Candidate.new(candidate_params)

    respond_to do |format|
      if @candidate.save
        format.html { redirect_to @candidate, notice: "Candidate was successfully created." }
        format.json { render :show, status: :created, location: @candidate }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /candidates/1 or /candidates/1.json
  def update
    respond_to do |format|
      if @candidate.update(candidate_params)
        format.html { redirect_to @candidate, notice: "Candidate was successfully updated." }
        format.json { render :show, status: :ok, location: @candidate }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @candidate.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /candidates/1 or /candidates/1.json
  def destroy
    @candidate.destroy
    respond_to do |format|
      format.html { redirect_to candidates_url, notice: "Candidate was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_candidate
      @candidate = Candidate.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def candidate_params
      params.require(:candidate).permit(:dni, :names, :father_surname, :mother_surname, :number, :region_id, :party_id, :status, :election_id)
    end

    def candidate_filter_params
      prm = {}
      prm.merge!( party_ids: [ params[:party_id] ] ) if params[:party_id].present?
      prm.merge!( region_ids: [ params[:region_id] ] ) if params[:region_id].present?
      prm.merge!( election_ids: [ params[:election_id] ] ) if params[:election_id].present?

      prms = if params[:candidate_filter]
        params.require(:candidate_filter).permit(:terms,
          region_ids: [], party_ids: [], election_ids: [])
      else
        prm || session[:candidate_filter_params] || {}
      end
      prms
    end
  
end

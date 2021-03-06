class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]


  # GET /courses
  # GET /courses.json
  def index
    #@courses = Course.all
    @courses = Course.where(["Name LIKE ?", "%#{params[:search]}%"])
    @reviews = Review.where(["Course_ID LIKE ?", "%#{params[:search]}%"])


    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating)

    end
  end

  # GET /courses/1
  # GET /courses/1.json
  def show
    #@courses = Course.all
    @games = Game.where(course_id: @course.id)
    @events = Event.where(idx: @games.ids, event_type: 'game')
    @reviews = Review.where(course_id: @course.id)

    if @reviews.blank?
      @avg_review = 0
    else
      @avg_review = @reviews.average(:rating)
    end
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses
  # POST /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        # Andy added this here to save a new game creation to the events table
        event = Event.new
        event.event_type = "course"
        event.idx = @course.id
        event.set_user current_user
        event.save

        # Rails generated from here down
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1
  # PATCH/PUT /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1
  # DELETE /courses/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:course).permit(:name, :description, :city, :state, :difficulty, :image)
  end

  def rating_params
    params.require(:reviews).permit(:course_id, :rating)
  end

end

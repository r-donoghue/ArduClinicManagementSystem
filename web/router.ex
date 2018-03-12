defmodule Cmsv1.Router do
  use Cmsv1.Web, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", Cmsv1 do
    pipe_through :browser # Use the default browser stack

    get "/", PatientController, :index
    resources "/pharms", PharmacyController
    resources "/gps", GPController
    resources "/cdoctors", CDoctorController
    resources "/patients", PatientController
    resources "/reasons", InactivityController
    resources "/genders", GenderController
    resources "/relationships", RelationshipController
    
  end

  # Other scopes may use custom stacks.
  # scope "/api", Cmsv1 do
  #   pipe_through :api
  # end
end

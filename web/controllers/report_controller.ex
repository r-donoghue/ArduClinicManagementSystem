defmodule Cmsv1.ReportController do
    use Cmsv1.Web, :controller

    alias Cmsv1.GP
    alias Cmsv1.Patient

    def index(conn, _params) do
      
      patients = Repo.all(Patient) |> Repo.preload([:gps, :pharms, :cdoctors])
      render conn, "index.html", patients: patients
    end
  end
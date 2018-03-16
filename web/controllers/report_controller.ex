defmodule Cmsv1.ReportController do
    use Cmsv1.Web, :controller

    alias Cmsv1.GP
    alias Cmsv1.Patient
    
    def index(conn, %{"Type" => t}) do

 
      gp = Repo.all(GP)
      gps = Repo.all(GP) |> Enum.map(&{&1.gp_id,&1.name})
      patients = Repo.all(Patient) |> Enum.map(&{&1.gp_id,&1.fname<>" "<>&1.lname<>" - Ph Number: "<>&1.ph_number})
 
      if t == "PGP" do
        render conn, "patientbygp.html", patients: patients, gps: gps, gp: gp
      end
      if t == "PD" do
        render conn, "patientbydoctor.html"
      end
      if t == "PA" do
        render conn, "patientbyactivity.html"
      end
      if t == "PAge" do
        render conn, "patientbyage.html"
      end
      if t == "PC" do
        render conn, "patientbycounty.html"
      end

      render conn, "index.html"
    end

    def index(conn, _params) do
      

      render conn, "index.html"
    end
    
  end
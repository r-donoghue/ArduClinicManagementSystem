defmodule Cmsv1.PatientCommander do
  use Drab.Commander

  alias Cmsv1.Pharmacy
  alias Cmsv1.Repo
  alias Cmsv1.Patient
  alias Cmsv1.CDoctor
  alias Cmsv1.GP
  alias Cmsv1.Inactivity
  alias Cmsv1.Gender
  alias Cmsv1.Relationship

  def refresh_genders(socket, _sender) do
    genders = Repo.all(Gender) |> Enum.map(&{&1.gender, &1.gender}) |> Enum.into(%{})  
    set_prop socket, "#patient_gender" , options: genders
  end

  def refresh_pharms(socket, _sender) do
    pharms = Repo.all(Pharmacy) |> Enum.map(&{&1.pharm_id, &1.name<>" , "<>&1.address}) |> Enum.into(%{}) 
    set_prop socket, "#patient_pharm_id" , options: pharms
  end

  def refresh_gps(socket, _sender) do
    gps = Repo.all(GP) |> Enum.map(&{&1.gp_id, &1.name}) |> Enum.into(%{}) 
    set_prop socket, "#patient_gp_id" , options: gps
  end

  def refresh_doctors(socket, _sender) do
    doctors = Repo.all(CDoctor) |> Enum.map(&{&1.cdoctor_id,&1.name}) |> Enum.into(%{})
    set_prop socket, "#patient_cdoctor_id" , options: doctors  
  end

  def refresh_relations(socket, _sender) do
    relations = Repo.all(Relationship) |> Enum.map(&{&1.relationship, &1.relationship}) |> Enum.into(%{})  
    set_prop socket, "#patient_nok_rel" , options: relations
  end
end

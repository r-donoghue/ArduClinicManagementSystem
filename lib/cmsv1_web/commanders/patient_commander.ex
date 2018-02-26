defmodule Cmsv1.PatientCommander do
  use Drab.Commander

  alias Cmsv1.Pharmacy
  alias Cmsv1.Repo

  def refresh_pharms(socket, _sender) do
    pharm = Repo.all(Pharmacy) |> Enum.map(&{&1.name, &1.pharm_id}) |> Enum.into(%{})  
    IO.inspect pharm
    set_prop socket, "#patient_pharm_id" , pharms: pharm
  end
end

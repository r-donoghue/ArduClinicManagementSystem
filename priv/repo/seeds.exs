# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Cmsv1.Repo.insert!(%Cmsv1.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.


reason = %Cmsv1.Inactivity{reason: "Death"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Absent without reason"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Deceased"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Prison"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Unknown"}
Cmsv1.Repo.insert(reason)

gender = %Cmsv1.Gender{gender: "Male"}
Cmsv1.Repo.insert(gender)
gender = %Cmsv1.Gender{gender: "Female"}
Cmsv1.Repo.insert(gender)

relation = %Cmsv1.Gender{gender: "Brother"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Gender{gender: "Sister"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Gender{gender: "Mother"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Gender{gender: "Father"}
Cmsv1.Repo.insert(relation)


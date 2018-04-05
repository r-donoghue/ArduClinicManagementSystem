
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

relation = %Cmsv1.Relationship{relationship: "Brother"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Relationship{relationship: "Sister"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Relationship{relationship: "Mother"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Relationship{relationship: "Father"}
Cmsv1.Repo.insert(relation)

vbrand = %Cmsv1.VaccBrand{vaccbrand: "Twinrix"}
Cmsv1.Repo.insert(vbrand)
vbrand = %Cmsv1.VaccBrand{vaccbrand: "HBVAXPRO"}
Cmsv1.Repo.insert(vbrand)

clinic = %Cmsv1.Clinic{name: "defaultclinic", address: "defaultclinic", clinic_id: "8d0b73bc-2fd4-4b55-b519-361fa367cffb"}
Cmsv1.Repo.insert(clinic)

user = %Cmsv1.User{name: "admin", username: "admin", password_hash: "$2b$12$IF4JpsOq3bBg0MNZyohSFu0DkBsJMa.eNcnoLU2NeCuBmtXuFbTP2", level: "admin", clinic_id: "8d0b73bc-2fd4-4b55-b519-361fa367cffb"}
Cmsv1.Repo.insert(user)


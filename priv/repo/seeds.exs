#Reasons
reason = %Cmsv1.Inactivity{reason: "Absent without reason"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Deceased"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Prison"}
Cmsv1.Repo.insert(reason)
reason = %Cmsv1.Inactivity{reason: "Unknown"}
Cmsv1.Repo.insert(reason)

# Genders
gender = %Cmsv1.Gender{gender: "Male"}
Cmsv1.Repo.insert(gender)
gender = %Cmsv1.Gender{gender: "Female"}
Cmsv1.Repo.insert(gender)

#Patient Relationships
relation = %Cmsv1.Relationship{relationship: "Brother"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Relationship{relationship: "Sister"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Relationship{relationship: "Mother"}
Cmsv1.Repo.insert(relation)
relation = %Cmsv1.Relationship{relationship: "Father"}
Cmsv1.Repo.insert(relation)

# Vaccination Brand
vbrand = %Cmsv1.VaccBrand{vaccbrand: "Twinrix"}
Cmsv1.Repo.insert(vbrand)
vbrand = %Cmsv1.VaccBrand{vaccbrand: "HBVAXPRO"}
Cmsv1.Repo.insert(vbrand)

#Clinic
clinic = %Cmsv1.Clinic{name: "defaultclinic", address: "defaultclinic", clinic_id: "8d0b73bc-2fd4-4b55-b519-361fa367cffb"}
Cmsv1.Repo.insert(clinic)

clinic = %Cmsv1.Clinic{name: "Carlow", address: "St. Dymphnas", clinic_id: "8a1543c2-6b60-4cda-b4b3-ada49743eb6f"}
Cmsv1.Repo.insert(clinic)

# Users
user = %Cmsv1.User{name: "admin", username: "admin", password_hash: "$2b$12$IF4JpsOq3bBg0MNZyohSFu0DkBsJMa.eNcnoLU2NeCuBmtXuFbTP2", level: "admin", clinic_id: "8d0b73bc-2fd4-4b55-b519-361fa367cffb"}
Cmsv1.Repo.insert(user)

user = %Cmsv1.User{name: "Deirdre", username: "deirdre", password_hash: "$2b$12$IF4JpsOq3bBg0MNZyohSFu0DkBsJMa.eNcnoLU2NeCuBmtXuFbTP2", level: "standard", clinic_id: "8a1543c2-6b60-4cda-b4b3-ada49743eb6f"}
Cmsv1.Repo.insert(user)

# GPs

gp = %Cmsv1.GP{gp_id: "0d56421d-5728-410b-b091-372c4b2e7801", name: "Joe Bloggs", address: "Waterford", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "joe@bloggs.com", training_level: "1"}
Cmsv1.Repo.insert(gp)

gp = %Cmsv1.GP{gp_id: "0d564111-5728-410b-b091-372c4b2e7801", name: "John Doe", address: "Carlow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "john@doe.com", training_level: "1"}
Cmsv1.Repo.insert(gp)

gp = %Cmsv1.GP{gp_id: "0d564222-5728-410b-b091-372c4b2e7801", name: "Joe Dolan", address: "Baltinglass", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "joe@dolan.com", training_level: "1"}
Cmsv1.Repo.insert(gp)

gp = %Cmsv1.GP{gp_id: "0d564333-5728-410b-b091-372c4b2e7801", name: "Donal Drump", address: "Kilkenny", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "donal@drump.com", training_level: "1"}
Cmsv1.Repo.insert(gp)

# Clinic Doctors

cdoctor = %Cmsv1.CDoctor{cdoctor_id: "1a05503a-d40d-42f7-84df-c3fe3fcd531e", name: "Jim Dunne", address: "Baltinglass", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "jim@bloggs.com", training_level: "2"}
Cmsv1.Repo.insert(cdoctor)

cdoctor = %Cmsv1.CDoctor{cdoctor_id: "1a055111-d40d-42f7-84df-c3fe3fcd531e", name: "Declan Byrne", address: "Carlow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "declan@byrne.com", training_level: "2"}
Cmsv1.Repo.insert(cdoctor)

cdoctor = %Cmsv1.CDoctor{cdoctor_id: "1a055222-d40d-42f7-84df-c3fe3fcd531e", name: "Jimmy McNamara", address: "Kilkenny", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "caroline@nolan.com", training_level: "2"}
Cmsv1.Repo.insert(cdoctor)

cdoctor = %Cmsv1.CDoctor{cdoctor_id: "1a055333-d40d-42f7-84df-c3fe3fcd531e", name: "Caroline Nolan", address: "Waterford", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "jimmy@mcnamara.com", training_level: "2"}
Cmsv1.Repo.insert(cdoctor)

#Pharmacies

p = %Cmsv1.Pharmacy{pharm_id: "3480f2c1-ccf3-46bb-93c2-e5c1ac8d8208", name: "Lloyds Carlow", address: "Main Street, Carlow Town, Co. Carlow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "Morriseys@carlow.com", contact_person: "Jenny Dooley", contact_person_number: "083-xxx-xxxx"}
Cmsv1.Repo.insert(p)

p = %Cmsv1.Pharmacy{pharm_id: "3480f111-ccf3-46bb-93c2-e5c1ac8d8208", name: "Morrisseys Carlow", address: "Tullow Street, Carlow Town, Co. Carlow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "lloyds@carlow.com", contact_person: "Jenny Byrne", contact_person_number: "087-xxx-xxxx"}
Cmsv1.Repo.insert(p)

p = %Cmsv1.Pharmacy{pharm_id: "3480f2c1-ccf3-46bb-93c2-e5c1ac8d8208", name: "Lloyds Carlow", address: "Barrow Street, Carlow Town, Co. Carlow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "Morriseys@carlow.com", contact_person: "Jenny Dooley", contact_person_number: "083-xxx-xxxx"}
Cmsv1.Repo.insert(p)

p = %Cmsv1.Pharmacy{pharm_id: "3480f111-ccf3-46bb-93c2-e5c1ac8d8208", name: "Sam McCauleys Carlow", address: "Other Street, Carlow Town, Co. Carlow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "lloyds@carlow.com", contact_person: "Jenny Byrne", contact_person_number: "087-xxx-xxxx"}
Cmsv1.Repo.insert(p)

p = %Cmsv1.Pharmacy{pharm_id: "3480f2c1-ccf3-46bb-93c2-e5c1ac8d8208", name: "Sam McCauleys Waterford", address: "Main Street, Waterford Town, Co. Waterford", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "Morriseys@carlow.com", contact_person: "Jenny Dooley", contact_person_number: "083-xxx-xxxx"}
Cmsv1.Repo.insert(p)

p = %Cmsv1.Pharmacy{pharm_id: "3480f111-ccf3-46bb-93c2-e5c1ac8d8208", name: "Stacks Baltinglas", address: "Main Street, Baltinglas, Co. Wicklow", mobile_number: "085-xxx-xxxx", landline_number: "05991-xx-xxx", fax: "xxx1234", email: "lloyds@carlow.com", contact_person: "Jenny Byrne", contact_person_number: "087-xxx-xxxx"}
Cmsv1.Repo.insert(p)



require 'csv'
require 'rubygems'


user = User.new(

  name:  "AdminCIV",
  email: "adminCIV@gmail.com",
  # avatar_url: "https://i.pravatar.cc/150?img=65",
  admin: true,
  password:  'adminCIV',
  password_confirmation: 'adminCIV',
)

user.save!
puts "Creating admin"

csv_options = { col_sep: ';', quote_char: '"', headers: :first_row }
filesresponses    = 'db/csv/responses.csv'

CSV.foreach(filesresponses, csv_options) do |row|

  User.create(name: row['Ton prénom'], start_year_prepa: row["Ton année d'entrée en prépa"],
      email: row["Email"],
      contact_details: row["Comment te contacter"],
      sector: row["Quel est ton secteur d'activité ?"],
      occupation: row["Décris brièvement ce que tu fais aujourd'hui"],
      hobbies: row["Décris brièvement ce qui t'animes"],
      school_description: row["Peux-tu nous en dire plus sur l'école que tu as intégré ? Qu'est-ce que tu as aimé/ moins apprécié ?"],
      personal_path: row["Décris brièvement le parcours qui t'a mené jusqu'ici"],
      project: row["Est-ce que tu savais ce que tu voulais faire quand tu étais en prépa ?"],
      memories: row["Un souvenir marquant sur ton passage en prépa ?"],
      link_network: row["Un lien vers ton compte Linkedin ou autre (Behance, Viadeo, que sais-je) ?"],
      admin: false, profile: "Alumni",
      password:  'AlumniCIV',
      password_confirmation: 'AlumniCIV')

      puts "Creating #{row['Ton prénom']}"

end








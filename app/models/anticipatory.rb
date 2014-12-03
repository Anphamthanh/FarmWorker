class Anticipatory < ActiveRecord::Base
  belongs_to :patient

  def get_list
    patient = Patient.find(patient_id)
    if !patient.is_under_2? and patient.is_under_6?
      {
        "Health Promotion/Safety" => [
          "Please choose one",
          "Seat Belts – Place in back of vehicle/Airbag safety",
          "Teach to answer phone/get help",
          "Teach name, address, phone number",
          "Secure matches, weapons",
          "Teach to avoid 'bad touch'",
          "Encourage active play",
          "safe outdoor play areas",
          "Street crossing",
          "Dental flossing",
          "Bike, water safety",
          "Supervision at bath time",
          "Out of home care",
          "Lead Education",
          "Important of up-to-date immunizations"
          ],
        "Developemental Stimulation" => [
          "Please choose one",
          "Riding Toys",
          "Simple chores",
          "Recognizes Coins",
          "Colors",
          "Scissors, clay, yarn",
          "Begin self hygiene, grooming (5 yr)",
          "Shoe tying (5 yr)",
          "Negotiation skills"
          ],
        "Socialization" => [
          "Please choose one",
          "Respect for authority figures",
          "'Bad' language",
          "Expect loud boisterous behavior",
          "Different developmental rates",
          "Separation anxiety",
          "School readiness/following rules",
          "Sharing/respect for other's rights"
          ],
        "Nutrition" => [
          "Please choose one",
          "Review balanced diet/snacks",
          "Food acceptance/good food habits",
          "Limit salt, sugar, fat",
          "Iron rich foods, Folic Acid/Building Blood",
          "Choking on foods",
          "Picky eater/food jags",
          "WIC Topics: Reason certified",
          "WIC Topics: Prescribe food package",
          "WIC Topics: Using WIC foods"
          ]  
      }  
    elsif !patient.is_under_5? and patient.is_under_10?
      {
        "Health Promotion/Safety" => [
          "Please choose one",
          "Bike, street, swimming, assault, safety, seatbelts, sit in back of vehicle",
          "Need for adult supervision",
          "Limit TV to 2 hours per day",
          "Encourage aerobic activities",
          "Preparation for puberty",
          "Hair, skin care",
          "Substance abuse",
          "Sex education, contraception",
          "Beginning awareness for own health",
          "Teach to avoid 'bad touch'",
          "Lead Education",
          "Important of up-to-date immunizations"
        ],
        "Developmental Stimulation" => [
          "Please choose one",
          "Promote listening skills through music",
          "Encourage word games, puzzles",
          "Provide new experiences",
          "Encourage reading",
          "Age appropriate responsibilities and limits",
          "Variations of physical development",
          "Encourage communication about feelings",
          "Develop trust/honesty",
          "Games with rules (6 yr. olds)"
        ],
        "Socialization" => [
          "Please choose one",
          "Telling time",
          "Following directions",
          "Homework",
          "Promote self-esteem",
          "Encourage peer interaction",
          "Encourage special interests",
          "Sharing/respect for other's rights",
          "Respect for authority figures"
        ],
        "Nutrition" => [
          "Please choose one",
          "Stress balanced diet",
          "Avoid fad diets",
          "Weight control via exercise",
          "Increased calories during growth spurt/activity",
          "Adequate calcium intake",
          "Nutritious snacks",
          "Iron rich foods",
          "Importance of Folic Acid for females"
        ]
      }
    end
  end

  
end

class Anticipatory < ActiveRecord::Base
  belongs_to :patient

  def get_list
    patient = Patient.find(patient_id)
    if !patient.is_under_3? and patient.is_under_6?
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
    end
  end

  
end

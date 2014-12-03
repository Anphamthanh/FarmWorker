class Anticipatory < ActiveRecord::Base
  belongs_to :patient

  def get_list
    patient = Patient.find(patient_id)
    if !patient.is_under_3? and patient.is_under_6?
      ["Health Promotion/Safety", "Developemental Stimulation", "Socialization", "Nutrition"]
    end
  end

  def get_db_key(text)
    KEY_LIST[text]
  end

  def get_details(key)
    ANTICIPATORY[key]
  end

  ANTICIPATORY = {
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
      ],
    "Socialization" => [
      ],
    "Nutrition" => [
      ]  
  }

  KEY_LIST = {
    "Health Promotion/Safety" => "health_promotion"
  }

  
end

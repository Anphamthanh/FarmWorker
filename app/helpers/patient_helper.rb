module PatientHelper
  
  def missing?(missing = 0)
    if (missing == 0 || missing.to_s == "" || missing.to_s == "Not Evaluated")
      image_tag "Yellow.png"
    end
  end
  
  def CalculateBMI(weight = 0, height = 0)
    (weight.to_f / height.to_f**2 * 703).round(1)
  end
  
  def BMIAlert(bmi = 0)
    bmi = bmi.to_i
    if (bmi <= 18.5 || (bmi > 25 && bmi < 30))
      image_tag "Yellow.png"
    else
      image_tag "Red.png"
    end
  end
    
  def BPAlert(sys = 0, dia = 0)
    sys = sys.to_i
    dia = dia.to_i
    if (sys < 140 || dia < 90)
      image_tag "Yellow.png"
    else
      image_tag "Red.png"
    end
  end
  
  def HGBAlert(hgb = 0)
    hgb = hgb.to_i
    if (!(hgb >= 11 && hgb <= 16))
      image_tag "Yellow.png"
    end
  end
  
  def GlucoseAlert(glucose = 0)
    glucose = glucose.to_i
    if (!(glucose > 4 && glucose < 6))
      image_tag "Yellow.png"
    end
  end
    
end
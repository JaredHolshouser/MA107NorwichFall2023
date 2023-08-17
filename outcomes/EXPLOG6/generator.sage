class Generator(BaseGenerator):
    def data(self):
        t = var('t')
        #Compound Interest comes first
        #Generate a random diverse name
        names = [
            "Dennis",
            "Denise",
            "Catherine",
            "Blanca",
            "Roman",
            "Charles",
            "Marie",
            "Lei",
            "Juan",
            "Yan",
            "Tao",
            "Natsu",
            "Kazuyo",
            "Nuriyah",
            "Firas",
            "Asmaa",
            "Bahiya",
            "Chovka",
            "Solta",
            "Kurbika",
            "Alia",
            "Fahtima",
            "Sara",
            "Rahul",
            "Kabir",
        ]
        name = choice(names)
        
        #Choose a principal amount
        principal = 100*randrange(2,21)
        
        #Choose an interest rate
        interest_percent = round(0.01*randrange(30,300),2)
        interest_rate = round(interest_percent*0.01,4)
        
        #Choose a compounding time
        compounding_options = ["annually", "semi-annually", "quarterly", "monthly", "daily"]
        compounding_times = choice(compounding_options)
        if compounding_times == "annually":
            n = 1
        elif compounding_times == "semi-annually":
            n = 2
        elif compounding_times == "quarterly":
            n = 4
        elif compounding_times == "monthly":
            n = 12
        else:
            n = 365
            
        #Choose a number of years
        interest_time = randrange(2,21)
        
        #Calculate the future value
        future_value = round(principal*(1 + interest_rate/n)^(n*interest_time),2)
        
        #Make money strings
        future_value_string = f"${float(future_value):,}"
        
        #Now for the continuous exponential model
        #Generate a random problme type 1 -> decay, 2 -> growth
        random_scenario = choice(["phrasing1", "phrasing2"])

        #Choose an initial amount
        initial_amount = 100*randrange(5,20)
    
        #Choose a rate
        exp_percent = round(0.1*randrange(30,60),1)
        exp_rate = round(exp_percent*0.01,3)
        
        #Choose an elapsed time
        elapsed_time = randrange(30,90)
        
        #Now for some specifics
        #Decay
        if random_scenario == "phrasing1":
            model(t) = initial_amount*e^(-exp_rate*t)
            #Choose a target amount that is smaller than the initial amount
            target_amount = round(0.1*randrange(3,8)*initial_amount,0)
            #Find the predicted time to hit: ln(A/A_0)/(-exp_rate)
            predicted_time = round(ln(target_amount/initial_amount)/(-exp_rate),2)
            #Find the predicted amount
            predicted_amount = round(model(elapsed_time),2)
        #Growth
        elif random_scenario == "phrasing2":
            model(t) = initial_amount*e^(exp_rate*t)
            #Choose a target amount that is larger than the initial amount
            target_amount = randrange(3,8)*initial_amount
            #Find the predicted time to hit: ln(A/A_0)/(exp_rate)
            predicted_time = round(ln(target_amount/initial_amount)/(exp_rate),2)
            #Find the predicted amount
            predicted_amount = round(model(elapsed_time),0)
        
        #Find the half-life/double-tiome
        HD_time = round(ln(2)/exp_rate,2)

        return {
            "name": name,
            "principal": principal,
            "interest_percent": interest_percent,
            "compounding_times": compounding_times,
            "interest_time": interest_time,
            "future_value": future_value_string,
            "scenario": {random_scenario: True},
            "initial_amount": initial_amount,
            "exp_percent": exp_percent,
            "elapsed_time": elapsed_time,
            "model": latex(model(t)),
            "target_amount": target_amount,
            "predicted_time": predicted_time,
            "predicted_amount": predicted_amount,
            "HD_time": HD_time,
        }
        



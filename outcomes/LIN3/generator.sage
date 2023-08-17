class Generator(BaseGenerator):
    def data(self):
        #generate a random diverse name
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
        #generate a random problme type 1 -> landscaping, 2 -> trench digger 3 -> cell phone plan
        random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])

        #generate a random slope
        slope = randrange(50,151)
    
        #generate a random intercept
        intercept = randrange(20,60)
        
        if random_scenario == "phrasing1":
            intercept *= 100
        elif random_scenario == "phrasing3":
            slope *= 0.001
            slope = round(slope,2)
    
        #generate a random input
        input = randrange(2,10)
    
        #compute the linear model
        model(x) = slope*x + intercept

        #compute the answer to part 3.
        output = model(input)
        
        #make money strings
        slope_string = f"${float(slope):,}"
        intercept_string = f"${float(intercept):,}"
        output_string = f"${float(output):,}"

        return {
            "name": name,
            "scenario": {random_scenario: True},
            "slope": slope_string,
            "intercept": intercept_string,
            "input": input,
            "output": output_string,
            "model": latex(model(x)),
        }
        



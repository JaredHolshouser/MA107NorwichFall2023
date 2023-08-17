class Generator(BaseGenerator):
    def data(self):
        #generate a random problme type 1 -> tangent problem, 2 -> sine problem, 3 -> tangent again 4 - sine again
        random_scenario = choice(["phrasing1", "phrasing2", "phrasing3", "phrasing4"])
        #generate units
        units = choice(["meters","feet", "yards"])
        #Choose a tall object
        tall_object = choice(["building","tree","tower","waterfall"])
        #Choose a slanted object
        slanted_object = choice(["ramp", "hill", "slope"])
        
        #The first tangent problem
        if random_scenario == "phrasing1":
            #Choose an angle of elevation
            theta = randrange(10,45)
            #Choose a distance away
            side = 10^randrange(1,3)*randrange(1,10)
            #Find the height -> Use tan(theta) = height/side
            height = round(side*tan(theta*pi/180),2)    
        
        #The first sine problem
        elif random_scenario == "phrasing2":
            #Choose an angle of elevation
            theta = randrange(30,70)
            #Choose a ladder length
            side = 4*randrange(4,16)
            #Find the height -> Use sin(theta) = height/side
            height = round(side*sin(theta*pi/180),2)
            
        #The second tangent problem
        elif random_scenario == "phrasing3":
            #Choose an angle of depression
            theta = randrange(70,90)
            #Choose a hole width
            side = randrange(3,10)
            #Find the height -> Use tan(theta) = height/side
            height = round(side*tan(theta*pi/180),2)
            
        #The second sine problem
        elif random_scenario == "phrasing4":
            #Choose an angle of elevation
            theta = randrange(10,30)
            #Choose a ramp/ladder length
            side = randrange(5,25)
            #Find the height -> Use sin(theta) = side/height
            height = round(side*sin(theta*pi/180),2)

        
        return {
            "scenario": {random_scenario: True},
            "units": units,
            "theta": theta,
            "side": side,
            "height": height,
            "tall_object": tall_object,
            "slanted_object": slanted_object,
        }
        



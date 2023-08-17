class Generator(BaseGenerator):
    def data(self):
        #generate a random problme type 1 -> projectile, 2 -> chain 3 -> enclosure
        random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])
        #generate units
        units = choice(["meters","feet"])
        
        #Scenario 1
        if random_scenario == "phrasing1":
            #Choose an initial height and velocity
            y_0 = randrange(5,50)
            v_0 = randrange(3,20)
            #Set acceleration based on units
            if units == "meters":
                a = -9.8
            else:
                a = -32.2
            #form the model
            t = var('t')
            h(t) = round(a/2,1)*t^2 + v_0*t + y_0
            model = latex(h(t))
            simplified_model = model
            #Solve for when it hits the ground
            root = round((-v_0 - sqrt(v_0^2 - 4*0.5*a*y_0))/a,2)
            #Find a good input
            x_in = randrange(0,100*ceil(root))
            x_in = round(x_in/100,2)
            #Evaluate the output
            y_out = h(x_in)
            #Find the vertex
            vertex = -v_0/a
            optimum = round(h(vertex),2)
            #Setting variables that show up elsewhere
            material = ""
            height = 0
            perimeter = 0
        
        #Scenario 2
        elif random_scenario == "phrasing2":
            #Choose a material
            units = choice(["meters","feet"])
            material = choice(["rope","string","chain"])
            #Choose a post width. This solves part 2
            width = randrange(3,20)
            root = width
            #the vertex is halfway in between
            vertex = round(width/2,2)
            #The minimum is up to me (two decimal places of precision). This solves part 3.
            k = randrange(2,11)*4*vertex*vertex
            k = round(k/10,2)
            optimum = k
            #I also get to choose a post height
            multiplier = randrange(11,20)
            height = round(k*multiplier/10,2)
            #This then creates a: height = a*vertex^2 + k
            a = round((height - k)/(vertex^2),2)
            #Form the model
            x = var('x')
            h(x) = a*(x - vertex)^2 + k
            h_simple = h.simplify_full()
            model = latex(h_simple(x=x))
            simplified_model = model
            #Find a good input
            x_in = randrange(5,10*width)
            x_in = round(x_in/10,2)
            #Evaluate the output
            y_out = h(x_in)
            #Note that the width is the root we need for part 2 and k is the minimum height
            #Setting variables that turn up elsewhere
            y_0 = 0
            v_0 = 0
            perimeter = 0
        
        #Scenario 3
        else:
            #Choose a perimeter
            perimeter = randrange(50,300)
            #Form the model
            w = var('w')
            A(w) = w*(perimeter - 2*w)
            model = "w(" + str(perimeter) + " - 2w)"
            A_simplified = A.full_simplify()
            simplified_model = latex(A_simplified(w=w))
            #Solve for the root
            root = round(perimeter/2,1)
            #Find a good input
            x_in = randrange(50,100*root)
            x_in = round(x_in/100,2)
            #Evaluate the output
            y_out = A(x_in)
            #Finding the maximum area A(w) = -2*w^2 + perim*w, so the vertex is at perim/4
            vertex = perimeter/4
            optimum = A(vertex)
            #Setting variables that turn up elsewhere
            y_0 = 0
            v_0 = 0
            material = ""
            height = 0
        
        return {
            "scenario": {random_scenario: True},
            "units": units,
            "material": material,
            "y0": y_0,
            "v0": v_0,
            "model": model,
            "simplified_model": simplified_model,
            "root": root,
            "x_in": x_in,
            "y_out": round(y_out,2),
            "optimum": round(optimum,2),
            "height": height,
            "perimeter": perimeter,
        }
        



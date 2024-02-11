class Generator(BaseGenerator):
    def data(self):
        #generate a random problme type 1 -> projectile, 2 -> chain 3 -> enclosure
        random_scenario = choice(["phrasing1", "phrasing2", "phrasing3"])
        
        #Scenario 1
        if random_scenario == "phrasing1":
            #generate units
            units = choice(["meters","feet"])
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
            zero = (-v_0 - sqrt(v_0^2 - 4*0.5*a*y_0))/a
            #Find a good input
            x_in = round(0.01*randrange(0,floor(100*zero)),2)
            #Evaluate the output
            y_out = h(x_in)
            #Find the vertex
            vertex = -v_0/a
            optimum = round(h(vertex),2)
            #Find a good output
            output = round(0.01*randrange(100*y_0,floor(100*optimum)),2)
            #Solve for when the output is hit
            root1 = round((-v_0 - sqrt(v_0^2 - 4*0.5*a*(y_0 - output)))/a,2)
            root2 = round((-v_0 + sqrt(v_0^2 - 4*0.5*a*(y_0 - output)))/a,2)
            #Setting variables that show up elsewhere
            material = ""
            height = 0
            perimeter = 0
        
        #Scenario 2
        elif random_scenario == "phrasing2":
            #Choose a material
            units = choice(["meters","feet"])
            material = choice(["rope","string","chain"])
            #Choose a post width.
            width = randrange(3,20)
            #the vertex is halfway in between
            vertex = round(width/2,2)
            #The minimum is up to me (two decimal places of precision). This solves part 3. Note that k is the min height
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
            #Put it in ax^2 + bx + c format
            h_simple = h.simplify_full()
            b = round(h_simple.list()[1],2)
            c = round(h_simple.list()[0],2)
            h_final(x) = a*x^2 + b*x + c
            model = latex(h_final(x=x))
            simplified_model = model
            #Find a good input
            x_in = randrange(5,10*width)
            x_in = round(x_in/10,2)
            #Evaluate the output
            y_out = h(x_in)
            #Find a good ouput
            output = round(0.01*randrange(ceil(100*k),floor(100*height)),2)
            #Find when this height happens
            root1 = round(vertex - sqrt((output-k)/a),2)
            root2 = round(vertex + sqrt((output-k)/a),2)
            #Setting variables that turn up elsewhere
            y_0 = 0
            v_0 = 0
            perimeter = 0
            zero = width
        
        #Scenario 3
        else:
            #generate units
            units = choice(["meters","feet"])
            #Choose a perimeter
            perimeter = randrange(50,300)
            #Form the model
            w = var('w')
            A(w) = w*(perimeter - 2*w)
            model = "w(" + str(perimeter) + " - 2w)"
            A_simplified = A.full_simplify()
            simplified_model = latex(A_simplified(w=w))
            #Solve for when the area is zero
            zero = round(perimeter/2,1)
            #Find a good input
            x_in = round(0.01*randrange(50,floor(100*zero)),2)
            #Evaluate the output
            y_out = A(x_in)
            #Finding the maximum area A(w) = -2*w^2 + perim*w, so the vertex is at perim/4
            vertex = perimeter/4
            optimum = A(vertex)
            #Finding a good output
            output = round(0.01*randrange(0,floor(100*optimum)),2)
            #Find when this output happens: solve -2*w^2 + perim*w - output = 0
            root1 = round((-perimeter + sqrt(perimeter^2 - 4*(-2)*(-output)))/(-4),2)
            root2 = round((-perimeter - sqrt(perimeter^2 - 4*(-2)*(-output)))/(-4),2)
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
            "zero": round(zero,2),
            "x_in": x_in,
            "y_out": round(y_out,2),
            "output": output,
            "root1": root1,
            "root2": root2,
            "vertex": round(vertex,2),
            "optimum": round(optimum,2),
            "height": height,
            "perimeter": perimeter,
        }
        



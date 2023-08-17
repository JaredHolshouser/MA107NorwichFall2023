class Generator(BaseGenerator):
    def data(self):
        #Choose 2 roots or 3 roots or 4 roots
        num_roots = randrange(2,5)
        
        #2 roots case
        if num_roots == 2:
            #Choose roots
            root_1 = randrange(-7,3)
            root_2 = randrange(root_1 + 3,8)
            #Choose multiplicity
            mult_1 = randrange(1,3)
            mult_2 = randrange(3,5) - mult_1
            total_power = mult_1 + mult_2
            #Determine a reflection
            a = (-1)^randrange(0,2)
            #Build the polynomial
            f(x) = a*(x - root_1)^mult_1 * (x - root_2)^mult_2
            f_simple = f.full_simplify()
            #Write the x-intercept string
            x_ints = "(" + str(root_1) + ", 0) \\text{ and } (" + str(root_2) + ", 0)"
            mults = str(mult_1) + "\\text{ and } " + str(mult_2)
            
        #3 roots case
        elif num_roots == 3:
            #Choose roots
            root_1 = randrange(-7,-1)
            root_2 = randrange(root_1 + 2,4)
            root_3 = randrange(root_2 + 2,8)
            #Choose multiplicity
            mult_1 = randrange(1,3)
            mult_2 = randrange(1,3)
            mult_3 = max(randrange(4,6) - mult_1 - mult_2,1)
            total_power = mult_1 + mult_2 + mult_3
            #Determine a reflection
            a = (-1)^randrange(0,2)
            #Build the polynomial
            f(x) = a*(x - root_1)^mult_1 * (x - root_2)^mult_2 * (x - root_3)^mult_3
            f_simple = f.full_simplify()
            #Write the x-intercept string
            x_ints = "(" + str(root_1) + ", 0), (" + str(root_2) + ", 0) \\text{ and } (" + str(root_3) + ", 0)"
            mults = str(mult_1) + ", " + str(mult_2) + " \\text{ and } " +  str(mult_3)
            
        #4 roots case
        else:
            #Choose roots
            root_1 = randrange(-7,-3)
            root_2 = randrange(root_1 + 2,2)
            root_3 = randrange(root_2 + 2,5)
            root_4 = randrange(root_3 + 2,8)
            #Choose multiplicity
            mult_1 = randrange(1,3)
            mult_2 = max(randrange(2,4) - mult_1,1)
            mult_3 = max(randrange(3,5) - mult_1 - mult_2,1)
            mult_4 = max(randrange(4,6) - mult_1 - mult_2 - mult_3,1)
            total_power = mult_1 + mult_2 + mult_3 + mult_4
            #Determine a reflection
            a = (-1)^randrange(0,2)
            #Build the polynomial
            f(x) = a*(x - root_1)^mult_1 * (x - root_2)^mult_2 * (x - root_3)^mult_3 * (x - root_4)^mult_4
            f_simple = f.full_simplify()
            #Write the x-intercept string
            x_ints = "(" + str(root_1) + ", 0), (" + str(root_2) + ", 0), (" + str(root_3) + ", 0) \\text{ and } (" + str(root_4) + ", 0)"
            mults = str(mult_1) + ", " + str(mult_2) + ", " +  str(mult_3) + " \\text{ and } " + str(mult_4)
        
        #Find the end behavior
        if a == 1:
            if total_power %2 == 0:
                left_end = "\\infty"
                right_end = "\\infty"
            else:
                left_end = "-\\infty"
                right_end = "\\infty"
        else:
            if total_power %2 == 0:
                left_end = "-\\infty"
                right_end = "-\\infty"
            else:
                left_end = "\\infty"
                right_end = "-\\infty"
                
        #Write the y-intercept string
        y_int = f(0)
        y_bound = max(abs(y_int),10)

        return {
            "polynomial": latex(f(x)),
            "polynomial_simplified": latex(f_simple(x=x)),
            "left_end": left_end,
            "right_end": right_end,
            "x_ints": x_ints,
            "mults": mults,
            "y_int": y_int,
            "function": f,
            "y_bound": y_bound,
        }
        
    @provide_data
    def graphics(data):

        return {
            "Show": plot(data["function"], (x,-10,10), ymin = -data["y_bound"], ymax = data["y_bound"], color = 'red')
        }

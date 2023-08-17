class Generator(BaseGenerator):
    def data(self):
        #Decide to start with degrees or radians
        angle_options = ["degrees","radians"]
        coin_flip = randrange(0,2)
        state_1 = angle_options[coin_flip]
        
        #Make the second state
        state_2 = angle_options[(coin_flip + 1)%2]
        
        #Degrees
        if coin_flip == 0:
            #First make a reference angle
            reference_options = [5*i for i in range(1,18)]
            reference = choice(reference_options)
            reference_string = str(reference) + "^\\circ"
            reference_point = (round(cos(reference*pi/180),2),round(sin(reference*pi/180),2))

            #Then make a coterminal angle
            #Choose to go off of positive x-axis or negative
            pos_neg = randrange(0,2)
            #Choose to go up or down
            up_down = randrange(0,2)
            #positive
            if pos_neg == 0:
                #up
                if up_down == 0:
                    coterminal = reference
                #down
                else:
                    coterminal = 360 - reference
            #negative
            else:
                #up
                if up_down == 0:
                    coterminal = 180 - reference
                #down
                else:
                    coterminal = 180 + reference
            coterminal_string = str(coterminal) + "^\\circ"
            coterminal_point = (round(cos(coterminal*pi/180),2),round(sin(coterminal*pi/180),2))

            #Finally make the angle itself
            adjuster = (-1)^randrange(0,2)*randrange(1,5)*360
            angle = coterminal + adjuster
            angle_string = str(angle) + "^\\circ"

            #Write down the min and max angles
            min_angle = "0^\\circ"
            max_angle = "360^\\circ"
            
            #Convert to radians
            converted_frac = Rational(angle/180)
            converted_num = converted_frac.numerator()
            converted_den = converted_frac.denominator()
            converted = "\\frac{" + str(converted_num) + "\\pi}{" + str(converted_den) + "}"

            #Write down the conversion factor
            conversion_factor = "\\frac{\\pi}{180}"
        
        #Radians
        else:
            #First make a reference angle
            reference_options = [Rational(1/36*i) for i in range(1,18)]
            reference = choice(reference_options)
            reference_num = reference.numerator()
            reference_den = reference.denominator()
            reference_string = "\\frac{" + str(reference_num) + "\\pi}{" + str(reference_den) + "} \\text{ rad}"
            reference_point = (round(cos(reference*pi),2),round(sin(reference*pi),2))

            #Then make a coterminal angle
            #Choose to go off of positive x-axis or negative
            pos_neg = randrange(0,2)
            #Choose to go up or down
            up_down = randrange(0,2)
            #positive
            if pos_neg == 0:
                #up
                if up_down == 0:
                    coterminal = reference
                #down
                else:
                    coterminal = 2 - reference
            #negative
            else:
                #up
                if up_down == 0:
                    coterminal = 1 - reference
                #down
                else:
                    coterminal = 1 + reference
            coterminal_num = coterminal.numerator()
            coterminal_den = coterminal.denominator()
            coterminal_string = "\\frac{" + str(coterminal_num) + "\\pi}{" + str(coterminal_den) + "} \\text{ rad}"
            coterminal_point = (round(cos(coterminal*pi),2),round(sin(coterminal*pi),2))

            #Finally make the angle itself
            adjuster = (-1)^randrange(0,2)*randrange(1,5)*2
            angle = coterminal + adjuster
            angle_num = angle.numerator()
            angle_den = angle.denominator()
            angle_string = "\\frac{" + str(angle_num) + "\\pi}{" + str(angle_den) + "} \\text{ rad}"

            #Write down the min and max angles
            min_angle = "0 \\text{ rad}"
            max_angle = "2\\pi \\text{ rad}"
            
            #Convert to degrees
            converted_frac = Rational(angle*180)
            converted = str(converted_frac) + "^\\circ"

            #Write down the conversion factor
            conversion_factor = "\\frac{180}{\\pi}"

        return {
            "angle": angle_string,
            "min_angle": min_angle,
            "max_angle": max_angle,
            "state_1": state_1,
            "state_2": state_2,
            "coterminal": coterminal_string,
            "reference": reference_string,
            "converted": converted,
            "conversion_factor": conversion_factor,
            "cot_x": coterminal_point[0],
            "cot_y": coterminal_point[1],
            "ref_x": reference_point[0],
            "ref_y": reference_point[1],
        }
        
    @provide_data
    def graphics(data):
        y = var('y')
        t = var('t')
        
        #Make the circle
        plot = implicit_plot(x^2 + y^2 == 1, (x,-1,1), (y,-1,1), color = 'red')
        #Make the axes
        plot += implicit_plot(x == 0, (x,-1,1), (y,-1,1), color = 'black') 
        plot += implicit_plot(y == 0, (x,-1,1), (y,-1,1), color = 'black')
        #Make the coterminal angle
        plot += parametric_plot((t*data["cot_x"],t*data["cot_y"]), (t,0,1), color = 'blue')
        #Make the reference angle
        plot += parametric_plot((t*data["ref_x"],t*data["ref_y"]), (t,0,1), color = 'purple')
        
        return {
            "Show": plot,
        }

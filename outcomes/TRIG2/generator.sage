class Generator(BaseGenerator):
    def data(self):
        #Make the unit circle
        unit_circle = [
        ("0","0","1","0"),
        ("30","\\frac{\\pi}{6}","\\frac{\\sqrt{3}}{2}","\\frac{1}{2}"),
        ("45","\\frac{\\pi}{4}","\\frac{\\sqrt{2}}{2}","\\frac{\\sqrt{2}}{2}"),
        ("60","\\frac{\\pi}{3}","\\frac{1}{2}","\\frac{\\sqrt{3}}{2}"),
        ("90","\\frac{\\pi}{2}","0","1"),
        ("120","\\frac{2\\pi}{3}","-\\frac{1}{2}","\\frac{\\sqrt{3}}{2}"),
        ("135","\\frac{3\\pi}{4}","-\\frac{\\sqrt{2}}{2}","\\frac{\\sqrt{2}}{2}"),
        ("150","\\frac{5\\pi}{6}","-\\frac{\\sqrt{3}}{2}","\\frac{1}{2}"),
        ("180","\\pi","-1","0"),
        ("210","\\frac{7\\pi}{6}","-\\frac{\\sqrt{3}}{2}","-\\frac{1}{2}"),
        ("225","\\frac{5\\pi}{4}","-\\frac{\\sqrt{2}}{2}","-\\frac{\\sqrt{2}}{2}"),
        ("240","\\frac{4\\pi}{3}","-\\frac{1}{2}","-\\frac{\\sqrt{3}}{2}"),
        ("270","\\frac{3\\pi}{2}","0","-1"),
        ("300","\\frac{5\\pi}{3}","\\frac{1}{2}","-\\frac{\\sqrt{3}}{2}"),
        ("315","\\frac{7\\pi}{4}","\\frac{\\sqrt{2}}{2}","-\\frac{\\sqrt{2}}{2}"),
        ("330","\\frac{11\\pi}{6}","\\frac{\\sqrt{3}}{2}","-\\frac{1}{2}"),
        ]
    
        #Sine or Cosine with a nice degree.
        #Get the nice degree
        nice_degree_index = randrange(0,len(unit_circle))
        nice_degree_choice = unit_circle[nice_degree_index]
        nice_degree = nice_degree_choice[0]
        #Choose Sine or Cosine
        coin_flip_1 = randrange(0,2)
        #Make the question and answer
        if coin_flip_1 == 0:
            SCdeg = "\\sin(" + str(nice_degree) + "^\\circ)"
            answer_1 = nice_degree_choice[3]
        else:
            SCdeg = "\\cos(" + str(nice_degree) + "^\\circ)"
            answer_1 = nice_degree_choice[2]
            
        #Sine or Cosine with a nice radian.
        #Get the nice radian
        nice_radian_index = randrange(0,len(unit_circle))
        nice_radian_choice = unit_circle[nice_radian_index]
        nice_radian = nice_radian_choice[1]
        #Choose Sine or Cosine
        coin_flip_2 = randrange(0,2)
        #Make the question and answer
        if coin_flip_2 == 0:
            SCrad = "\\sin(" + str(nice_radian) + ")"
            answer_2 = nice_radian_choice[3]
        else:
            SCrad = "\\cos(" + str(nice_radian) + ")"
            answer_2 = nice_radian_choice[2]
            
        #A different trig function with a not so nice value
        #Choose the trig function 0 -> tan 1 -> csc 2 -> sec 3 -> cot
        spinner = randrange(0,4)
        #Choose a whatever value
        #Choose degrees or radians
        coin_flip_3 = randrange(0,2)
        #tan
        if spinner == 0:
            #degrees
            if coin_flip_3 == 0:
                approx_angle = randrange(10,80) + randrange(0,4)*90
                Other = "\\tan(" + str(approx_angle) + "^\\circ )"
                answer_3 = round(tan(approx_angle*pi/180),2)
            #radians
            else:
                approx_angle = round(0.01*(randrange(20,150) + randrange(0,4)*157),2)
                Other = "\\tan(" + str(approx_angle) + ")"
                answer_3 = round(tan(approx_angle),2)
        #csc
        elif spinner == 1:
            #degrees
            if coin_flip_3 == 0:
                approx_angle = randrange(10,80) + randrange(0,4)*90
                Other = "\\csc(" + str(approx_angle) + "^\\circ )"
                answer_3 = round(csc(approx_angle*pi/180),2)
            #radians
            else:
                approx_angle = round(0.01*(randrange(20,150) + randrange(0,4)*157),2)
                Other = "\\csc(" + str(approx_angle) + ")"
                answer_3 = round(csc(approx_angle),2)
        #sec
        elif spinner == 2:
            #degrees
            if coin_flip_3 == 0:
                approx_angle = randrange(10,80) + randrange(0,4)*90
                Other = "\\sec(" + str(approx_angle) + "^\\circ )"
                answer_3 = round(sec(approx_angle*pi/180),2)
            #radians
            else:
                approx_angle = round(0.01*(randrange(20,150) + randrange(0,4)*157),2)
                Other = "\\sec(" + str(approx_angle) + ")"
                answer_3 = round(sec(approx_angle),2)
        #cot
        else:
            #degrees
            if coin_flip_3 == 0:
                approx_angle = randrange(10,80) + randrange(0,4)*90
                Other = "\\cot(" + str(approx_angle) + "^\\circ )"
                answer_3 = round(cot(approx_angle*pi/180),2)
            #radians
            else:
                approx_angle = round(0.01*(randrange(20,150) + randrange(0,4)*157),2)
                Other = "\\cot(" + str(approx_angle) + ")"
                answer_3 = round(cot(approx_angle),2)
                
        #Using the pythagorean identity
        #Choose to start with sine or cosine
        coin_flip_4 = randrange(0,2)
        #Choose a value for the trig function
        value_1 = round(0.01*randrange(10,80),2)
        #Start with sine
        if coin_flip_4 == 0:
            Pyth1 = "\\sin(\\theta) = " + str(value_1)
            Pyth2 = "\\cos(\\theta)"
            #Choose a quadrant
            quadrant = randrange(1,3)
            #Quadrant 1
            if quadrant == 1:
                answer_4 = round(sqrt(1 - value_1^2),2)
            #Quadrant 2
            else:
                answer_4 = round(-sqrt(1 - value_1^2),2)
        #Start with cosine
        else:
            Pyth1 = "\\cos(\\theta) = " + str(value_1)
            Pyth2 = "\\sin(\\theta)"
            #Choose a quadrant
            quadrant = choice([1,4])
            #Quadrant 1
            if quadrant == 1:
                answer_4 = round(sqrt(1 - value_1^2),2)
            #Quadrant 2
            else:
                answer_4 = round(-sqrt(1 - value_1^2),2)
                
        #Finally the inverse trig part
        #Choose sine or cosine
        coin_flip_5 = randrange(0,2)
        #Sine
        if coin_flip_5 == 0:
            #Set the domain correctly
            modified_unit_circle = [
            ("0","0","1","0"),
            ("30","\\frac{\\pi}{6}","\\frac{\\sqrt{3}}{2}","\\frac{1}{2}"),
            ("45","\\frac{\\pi}{4}","\\frac{\\sqrt{2}}{2}","\\frac{\\sqrt{2}}{2}"),
            ("60","\\frac{\\pi}{3}","\\frac{1}{2}","\\frac{\\sqrt{3}}{2}"),
            ("90","\\frac{\\pi}{2}","0","1"),
            ("-90","-\\frac{\\pi}{2}","0","-1"),
            ("-60","-\\frac{\\pi}{3}","\\frac{1}{2}","-\\frac{\\sqrt{3}}{2}"),
            ("-45","-\\frac{\\pi}{4}","\\frac{\\sqrt{2}}{2}","-\\frac{\\sqrt{2}}{2}"),
            ("-30","-\\frac{\\pi}{6}","\\frac{\\sqrt{3}}{2}","-\\frac{1}{2}"),
            ]
            #Get the nice value
            nice_value_index = randrange(0,len(modified_unit_circle))
            nice_value_choice = modified_unit_circle[nice_value_index]
            nice_value = nice_value_choice[3]
            #Make the phrase
            Inverse = "\\sin^{-1} \\left( " + nice_value + " \\right)"
            #Find the answer
            answer_5 = nice_value_choice[0] + "^\\circ \\text{ or } " + nice_value_choice[1]
        #Cosine
        else:
            #Set the domain correctly
            modified_unit_circle = [
            ("0","0","1","0"),
            ("30","\\frac{\\pi}{6}","\\frac{\\sqrt{3}}{2}","\\frac{1}{2}"),
            ("45","\\frac{\\pi}{4}","\\frac{\\sqrt{2}}{2}","\\frac{\\sqrt{2}}{2}"),
            ("60","\\frac{\\pi}{3}","\\frac{1}{2}","\\frac{\\sqrt{3}}{2}"),
            ("90","\\frac{\\pi}{2}","0","1"),
            ("120","\\frac{2\\pi}{3}","-\\frac{1}{2}","\\frac{\\sqrt{3}}{2}"),
            ("135","\\frac{3\\pi}{4}","-\\frac{\\sqrt{2}}{2}","\\frac{\\sqrt{2}}{2}"),
            ("150","\\frac{5\\pi}{6}","-\\frac{\\sqrt{3}}{2}","\\frac{1}{2}"),
            ("180","\\pi","-1","0"),
            ]
            #Get the nice value
            nice_value_index = randrange(0,len(modified_unit_circle))
            nice_value_choice = modified_unit_circle[nice_value_index]
            nice_value = nice_value_choice[2]
            #Make the phrase
            Inverse = "\\cos^{-1} \\left( " + nice_value + " \\right)"
            #Find the answer
            answer_5 = nice_value_choice[0] + "^\\circ \\text{ or } " + nice_value_choice[1]


        return {
            "SCdeg": SCdeg,
            "answer_1": answer_1,
            "SCrad": SCrad,
            "answer_2": answer_2,
            "Other": Other,
            "answer_3": answer_3,
            "Pyth1": Pyth1,
            "Pyth2": Pyth2,
            "quadrant": quadrant,
            "answer_4": answer_4,
            "Inverse": Inverse,
            "answer_5": answer_5,
        }

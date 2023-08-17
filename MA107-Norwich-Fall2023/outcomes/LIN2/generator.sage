class Generator(BaseGenerator):
    def data(self):
        x = var('x')
        y = var('y')
    
        Delta_x = (-1)^randrange(0,2)*randrange(1,10)
        Delta_y = (-1)^randrange(0,2)*randrange(1,10)
        x_coordinate = randrange(-10,10)
        y_coordinate = randrange(-10,10)
        
        slope = Rational(Delta_y/Delta_x)
        eq1 = latex(y - y_coordinate)
        eq1 += " = "
        eq1 += latex(slope)
        eq1 += "("
        eq1 += latex(x - x_coordinate)
        eq1 += ")"
        eq1_SI = "y = "
        eq1_SI += latex(slope*x - slope*x_coordinate + y_coordinate)
        
        x_1 = randrange (-10,1)
        y_1 = randrange(-10,10)
        x_2 = randrange(1,10)
        y_2 = randrange(-10,10)
        
        slope2 = Rational((y_2 - y_1)/(x_2 - x_1))
        eq2 = latex(y - y_1)
        eq2 += " = "
        eq2 += latex(slope2)
        eq2 += "("
        eq2 += latex(x - x_1)
        eq2 += ")"
        eq2_SI = "y = "
        eq2_SI += latex(slope2*x - slope2*x_1 + y_1)    
        
        Delta_x_p = (-1)^randrange(0,2)*randrange(1,10)
        Delta_y_p = (-1)^randrange(0,2)*randrange(1,10)
        
        slope_p = Rational(Delta_y_p/Delta_x_p)
        line_equation = slope_p*x - slope_p*x_coordinate + y_coordinate
        
        coin = randrange(0,2)
        if coin == 0:
            ParallelOrPerpendicular = "parallel"
            slope_ans = slope_p
        else:
            ParallelOrPerpendicular = "perpendicular"
            slope_ans = Rational(-1/slope_p)        
            
        eq3 = latex(y - y_coordinate)
        eq3 += " = "
        eq3 += latex(slope_ans)
        eq3 += "("
        eq3 += latex(x - x_coordinate)
        eq3 += ")"
        eq3_SI = "y = "
        eq3_SI += latex(slope_ans*x - slope_ans*x_coordinate + y_coordinate)

        return {
            "slope": slope,
            "x_coordinate": x_coordinate,
            "y_coordinate": y_coordinate,
            "equation1": eq1,
            "equation1SI": eq1_SI,
            "x1": x_1,
            "y1": y_1,
            "x2": x_2,
            "y2": y_2,
            "equation2": eq2,
            "equation2SI": eq2_SI,
            "relationship": ParallelOrPerpendicular,
            "line": latex(line_equation),
            "equation3": eq3,
            "equation3SI": eq3_SI,
        }

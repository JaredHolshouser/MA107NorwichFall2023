class Generator(BaseGenerator):
    def data(self):
        #Setting the x and y intercepts to be nice first
        y_int = randrange(-10,11)
        y_int_pt = (0,y_int)
        x_int = (-1)^randrange(0,2)*randrange(1,11)
        x_int_pt = (x_int,0)
        
        #Computing the slope
        slope = Rational(-y_int/(x_int))
        increment = slope.denominator()
        
        #Writing the equation of the line
        f(x) = y_int + slope*x
        
        #Choosing two integer valued points on the line
        possible_x_values = [increment*n for n in range(-2,3) if increment*n != x_int and n != 0]
        index_1 = randrange(0,len(possible_x_values))
        x_1 = possible_x_values[index_1]
        y_1 = f(x_1)
        point1 = (x_1,y_1)
        
        possible_x_values.remove(x_1)
        
        index_2 = randrange(0,len(possible_x_values))
        x_2 = possible_x_values[index_2]
        y_2 = f(x_2)
        point2 = (x_2,y_2)
        
        

        return {
            "point1": point1,
            "point2": point2,
            "slope": slope,
            "y_int": y_int,
            "x_int": x_int,
            "y_int_pt": y_int_pt,
            "x_int_pt": x_int_pt,
            "f": f,
        }
        
    @provide_data
    def graphics(data):

        return {
            "Show": point([data["y_int_pt"],data["x_int_pt"],],pointsize=20,color='blue') + point([data["point1"],data["point2"],],pointsize=20,color='red') + plot(data["f"],(x,-20,20),color='red'),
        }
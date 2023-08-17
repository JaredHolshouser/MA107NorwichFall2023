class Generator(BaseGenerator):
    def data(self):  
        #choose where the intervals break up
        r_1 = randrange(-4,0)
        r_2 = randrange(r_1+3,5)
        #choose powers
        p_1 = randrange(1,3)
        p_2 = randrange(1,4 - p_1)
        #choose reflection
        c = (-1)^(randrange(0,2))
            
        #define the polynomial to be integrated
        f_0(x) = c*(x-r_1)^p_1 * (x-r_2)^p_2
        #integrate
        f_1(x) = integral(f_0(x),x)
        #work to make the function plot nicely
        critical_values = [f_1(-6),f_1(r_1),f_1(r_2),f_1(6)]
        max_value = max(critical_values)
        min_value = min(critical_values)
        scale_1 = max(abs(max_value),abs(min_value))
        abs_crits = [abs(v) for v in critical_values if v !=0]
        scale_2 = min(abs_crits)
        f_2(x) = (1/scale_1 + 1/scale_2)/2*f_1(x)
        
        #Determine the intervals and local max/min
        interval_1 = RealSet.unbounded_below_open(r_1)
        interval_2 = RealSet.open(r_1,r_2)
        interval_3 = RealSet.unbounded_above_open(r_2)
        
        if c == 1:
            if p_1 == 1:
                #case 1: (x-r_1)(x-r_2)
                if p_2 == 1:
                    increasing = RealSet.union(interval_1,interval_3)
                    decreasing = interval_2
                    max_pt = (r_1,f_2(r_1).n(1))
                    min_pt = (r_2,f_2(r_2).n(1))
                    max_answer = "The function has a local maximum at " + str(max_pt)
                    min_answer = "The function has a local minimum at " + str(min_pt)
                #case 2: (x - r_1)(x-r_2)^2
                else:
                    increasing = RealSet.union(interval_2,interval_3)
                    decreasing = interval_1
                    max_answer = "The function has no local maximum"
                    min_pt = (r_1,f_2(r_1).n(1))
                    min_answer = "The function has a local minimum at " + str(min_pt)
            #case 3: (x - r_1)^2(x - r_2)
            else:
                increasing = interval_3
                decreasing = RealSet.union(interval_1,interval_2)
                min_pt = (r_2,f_2(r_2).n(1))
                min_answer = "The function has a local minimum at " + str(min_pt)
                max_answer = "The function has no local maximum"
        else:
            if p_1 == 1:
                #case 4: -(x-r_1)(x-r_2)
                if p_2 == 1:
                    decreasing = RealSet.union(interval_1,interval_3)
                    increasing = interval_2
                    min_pt = (r_1,f_2(r_1).n(1))
                    max_pt = (r_2,f_2(r_2).n(1))
                    max_answer = "The function has a local maximum at " + str(max_pt)
                    min_answer = "The function has a local maximum at " + str(min_pt)
                #case 5: -(x - r_1)(x-r_2)^2
                else:
                    decreasing = RealSet.union(interval_2,interval_3)
                    increasing = interval_1
                    min_answer = "The function has no local minimum"
                    max_pt = (r_1,f_2(r_1).n(1))
                    max_answer = "The function has a local maximum at " + str(max_pt)
            #case 6: -(x - r_1)^2(x - r_2)
            else:
                decreasing = interval_3
                increasing = RealSet.union(interval_1,interval_2)
                max_pt = (r_2,f_2(r_2).n(1))
                max_answer = "The function has a local maximum at " + str(max_pt)
                min_answer = "The function has no local minimum"

        return {
            "formula": latex(f_0(x)),
            "increasing": latex(increasing),
            "decreasing": latex(decreasing),
            "max_answer": max_answer,
            "min_answer": min_answer,
            "function": f_2
        }
        
    @provide_data
    def graphics(data):

        return {
            "Show": plot(data["function"], (x,-6,6), ymin = -10, ymax = 10, color = 'red')
        }

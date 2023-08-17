class Generator(BaseGenerator):
    def data(self):
        x1 = randrange(-10,-5)
        x2 = randrange(x1,5)
        x3 = randrange(x2,10)
        test = randrange(x1,10)
        m1 = randrange(-9,10)
        b1 = randrange(-9,10)
        m2 = randrange(-9,10)
        b2 = randrange(-9,10)
        m3 = randrange(-9,10)
        b3 = randrange(-9,10)
        
        f1(x) = m1*x+b1
        f2(x) = m2*x+b2
        f3(x) = m3*x+b3
        
        f = piecewise([(RealSet.closed_open(x1,x2),f1(x)),(RealSet.closed_open(x2,x3),f2(x)),([x3,10],f3(x))], var=x)
        result = f(test)
        
        function_string = "f(x) = "
        function_string += "\\begin{cases} "
        function_string += latex(f1(x)) + " & " + str(x1) + " \\leq x < " + str(x2) + "\\\\ "
        function_string += latex(f2(x)) + " & " + str(x2) + " \\leq x < " + str(x3) + "\\\\ "
        function_string += latex(f3(x)) + " & " + str(x3) + " \\leq x < 10 \\\\"
        function_string += " \\end{cases} "

        return {
            "function": function_string,
            "input": test,
            "output": result,
        }

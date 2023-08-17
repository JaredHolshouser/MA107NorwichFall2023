class Generator(BaseGenerator):
    def data(self):
        #Choose a quadratic or a cubic quotient
        quotient_degree = randrange(2,4)
        
        #quadratic quotient
        if quotient_degree == 2:
            #Choose coefficients
            a = (-1)^randrange(0,2)*randrange(1,10)
            b = randrange(-9,10)
            c = randrange(-9,10)
            #Build the polynomial
            f(x) = a*x^2 + b*x + c
        
        #cubic quotient
        else:
            #Choose coefficients
            a = (-1)^randrange(0,2)*randrange(1,10)
            b = randrange(-9,10)
            c = randrange(-9,10)
            d = randrange(-9,10)
            #Build the polynomial
            f(x) = a*x^3 + b*x^2 + c*x + d
            
        #Choose what to divide by
        r = (-1)^randrange(0,2)*randrange(1,5)
        divisor(x) = x - r
        
        #Create the solution
        remainder = randrange(-2,3)
        if remainder < 0:
            solution = latex(f(x)) + latex(remainder/divisor(x))
        elif remainder == 0:
            solution = latex(f(x))
        else:
            solution = latex(f(x)) + " + " + latex(remainder/divisor(x))
        
        #Create the big polynomial
        big_polynomial = f(x)*divisor(x) + remainder
        big_polynomial_simplified = big_polynomial.full_simplify()
        
        #Write the fraction
        fraction = big_polynomial_simplified/divisor

        return {
            "big_polynomial_simplified": latex(big_polynomial_simplified(x=x)),
            "divisor": latex(divisor(x)),
            "solution": solution,
            "fraction": latex(fraction(x)),
        }

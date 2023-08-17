class Generator(BaseGenerator):
    def data(self):
        flip = randrange(0,2)
        
        if(flip == 0):
            a = randrange(2,10)
            b = randrange(-10,10)
            c = randrange(2,10)
            d = (-1)^randrange(1,3)
            f(x) = a/(b+c*d*x)

            miss = Rational(-b/(c*d))
            domain = RealSet(x != miss)
        else:
            a = randrange(2,10)
            b = randrange(-10,10)
            c = randrange(2,10)
            d = (-1)^randrange(1,3)
            f(x) = a*sqrt((b+c*d*x))

            miss = Rational(-b/(c*d))
            if(d > 0):
                domain = RealSet(x >= miss)  
            else:
                domain = RealSet(x <= miss)

        return {
            "function": f(x),
            "domain": domain,
        }

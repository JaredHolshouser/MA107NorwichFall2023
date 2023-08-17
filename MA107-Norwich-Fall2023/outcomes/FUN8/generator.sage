class Generator(BaseGenerator):
    def data(self):
        a = randrange(2,10)
        c = randrange(-9,10)
        d = randrange(1,10)
        e = randrange(1,10)
        
        eq = a*abs(x+c)-d == e
        x1 = Rational(Rational((e+d)/a) - c)
        x2 = Rational(Rational(-(e+d)/a) - c)
        low = min(x1,x2)
        high = max(x1,x2)
        
        abs_expr = abs(x+c)
        abs_str = latex(abs_expr)
        
        die = randrange(0,4)
        if die == 0:
            inequality = a*abs(x+c)-d < e
            interval = RealSet(low,high)
            trivial = str(a)+abs_str+ " < -1"
            trivial_answer = "There are no solutions"
        elif die == 1:
            inequality = a*abs(x+c)-d <= e
            interval = RealSet([low,high])
            trivial = str(a)+abs_str+ " \\leq -1"
            trivial_answer = "There are no solutions"
        elif die == 2:
            inequality = a*abs(x+c)-d > e
            interval = RealSet(x < low, x > high)
            trivial = str(a)+abs_str+ " > -1"
            trivial_answer = "The inequality is true for all real numbers"
        else:
            inequality = a*abs(x+c)-d >= e
            interval = RealSet(x <= low, x >= high)
            trivial = str(a)+abs_str+ " \\geq -1"
            trivial_answer = "The inequality is true for all real numbers"

        return {
            "equation": eq,
            "inequality": inequality,
            "answer1": low,
            "answer2": high,
            "interval": interval,
            "trivial": trivial,
            "trivial_answer": trivial_answer,
        }

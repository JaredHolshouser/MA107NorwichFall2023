class Generator(BaseGenerator):
    def data(self):

        # task1 stuff
        s1 = randrange(1,15);
        theta1 = pi/4;
        s1_location = choice(["leg","hyp"]);
        if s1_location == "leg":
            a1 = s1;
            b1 = s1;
            c1 = s1*sqrt(2);
            aprompt1 = "s";
            bprompt1 = "s";
            cprompt1 = str(s1) + r'$\sqrt{2}$';
        else:
            c1 = s1;
            a1 = s1/sqrt(2);
            b1 = s1/sqrt(2);
            aprompt1 = str(s1) + r'/' + r'$\sqrt{2}$';
            bprompt1 = str(s1) + r'/' + r'$\sqrt{2}$';
            cprompt1 = "s";






        # task2 stuff
        s2 = randrange(1,8)*2;
        theta2 = choice([pi/3,pi/6]);
        s2_location = choice(["short","long","hyp"]);
        if s2_location == "short":
            a2 = s2;
            b2 = s2*sqrt(3);
            c2 = 2*s2;
            aprompt2 = "s";
            bprompt2 = str(s2)+r'$\sqrt{3}$';
            cprompt2 = str(c2);
        elif s2_location == "long":
            a2 = s2/sqrt(3);
            b2 = s2;
            c2 = 2*s2/sqrt(3);
            c2ratl = 2*s2;
            aprompt2 = str(s2)+r'/'+r'$\sqrt{3}$';
            bprompt2 = "s";
            cprompt2 = str(c2ratl)+r'/'+r'$\sqrt{3}$';
        else:
            a2 = s2/2;
            b2 = s2*sqrt(3)/2;
            c2 = s2;
            aprompt2 = str(a2);
            bprompt2 = str(a2)+r'$\sqrt{3}$';
            cprompt2 = "s";


        # task3 stuff
        a3_unscaled = choice([3,5,8]);
        if a3_unscaled == 3:
            b3_unscaled = 4;
            c3_unscaled = 5;
            size3 = choice([1,2,3,4,5]);
        elif a3_unscaled == 8:
            b3_unscaled = 15;
            c3_unscaled = 17;
            size3 = choice([1,2])
        else:
            b3_unscaled = 12;
            c3_unscaled = 13;
            size3 = choice([1,2]);

        a3 = a3_unscaled*size3;
        b3 = b3_unscaled*size3;
        c3 = c3_unscaled*size3;


        s3 = choice([a3,b3,c3]);
        if s3 == a3:
            aprompt3 = "s";
            bprompt3 = str(b3);
            cprompt3 = str(c3);
        elif s3 == b3:
            aprompt3 = str(a3);
            bprompt3 = "s";
            cprompt3 = str(c3);
        else:
            aprompt3 = str(a3);
            bprompt3 = str(b3);
            cprompt3 = "s";



        theta3_location = choice(["bot","top"]);
        if theta3_location == "bot":
            theta3 = arctan(b3/a3);
        else:
            theta3 = arctan(a3/b3);


        return {
            "s1_value": s1,
            "s2_value": s2,
            "s3_value": s3,
            "a1": a1,
            "a2": a2,
            "a3": a3,
            "b1": b1,
            "b2": b2,
            "b3": b3,
            "c1": c1,
            "c2": c2,
            "c3": c3,
            "theta1_value_rad": theta1,
            "theta1_value_deg": theta1*180/pi,
            "theta2_value_rad": theta2,
            "theta2_value_deg": theta2*180/pi,
            "theta3_value_rad": round(n(theta3),2),
            "theta3_value_deg": round(n(theta3*180/pi),2),
            "theta3_location": theta3_location,
            "aprompt1": aprompt1,
            "bprompt1": bprompt1,
            "cprompt1": cprompt1,
            "aprompt2": aprompt2,
            "bprompt2": bprompt2,
            "cprompt2": cprompt2,
            "aprompt3": aprompt3,
            "bprompt3": bprompt3,
            "cprompt3": cprompt3,
        }

    @provide_data
    def graphics(data):

        A1 = data["a1"];
        B1 = data["b1"];
        C1 = data["c1"];
        A2 = data["a2"];
        B2 = data["b2"];
        C2 = data["c2"];
        A3 = data["a3"];
        B3 = data["b3"];
        C3 = data["c3"];

        eps1 = A1*.05;
        eps2 = A2*.05;
        eps3 = A3*.05;

        p1 = choice([(2*eps1,eps1),(A1-eps1,B1-2*eps1)]); 

        t2 = data["theta2_value_rad"];
        if t2==pi/6:
            p2 = (A2-eps2,B2-3*eps2);
        else:
            p2 = (2*eps2,eps2)

        t3 = data["theta3_location"];
        if t3 == "bot":
            p3 = (2*eps3,eps3)
        else:
            if B3/A3 == 4/3:
                p3 = (A3-eps3,B3-8/3*eps3);
            elif B3/A3 == 12/5:
                p3 = (A3-eps3,B3-24/5*eps3);
            elif B3/A3 == 15/8:
                p3 = (A3-eps3,B3-30/8*eps3)

        return {
            "Show1": polygon2d([(0,0),(A1,0),(A1,B1)],fill=False,axes=False) + text(data["aprompt1"],(A1/2,-eps1),color='black')+text(data["bprompt1"],(A1+eps1/2,B1/2),color='black',horizontal_alignment='left')+text(data["cprompt1"],(A1/2-eps1,B1/2+eps1),color='black')+text(r'$\theta$',p1,color='black'),
            "Show2": polygon2d([(0,0),(A2,0),(A2,B2)],fill=False,axes=False) + text(data["aprompt2"],(A2/2,-eps2),color='black')+text(data["bprompt2"],(A2+eps2/2,B2/2),color='black',horizontal_alignment='left')+text(data["cprompt2"],(A2/2-eps2,B2/2+eps2),color='black')+text(r'$\theta$',p2,color='black'),
            "Show3": polygon2d([(0,0),(A3,0),(A3,B3)],fill=False,axes=False) + text(data["aprompt3"],(A3/2,-eps3),color='black')+text(data["bprompt3"],(A3+eps3/2,B3/2),color='black',horizontal_alignment='left')+text(data["cprompt3"],(A3/2-eps3,B3/2+eps3),color='black')+text(r'$\theta$',p3,color='black'),
        }

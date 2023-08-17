class Generator(BaseGenerator):
    def data(self):
        x,t = var('x,t')
        L1 = [i*pi/6 for i in range(13)];
        L2 = [(2*j+1)*pi/4 for j in range(4)];
        pts = L1+L2

        f = choice([sin,cos]);


        #task2 stuff
        A = randrange(2,15)*choice([-1,1]);
        

        option = choice(["phase_shift","period_change"]);
        if option == "phase_shift":
            phase = choice([pi/6,pi/4,pi/3,pi/2])*choice([-2,-1,1,2]);
            per_fact = 1;
            period = 2*pi;
            xstart = phase;
        else:
            phase = 0;
            per_fact = choice([2,3,4,5,6])^(choice([1,-1]));
            period = 2*pi/per_fact;
            xstart = 0;


        xend = xstart + period;
        ext_pts = [phase + i*period/4 for i in range(5)];
        tickmarks = ext_pts; #[phase + period/4, phase+period/2, phase+3*period/4];

        



        return {
            "f": f,
            "pts": pts,
            "A": A,
            "amp": abs(A),
            "T": period,
            "arg": per_fact*(x-phase),
            "xstart": xstart,
            "xend": xend,
            "epts": ext_pts,
            "tickmarks": tickmarks,
        }

    @provide_data
    def graphics(data):

        return {
            "Show1": plot(data["f"](x),(x,0,2*pi),ticks=[pi/6,1/2], tick_formatter=[pi,1/2])+points([(t,data["f"](t)) for t in data["pts"]],pointsize=20,color="blue"),
            "Show2": plot(data["A"]*data["f"](data["arg"]),(x,data["xstart"],data["xend"]),ticks=[data["tickmarks"],None],tick_formatter=pi)
        }
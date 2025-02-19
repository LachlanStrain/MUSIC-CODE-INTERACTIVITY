(
SynthDef.new(\BigGuy, {
	arg freq = 100;
	var temp, sum;
	sum = 0;
		60.do{
			arg count;
			temp = SinOsc.ar(freq * (count + 1)
			*Saw.kr({Rand(0.8,0.1)}!2).range(0.85,1.15)
			);
			sum = sum + temp; //increment
		};
	sum = sum * 0.05;
	Out.ar(0, sum);
	}).add;
)

x = Synth(\BigGuy);
x.free
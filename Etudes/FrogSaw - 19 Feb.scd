n = NodeProxy.audio(s, 2); //audio rate NP running on default server! 2 ch
n.fadeTime = 2; //specify the fadetime
n.source = {SinOsc.ar(440, 0, 0.4)}; //fill arbitrary function
n.play //turns on the node(play method)
n.free //stop without changing what's in the proxy

(
n[0..2]= {
	arg max=8, pitch=50;
	var frog1, frog2, out, sig, mix;
	frog1= Mix.ar(SinOsc.ar(exprand(0.3,max) * [rrand(0.7,1.3),1], [2pi.rand,2pi.rand], 0.1)).max(0);
	frog2= Mix.ar(SinOsc.ar(exprand(6,24) * [rrand(0.7,1.3),1], [2pi.rand,2pi.rand], 0.1)).abs;
	sig = SinOsc.ar(rrand(1,20)*pitch, 2pi.rand, frog1*frog2);
	out = Pan2.ar(sig, 1.0.rand2);
};
)

n.gui
w = n.gui; //This returns an NdefGui
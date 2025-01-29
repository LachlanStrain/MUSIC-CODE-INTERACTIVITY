(s.boot;)
(
FreqScope.new;
Stethoscope.new;
)

(
{
	[ SinOsc.ar(200, 0, 0.05) + SinOsc.ar(SinOsc.ar(XLine.kr(1, 1000, 5), 0, 200, 800), 0, 	0.06)] //Swoopin Bouncin Sine Wave + Carrier
}.play;
{
	[Saw.ar(440, 0.01, 0.1) + SinOsc.ar(523, 0.01, 0.1) + SinOsc.ar(329.5, 0.01, 0.1) + Saw.ar(830, 0.001, 0.1)] //Amaj7 Chord
}.play;
{
 var ampOsc;
    ampOsc = SinOsc.kr(0.5, 0.5pi, 0.5, 0.00000001);
    SinOsc.ar(440, 0, ampOsc); //High Sine Wave Oscillator w/ trem
}.play;


{
    var amp, density, dmul, dadd, signal, freq, volume;
    amp = 0.07;
    density = MouseX.kr(0.01, 1);  //Density controlled by mouse X-axis
    dmul = density.reciprocal * 0.5 * amp;
    dadd = dmul.neg + amp;
    freq = MouseX.kr(100, 1000); //Freq controlled by the mouse X-axis
    volume = MouseY.kr(0, 0.5); //Volume controlled by mouse Y-axis
    signal = Mix.ar([
        SinOsc.ar(freq, 0.01, 0.4) //Sine controlled by the mouse X-axis
    ]);
    5.do {
        signal = AllpassN.ar(signal, 0.05, [0.05.rand, 0.05.rand], 1); //Random delay
    };
    signal = LeakDC.ar(signal, 0.995); //Leak DC offset
    signal = signal * volume;
    signal
}.play;
)
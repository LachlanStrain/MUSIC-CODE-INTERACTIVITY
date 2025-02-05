(
{
    var levels, times, doneAction, env, a;
    a = SinOsc.ar(440, 0, 0.1);  // Sine wave
    a = RLPF.ar(a, [300, 500], 0.05).softclip * 0.1;  // Sine wave filter

    doneAction = 2;  // When the envelope finishes, it will dispose of the synth
    levels = [0, 0.8, 0.8, 0];
    times = [1, 3, 2];
    env = Env(levels, times);
    env = env.kr(doneAction);
    env = env.lincurve(0, 1, 0, 4, 3); // Envelope curve

    a = env * a; // Put envelope on sine wave

    a
}.play;
)
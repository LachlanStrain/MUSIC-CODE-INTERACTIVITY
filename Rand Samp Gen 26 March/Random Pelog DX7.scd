(
~dirpath = "/Users/lachie/Desktop/SuperCollider/Rand Samp Gen/Pelog DX7 - 26 March/*".resolveRelative;
~filepaths = ~dirpath.pathMatch;
~buffers = ~filepaths.collect { |path| Buffer.readChannel(s, path, channels: [0]) };
~waitTime = 0.2;

s.options.maxSynthDefs = 2048;
s.boot;

s.waitForBoot({
    ~np = NodeProxy.audio(s, 2);
    ~np.source = nil;
    ~np.play;
});

~bigguy = Task({
    "Playing Big Guy...".postln;
    inf.do {
        var buf = ~buffers.choose;
        var rate = [-12, -5, 0, 5, 12].choose.midiratio;

        ~np.add({
            Pan2.ar(
                PlayBuf.ar(buf.numChannels, buf.bufnum, rate: rate, doneAction: 2)
                * rrand(-20, 0).dbamp,
                Rand(-1.0, 1.0)
            )
        });

        ~waitTime.wait;
    };
});

~start = { ~bigguy.play; "Starting Playback...".postln; };
~stop = { ~bigguy.stop; ~np.clear; "Stopping Playback...".postln; };

"SIMPLE CONTROLS:".postln;
"~start.value - Start playback".postln;
"~stop.value - Stop playback".postln;
)

~start.value
~stop.value
#!/bin/sh
#KDZU Custom Theme for OpenNDS
#Copyright (C) 2025
#This software is released under the GNU GPL license.

# Title of this theme:
title="KDZU All Is Not Lost Theme"

# functions:

generate_splash_sequence() {
	kdzu_splash
}

header() {
	# Define a common header html for every page served
	gatewayurl=$(printf "${gatewayurl//%/\\x}")
	echo "<!DOCTYPE html>
	<html lang=\"en\">
	<head>
		<meta http-equiv=\"Cache-Control\" content=\"no-cache, no-store, must-revalidate\">
		<meta http-equiv=\"Pragma\" content=\"no-cache\">
		<meta http-equiv=\"Expires\" content=\"0\">
		<meta charset=\"UTF-8\">
		<meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
		<title>KDZU :: ALL IS NOT LOST</title>
		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			body {
				background: #0a0a0a;
				color: #e8e8e8;
				font-family: 'Courier New', Courier, monospace;
				line-height: 1.6;
				overflow-x: hidden;
			}

			.container {
				max-width: 900px;
				margin: 0 auto;
				padding: 20px;
			}

			header {
				text-align: center;
				padding: 40px 20px;
				border-bottom: 3px solid #ff0066;
				margin-bottom: 40px;
				position: relative;
			}

			.glitch {
				font-size: clamp(2.5rem, 8vw, 5rem);
				font-weight: bold;
				letter-spacing: 0.1em;
				text-transform: uppercase;
				position: relative;
				display: inline-block;
				color: #00ff88;
				text-shadow: 
					2px 2px 0 #ff0066,
					-2px -2px 0 #00ccff;
			}

			.subtitle {
				font-size: clamp(1rem, 3vw, 1.5rem);
				color: #ff0066;
				margin-top: 10px;
				letter-spacing: 0.3em;
				text-transform: uppercase;
			}

			.tagline {
				font-size: clamp(0.8rem, 2vw, 1rem);
				color: #888;
				margin-top: 15px;
				font-style: italic;
				letter-spacing: 0.05em;
			}

			section {
				margin: 60px 0;
				padding: 30px;
				border: 2px solid #333;
				background: rgba(255, 255, 255, 0.02);
				position: relative;
			}

			section::before {
				content: '';
				position: absolute;
				top: -2px;
				left: -2px;
				right: -2px;
				bottom: -2px;
				background: linear-gradient(45deg, #ff0066, #00ff88, #00ccff, #ff0066);
				z-index: -1;
				opacity: 0;
				transition: opacity 0.3s;
			}

			section:hover::before {
				opacity: 0.1;
			}

			h2 {
				font-size: clamp(1.5rem, 4vw, 2.5rem);
				color: #00ff88;
				margin-bottom: 20px;
				text-transform: uppercase;
				letter-spacing: 0.05em;
				border-bottom: 2px solid #ff0066;
				padding-bottom: 10px;
			}

			h3 {
				font-size: clamp(1.2rem, 3vw, 1.8rem);
				color: #00ccff;
				margin: 25px 0 15px;
				text-transform: uppercase;
				letter-spacing: 0.05em;
			}

			p {
				margin-bottom: 20px;
				font-size: clamp(0.9rem, 2vw, 1.1rem);
				text-align: justify;
				color: #ccc;
			}

			.highlight {
				color: #ff0066;
				font-weight: bold;
				text-transform: uppercase;
			}

			.emphasis {
				color: #00ff88;
				font-style: italic;
			}

			.artifact-list {
				list-style: none;
				padding-left: 20px;
				margin: 20px 0;
			}

			.artifact-list li {
				margin: 10px 0;
				position: relative;
				padding-left: 25px;
				color: #aaa;
			}

			.artifact-list li::before {
				content: '▸';
				position: absolute;
				left: 0;
				color: #00ff88;
				font-size: 1.2em;
			}

			.quote-block {
				border-left: 4px solid #ff0066;
				padding: 20px;
				margin: 30px 0;
				background: rgba(255, 0, 102, 0.05);
				font-style: italic;
				color: #ddd;
			}

			.transmission {
				background: #111;
				border: 1px dashed #00ff88;
				padding: 15px;
				margin: 20px 0;
				font-family: 'Courier New', monospace;
				font-size: 0.9rem;
				color: #00ff88;
			}

			.continue-btn {
				display: block;
				width: 100%;
				max-width: 400px;
				margin: 60px auto;
				padding: 20px 40px;
				background: transparent;
				color: #00ff88;
				border: 3px solid #00ff88;
				font-size: clamp(1rem, 3vw, 1.5rem);
				font-weight: bold;
				text-transform: uppercase;
				letter-spacing: 0.1em;
				cursor: pointer;
				transition: all 0.3s;
				text-align: center;
				text-decoration: none;
				font-family: 'Courier New', Courier, monospace;
			}

			.continue-btn:hover {
				background: #00ff88;
				color: #0a0a0a;
				box-shadow: 0 0 20px rgba(0, 255, 136, 0.5);
			}

			footer {
				text-align: center;
				padding: 40px 20px;
				border-top: 2px solid #333;
				margin-top: 60px;
				color: #666;
				font-size: 0.9rem;
			}

			.static-overlay {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: 
					repeating-linear-gradient(
						0deg,
						transparent,
						transparent 2px,
						rgba(0, 0, 0, 0.03) 2px,
						rgba(0, 0, 0, 0.03) 4px
					);
				pointer-events: none;
				z-index: 9999;
			}

			@media (max-width: 768px) {
				section {
					padding: 20px;
					margin: 40px 0;
				}

				.container {
					padding: 15px;
				}

				header {
					padding: 30px 15px;
				}
			}

			.ascii-art {
				font-family: monospace;
				color: #666;
				font-size: 0.7rem;
				line-height: 1.2;
				text-align: center;
				margin: 20px 0;
				overflow-x: auto;
			}
		</style>
	</head>
	<body>
		<div class=\"static-overlay\"></div>
	"
}

footer() {
	# Define a common footer html for every page served
	echo "
		<script>
			// Subtle glitch effect on title
			const glitchElement = document.querySelector('.glitch');
			if (glitchElement) {
				setInterval(() => {
					if (Math.random() > 0.95) {
						glitchElement.style.textShadow = \`
							\${Math.random() * 4 - 2}px \${Math.random() * 4 - 2}px 0 #ff0066,
							\${Math.random() * 4 - 2}px \${Math.random() * 4 - 2}px 0 #00ccff
						\`;
						setTimeout(() => {
							glitchElement.style.textShadow = '2px 2px 0 #ff0066, -2px -2px 0 #00ccff';
						}, 50);
					}
				}, 100);
			}
		</script>
	</body>
	</html>
	"
}

kdzu_splash() {
	header
	
	echo "
	<div class=\"container\">
		<header>
			<h1 class=\"glitch\">KDZU</h1>
			<div class=\"subtitle\">All Is Not Lost</div>
			<div class=\"tagline\">You have entered a frequency of resistance</div>
			<div class=\"ascii-art\">
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
 ▓▓▒▒░░  TACTICAL MYTHMAKING IN PROGRESS  ░░▒▒▓▓
░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
			</div>
		</header>

		<section>
			<h2>∴ Tactical Artifacts ∴</h2>
			
			<p>
				You found a lost object. You found a found signal. Each item found is what <span class=\"highlight\">KDZU</span> refers to as a 
				<span class=\"emphasis\">\"tactical artifact\"</span>: a constructed object embedded with narrative 
				fragments and encoded transmissions from the world of the KDZU pirate radio station and its 
				predecessor, <span class=\"highlight\">OMSA</span> (Of Memory, Silence, and Artifacts), an underground 
				anarcho-collectivist engineering and art group based in Memphis, Tennessee, which squatted the 
				Memphis Pyramid and was later raided and disbanded in 1994.
			</p>

			<div class=\"transmission\">
				&gt;&gt; TRANSMISSION LOG :: EST. 1989-1994<br>
				&gt;&gt; LOCATION: MEMPHIS PYRAMID<br>
				&gt;&gt; STATUS: DISPERSED / FREQUENCY MAINTAINED<br>
				&gt;&gt; ARTIFACTS DEPLOYED: ONGOING
			</div>

			<h3>Objects of Ontological Camouflage</h3>

			<p>
				The found objects of <span class=\"highlight\">\"All Is Not Lost\"</span> operate using 
				<span class=\"emphasis\">ontological camouflage</span>. They appear benign, socially neutral, 
				and personally familiar, designed to invite inspection without suspicion.
			</p>

			<p>
				The found wallet, for example, is an object nearly everyone feels obligated to open. 
				<span class=\"emphasis\">\"Maybe I can contact the owner,\"</span> a person might think. 
				This socially acceptable intrusion is KDZU's mechanism of intervention.
			</p>

			<div class=\"quote-block\">
				Instead of finding a driver's license or emergency contact card inside the wallet, 
				the finder/participant encounters communiques and ephemera from KDZU.
			</div>

			<ul class=\"artifact-list\">
				<li>A handmade map to a nearby destination</li>
				<li>A username and password for a wifi network</li>
				<li>A set of instructions written on the back of a receipt</li>
				<li>The mitten, the sunglasses, the paperback book</li>
			</ul>

			<p>
				What appears to be an act of helpful return becomes a <span class=\"highlight\">moment of 
				narrative destabilization</span>. The moment of discovery triggers a shift in perception. 
				The finder/participant is <span class=\"emphasis\">implicated, activated, and drawn into a 
				speculative system</span>. The wallet, like the mitten, the sunglasses, and the paperback book, 
				acts as a vessel of plausible fiction, slipping under the radar of disbelief into KDZU's 
				alternate realities.
			</p>
		</section>

		<section>
			<h2>∴ Brechtian Alienation ∴</h2>
			
			<p>
				<span class=\"highlight\">KDZU</span> employs <span class=\"emphasis\">Brechtian techniques of 
				alienation</span>, deliberately revealing the radio station's autofictionally constructed nature. 
				Rather than attempting to fully immerse our audience in a seamless fictional world, KDZU 
				foregrounds its own fabrication.
			</p>

			<p>
				This self-revealing structure <span class=\"highlight\">rejects narrative closure</span> and 
				encourages viewer/participants to engage critically, to question the legitimacy of their 
				received truths, and to recognize the constructedness of all narratives, not just the 
				fictional ones.
			</p>

			<div class=\"quote-block\">
				By making the seams of its world-stitching visible, KDZU repositions the audience not as 
				consumers of myth, but as co-builders within the framework.
			</div>

			<h3>Tactical Mythmaking</h3>

			<p>
				The project assumes that we can <span class=\"emphasis\">hold both fiction and reality 
				simultaneously</span>—it respects the human ability to navigate ambiguity with insight 
				and meaning-making. KDZU maintains enough internal coherence to evoke belief and action, 
				while remaining transparent about its artifice.
			</p>

			<div class=\"transmission\">
				&gt;&gt; OPERATIONAL PRINCIPLE::<br>
				&gt;&gt; PLAUSIBILITY + EXPOSURE = TACTICAL INTERVENTION<br>
				&gt;&gt; FICTION ⊕ REALITY = MYTHMAKING<br>
				&gt;&gt; STATUS: THE SEAMS ARE VISIBLE BY DESIGN
			</div>

			<p>
				This balance between plausibility and exposure is key to what we call 
				<span class=\"highlight\">tactical mythmaking</span>: the intentional crafting of speculative 
				stories, symbolic structures, and complex fictions meant to mystify and disrupt, ultimately 
				<span class=\"emphasis\">shifting perceptions and reclaiming authority from mainstream narratives 
				and power structures</span>.
			</p>
		</section>

		<section>
			<h2>∴ You Are Now Implicated ∴</h2>
			
			<p>
				By reading this, by connecting to this network, you have become a 
				<span class=\"emphasis\">finder/participant</span>. You have opened the wallet. You have 
				picked up the mitten. You have discovered the frequency.
			</p>

			<p>
				The question is not whether this is real or fiction. The question is: 
				<span class=\"highlight\">what will you do with this transmission?</span>
			</p>

			<div class=\"transmission\">
				&gt;&gt; FREQUENCY: 93.7 FM (SPECTRAL)<br>
				&gt;&gt; BROADCAST: CONTINUOUS<br>
				&gt;&gt; PARTICIPATION: ACTIVATED<br>
				&gt;&gt; ALL IS NOT LOST
			</div>
		</section>

		<form method=\"GET\" action=\"$gatewayurl\">
			<input type=\"hidden\" name=\"clientip\" value=\"$clientip\">
			<input type=\"hidden\" name=\"gatewayname\" value=\"$gatewayname\">
			<input type=\"hidden\" name=\"tok\" value=\"$tok\">
			<input type=\"hidden\" name=\"redir\" value=\"$originurl\">
			<button type=\"submit\" class=\"continue-btn\">⟫ Continue Transmission ⟪</button>
		</form>

		<footer>
			<p>KDZU Radio Network :: Goldfield, NV Los Angeles, CA Mesa, AZ New London, CT :: Frequencies Unknown</p>
			<p>We are looking for OMSA (Of Memory, Silence, and Artifacts) :: 1989-1994 :: The Pyramid Remembers</p>
			<p style=\"margin-top: 20px; font-size: 0.8rem;\">
				This network is a tactical artifact. Your connection is a participation.
			</p>
		</footer>
	</div>
	"
	
	footer
}

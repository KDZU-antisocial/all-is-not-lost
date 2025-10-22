#!/bin/sh
#Void Whispers Theme for OpenNDS
#Copyright (C) 2025
#This software is released under the GNU GPL license.

# Title of this theme:
title="Void Whispers - The Forgotten Frequency"

# functions:

generate_splash_sequence() {
	void_splash
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
		<title>◈ VOID WHISPERS ◈</title>
		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			body {
				background: #000000;
				color: #9b87c7;
				font-family: 'Georgia', 'Times New Roman', serif;
				line-height: 1.8;
				overflow-x: hidden;
				position: relative;
			}

			body::before {
				content: '';
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				background: 
					radial-gradient(ellipse at 20% 30%, rgba(75, 0, 130, 0.1) 0%, transparent 50%),
					radial-gradient(ellipse at 80% 70%, rgba(139, 0, 139, 0.08) 0%, transparent 50%),
					radial-gradient(ellipse at 50% 50%, rgba(25, 25, 112, 0.05) 0%, transparent 70%);
				pointer-events: none;
				z-index: 0;
			}

			.void-particles {
				position: fixed;
				top: 0;
				left: 0;
				width: 100%;
				height: 100%;
				pointer-events: none;
				z-index: 1;
				overflow: hidden;
			}

			.particle {
				position: absolute;
				width: 2px;
				height: 2px;
				background: rgba(155, 135, 199, 0.3);
				border-radius: 50%;
				animation: float 20s infinite ease-in-out;
			}

			@keyframes float {
				0%, 100% { transform: translateY(0) translateX(0); opacity: 0; }
				10% { opacity: 0.6; }
				90% { opacity: 0.6; }
				50% { transform: translateY(-100vh) translateX(50px); }
			}

			.container {
				max-width: 800px;
				margin: 0 auto;
				padding: 20px;
				position: relative;
				z-index: 2;
			}

			header {
				text-align: center;
				padding: 60px 20px 40px;
				border-bottom: 1px solid rgba(155, 135, 199, 0.2);
				margin-bottom: 40px;
				position: relative;
			}

			.sigil-container {
				margin: 0 auto 30px;
				width: 120px;
				height: 120px;
				position: relative;
				animation: pulse-glow 4s ease-in-out infinite;
			}

			@keyframes pulse-glow {
				0%, 100% { filter: drop-shadow(0 0 10px rgba(155, 135, 199, 0.5)); }
				50% { filter: drop-shadow(0 0 25px rgba(155, 135, 199, 0.8)); }
			}

			.sigil-image {
				width: 100%;
				height: 100%;
				opacity: 0.9;
			}

			.title {
				font-size: clamp(2rem, 6vw, 3.5rem);
				font-weight: normal;
				letter-spacing: 0.3em;
				text-transform: uppercase;
				position: relative;
				display: inline-block;
				color: #c8b5e8;
				text-shadow: 
					0 0 10px rgba(155, 135, 199, 0.8),
					0 0 20px rgba(75, 0, 130, 0.6),
					0 0 30px rgba(139, 0, 139, 0.4);
				margin-bottom: 15px;
			}

			.subtitle {
				font-size: clamp(0.9rem, 2.5vw, 1.2rem);
				color: #7d6ba8;
				margin-top: 10px;
				letter-spacing: 0.2em;
				font-style: italic;
			}

			.whisper-text {
				font-size: clamp(0.7rem, 1.8vw, 0.9rem);
				color: #554466;
				margin-top: 20px;
				letter-spacing: 0.1em;
				opacity: 0.7;
				font-style: italic;
			}

			section {
				margin: 50px 0;
				padding: 40px 30px;
				border: 1px solid rgba(155, 135, 199, 0.15);
				background: rgba(25, 25, 112, 0.05);
				position: relative;
				backdrop-filter: blur(10px);
			}

			section::before {
				content: '◈';
				position: absolute;
				top: -12px;
				left: 50%;
				transform: translateX(-50%);
				font-size: 1.5rem;
				color: #9b87c7;
				background: #000;
				padding: 0 10px;
			}

			h2 {
				font-size: clamp(1.4rem, 3.5vw, 2rem);
				color: #c8b5e8;
				margin-bottom: 25px;
				text-transform: uppercase;
				letter-spacing: 0.15em;
				text-align: center;
				font-weight: normal;
			}

			h3 {
				font-size: clamp(1.1rem, 2.8vw, 1.5rem);
				color: #9b87c7;
				margin: 30px 0 15px;
				text-transform: uppercase;
				letter-spacing: 0.1em;
				font-weight: normal;
				border-bottom: 1px solid rgba(155, 135, 199, 0.2);
				padding-bottom: 8px;
			}

			p {
				margin-bottom: 20px;
				font-size: clamp(0.95rem, 2vw, 1.1rem);
				color: #8877aa;
				text-align: justify;
				line-height: 1.9;
			}

			.ritual-mark {
				color: #c8b5e8;
				font-weight: bold;
				font-style: italic;
				text-shadow: 0 0 5px rgba(155, 135, 199, 0.5);
			}

		.void-voice {
			color: #554466;
			font-style: italic;
			font-size: 0.95em;
			letter-spacing: 0.05em;
		}

		.philosophical {
			color: #c8b5e8;
			font-style: italic;
		}

			.symbol-list {
				list-style: none;
				padding-left: 30px;
				margin: 25px 0;
			}

			.symbol-list li {
				margin: 15px 0;
				position: relative;
				padding-left: 20px;
				color: #7d6ba8;
			}

			.symbol-list li::before {
				content: '⟡';
				position: absolute;
				left: -10px;
				color: #9b87c7;
				font-size: 1.1em;
			}

			.incantation-box {
				border: 1px solid rgba(155, 135, 199, 0.3);
				padding: 25px;
				margin: 30px 0;
				background: rgba(75, 0, 130, 0.08);
				font-style: italic;
				color: #9b87c7;
				text-align: center;
				position: relative;
			}

			.incantation-box::before,
			.incantation-box::after {
				content: '◈ ◈ ◈';
				display: block;
				color: #554466;
				font-size: 0.8rem;
				letter-spacing: 0.5em;
				margin: 10px 0;
			}

			.transmission-void {
				background: rgba(0, 0, 0, 0.6);
				border: 1px dashed #9b87c7;
				padding: 20px;
				margin: 25px 0;
				font-family: 'Courier New', monospace;
				font-size: 0.85rem;
				color: #7d6ba8;
				text-align: center;
				letter-spacing: 0.05em;
			}

			.glyph-image {
				display: block;
				margin: 30px auto;
				max-width: 200px;
				opacity: 0.7;
				filter: drop-shadow(0 0 10px rgba(155, 135, 199, 0.4));
			}

			.continue-btn {
				display: block;
				width: 100%;
				max-width: 450px;
				margin: 60px auto;
				padding: 25px 40px;
				background: transparent;
				color: #c8b5e8;
				border: 2px solid #9b87c7;
				font-size: clamp(1rem, 3vw, 1.3rem);
				font-weight: normal;
				text-transform: uppercase;
				letter-spacing: 0.2em;
				cursor: pointer;
				transition: all 0.5s ease;
				text-align: center;
				text-decoration: none;
				font-family: 'Georgia', 'Times New Roman', serif;
				position: relative;
				overflow: hidden;
			}

			.continue-btn::before {
				content: '';
				position: absolute;
				top: 50%;
				left: 50%;
				width: 0;
				height: 0;
				border-radius: 50%;
				background: rgba(155, 135, 199, 0.2);
				transform: translate(-50%, -50%);
				transition: width 0.5s, height 0.5s;
			}

			.continue-btn:hover::before {
				width: 500px;
				height: 500px;
			}

			.continue-btn:hover {
				border-color: #c8b5e8;
				box-shadow: 
					0 0 20px rgba(155, 135, 199, 0.4),
					inset 0 0 20px rgba(155, 135, 199, 0.1);
				text-shadow: 0 0 10px rgba(155, 135, 199, 0.8);
			}

			.continue-btn span {
				position: relative;
				z-index: 1;
			}

			footer {
				text-align: center;
				padding: 50px 20px;
				border-top: 1px solid rgba(155, 135, 199, 0.2);
				margin-top: 60px;
				color: #554466;
				font-size: 0.85rem;
				font-style: italic;
			}

			.coordinates {
				margin: 15px 0;
				letter-spacing: 0.1em;
				opacity: 0.8;
			}

			@media (max-width: 768px) {
				section {
					padding: 30px 20px;
					margin: 40px 0;
				}

				.container {
					padding: 15px;
				}

				header {
					padding: 40px 15px 30px;
				}

				.sigil-container {
					width: 90px;
					height: 90px;
				}
			}

		.flicker {
			animation: flicker 3s infinite alternate;
		}

		@keyframes flicker {
			0%, 100% { opacity: 1; }
			50% { opacity: 0.7; }
		}

		.mystical-stones {
			position: fixed;
			top: 0;
			left: 0;
			width: 100%;
			height: 100%;
			pointer-events: none;
			z-index: 1;
			overflow: hidden;
		}

		.stone {
			position: absolute;
			opacity: 0;
			animation: stone-drift 25s infinite ease-in-out;
		}

		@keyframes stone-drift {
			0% { 
				opacity: 0;
				transform: translateY(100vh) translateX(0) rotate(0deg);
			}
			10% { opacity: 0.3; }
			50% { 
				opacity: 0.5;
				transform: translateY(50vh) translateX(40px) rotate(180deg);
			}
			90% { opacity: 0.3; }
			100% { 
				opacity: 0;
				transform: translateY(-20vh) translateX(80px) rotate(360deg);
			}
		}
	</style>
</head>
<body>
	<div class=\"void-particles\" id=\"particles\"></div>
	<div class=\"mystical-stones\" id=\"stones\"></div>
	"
}

footer() {
	# Define a common footer html for every page served
	echo "
		<script>
			// Create floating particles
			const particlesContainer = document.getElementById('particles');
			for (let i = 0; i < 30; i++) {
				const particle = document.createElement('div');
				particle.className = 'particle';
				particle.style.left = Math.random() * 100 + '%';
				particle.style.animationDelay = Math.random() * 20 + 's';
				particle.style.animationDuration = (15 + Math.random() * 10) + 's';
				particlesContainer.appendChild(particle);
			}

			// Create mystical floating stones
			const stonesContainer = document.getElementById('stones');
			const stoneShapes = [
				// Elongated crystal
				'<svg viewBox=\"0 0 40 60\" xmlns=\"http://www.w3.org/2000/svg\"><defs><linearGradient id=\"sg1\" x1=\"0%\" y1=\"0%\" x2=\"100%\" y2=\"100%\"><stop offset=\"0%\" style=\"stop-color:#9b87c7;stop-opacity:0.3\"/><stop offset=\"50%\" style=\"stop-color:#c8b5e8;stop-opacity:0.5\"/><stop offset=\"100%\" style=\"stop-color:#9b87c7;stop-opacity:0.3\"/></linearGradient></defs><polygon points=\"20,5 30,20 25,50 15,50 10,20\" fill=\"url(#sg1)\" stroke=\"#c8b5e8\" stroke-width=\"0.5\" opacity=\"0.6\"/></svg>',
				// Round crystal
				'<svg viewBox=\"0 0 50 50\" xmlns=\"http://www.w3.org/2000/svg\"><defs><radialGradient id=\"sg2\"><stop offset=\"0%\" style=\"stop-color:#c8b5e8;stop-opacity:0.6\"/><stop offset=\"100%\" style=\"stop-color:#9b87c7;stop-opacity:0.2\"/></radialGradient></defs><circle cx=\"25\" cy=\"25\" r=\"20\" fill=\"url(#sg2)\" stroke=\"#c8b5e8\" stroke-width=\"0.5\" opacity=\"0.5\"/><circle cx=\"25\" cy=\"25\" r=\"15\" fill=\"none\" stroke=\"#c8b5e8\" stroke-width=\"0.3\" opacity=\"0.4\"/></svg>',
				// Angular shard
				'<svg viewBox=\"0 0 45 55\" xmlns=\"http://www.w3.org/2000/svg\"><defs><linearGradient id=\"sg3\" x1=\"0%\" y1=\"0%\" x2=\"0%\" y2=\"100%\"><stop offset=\"0%\" style=\"stop-color:#c8b5e8;stop-opacity:0.4\"/><stop offset=\"100%\" style=\"stop-color:#7d6ba8;stop-opacity:0.3\"/></linearGradient></defs><polygon points=\"22,5 35,15 38,40 22,50 7,40 10,15\" fill=\"url(#sg3)\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.6\"/></svg>',
				// Flat crystal
				'<svg viewBox=\"0 0 55 35\" xmlns=\"http://www.w3.org/2000/svg\"><defs><linearGradient id=\"sg4\" x1=\"0%\" y1=\"0%\" x2=\"100%\" y2=\"0%\"><stop offset=\"0%\" style=\"stop-color:#7d6ba8;stop-opacity:0.3\"/><stop offset=\"50%\" style=\"stop-color:#c8b5e8;stop-opacity:0.5\"/><stop offset=\"100%\" style=\"stop-color:#7d6ba8;stop-opacity:0.3\"/></linearGradient></defs><ellipse cx=\"27\" cy=\"17\" rx=\"25\" ry=\"15\" fill=\"url(#sg4)\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.5\"/></svg>'
			];

			for (let i = 0; i < 20; i++) {
				const stone = document.createElement('div');
				stone.className = 'stone';
				stone.innerHTML = stoneShapes[Math.floor(Math.random() * stoneShapes.length)];
				stone.style.left = Math.random() * 100 + '%';
				stone.style.width = (35 + Math.random() * 60) + 'px';
				stone.style.animationDelay = (i * 1.5) + 's';
				stone.style.animationDuration = (12 + Math.random() * 12) + 's';
				stonesContainer.appendChild(stone);
			}

			// Subtle title flicker effect
			const title = document.querySelector('.title');
			if (title) {
				setInterval(() => {
					if (Math.random() > 0.97) {
						title.style.textShadow = \`
							0 0 \${Math.random() * 20 + 10}px rgba(155, 135, 199, \${Math.random() * 0.5 + 0.5}),
							0 0 \${Math.random() * 30 + 10}px rgba(75, 0, 130, \${Math.random() * 0.4 + 0.4}),
							0 0 \${Math.random() * 40 + 10}px rgba(139, 0, 139, \${Math.random() * 0.3 + 0.3})
						\`;
						setTimeout(() => {
							title.style.textShadow = '0 0 10px rgba(155, 135, 199, 0.8), 0 0 20px rgba(75, 0, 130, 0.6), 0 0 30px rgba(139, 0, 139, 0.4)';
						}, 100);
					}
				}, 150);
			}

			// Random whispers
			const whispers = ['listening...', 'watching...', 'waiting...', 'remembering...', 'forgetting...'];
			const whisperElement = document.querySelector('.whisper-text');
			if (whisperElement) {
				setInterval(() => {
					if (Math.random() > 0.8) {
						whisperElement.textContent = whispers[Math.floor(Math.random() * whispers.length)];
					}
				}, 5000);
			}
		</script>
	</body>
	</html>
	"
}

void_splash() {
	header
	
	echo "
	<div class=\"container\">
		<header>
			<div class=\"sigil-container\">
				<svg class=\"sigil-image\" viewBox=\"0 0 200 200\" xmlns=\"http://www.w3.org/2000/svg\">
					<defs>
						<filter id=\"glow\">
							<feGaussianBlur stdDeviation=\"3\" result=\"coloredBlur\"/>
							<feMerge>
								<feMergeNode in=\"coloredBlur\"/>
								<feMergeNode in=\"SourceGraphic\"/>
							</feMerge>
						</filter>
					</defs>
					<!-- Outer circle -->
					<circle cx=\"100\" cy=\"100\" r=\"80\" fill=\"none\" stroke=\"#9b87c7\" stroke-width=\"1.5\" opacity=\"0.6\"/>
					<circle cx=\"100\" cy=\"100\" r=\"70\" fill=\"none\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
					
					<!-- Center eye/void -->
					<circle cx=\"100\" cy=\"100\" r=\"15\" fill=\"#9b87c7\" opacity=\"0.3\"/>
					<circle cx=\"100\" cy=\"100\" r=\"8\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
					<circle cx=\"100\" cy=\"100\" r=\"3\" fill=\"#000000\"/>
					
					<!-- Radiating lines -->
					<line x1=\"100\" y1=\"20\" x2=\"100\" y2=\"50\" stroke=\"#9b87c7\" stroke-width=\"1\" opacity=\"0.6\"/>
					<line x1=\"100\" y1=\"150\" x2=\"100\" y2=\"180\" stroke=\"#9b87c7\" stroke-width=\"1\" opacity=\"0.6\"/>
					<line x1=\"20\" y1=\"100\" x2=\"50\" y2=\"100\" stroke=\"#9b87c7\" stroke-width=\"1\" opacity=\"0.6\"/>
					<line x1=\"150\" y1=\"100\" x2=\"180\" y2=\"100\" stroke=\"#9b87c7\" stroke-width=\"1\" opacity=\"0.6\"/>
					
					<!-- Diagonal lines -->
					<line x1=\"41\" y1=\"41\" x2=\"65\" y2=\"65\" stroke=\"#9b87c7\" stroke-width=\"0.8\" opacity=\"0.5\"/>
					<line x1=\"135\" y1=\"135\" x2=\"159\" y2=\"159\" stroke=\"#9b87c7\" stroke-width=\"0.8\" opacity=\"0.5\"/>
					<line x1=\"159\" y1=\"41\" x2=\"135\" y2=\"65\" stroke=\"#9b87c7\" stroke-width=\"0.8\" opacity=\"0.5\"/>
					<line x1=\"65\" y1=\"135\" x2=\"41\" y2=\"159\" stroke=\"#9b87c7\" stroke-width=\"0.8\" opacity=\"0.5\"/>
					
					<!-- Triangular points -->
					<polygon points=\"100,25 95,35 105,35\" fill=\"#9b87c7\" opacity=\"0.7\"/>
					<polygon points=\"100,175 95,165 105,165\" fill=\"#9b87c7\" opacity=\"0.7\"/>
					<polygon points=\"25,100 35,95 35,105\" fill=\"#9b87c7\" opacity=\"0.7\"/>
					<polygon points=\"175,100 165,95 165,105\" fill=\"#9b87c7\" opacity=\"0.7\"/>
					
					<!-- Sacred geometry -->
					<path d=\"M 100 55 L 130 100 L 100 145 L 70 100 Z\" fill=\"none\" stroke=\"#9b87c7\" stroke-width=\"0.8\" opacity=\"0.4\"/>
					
					<!-- Runes/symbols around the edge -->
					<text x=\"100\" y=\"15\" text-anchor=\"middle\" fill=\"#9b87c7\" font-size=\"12\" opacity=\"0.7\">◈</text>
					<text x=\"100\" y=\"192\" text-anchor=\"middle\" fill=\"#9b87c7\" font-size=\"12\" opacity=\"0.7\">◈</text>
					<text x=\"8\" y=\"105\" text-anchor=\"middle\" fill=\"#9b87c7\" font-size=\"12\" opacity=\"0.7\">◈</text>
					<text x=\"192\" y=\"105\" text-anchor=\"middle\" fill=\"#9b87c7\" font-size=\"12\" opacity=\"0.7\">◈</text>
				</svg>
			</div>
			<h1 class=\"title\">All Is Not Lost</h1>
			<div class=\"subtitle\">A Rhizomatic Underground</div>
			<div class=\"whisper-text flicker\">You have found what was meant to be found...</div>
		</header>

		<section>
			<h2>Ontological Camouflage</h2>
			
			<p>
				The objects of <span class=\"ritual-mark\">\"All Is Not Lost\"</span> operate through 
				<span class=\"philosophical\">ontological camouflage</span>. They appear benign, socially neutral, 
				personally familiar—designed to invite inspection without suspicion. The found wallet. The lost 
				mitten. The discarded book. Each is an invitation disguised as <span class=\"void-voice\">almost-trash</span>.
			</p>

			<div class=\"transmission-void\">
				⊹ NETWORK TYPE :: RHIZOMATIC<br>
				⊹ ARCHITECTURE :: DECENTRALIZED<br>
				⊹ METHOD :: TACTICAL MYTHMAKING<br>
				⊹ STATUS :: YOU ARE NOW IMPLICATED
			</div>

			<p>
				This network activates 
				<span class=\"ritual-mark\">overlooked and transitional spaces</span>—locations where attention 
				can be subtly redirected, where the curious become <span class=\"philosophical\">finder/participants</span>. 
				You thought you were helping. You thought you were returning something lost.
			</p>

			<div class=\"incantation-box\">
				\"What appears to be an act of helpful return<br>
				becomes a moment of narrative destabilization.<br>
				Do you feel activated?\"
			</div>
		</section>

		<section>
			<h2>The Rhizomatic Underground</h2>
			
			<svg class=\"glyph-image\" viewBox=\"0 0 150 150\" xmlns=\"http://www.w3.org/2000/svg\">
				<defs>
					<filter id=\"blur\">
						<feGaussianBlur in=\"SourceGraphic\" stdDeviation=\"1\" />
					</filter>
				</defs>
				<!-- Network nodes -->
				<circle cx=\"75\" cy=\"75\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				<circle cx=\"30\" cy=\"40\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				<circle cx=\"120\" cy=\"50\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				<circle cx=\"45\" cy=\"110\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				<circle cx=\"110\" cy=\"100\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				<circle cx=\"60\" cy=\"30\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				<circle cx=\"90\" cy=\"120\" r=\"3\" fill=\"#c8b5e8\" opacity=\"0.8\"/>
				
				<!-- Connecting lines (rhizome) -->
				<line x1=\"75\" y1=\"75\" x2=\"30\" y2=\"40\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
				<line x1=\"75\" y1=\"75\" x2=\"120\" y2=\"50\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
				<line x1=\"75\" y1=\"75\" x2=\"45\" y2=\"110\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
				<line x1=\"75\" y1=\"75\" x2=\"110\" y2=\"100\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
				<line x1=\"30\" y1=\"40\" x2=\"60\" y2=\"30\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
				<line x1=\"45\" y1=\"110\" x2=\"90\" y2=\"120\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
				<line x1=\"110\" y1=\"100\" x2=\"90\" y2=\"120\" stroke=\"#9b87c7\" stroke-width=\"0.5\" opacity=\"0.4\"/>
			</svg>

			<h3>Relational Resistance</h3>

			<p>
				This project aims to <span class=\"ritual-mark\">restore the roots and shoots</span> of a rhizomatic 
				underground: a connected, decentralized ecosystem of <span class=\"philosophical\">mythic and speculative 
				engagement</span> with the world. It regenerates a public imagination that resists the logics of 
				capitalist, institutional, and technocratic systems.
			</p>

			<ul class=\"symbol-list\">
				<li><strong>Decenter the Self:</strong> Rather than affirming individualism or fixed identity, 
				this network invites you to <span class=\"void-voice\">unfix political subjectivities</span> and 
				navigate through collective practices.</li>
				
				<li><strong>The Undercommons:</strong> Drawing from Moten and Harney, this underground values 
				<span class=\"ritual-mark\">the spontaneous, the hidden, the relational</span> as sources of human 
				potential and forms of resistance.</li>
				
				<li><strong>Shared Presence:</strong> These encounters become portals into zones that feel both 
				intimate and expansive, inviting you to <span class=\"philosophical\">imagine otherwise</span>.</li>
			</ul>

			<div class=\"transmission-void\">
				⊹ NETWORK MODE :: COLLECTIVE<br>
				⊹ HIERARCHY :: NONE<br>
				⊹ LOGIC :: NON-LINEAR<br>
				⊹ MYTHMAKING :: TACTICAL
			</div>
		</section>

		<section>
			<h2>Myth as Method</h2>
			
			<p>
				This network does not offer a singular utopian vision. Instead, it invites 
				<span class=\"ritual-mark\">a multiplicity of partial, unstable, and co-authored realities</span>. 
				The rhizomatic underground is not metaphor—it is a proposed alternative network of communication 
				and attention, operating <span class=\"philosophical\">beneath and around sanctioned channels of meaning</span>.
			</p>

			<ul class=\"symbol-list\">
				<li><strong>Not Escapism:</strong> Myth here is a method of thinking, relating, and intervening 
				in the world otherwise.</li>
				<li><strong>Not Deception:</strong> These objects do not demand engagement; they invite it quietly, 
				through familiar forms of <span class=\"void-voice\">personal loss and shared curiosity</span>.</li>
				<li><strong>Not Utopia:</strong> This is low-frequency enchantment, a field of 
				<span class=\"ritual-mark\">latent resistance</span> distributed across everyday space.</li>
				<li><strong>Not Fixed:</strong> Meaning is made, not given. The authority to make meaning can be 
				<span class=\"philosophical\">reclaimed</span>.</li>
			</ul>

			<p>
				By seeding everyday spaces with objects that appear lost or discarded, this project activates 
				moments of <span class=\"ritual-mark\">curiosity and disorientation</span>. These are not artworks 
				in galleries. They are interventions in the real, vessels of plausible fiction that slip under 
				the radar of disbelief.
			</p>

			<div class=\"incantation-box\">
				Found wallet. Lost glove. Discarded book.<br>
				Each contains a handmade map,<br>
				a wifi password, instructions on a receipt.<br>
				Each is a transmitter disguised as almost-trash,<br>
				<em class=\"ritual-mark\">a quiet act of undermining techno-capitalist certainty.</em>
			</div>
		</section>

		<section>
			<h2>Are You Implicated?</h2>
			
			<p>
				By connecting to this network, you become <span class=\"ritual-mark\">finder/participant</span>. 
				Not user. Not consumer. Not product. You are now part of a <span class=\"philosophical\">
				distributed, interventionist installation</span> unfolding through chance encounters in everyday spaces.
			</p>

			<p>
				This alternate reality operates not through control or hierarchy, but through 
				<span class=\"ritual-mark\">situated relation and shared presence</span>. You thought you found 
				something lost. Instead, you discovered a <span class=\"void-voice\">tactical mythology</span> 
				designed to trouble techno-capitalist certainty and remind you that reality itself is constructed.
			</p>

			<div class=\"transmission-void\">
				⊹ PARTICIPANT STATUS: ACTIVATED<br>
				⊹ INDIVIDUALISM: DECENTERED<br>
				⊹ MEANING-MAKING: RECLAIMED<br>
				⊹ IMAGINATION: REGENERATED<br>
				⊹ ALL IS NOT LOST
			</div>

			<div class=\"incantation-box\">
				\"Myth is still a tactical tool:<br>
				not to obscure truth, but to <em>trouble it</em>,<br>
				to remind us that meaning is made, not given—<br>
				and that the authority to make meaning<br>
				<span class=\"ritual-mark\">can be reclaimed</span>.\"
			</div>

			<p style=\"text-align: center; margin-top: 30px; color: #a0b0d0;\">
				<em>Through dispersed and durational form, this cultivates<br>
				a field of latent resistance and low-frequency enchantment.</em>
			</p>
		</section>

		<form method=\"GET\" action=\"$gatewayurl\">
			<input type=\"hidden\" name=\"clientip\" value=\"$clientip\">
			<input type=\"hidden\" name=\"gatewayname\" value=\"$gatewayname\">
			<input type=\"hidden\" name=\"tok\" value=\"$tok\">
			<input type=\"hidden\" name=\"redir\" value=\"$originurl\">
		</form>

		<footer>
			<p class=\"flicker\">∴ All Is Not Lost :: The Rhizomatic Underground ∴</p>
			<p class=\"coordinates\">A network of tactical mythmaking and ontological camouflage</p>
			<p class=\"coordinates\">Operating in hidden channels of meaning</p>
			<p style=\"margin-top: 25px; font-size: 0.75rem; opacity: 0.6;\">
				Resisting capitalist, institutional, and technocratic logics<br>
			</p>
			<p style=\"margin-top: 20px; font-size: 0.7rem; opacity: 0.4;\">
				⟡ ⟡ ⟡
			</p>
		</footer>
	</div>
	"
	
	footer
}


#!/bin/sh
# Except to the Sun Theme for OpenNDS
# Copyright (C) 2025
# This software is released under the GNU GPL license.

# Title of this theme:
title="Except to the Sun :: Packrat Middens"

# functions:

generate_splash_sequence() {
	packrat_splash
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
		<title>Except to the Sun :: Packrat Middens</title>
		<style>
			* {
				margin: 0;
				padding: 0;
				box-sizing: border-box;
			}

			body {
				background: #ffffff;
				color: #111111;
				font-family: 'Georgia', 'Times New Roman', serif;
				line-height: 1.8;
				overflow-x: hidden;
				position: relative;
			}

			body::before {
				content: '';
				position: fixed;
				inset: 0;
				background:
					radial-gradient(circle at 10% 0%, rgba(255, 0, 170, 0.08) 0%, transparent 55%),
					radial-gradient(circle at 90% 100%, rgba(255, 0, 170, 0.06) 0%, transparent 60%);
				pointer-events: none;
				z-index: 0;
			}

			.static-overlay {
				position: fixed;
				inset: 0;
				background:
					repeating-linear-gradient(
						0deg,
						rgba(255, 255, 255, 0.03),
						rgba(255, 255, 255, 0.03) 1px,
						transparent 1px,
						transparent 2px
					);
				mix-blend-mode: screen;
				pointer-events: none;
				z-index: 1;
				animation: static-flicker 0.12s infinite;
			}

			@keyframes static-flicker {
				0%, 100% { opacity: 0.25; }
				40% { opacity: 0.45; }
				70% { opacity: 0.35; }
			}

			.container {
				max-width: 860px;
				margin: 0 auto;
				padding: 40px 20px 60px;
				position: relative;
				z-index: 2;
			}

			header {
				text-align: center;
				padding: 40px 20px 35px;
				border-bottom: 1px solid rgba(255, 255, 255, 0.18);
				margin-bottom: 40px;
				position: relative;
			}

			header::after {
				content: '';
				position: absolute;
				left: 50%;
				bottom: -1px;
				transform: translateX(-50%);
				width: 140px;
				height: 1px;
				background: linear-gradient(90deg, transparent, #ff00aa, transparent);
			}

			.badge {
				display: inline-block;
				border: 1px solid rgba(0, 0, 0, 0.6);
				border-radius: 4px;
				padding: 6px 10px;
				font-size: 0.7rem;
				letter-spacing: 0.14em;
				text-transform: uppercase;
				color: #b0006f;
				margin-bottom: 18px;
				background: rgba(255, 255, 255, 0.9);
			}

			.rat-hero {
				width: 260px;
				max-width: 70%;
				margin: 22px auto 8px;
				display: block;
			}

			.title {
				font-size: clamp(2.1rem, 5vw, 3.4rem);
				letter-spacing: 0.14em;
				font-weight: normal;
				text-transform: uppercase;
				color: #000000;
				margin-bottom: 10px;
			}

			.subtitle {
				font-size: clamp(0.9rem, 2.2vw, 1.2rem);
				color: #444444;
				letter-spacing: 0.2em;
				text-transform: uppercase;
				opacity: 0.95;
			}

			.tagline {
				margin-top: 18px;
				font-size: 0.9rem;
				color: #555555;
				font-style: italic;
			}

			.midden-ring {
				margin: 26px auto 10px;
				width: 200px;
				height: 200px;
				border-radius: 50%;
				border: 1px solid rgba(255, 255, 255, 0.45);
				display: flex;
				align-items: center;
				justify-content: center;
				position: relative;
				overflow: hidden;
				box-shadow:
					0 0 0 1px rgba(255, 0, 170, 0.35),
					0 0 35px rgba(255, 0, 170, 0.35);
			}

			.midden-ring::before {
				content: '';
				position: absolute;
				inset: 9%;
				border-radius: 50%;
				border: 1px dashed rgba(255, 255, 255, 0.4);
			}

			.midden-ring span {
				font-size: 0.75rem;
				text-transform: uppercase;
				letter-spacing: 0.22em;
				color: #ffffff;
			}

			section {
				margin: 40px 0;
				padding: 30px 26px 30px;
				border-radius: 18px;
				border: 1px solid rgba(0, 0, 0, 0.12);
				background:
					radial-gradient(circle at 0% 0%, rgba(255, 0, 170, 0.06), transparent 55%),
					radial-gradient(circle at 100% 100%, rgba(0, 0, 0, 0.03), transparent 60%),
					#ffffff;
				position: relative;
			}

			section::before {
				content: '';
				position: absolute;
				top: 0;
				left: 0;
				right: 0;
				height: 2px;
				background: linear-gradient(90deg, transparent, #ff00aa, transparent);
				opacity: 0.7;
			}

			h2 {
				font-size: clamp(1.4rem, 3.8vw, 2.1rem);
				color: #111111;
				margin-bottom: 20px;
				text-align: center;
				text-transform: uppercase;
				letter-spacing: 0.14em;
			}

			h3 {
				font-size: clamp(1.1rem, 3vw, 1.5rem);
				color: #222222;
				margin: 26px 0 14px;
				letter-spacing: 0.08em;
				text-transform: uppercase;
			}

			p {
				margin-bottom: 18px;
				font-size: clamp(0.96rem, 2vw, 1.08rem);
				color: #222222;
				line-height: 1.9;
				text-align: justify;
			}

			.desert-note {
				font-size: 0.85rem;
				text-transform: uppercase;
				letter-spacing: 0.18em;
				color: #b0006f;
			}

			.highlight {
				color: #ff0088;
				font-weight: bold;
			}

			.white-thread {
				color: #000000;
				font-style: italic;
			}

			.key-list {
				list-style: none;
				margin: 10px 0 8px;
				padding: 0;
			}

			.key-list li {
				margin: 6px 0;
				padding-left: 20px;
				position: relative;
				font-size: 0.98rem;
				color: #222222;
			}

			.key-list li::before {
				content: '✶';
				position: absolute;
				left: 0;
				top: 0.1rem;
				font-size: 0.7rem;
				color: #ff00aa;
			}

			.trinket-strip {
				margin-top: 20px;
				padding: 10px 14px;
				border-radius: 999px;
				border: 1px dashed rgba(0, 0, 0, 0.3);
				font-size: 0.82rem;
				text-transform: uppercase;
				letter-spacing: 0.2em;
				text-align: center;
				color: #b0006f;
				background: rgba(255, 255, 255, 0.9);
			}

			.transmission-box {
				margin-top: 24px;
				padding: 18px 18px 16px;
				border-radius: 14px;
				border: 1px solid rgba(0, 0, 0, 0.12);
				background: #ffffff;
				font-family: 'Courier New', monospace;
				font-size: 0.88rem;
				line-height: 1.7;
				color: #111111;
			}

			.transmission-label {
				color: #ff0088;
				text-transform: uppercase;
				letter-spacing: 0.18em;
				font-size: 0.7rem;
			}

			.action-area {
				margin-top: 32px;
				text-align: center;
			}

			.submit-button {
				display: inline-block;
				padding: 11px 30px;
				border-radius: 999px;
				border: 1px solid #000000;
				background: #ff00aa;
				color: #ffffff;
				text-transform: uppercase;
				letter-spacing: 0.18em;
				font-size: 0.8rem;
				font-weight: bold;
				cursor: pointer;
				box-shadow: 0 0 18px rgba(255, 0, 170, 0.4);
				transition: transform 0.15s ease, box-shadow 0.15s ease, background 0.15s ease;
			}

			.submit-button:hover {
				transform: translateY(-1px);
				box-shadow: 0 0 26px rgba(255, 0, 170, 0.7);
				background: #ff33bb;
			}

			.submit-button:active {
				transform: translateY(1px);
				box-shadow: 0 0 14px rgba(255, 0, 170, 0.4);
			}

			footer {
				margin-top: 40px;
				padding-top: 26px;
				border-top: 1px solid rgba(0, 0, 0, 0.12);
				text-align: center;
				color: #444444;
				font-size: 0.86rem;
			}

			footer h2 {
				font-size: 0.88rem;
				margin: 10px 0 0;
				text-transform: uppercase;
				letter-spacing: 0.2em;
				color: #000000;
			}

			@media (max-width: 600px) {
				section {
					padding: 24px 18px 24px;
				}

				.midden-ring {
					width: 160px;
					height: 160px;
				}
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
			const staticOverlay = document.querySelector('.static-overlay');
			if (staticOverlay) {
				setInterval(() => {
					if (Math.random() > 0.95) {
						staticOverlay.style.opacity = Math.random() * 0.3 + 0.2;
					}
				}, 120);
			}
		</script>
	</body>
	</html>
	"
}

packrat_splash() {
	header

	echo "
	<div class=\"container\">
		<header>
			<div class=\"badge\">KDZU</div>
			<img class=\"rat-hero\" src=\"/images/black-rat.png\" alt=\"Silhouette of a packrat\">
			<h1 class=\"title\">ALL IS NOT LOST (EXCEPT TO THE SUN)</h1>
			<div class=\"subtitle\">Packrats in the All Is Not Lost Network</div>
			<p class=\"tagline\">
				We carry fragments of the transmission.
			</p>
		</header>

		<section>
			<p class=\"desert-note\">
				OUR LOGIC IS FOUND
			</p>

			<p>
				With All Is Not Lost, we aim to restore the roots and shoots of a
				<span class=\"highlight\">rhizomatic underground</span> &mdash; a decentralized ecosystem of mythic
				and speculative engagement &mdash; and to regenerate a public collectivity
				that resists capitalist, institutional, and technocratic logics. This
				system of engagement and interaction aspires to function as a
				<span class=\"white-thread\">distributed intervention</span> unfolding through chance encounters in daily life.
			</p>

			<p>
				All Is Not Lost uses found objects &mdash; wallets, gloves, books, key cards &mdash;
				as entry points into a layered fictional world. These belongings, placed in
				public and transitional spaces, are what KDZU calls
				<span class=\"highlight\">tactical artifacts</span>: constructed objects embedded with narrative
				fragments and encoded transmissions from the KDZU pirate signal and its
				predecessor OMSA (Of Memory, Silence, and Artifacts), an underground
				anarcho-collectivist engineering and artmaking group that once occupied
				the Memphis Pyramid and was later raided and dispersed in 1994.
			</p>

			<p>
				We move through the stairwells, parking lots, and trail edges,
				dropping and stashing. Are we pests? We are <span class=\"white-thread\">participants in the network</span>.
				Tactical artifacts transform space into middens.
			</p>
		</section>

		<section>
			<h2>OPERATIONAL DETAILS</h2>

			<h3>The Trade</h3>
			<p>
				We do not barter in the human sense, but we are notorious for
				carrying off small, often shiny, items &mdash; keys, coins, golf balls,
				bottle caps. When they encounter something more compelling, they will
				<span class=\"highlight\">drop one object to take another</span>. What you lose in the parking lot
				may reappear as a doorframe in a midden.
			</p>

			<ul class=\"key-list\">
				<li>Coins, keys, and glass fragments become glittering lintels.</li>
				<li>Broken mirrors and metal screws mark the entries.</li>
				<li>Every object is a compromise: chosen, then traded, then fixed in place.</li>
			</ul>

			<div class=\"trinket-strip\">
				SHINY OBJECTS ARE SIGNALS
			</div>

			<h3>Midden Construction</h3>
			<p>
				We build large, fortified homes called <span class=\"highlight\">middens</span> from twigs, cactus joints,
				and the things we steal from you. These layered structures defend against
				predators and weather, and when dried and crystallized, can last for
				<span class=\"white-thread\">thousands of years</span>. What feels like clutter on the surface becomes
				a desert archive below.
			</p>

			<h3>Habitat</h3>
			<p>
				We live in rocky outcrops, at the base of cacti, and in the tucked
				angles of human structures. We feed on seeds, plants, and fruits, and we
				chew through <span class=\"highlight\">car wiring, pipes, and insulation</span> when our infrastructure
				crosses your routes. <span class=\"white-thread\">Pest behavior. Edit the built environment.</span>
			</p>

			<div class=\"transmission-box\">
				<div class=\"transmission-label\">&gt;&gt; DESERT TRANSMISSION &lt;&lt;</div>
				<br>
				&gt;&gt; Transmission where transmission is not expected, and where the attention of the curious can be subtly tingled.
			</div>
		</section>

		<footer>
			<p>KDZU :: Except to the Sun :: End Transmission.</p>
			<h2>All Bright Things Are Archived Somewhere.</h2>
		</footer>
	</div>
	"

	footer
}


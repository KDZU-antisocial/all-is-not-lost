# KDZU Captive Portal for OpenNDS

A custom captive portal splash page for OpenWrt routers running OpenNDS. This project creates a zine-like manifesto page that appears when users connect to a KDZU Lone Wolf WiFi network.

## Table of Contents

- [Overview](#overview)
- [KDZU's "Lone Wolf" WiFi Networks](#kdzus-lone-wolf-wifi-networks)
- [How It Works](#how-it-works)
- [Requirements](#requirements)
- [Installation](#installation)
- [Understanding the Components](#understanding-the-components)
- [Customization](#customization)
- [Troubleshooting](#troubleshooting)
- [Technical Details](#technical-details)

---

## Overview

This project implements a custom captive portal page for the KDZU "All Is Not Lost" project. When someone connects to the "All Is Not Lost" Lone Wolf WiFi network, they are automatically redirected to a custom splash page that presents the KDZU manifesto.

**Key Features:**
- No authentication required (click-through only)
- Fully responsive design
- Self-contained theme (no external dependencies)

---

## KDZU's "Lone Wolf" WiFi Networks

### How KDZU Builds "Lone Wolf" WiFi Networks Using OpenWrt

We broadcast from the edges of trails, rooftops, stairwells, and other transitional spaces. We utilize tools that can be repurposed, reimagined, or sometimes left for others to adapt. One such tool is WiFi routers running **OpenWrt**, an open-source OS that turns standard routers into independent transmitters, creating isolated networks.

### What is a Lone Wolf WiFi Network?

A **lone wolf WiFi network** is a small, self-contained wireless setup used to create a small local network without internet access. This network does not uplink to social media. There is no ad tech. There is no cloud. It quietly shares local files or prompts, accessible only to those within WiFi range.

With one of these small routers, we can share files, serve HTML pages, loop audio, send messages, or create archives. We place them in overlooked public spaces. They run on batteries or in those strange and rare places with open power outlets (check behind vending machines!). These routers often disappear over time.

**We see our Lone Wolf networks as similar to zines, using Wi-Fi routers as "photocopiers" to reproduce and distribute human-made content at human scale.**

### This Project's Place in the Ecosystem

While this specific implementation connects users to the internet (making it a gateway rather than a true "lone wolf"), it demonstrates the captive portal technique that can be adapted for fully offline networks. The manifesto page becomes the primary content, with internet access optional—a transitional form between lone wolf and traditional hotspot.

---

## How It Works

### Captive Portals

A **captive portal** is a web page that users must view before accessing a network. When you connect to public WiFi at a coffee shop or airport, the login page you see is a captive portal.

### OpenNDS (Open Network Demilitarized Server)

OpenNDS is software that runs on OpenWrt routers to create captive portals. It intercepts HTTP requests and redirects users to a splash page before granting internet access.

### ThemeSpec Scripts

OpenNDS uses **ThemeSpec** shell scripts to generate captive portal pages. Instead of serving static HTML files, OpenNDS executes these scripts which output HTML dynamically. This allows the page to include user-specific information (IP address, tokens, etc.) needed for authentication.

---

## Requirements

### Hardware
- OpenWrt-compatible router (already running OpenWrt)
- Router must have OpenNDS installed

### Software
- **OpenNDS 10.x** or later
- **SSH access** to your router
- **SCP** (for file transfer) - included with macOS, Linux, and Windows 10+

### Knowledge
- Basic command line usage
- Basic understanding of SSH
- Your router's IP address (typically `192.168.1.1`)
- Your router's root password

---

## Installation

### Step 1: Prepare Your Files

Clone or download this repository to your local machine:

```bash
cd /path/to/your/projects
git clone [repository-url]
cd fas
```

You should have these files:
- `kdzu-theme.sh` - The main theme script
- `index.html` - Reference HTML (for editing)
- `README.md` - This file

### Step 2: Copy Theme to Router

Use SCP to copy the theme script to your router's OpenNDS directory:

```bash
scp -O big-white-dog-theme.sh root@192.168.1.1:/usr/lib/opennds/
```

**Note:** Replace `192.168.1.1` with your router's actual IP address.

The `-O` flag uses the legacy SCP protocol, which is often needed for OpenWrt routers that don't have the sftp-server installed.

### Step 3: Configure OpenNDS

SSH into your router:

```bash
ssh root@192.168.1.1
```

Once connected, run these commands:

```bash
# Make the theme script executable, commit config, and restart OpenNDS
chmod +x /usr/lib/opennds/big-white-dog-theme.sh && uci commit opennds && /etc/init.d/opennds restart
```

**Or run the configuration steps individually:**

```bash
# Make the theme script executable
chmod +x /usr/lib/opennds/big-white-dog-theme.sh

# Configure OpenNDS to use login mode 3 (custom ThemeSpec)
uci set opennds.@opennds[0].login_option_enabled='3'

# Point to your custom theme
uci set opennds.@opennds[0].themespec_path='/usr/lib/opennds/big-white-dog-theme.sh'

# Increase max page size to accommodate your content (see "Calculating Page Size" section below)
uci set opennds.@opennds[0].max_page_size='20480'

# Save the configuration
uci commit opennds

# Restart OpenNDS to apply changes
/etc/init.d/opennds restart
```

### Step 4: Verify Installation

Check OpenNDS status:

```bash
ndsctl status
```

You should see:
```
openNDS Status
Version: 10.3.1
Maximum Html Page size is [ 20480 ] Bytes
...
ThemeSpec Core Library: /usr/lib/opennds/libopennds.sh
```

Check the logs for errors:

```bash
logread | grep opennds | tail -20
```

You should see:
```
daemon.notice opennds[...]: Login option is Enabled using mode 3.
daemon.notice opennds[...]: openNDS is now running.
```

### Step 5: Test

1. Connect a device (phone, laptop) to your WiFi network
2. Open a web browser and try to visit any website (e.g., `http://example.com`)
3. You should be automatically redirected to the KDZU splash page
4. Click **"⟫ Continue Transmission ⟪"** to authenticate

---

## Understanding the Components

### File Structure

```
/usr/lib/opennds/
├── kdzu-theme.sh           # Your custom theme script
├── libopennds.sh           # OpenNDS core library (provided by OpenNDS)
├── theme_*.sh              # Built-in themes (default)
└── binauth_log.sh          # Authentication handler
```

### The Theme Script (`kdzu-theme.sh`)

The theme script is a shell script with three main functions:

1. **`header()`** - Outputs the HTML `<head>` and opening `<body>` with CSS styles
2. **`kdzu_splash()`** - Outputs the main content of your page
3. **`footer()`** - Outputs closing tags and JavaScript

When a user accesses the captive portal, OpenNDS:
1. Executes your theme script
2. Sets environment variables (`$clientip`, `$gatewayurl`, `$tok`, etc.)
3. Captures the script's output (HTML)
4. Serves the HTML to the user's browser

### Authentication Flow

```
User connects to WiFi
         ↓
User tries to browse the internet
         ↓
OpenNDS intercepts the request
         ↓
OpenNDS executes kdzu-theme.sh
         ↓
Theme outputs HTML with authentication form
         ↓
HTML served to user's browser
         ↓
User clicks "Continue Transmission"
         ↓
Form submits to OpenNDS with token
         ↓
OpenNDS validates and authenticates user
         ↓
User can now access the internet
```

### Important Variables

OpenNDS provides these variables to your theme script:

- `$clientip` - The client's IP address
- `$clientmac` - The client's MAC address
- `$gatewayurl` - URL to OpenNDS (e.g., `http://192.168.1.1:2050`)
- `$tok` - Authentication token for this session
- `$originurl` - Where to redirect after authentication
- `$gatewayname` - Name of your gateway

These are used in the authentication form:

```html
<form method="GET" action="$gatewayurl">
    <input type="hidden" name="clientip" value="$clientip">
    <input type="hidden" name="gatewayname" value="$gatewayname">
    <input type="hidden" name="tok" value="$tok">
    <input type="hidden" name="redir" value="$originurl">
    <button type="submit">Continue</button>
</form>
```

---

## Customization

### Editing Content

1. **Edit the HTML locally** - Modify `index.html` to test your changes
   - Open in a browser to preview
   - Adjust text, colors, layout, etc.

2. **Transfer to shell script** - Copy your changes into `kdzu-theme.sh`
   - Content goes in the `kdzu_splash()` function
   - Escape special characters:
     - `"` becomes `\"`
     - `$` becomes `\$` (unless it's an OpenNDS variable)
     - Backticks become `\``

3. **Update CSS** - Modify styles in the `header()` function
   - Colors are at the top of the `<style>` block
   - Change fonts, sizes, spacing, etc.

4. **Upload and restart**:
   ```bash
   scp -O big-white-dog-theme.sh root@192.168.1.1:/usr/lib/opennds/
   ssh root@192.168.1.1 "chmod +x /usr/lib/opennds/big-white-dog-theme.sh && uci commit opennds && /etc/init.d/opennds restart"
   ```

### Changing Colors

Primary colors used in the theme:

```css
#00ff88  /* Primary Green - KDZU frequency color */
#ff0066  /* Accent Pink - borders and highlights */
#00ccff  /* Accent Cyan - subheadings */
#0a0a0a  /* Background - near black */
```

To change the color scheme, search and replace these hex codes in the `header()` function.

### Adding Sections

To add a new section to the page:

```bash
# In kdzu-theme.sh, inside the kdzu_splash() function, add:

<section>
    <h2>∴ Your New Section ∴</h2>
    
    <p>
        Your content here with <span class=\"highlight\">highlighted</span> 
        and <span class=\"emphasis\">emphasized</span> text.
    </p>
    
    <div class=\"transmission\">
        &gt;&gt; TRANSMISSION TEXT<br>
        &gt;&gt; ADDITIONAL LINES
    </div>
</section>
```

### Calculating Page Size

OpenNDS has a maximum page size limit to prevent buffer overflows. If your theme exceeds this limit, the page will be truncated and you'll see errors in the logs.

**Method 1: Check the actual output size**

SSH into your router and test the theme script output:

```bash
ssh root@192.168.1.1
cd /usr/lib/opennds
# Set some test environment variables
export clientip="192.168.1.100"
export gatewayurl="http://192.168.1.1:2050"
export tok="test123"
export originurl="http://example.com"
export gatewayname="Test Gateway"

# Run the theme and measure output
./big-white-dog-theme.sh | wc -c
```

This will show you the exact byte count of your HTML output.

**Method 2: Check locally before uploading**

On your local machine, if you have a preview HTML file:

```bash
wc -c big-white-dog-theme-preview.html
```

**Method 3: Check OpenNDS logs for overflow warnings**

```bash
logread | grep -i "overflow\|truncated\|page size"
```

If you see "Buffer overflow" or "output may be truncated", your page is too large.

### Adjusting Page Size with UCI

Once you know your page size, set it in OpenNDS configuration:

```bash
# SSH into your router
ssh root@192.168.1.1

# Set max_page_size (values are in bytes)
# Common sizes:
#   20480  = 20 KB
#   30720  = 30 KB
#   40960  = 40 KB
#   51200  = 50 KB
#   61440  = 60 KB
#   81920  = 80 KB
#   102400 = 100 KB

# Set the page size (add 10-20% buffer for safety)
uci set opennds.@opennds[0].max_page_size='30720'

# Save the configuration
uci commit opennds

# Restart OpenNDS to apply changes
/etc/init.d/opennds restart
```

**Quick one-liner:**

```bash
uci set opennds.@opennds[0].max_page_size='30720' && uci commit opennds && /etc/init.d/opennds restart
```

**Verify the new page size:**

```bash
ndsctl status | grep -i "page size"
```

**Warning:** Very large pages (over 100KB) may cause performance issues on resource-constrained routers. Consider optimizing your HTML/CSS or splitting content across multiple pages.

**Tips for reducing page size:**
- Minimize base64-encoded images (they're very large)
- Remove unnecessary whitespace and comments
- Use CSS efficiently (avoid repetition)
- Consider external resources if your router has internet access

---

## Troubleshooting

### "Buffer overflow, output may be truncated"

**Problem:** Your page is too large for the configured max page size.

**Solution:** 
1. First, calculate your actual page size (see "Calculating Page Size" section above)
2. Set `max_page_size` to a value larger than your page size (add 10-20% buffer):

```bash
# Example: if your page is 25KB, set to 30KB (30720 bytes)
uci set opennds.@opennds[0].max_page_size='30720'
uci commit opennds
/etc/init.d/opennds restart
```

**Quick one-liner:**
```bash
uci set opennds.@opennds[0].max_page_size='30720' && uci commit opennds && /etc/init.d/opennds restart
```

### Page shows default OpenNDS splash instead of custom theme

**Problem:** OpenNDS is using the built-in theme instead of yours.

**Check configuration:**
```bash
uci show opennds | grep -E 'login|theme'
```

Should show:
```
opennds.@opennds[0].login_option_enabled='3'
opennds.@opennds[0].themespec_path='/usr/lib/opennds/big-white-dog-theme.sh'
```

**Fix:**
```bash
uci set opennds.@opennds[0].login_option_enabled='3'
uci set opennds.@opennds[0].themespec_path='/usr/lib/opennds/big-white-dog-theme.sh'
uci commit opennds
/etc/init.d/opennds restart
```

### Page is blank or shows errors

**Problem:** Syntax error in the shell script.

**Test the script:**
```bash
ssh root@192.168.1.1
sh -n /usr/lib/opennds/big-white-dog-theme.sh
```

If there are errors, they'll be displayed. Common issues:
- Unescaped quotes: `"` should be `\"`
- Unescaped dollar signs: `$var` should be `\$var` (unless it's an OpenNDS variable)
- Missing closing tags in HTML

### "Permission denied" when uploading

**Problem:** File isn't executable or wrong permissions.

**Solution:**
```bash
ssh root@192.168.1.1 "chmod +x /usr/lib/opennds/big-white-dog-theme.sh"
```

### Authentication doesn't work (stuck in loop)

**Problem:** Form is missing required fields or using wrong variable names.

**Verify the form has these fields:**
```html
<input type="hidden" name="tok" value="$tok">
<input type="hidden" name="redir" value="$originurl">
```

### CSS or JavaScript not working

**Problem:** Special characters not properly escaped in the shell script.

**Common fixes:**
- Dollar signs in JavaScript: Use `\$` instead of `$`
- Backticks in template literals: Use `\`` instead of `` ` ``
- Single quotes in JavaScript: Use `\'` inside single-quoted shell strings

---

## Technical Details

### OpenNDS Configuration Options

Key UCI options used in this project:

| Option | Value | Purpose |
|--------|-------|---------|
| `login_option_enabled` | `3` | Use custom ThemeSpec script |
| `themespec_path` | `/usr/lib/opennds/big-white-dog-theme.sh` | Path to custom theme |
| `max_page_size` | `20480` | Maximum HTML page size (bytes) |
| `fas_secure_enabled` | `0` | Security level (0=basic, 1-4=secure) |

### UCI (Unified Configuration Interface)

OpenWrt uses UCI to manage configuration files. Commands:

```bash
# Show all OpenNDS settings
uci show opennds

# Set a specific option
uci set opennds.@opennds[0].option_name='value'

# Save changes to disk
uci commit opennds

# Revert unsaved changes
uci revert opennds
```

### Shell Script Best Practices

When creating OpenNDS themes:

1. **Use double quotes for echo statements** containing HTML
2. **Escape these characters** inside echo:
   - `"` → `\"`
   - `$` → `\$` (unless it's an OpenNDS variable like `$tok`)
   - `` ` `` → `\``
3. **Use `&gt;` and `&lt;`** for `>` and `<` in HTML content
4. **Test locally** before deploying:
   ```bash
   sh -n kdzu-theme.sh  # Check syntax
   ```

### File Locations on OpenWrt

```
/etc/opennds/              # OpenNDS config directory
  ├── opennds.conf         # Main config (rarely used)
  └── fas/                 # FAS directory (not used by ThemeSpec)

/etc/config/opennds        # UCI configuration file

/usr/lib/opennds/          # OpenNDS libraries and themes
  ├── big-white-dog-theme.sh  # Your custom theme
  ├── libopennds.sh        # Core library
  └── theme_*.sh           # Built-in themes

/etc/init.d/opennds        # Init script (start/stop/restart)

/tmp/ndsctl.sock           # Control socket for ndsctl command
```

### Useful Commands

```bash
# Check OpenNDS status
ndsctl status

# View real-time logs
logread -f | grep opennds

# List connected clients
ndsctl clients

# Manually authenticate a client
ndsctl auth <client-ip>

# Deauthenticate a client
ndsctl deauth <client-ip>

# Stop/start/restart OpenNDS
/etc/init.d/opennds stop
/etc/init.d/opennds start
/etc/init.d/opennds restart
```

---

## Project Structure

```
all-is-not-lost/
├── big-white-dog-theme.sh          # Main theme script (deploy this)
├── big-white-dog-theme-preview.html # Preview HTML (for editing)
└── README.md                        # This file
```

## Design Philosophy

This captive portal embodies the KDZU project's concept of **tactical mythmaking**:

- **Ontological Camouflage** - The captive portal appears as a familiar WiFi login page but delivers unexpected narrative content
- **Brechtian Alienation** - The design deliberately reveals its constructed nature (glitch effects, visible artifacts)
- **Tactical Intervention** - The moment of connecting to WiFi becomes a moment of narrative engagement
- **Human-Scale Distribution** - Like zines photocopied and distributed by hand, these WiFi routers broadcast at human scale, accessible only to those within physical proximity

The finder/participant is implicated simply by connecting to the network - the WiFi connection itself becomes a tactical artifact.

### Lone Wolf as Medium

The router becomes a transmitter of narrative fragments, broadcasting from transitional spaces—edges of trails, rooftops, stairwells. It may run on batteries. It may be found behind a vending machine. It may disappear tomorrow. The ephemeral nature of the network mirrors the project's themes of memory, silence, and artifacts.

This is not a server in a data center. This is not cloud infrastructure. This is a router in a backpack, a transmitter on a rooftop, a signal in the stairwell—human-made content at human scale.

---

## Credits

**KDZU "All Is Not Lost"** - Tactical Mythmaking Project  
**OpenNDS** - https://opennds.readthedocs.io/  
**OpenWrt** - https://openwrt.org/

---

## License

This software is released under the GNU GPL license, following OpenNDS licensing.

---

## Further Learning

### Resources

- **OpenNDS Documentation**: https://opennds.readthedocs.io/
- **OpenWrt Wiki**: https://openwrt.org/docs/start
- **UCI Configuration**: https://openwrt.org/docs/guide-user/base-system/uci
- **ThemeSpec Examples**: Look at `/usr/lib/opennds/theme_*.sh` on your router

### Next Steps

Once you understand this basic setup, you can:

1. **Add user input** - Collect names, emails, etc.
2. **Integrate with databases** - Log user information
3. **Add external authentication** - Connect to RADIUS, LDAP, etc.
4. **Create multiple themes** - Different pages for different times/events
5. **Add dynamic content** - Pull content from external sources

### Understanding Captive Portals More Deeply

Read about:
- RFC 8910 (Captive Portal Identification)
- RFC 8908 (Captive Portal API)
- How browsers detect captive portals (CPD - Captive Portal Detection)
- Security considerations for captive portals

---

## Support

For issues specific to:
- **This KDZU theme**: Open an issue in this repository
- **OpenNDS**: See https://github.com/openNDS/openNDS
- **OpenWrt**: See https://forum.openwrt.org/

---

*"All Is Not Lost" - KDZU Radio Network*

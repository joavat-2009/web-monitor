# Web Monitor

Bash script for monitoring website availability with HTTP status check, logging, and desktop notifications.

## Features

- Checks HTTP status code of any website or web service
- Logs downtime events with timestamp
- Sends desktop alerts when a site goes down (using `notify-send`)
- Configurable timeout to avoid hanging
- Works with both `http://` and `https://` URLs

## Technologies

- **Bash 5.0+**
- **curl** (HTTP requests)
- **notify-send** (desktop alerts, optional)
- Standard Linux tools: `date`, `grep`

## Usage
```bash
./webmon.sh <URL>
```
- Replace <URL> with the website you want to monitor (e.g., https://google.com).

## Example output (website is up)
``` text
===========================================
                WEB MONITOR
===========================================

[+] HTTP Code: 200

Site https://google.com is UP (HTTP 200)
===========================================
```

## Example output (website is down)
```text
===========================================
                WEB MONITOR
===========================================

[+] HTTP Code: 000

Site https://fake-site.com is DOWN! Log: /home/user/webmon.log
===========================================
```
## Log file example output (~/webmon.log)
```text

[2026-06-15 14:30:00] ALERT: https://fake-site.com is DOWN (HTTP 000)
```
## How It Works

1. Script checks if curl is installed.

2. Makes an HTTP request to the specified URL with a 10-second timeout.

3. Captures the HTTP status code.

4. If the status code is 4xx, 5xx, or 000 (connection failed), it:

   - Logs the event to ~/webmon.log

   - Sends a desktop notification (if notify-send is available)

   - Displays an error message in the terminal

5. If the status code is normal (2xx or 3xx), it reports the site is up.

## Requirements

- curl – usually preinstalled. Install with: sudo apt install curl

- libnotify-bin – for desktop notifications (optional). Install with: sudo apt install libnotify-bin

## License

- MIT License — for educational and administrative purposes only.

## Author

- Joseph Avatyants
- GitHub: joavat-2009
- Email: joavat2009@gmail.com

## Installation

```bash
git clone https://github.com/joavat-2009/web-monitor.git
cd web-monitor
chmod +x webmon.sh
./webmon.sh <URL>
```

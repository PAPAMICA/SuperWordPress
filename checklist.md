# WordPress Checklist
More details at [Wiki-Tech.io](https://wiki-tech.io/Web/WordPress/checklist)
## Useful Projects:
 - [PAPAMICA/docker-environment](https://github.com/PAPAMICA/docker-environment)
 - [PAPAMICA/docker-compose-collection](https://github.com/PAPAMICA/docker-compose-collection)
 - [PAPAMICA/container-updater](https://github.com/PAPAMICA/container-updater)
 - [PAPAMICA/Backup-Script](https://github.com/PAPAMICA/Backup-Script)
 - [PAPAMICA/SuperWordPress](https://github.com/PAPAMICA/SuperWordPress)

## WordPress Deployment (30 min)

 - [ ] Set up WordPress and its database

 - [ ] Configure the uploads.ini file

```php
file_uploads = On
memory_limit = 500M
upload_max_filesize = 500M
post_max_size = 500M
max_execution_time = 600
```

 - [ ] Install and configure WP Mail SMTP

```ini
Send email address: notification@domain.com
Force sending email: Enabled
Sender Name: Site_Name
Force sender name: Enabled
Sending Service: Other SMTP
SMTP Host: 10.20.10.201
Encryption: None
SMTP Port: 25
Auto TLS: Disabled
Authentication: Disabled
```

## Backup (15 min)

 - [ ] Install and configure UpDraftPlus

	 - [ ] Set up Google Drive account

	 - [ ] Configure automatic backups

## Security (30 min)

- [ ] Enable automatic updates

- [ ] Install and configure Wordfence Security

- [ ] Install and activate the Wordfence Security extension

	- [ ] Enable automatic scans

	- [ ] Activate the firewall

	- [ ] Enable 2FA for all accounts

- [ ] Install and activate the WP Hide & Security Enhancer extension

	- [ ] Run the example setup

	- [ ] Enable captcha v3 in the WP Hide → Security → Captcha tab

	- [ ] Change the admin link in the WP Hide → Hide → Login/ tab

## Monitoring (30 min)

- [ ] UptimeKuma
	- [ ] Create a probe for a word that appears on the homepage

	- [ ] Add the client's email in the description field

	- [ ] Remember to enable certificate verification

	- [ ] Set up an NTFY notification if 5 attempts of 60 seconds fail

	- [ ] Clone & Set up a Telegram notification for 3 attempts of 300

	- [ ] Clone & Set up a client email notification for 6 attempts of 300

- [ ] For VIP clients → Full monitoring with Zabbix

- [ ] Install and configure JetPack

	- [ ] Enable Downtime Monitoring in settings

	- [ ] Link Jetpack with WordPress.com account

## Layout

- [ ] Install Elementor

- [ ] Install Elementor Pro

- [ ] Install Envato Elements

- [ ] Install Duplicate Page

- [ ] Design the general theme of the site

	- [ ] Colors

	- [ ] Font

	- [ ] Favicon

- [ ] Create menus

- [ ] Design the header

	- [ ] Logo

	- [ ] Desktop menu

	- [ ] Mobile menu

	- [ ] Call to Action

- [ ] Design the footer

	- [ ] Logo

	- [ ] Social networks

	- [ ] Useful links

	- [ ] Contact / Newsletter

	- [ ] Copyright

- [ ] If a blog → Design the page template

- [ ] Design the 404 Error template

## Essential Pages

- [ ] Home

- [ ] Contact

	- [ ] Create the form

	- [ ] Configure Captcha v3

- [ ] Privacy Policy

- [ ] Legal Notice

- [ ] If an e-commerce site → Terms and Conditions of Sale

## Analytics (30 min)

- [ ] Install and configure Complianz GDPR

- [ ] Install and configure Burst Statistics

## Optimization (30 min)

- [ ] Check performance with Pagespeed

- [ ] Check performance with Pingdom

- [ ] Install and configure Lite Speed Cache

	- [ ] Apply advanced presets

	- [ ] Configure the QUIC API key

- [ ] Install and configure Redis

	- [ ] Add the following variables in `wp-config.php`:

```php
define('WP_REDIS_HOST', 'redis'); # Use the name of the container
define('WP_REDIS_PORT', '6379'); # Use the port of the container
define('WP_REDIS_DATABASE', '0'); # Use a database ID per site (0-16)
```

- [ ] Retest performance



## SEO (1h)

- [ ] Ensure that Google can index the site

- [ ] Install and configure Yoast SEO

	- [ ] Set up the Home page and important pages

## Maintenance (30 min)

- [ ] Create a maintenance contract

- [ ] Allocate 30 min each month

- [ ] Perform basic checks

	- [ ] Updates

	- [ ] Site display

	- [ ] Monitoring

	- [ ] Backups

	- [ ] SEO

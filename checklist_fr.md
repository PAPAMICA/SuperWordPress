<p align="center">
  <a href="https://papamica.com">
    <img src="https://zupimages.net/up/20/04/7vtd.png" width="140px" alt="PAPAMICA" />
  </a>
</p>

<p align="center">
  <a href="#"><img src="https://readme-typing-svg.herokuapp.com?center=true&vCenter=true&lines=WordPress-Checklist;"></a>
</p>
  
Plus de détails sur [Wiki-Tech.io](https://wiki-tech.io/Web/WordPress/checklist)
## Projets utiles :
 - [PAPAMICA/docker-environment](https://github.com/PAPAMICA/docker-environment)
 - [PAPAMICA/docker-compose-collection](https://github.com/PAPAMICA/docker-compose-collection)
 - [PAPAMICA/container-updater](https://github.com/PAPAMICA/container-updater)
 - [PAPAMICA/Backup-Script](https://github.com/PAPAMICA/Backup-Script)
 - [PAPAMICA/SuperWordPress](https://github.com/PAPAMICA/SuperWordPress)

## Déploiement de WordPress (30 min)

 - [ ] Mettre en place WordPress et sa base de données

 - [ ] Configurer le fichier uploads.ini

```php
file_uploads = On
memory_limit = 500M
upload_max_filesize = 500M
post_max_size = 500M
max_execution_time = 600
```

 - [ ] Installer et configurer WP Mail SMTP

```ini
Adresse email d’envoi : notification@domain.com
Forcer l’e-mail d’expédition : Activé
Nom de l’expéditeur : Nom_du_site
Forcer le nom d’expéditeur : Activé
Service d’envoi : Autre SMTP
Hébergeur SMTP : 10.20.10.201
Cryptage : Aucun
Port SMTP : 25
TLS auto : Désactivé
Authentification : Désactivé
```

## Sauvegarde (15 min)

 - [ ] Installer et configurer UpDraftPlus

	 - [ ] Configurer le compte Google Drive

	 - [ ] Configurer les sauvegardes automatiques

## Sécurisation (30 min)

- [ ] Activer les mises à jour automatiques

- [ ] Installer et configurer Wordfence Security

- [ ] Installer et activer l’extension Wordfence Security

	- [ ] Activer les scans automatiques

	- [ ] Activer le firewall

	- [ ] Activer la 2FA pour l’ensemble des comptes

- [ ] Installer et activer l’extension WP Hide & Security Enhancer

	- [ ] Lancer le setup d’exemple

	- [ ] Activer le captcha v3 dans l’onglet WP Hide → Security → Captcha

	- [ ] Changer le lien d’administration dans l’onglet WP Hide → Hide → Login/

## Supervision (30 min)

- [ ] UptimeKuma
	- [ ] Créer la sonde sur un mot qui apparait sur la page d’accueil

	- [ ] Ajouter l'adresse mail du client dans le champ description

	- [ ] Penser à activer la vérification du certificat

	- [ ] Configurer une notification NTFY si 5 essais de 60 secondes fails

	- [ ] Cloner & Configurer une notification Telegram si 3 essais de 300

	- [ ] Cloner & Configurer une notification mail client si 6 essais de 300

- [ ] Pour client VIP → Supervision complète avec Zabbix

- [ ] Installer et configurer JetPack

	- [ ] Activer la Surveillance des temps d’arrêt dans les règlages

	- [ ] Lier Jetpack avec compte WordPress.com

## Mise en page

- [ ] Installer Elementor

- [ ] Installer Elementor Pro

- [ ] Installer Envato Elements

- [ ] Installer Duplicate Page

- [ ] Faire le thème général du site

	- [ ] Couleurs

	- [ ] Police d’écriture

	- [ ] Favicon

- [ ] Faire les menus

- [ ] Faire l'entête

	- [ ] Logo

	- [ ] Menu ordinateur

	- [ ] Menu téléphone

	- [ ] Call to Action

- [ ] Faire le pied de page

	- [ ] Logo

	- [ ] Réseaux sociaux

	- [ ] Liens utiles

	- [ ] Contact / Newsletter

	- [ ] Copyright

- [ ] Si blog → Faire le template de la page

- [ ] Faire le template Erreur 404

## Pages essentiels

- [ ] Accueil

- [ ] Contact

	- [ ] Faire le formulaire

	- [ ] Configurer le Captcha v3

- [ ] Politique de confidentialité

- [ ] Mentions légales

- [ ] Si boutique → Conditions générales de vente

## Analytiques (30 min)

- [ ] Installer et configurer Complianz RGPD

- [ ] Installer et configurer Burst Statistics

## Optimisation (30 min)

- [ ] Vérifier les performances avec Pagespeed

- [ ] Vérifier les performances avec Pingdom

- [ ] Installer et configurer Lite Speed Cache

	- [ ] Appliquer les préréglages avancés

	- [ ] Configuré la clé d’API QUIC

- [ ] Installer et configurer Redis

	- [ ] Ajouter les variables suivantes dans `wp-config.php` :

```php
define('WP_REDIS_HOST', 'redis'); # Utiliser le nom du container
define('WP_REDIS_PORT', '6379'); # Utiliser le port du container
define('WP_REDIS_DATABASE', '0'); # Utiliser un Id de base de données par site (0-16)
```

- [ ] Refaire les tests de performances

## SEO (1h)

- [ ] Vérifier que Google arrive à indexer le site

- [ ] Installer et configurer Yoast SEO

	- [ ] Faire la configuration de la page Accueil et des pages importantes

## Maintenance (30 min)

- [ ] Faire un contrat de maintenance

- [ ] Prévoir 30min chaque mois

- [ ] Faire les vérifications de bases

	- [ ] Mise à jour

	- [ ] Affichage du site

	- [ ] Supervision

	- [ ] Sauvegardes

	- [ ] SEO

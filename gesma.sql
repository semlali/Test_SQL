-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Ven 18 Mars 2016 à 12:45
-- Version du serveur :  5.6.17
-- Version de PHP :  5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données :  `gesma`
--

-- --------------------------------------------------------

--
-- Structure de la table `absence_etudiant`
--
---mouna



CREATE TABLE IF NOT EXISTS `samia` (
  `nbr` int(11) DEFAULT NULL,
)

CREATE TABLE IF NOT EXISTS `absence_etudiant` (
  `nbr_heure` int(11) DEFAULT NULL,
  `date_absence` date NOT NULL,
  `justification_ara` varchar(50) DEFAULT NULL,
  `date_debut_justif` date DEFAULT NULL,
  `date_fin_justif` date DEFAULT NULL,
  `piece_justif` varchar(300) DEFAULT NULL,
  `heure1` int(11) DEFAULT NULL,
  `heure2` int(11) DEFAULT NULL,
  `heure3` int(11) DEFAULT NULL,
  `heure4` int(11) DEFAULT NULL,
  `heure5` int(11) DEFAULT NULL,
  `heure6` int(11) DEFAULT NULL,
  `heure7` int(11) DEFAULT NULL,
  `heure8` int(11) DEFAULT NULL,
  `justification` varchar(200) DEFAULT NULL,
  `id_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `annee_scol` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `id_mois` int(11) NOT NULL,
  PRIMARY KEY (`date_absence`,`id_classe`,`id_etudiant`),
  KEY `fk_absence_etudiant_etudiant1_idx` (`id_etudiant`),
  KEY `fk_absence_etudiant_classe1_idx` (`id_classe`),
  KEY `fk_absence_etudiant_annee_scolaire1_idx` (`annee_scol`),
  KEY `fk_absence_etudiant_semestre1_idx` (`semestre`),
  KEY `fk_absence_etudiant_mois1_idx` (`id_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `absence_etudiant_par_mois`
--

CREATE TABLE IF NOT EXISTS `absence_etudiant_par_mois` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `absence_fonctionaire`
--

CREATE TABLE IF NOT EXISTS `absence_fonctionaire` (
  `nbr_heures` int(11) DEFAULT NULL,
  `date_absence_debut` date NOT NULL,
  `type_absence` varchar(50) DEFAULT NULL,
  `date_absence_fin` date DEFAULT NULL,
  `absence_justification` varchar(200) DEFAULT NULL,
  `heure_debut` int(11) DEFAULT NULL,
  `heure_fin` int(11) DEFAULT NULL,
  `id_absence_fonctionaire` int(11) NOT NULL AUTO_INCREMENT,
  `autorisation_absence` varchar(50) DEFAULT NULL,
  `pieces_jointes` varchar(500) DEFAULT NULL,
  `remplacer_absence` int(11) DEFAULT '0',
  `date_remplacer_absence` date NOT NULL,
  `date_reprendre` date NOT NULL,
  `id_fonctionaire` int(11) NOT NULL,
  `id_mois` int(11) NOT NULL,
  `semestre` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_absence_fonctionaire`,`id_fonctionaire`,`id_mois`,`semestre`),
  KEY `fk_absence_fonctionaire_fonctionaire1_idx` (`id_fonctionaire`),
  KEY `fk_absence_fonctionaire_mois1_idx` (`id_mois`),
  KEY `fk_absence_fonctionaire_semestre1_idx` (`semestre`),
  KEY `fk_absence_fonctionaire_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `absence_sms`
--

CREATE TABLE IF NOT EXISTS `absence_sms` (
  `date_envois_sms` date DEFAULT NULL,
  `date_arriver` date DEFAULT NULL,
  `contenu_sms` varchar(500) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `arriver_tuteur` int(11) DEFAULT '0',
  `remarques_tuteur` varchar(200) DEFAULT NULL,
  `remarques_surv` varchar(200) DEFAULT NULL,
  `prioritaire` int(11) DEFAULT '0',
  `id_sms` int(11) NOT NULL AUTO_INCREMENT,
  `id_mois` int(11) NOT NULL,
  `tuteur_id_tuteur` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  PRIMARY KEY (`id_sms`),
  KEY `fk_absence_sms_mois1_idx` (`id_mois`),
  KEY `fk_absence_sms_tuteur1_idx` (`tuteur_id_tuteur`),
  KEY `fk_absence_sms_classe1_idx` (`id_classe`),
  KEY `fk_absence_sms_etudiant1_idx` (`n_etudiant`),
  KEY `fk_absence_sms_semestre1_idx` (`id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `annee_scolaire`
--

CREATE TABLE IF NOT EXISTS `annee_scolaire` (
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `article`
--

CREATE TABLE IF NOT EXISTS `article` (
  `ref_article` int(11) NOT NULL AUTO_INCREMENT,
  `raison_sortie` text,
  `etat_article` varchar(30) DEFAULT NULL,
  `prix_article` double DEFAULT NULL,
  `date_entree` date DEFAULT NULL,
  `date_sortie` date DEFAULT NULL,
  `id_info_article` int(11) NOT NULL,
  PRIMARY KEY (`ref_article`),
  KEY `fk_article_info_article1_idx` (`id_info_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `article_web`
--

CREATE TABLE IF NOT EXISTS `article_web` (
  `id_article` int(11) NOT NULL AUTO_INCREMENT,
  `titre_article` varchar(200) DEFAULT NULL,
  `contenu_article` text,
  `active` int(11) DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nom_admin` varchar(30) DEFAULT NULL,
  `type_auteur` int(11) DEFAULT NULL,
  `id_page` int(11) NOT NULL,
  PRIMARY KEY (`id_article`,`id_page`),
  KEY `fk_article_web_pages1_idx` (`id_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `association_parenteleve_parametre`
--

CREATE TABLE IF NOT EXISTS `association_parenteleve_parametre` (
  `id_association` int(11) NOT NULL AUTO_INCREMENT,
  `cas` varchar(200) DEFAULT NULL,
  `frais` double DEFAULT NULL,
  PRIMARY KEY (`id_association`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `association_revenue_externe`
--

CREATE TABLE IF NOT EXISTS `association_revenue_externe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_recus` varchar(100) DEFAULT NULL,
  `date_revenue` date DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `nom_concerner` varchar(100) DEFAULT NULL,
  `remarques` varchar(500) DEFAULT NULL,
  `type_paiement` varchar(60) DEFAULT NULL,
  `numero_cheque` varchar(100) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_association_revenue_externe_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `association_revenue_interne`
--

CREATE TABLE IF NOT EXISTS `association_revenue_interne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_recus` varchar(100) DEFAULT NULL,
  `date_revenue` date DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `nom_concerner` varchar(100) DEFAULT NULL,
  `remarques` varchar(500) DEFAULT NULL,
  `type_paiement` varchar(60) DEFAULT NULL,
  `numero_cheque` varchar(100) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id`,`annee_scolaire`),
  KEY `fk_association_revenue_interne_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `association_traitement_sur_banque`
--

CREATE TABLE IF NOT EXISTS `association_traitement_sur_banque` (
  `id_traitement_sur_banque` int(11) NOT NULL AUTO_INCREMENT,
  `somme_vairement` double DEFAULT NULL,
  `numero_recu` varchar(100) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `type_traitement` varchar(60) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_traitement_sur_banque`,`annee_scolaire`),
  KEY `fk_association_traitement_sur_banque_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `bgimages`
--

CREATE TABLE IF NOT EXISTS `bgimages` (
  `id_image` int(11) NOT NULL AUTO_INCREMENT,
  `nom_images` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_image`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `bibliotheque_theme`
--

CREATE TABLE IF NOT EXISTS `bibliotheque_theme` (
  `id_theme` int(11) NOT NULL AUTO_INCREMENT,
  `nom_theme` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `branche`
--

CREATE TABLE IF NOT EXISTS `branche` (
  `id_branche` int(11) NOT NULL AUTO_INCREMENT,
  `nom_branche` varchar(50) DEFAULT NULL,
  `code_branche` int(11) DEFAULT NULL,
  `nom_branche_fr` varchar(200) DEFAULT NULL,
  `abreviation_ara` varchar(50) DEFAULT NULL,
  `abreviation_fr` varchar(50) DEFAULT NULL,
  `code_branche_statistique` varchar(30) DEFAULT NULL,
  `branchecol` varchar(45) DEFAULT NULL,
  `branchecol1` varchar(45) DEFAULT NULL,
  `id_niveau` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  `technique` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_branche`),
  KEY `fk_branche_niveau_scolaire1_idx` (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cadre_professionel`
--

CREATE TABLE IF NOT EXISTS `cadre_professionel` (
  `id_cadre` int(11) NOT NULL AUTO_INCREMENT,
  `code_cadre` varchar(10) DEFAULT NULL,
  `designation_cadre` varchar(50) DEFAULT NULL,
  `designation_cadre_fr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_cadre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `titre_categorie` varchar(200) DEFAULT NULL,
  `num_ordre` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE IF NOT EXISTS `categories` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre_categorie` varchar(200) DEFAULT NULL,
  `num_order` int(11) DEFAULT NULL,
  `modifiable` int(11) DEFAULT '1',
  `level` int(11) DEFAULT NULL,
  `id_mere` int(11) DEFAULT '9',
  `lien_categorie` varchar(200) DEFAULT NULL,
  `titre_categorie_fr` varchar(200) DEFAULT NULL,
  `add_post` int(11) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `categorie_article`
--

CREATE TABLE IF NOT EXISTS `categorie_article` (
  `id_categorie` int(11) NOT NULL AUTO_INCREMENT,
  `designation` varchar(30) DEFAULT NULL,
  `type_categorie` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `certificat_depart`
--

CREATE TABLE IF NOT EXISTS `certificat_depart` (
  `id_certificat_depart` int(11) NOT NULL AUTO_INCREMENT,
  `n_certificat` varchar(100) DEFAULT NULL,
  `date_certificat` date DEFAULT NULL,
  `causes_depart` text,
  `id_ecole` int(11) NOT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  PRIMARY KEY (`id_certificat_depart`),
  KEY `fk_certificat_depart_etablissement_precedente1_idx` (`id_ecole`),
  KEY `fk_certificat_depart_etudiant1_idx` (`n_etudiant`),
  KEY `fk_certificat_depart_classe1_idx` (`id_classe`),
  KEY `fk_certificat_depart_annee_scolaire1_idx` (`annee`),
  KEY `fk_certificat_depart_fonctionaire1_idx` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `certificat_professionel`
--

CREATE TABLE IF NOT EXISTS `certificat_professionel` (
  `mention` varchar(20) DEFAULT NULL,
  `annee_obtention_diplome` int(11) DEFAULT NULL,
  `etablissement` varchar(50) DEFAULT NULL,
  `id_spec` int(11) NOT NULL,
  `n_fonc` int(11) NOT NULL,
  `id_type_certificat` int(11) NOT NULL,
  PRIMARY KEY (`id_spec`,`n_fonc`,`id_type_certificat`),
  KEY `fk_certificat_professionel_fonctionaire1_idx` (`n_fonc`),
  KEY `fk_certificat_professionel_type_certificat_professionel1_idx` (`id_type_certificat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `certificat_scolaire`
--

CREATE TABLE IF NOT EXISTS `certificat_scolaire` (
  `id_certificat_scolaire` int(11) NOT NULL AUTO_INCREMENT,
  `n_certificat` varchar(30) DEFAULT NULL,
  `type_certificat` varchar(50) DEFAULT NULL,
  `date_certificat` date DEFAULT NULL,
  `id_classe` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  `n_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_certificat_scolaire`),
  KEY `fk_certificat_scolaire_classe1_idx` (`id_classe`),
  KEY `fk_certificat_scolaire_annee_scolaire1_idx` (`annee`),
  KEY `fk_certificat_scolaire_etudiant1_idx` (`n_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `certificat_travail`
--

CREATE TABLE IF NOT EXISTS `certificat_travail` (
  `id_certificat_travail` int(11) NOT NULL AUTO_INCREMENT,
  `n_certificat_travail` varchar(30) DEFAULT NULL,
  `date_certificat_travail` date DEFAULT NULL,
  `annee` int(11) NOT NULL,
  `n_fonc` int(11) NOT NULL,
  PRIMARY KEY (`id_certificat_travail`,`annee`,`n_fonc`),
  KEY `fk_certificat_travail_annee_scolaire1_idx` (`annee`),
  KEY `fk_certificat_travail_fonctionaire1_idx` (`n_fonc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classe`
--

CREATE TABLE IF NOT EXISTS `classe` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_classe` varchar(50) DEFAULT NULL,
  `abreviation` varchar(50) DEFAULT NULL,
  `abreviationfr` varchar(50) DEFAULT NULL,
  `id_specialite` int(11) NOT NULL,
  `id_langue` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  `id_surv` int(11) NOT NULL,
  `norder` int(11) DEFAULT NULL,
  `technique` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_classe`),
  KEY `fk_classe_specialite1_idx` (`id_specialite`),
  KEY `fk_classe_langue_etrangere1_idx` (`id_langue`),
  KEY `fk_classe_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_classe_branche1_idx` (`id_branche`),
  KEY `fk_classe_fonctionaire1_idx` (`id_surv`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classe_groupe`
--

CREATE TABLE IF NOT EXISTS `classe_groupe` (
  `id_groupe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(20) DEFAULT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  `annee` int(11) NOT NULL,
  PRIMARY KEY (`id_groupe`),
  KEY `fk_classe_groupe_niveau_scolaire1_idx` (`id_niveau`),
  KEY `fk_classe_groupe_branche1_idx` (`id_branche`),
  KEY `fk_classe_groupe_annee_scolaire1_idx` (`annee`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `classe_prof`
--

CREATE TABLE IF NOT EXISTS `classe_prof` (
  `nombre_heures` int(11) DEFAULT NULL,
  `nbr_jour_matiere` int(11) DEFAULT NULL,
  `id_classe` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  PRIMARY KEY (`id_classe`,`id_prof`,`id_matiere`,`id_groupe`),
  KEY `fk_classe_prof_fonctionaire1_idx` (`id_prof`),
  KEY `fk_classe_prof_matiere1_idx` (`id_matiere`),
  KEY `fk_classe_prof_classe_groupe1_idx` (`id_groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `coefficient`
--

CREATE TABLE IF NOT EXISTS `coefficient` (
  `coefficient` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `nbr_seance` int(11) DEFAULT NULL,
  `nbr_heure_seance` int(11) DEFAULT NULL,
  `coefficient_exam_regional` int(11) DEFAULT NULL,
  `coefficient_exam_national` int(11) DEFAULT NULL,
  `code_matiere_galy` int(11) DEFAULT NULL,
  `grouper` int(11) DEFAULT NULL,
  `nbr_controles` int(11) DEFAULT '3',
  `activites_integer` int(11) DEFAULT '1',
  `id_matiere` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  PRIMARY KEY (`id_branche`,`id_niveau`,`id_matiere`),
  KEY `fk_coefficient_matiere1_idx` (`id_matiere`),
  KEY `fk_coefficient_niveau_scolaire1_idx` (`id_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire`
--

CREATE TABLE IF NOT EXISTS `commentaire` (
  `id_comm` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emetteur` varchar(200) DEFAULT NULL,
  `texte_commentaire` text,
  `emeil_emetteur` varchar(200) DEFAULT NULL,
  `objet` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_comm`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commentaires`
--

CREATE TABLE IF NOT EXISTS `commentaires` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nom_emetteur` varchar(200) DEFAULT NULL,
  `texte_commentaire` text,
  `email_emetteur` varchar(200) DEFAULT NULL,
  `objet` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commentaire_reply`
--

CREATE TABLE IF NOT EXISTS `commentaire_reply` (
  `id_reply` int(11) NOT NULL AUTO_INCREMENT,
  `text_reply` text,
  `date_reply` date DEFAULT NULL,
  `id_commentaire` int(11) NOT NULL,
  PRIMARY KEY (`id_reply`,`id_commentaire`),
  KEY `fk_commentaire_reply_commentaire1_idx` (`id_commentaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `commune`
--

CREATE TABLE IF NOT EXISTS `commune` (
  `n_commune` int(11) NOT NULL AUTO_INCREMENT,
  `code_commune` varchar(100) DEFAULT NULL,
  `libelle_com_fr` varchar(100) DEFAULT NULL,
  `libelle_com_ara` varchar(100) DEFAULT NULL,
  `milieu` int(11) DEFAULT NULL,
  `n_delegation` int(11) NOT NULL,
  PRIMARY KEY (`n_commune`),
  KEY `fk_commune_delegation1_idx` (`n_delegation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `conjoint`
--

CREATE TABLE IF NOT EXISTS `conjoint` (
  `id_conjoint` int(11) NOT NULL AUTO_INCREMENT,
  `nom_conjoint` varchar(50) DEFAULT NULL,
  `nom_conjoint_ar` varchar(50) DEFAULT NULL,
  `matricule` varchar(20) DEFAULT NULL,
  `cin` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_conjoint`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `controle`
--

CREATE TABLE IF NOT EXISTS `controle` (
  `id_controle` int(11) NOT NULL,
  `nom_controle` varchar(45) DEFAULT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  PRIMARY KEY (`id_controle`),
  KEY `fk_controle_matiere1_idx` (`id_matiere`),
  KEY `fk_controle_branche1_idx` (`id_branche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `convocation_absence`
--

CREATE TABLE IF NOT EXISTS `convocation_absence` (
  `id_convocation_absence` int(11) NOT NULL AUTO_INCREMENT,
  `date_debut` date DEFAULT NULL,
  `date_fin` date DEFAULT NULL,
  `n_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_convocation_absence`),
  KEY `fk_convocation_absence_etudiant1_idx` (`n_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cours`
--

CREATE TABLE IF NOT EXISTS `cours` (
  `id_cours` int(11) NOT NULL AUTO_INCREMENT,
  `id_branche` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `lien` varchar(100) DEFAULT NULL,
  `type_doc` varchar(20) DEFAULT NULL,
  `titre` varchar(200) DEFAULT NULL,
  `type_cours` varchar(100) DEFAULT NULL,
  `date_depot` date DEFAULT NULL,
  `visibilite` int(11) DEFAULT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_emetteur` int(11) NOT NULL,
  `nom_emetteur` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cours`),
  KEY `fk_cours_branche1_idx` (`id_branche`),
  KEY `fk_cours_niveau_scolaire1_idx` (`id_niveau`),
  KEY `fk_cours_matiere1_idx` (`id_matiere`),
  KEY `id_emetter_idx` (`id_emetteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `cycle_enseignement`
--

CREATE TABLE IF NOT EXISTS `cycle_enseignement` (
  `id_cycle` int(11) NOT NULL AUTO_INCREMENT,
  `code_cycle` varchar(10) DEFAULT NULL,
  `designation_cycle` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_cycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `delegation`
--

CREATE TABLE IF NOT EXISTS `delegation` (
  `n_delegation` int(11) NOT NULL AUTO_INCREMENT,
  `code_deleg` varchar(100) DEFAULT NULL,
  `libelle_deleg_ara` varchar(100) DEFAULT NULL,
  `libelle_delg_fr` varchar(100) DEFAULT NULL,
  `n_region` int(11) NOT NULL,
  PRIMARY KEY (`n_delegation`),
  KEY `fk_delegation_region1_idx` (`n_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `delegue_responsable_classe`
--

CREATE TABLE IF NOT EXISTS `delegue_responsable_classe` (
  `id_delege` int(11) NOT NULL AUTO_INCREMENT,
  `mission` varchar(200) DEFAULT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id_delege`),
  KEY `fk_delegue_responsable_classe_etudiant1_idx` (`n_etudiant`),
  KEY `fk_delegue_responsable_classe_classe1_idx` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `demande`
--

CREATE TABLE IF NOT EXISTS `demande` (
  `id_demande` int(11) NOT NULL AUTO_INCREMENT,
  `n_emetteur` int(11) DEFAULT NULL,
  `type_emetteur` int(11) DEFAULT NULL,
  `type_demande` varchar(200) DEFAULT NULL,
  `message` varchar(300) DEFAULT NULL,
  `date_envoi` date DEFAULT NULL,
  `statut` varchar(100) DEFAULT NULL,
  `remarque_administration` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_demande`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `detail_emprunt`
--

CREATE TABLE IF NOT EXISTS `detail_emprunt` (
  `id_detail_emprunt` int(11) NOT NULL AUTO_INCREMENT,
  `date_emprunt` date DEFAULT NULL,
  `date_retour` date DEFAULT NULL,
  `date_retour_effective` date DEFAULT NULL,
  `id_livre` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `n_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`id_detail_emprunt`,`id_livre`,`annee_scolaire`,`n_etudiant`),
  KEY `fk_detail_emprunt_livre1_idx` (`id_livre`),
  KEY `fk_detail_emprunt_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_detail_emprunt_etudiant1_idx` (`n_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `detail_paiement`
--

CREATE TABLE IF NOT EXISTS `detail_paiement` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `montant_echeance` double DEFAULT NULL,
  `date_echeance` date DEFAULT NULL,
  `etat_valider` varchar(30) DEFAULT NULL,
  `num_echeance` int(11) DEFAULT NULL,
  `type_paiement` varchar(30) DEFAULT NULL,
  `banque` varchar(30) DEFAULT NULL,
  `date_encaissement` date DEFAULT NULL,
  `n_cheque` varchar(30) DEFAULT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `fk_detail_paiement_etudiant1_idx` (`n_etudiant`),
  KEY `fk_detail_paiement_classe1_idx` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `detail_reunion`
--

CREATE TABLE IF NOT EXISTS `detail_reunion` (
  `id_detail_reunion` int(11) NOT NULL AUTO_INCREMENT,
  `id_fonctionaire` int(11) NOT NULL,
  `id_reunion_pedagogique` int(11) NOT NULL,
  PRIMARY KEY (`id_detail_reunion`),
  KEY `fk_detail_reunion_fonctionaire1_idx` (`id_fonctionaire`),
  KEY `fk_detail_reunion_reunion_pedagogique1_idx` (`id_reunion_pedagogique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `detail_services`
--

CREATE TABLE IF NOT EXISTS `detail_services` (
  `id_detail` int(11) NOT NULL AUTO_INCREMENT,
  `date_envoi` date DEFAULT NULL,
  `nbr_doc` int(11) DEFAULT NULL,
  `num_envoi` varchar(45) DEFAULT NULL,
  `id_fonc` int(11) NOT NULL,
  `id_doc` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  PRIMARY KEY (`id_detail`),
  KEY `fk_detail_services_fonctionaire1_idx` (`id_fonc`),
  KEY `fk_detail_services_documents1_idx` (`id_doc`),
  KEY `fk_detail_services_services_delegation1_idx` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `diplome_fonc`
--

CREATE TABLE IF NOT EXISTS `diplome_fonc` (
  `mention` varchar(20) DEFAULT NULL,
  `annee_obtention_diplome` int(11) DEFAULT NULL,
  `etablissement` varchar(100) DEFAULT NULL,
  `n_fonc` int(11) NOT NULL,
  `id_type_dip` int(11) NOT NULL,
  `id_spec` int(11) NOT NULL,
  PRIMARY KEY (`n_fonc`,`id_type_dip`,`id_spec`),
  KEY `fk_diplome_fonc_type_diplome1_idx` (`id_type_dip`),
  KEY `fk_diplome_fonc_specialisation1_idx` (`id_spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `documents`
--

CREATE TABLE IF NOT EXISTS `documents` (
  `id_doc` int(11) NOT NULL AUTO_INCREMENT,
  `nom_doc` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_doc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `economa_details`
--

CREATE TABLE IF NOT EXISTS `economa_details` (
  `id_facture` int(11) NOT NULL AUTO_INCREMENT,
  `nom_article` varchar(200) DEFAULT NULL,
  `quantite` int(11) DEFAULT NULL,
  `prix_unitaire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_facture`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `economa_facture`
--

CREATE TABLE IF NOT EXISTS `economa_facture` (
  `id_facture` int(11) NOT NULL AUTO_INCREMENT,
  `numero_facture` varchar(100) DEFAULT NULL,
  `date_facture` date DEFAULT NULL,
  `taux_tva` double DEFAULT NULL,
  `nom_fournisseur` varchar(200) DEFAULT NULL,
  `type_paiement` varchar(60) DEFAULT NULL,
  `numero_cheque` varchar(100) DEFAULT NULL,
  `details_facture` varchar(500) DEFAULT NULL,
  `valeur_facture` double DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_facture`,`annee_scolaire`),
  KEY `fk_economa_facture_annee_scolaire2_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `economa_revenue_externe`
--

CREATE TABLE IF NOT EXISTS `economa_revenue_externe` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_recus` varchar(100) DEFAULT NULL,
  `date_revenue` date DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `nom_concerner` varchar(100) DEFAULT NULL,
  `remarques` varchar(500) DEFAULT NULL,
  `type_paiement` varchar(60) DEFAULT NULL,
  `numero_cheque` varchar(100) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id`,`annee_scolaire`),
  KEY `fk_economa_revenue_externe_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `economa_revenue_interne`
--

CREATE TABLE IF NOT EXISTS `economa_revenue_interne` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `numero_recus` varchar(100) DEFAULT NULL,
  `date_revenue` date DEFAULT NULL,
  `valeur` double DEFAULT NULL,
  `nom_concerner` varchar(100) DEFAULT NULL,
  `remarques` varchar(500) DEFAULT NULL,
  `type_paiement` varchar(60) DEFAULT NULL,
  `numero_cheque` varchar(100) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_economa_revenue_interne_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `economa_traitement_sur_banque`
--

CREATE TABLE IF NOT EXISTS `economa_traitement_sur_banque` (
  `id_traitement_sur_banque` int(11) NOT NULL AUTO_INCREMENT,
  `somme_vairement` double DEFAULT NULL,
  `numero_recu` varchar(100) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `type_traitement` varchar(60) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_traitement_sur_banque`,`annee_scolaire`),
  KEY `fk_economa_traitement_sur_banque_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `emplois_temps_days_list`
--

CREATE TABLE IF NOT EXISTS `emplois_temps_days_list` (
  `id_day` int(11) NOT NULL AUTO_INCREMENT,
  `day_name` varchar(100) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_day`),
  KEY `fk_emplois_temps_days_list_annee_scolaire1` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `emplois_temps_disponibility_prof`
--

CREATE TABLE IF NOT EXISTS `emplois_temps_disponibility_prof` (
  `annee_scolaire` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_day` int(11) NOT NULL,
  `id_hour` int(11) NOT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`annee_scolaire`,`id_prof`,`id_day`,`id_hour`),
  KEY `fk_emplois_temps_disponibility_prof_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_emplois_temps_disponibility_prof_fonctionaire1_idx` (`id_prof`),
  KEY `fk_emplois_temps_disponibility_prof_jour1_idx` (`id_day`),
  KEY `fk_emplois_temps_disponibility_prof_horaire1_idx` (`id_hour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emplois_temps_hours_days`
--

CREATE TABLE IF NOT EXISTS `emplois_temps_hours_days` (
  `active` int(11) DEFAULT NULL,
  `annee_scolaire_annee_scolaire` int(11) NOT NULL,
  `id_day` int(11) NOT NULL,
  `id_hour` int(11) NOT NULL,
  PRIMARY KEY (`id_day`,`id_hour`),
  KEY `fk_emplois_temps_hours_days_jour1_idx` (`id_day`),
  KEY `fk_emplois_temps_hours_days_horaire1_idx` (`id_hour`),
  KEY `fk_emplois_temps_hours_days_annee_scolaire1` (`annee_scolaire_annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emplois_two_activities_grouped`
--

CREATE TABLE IF NOT EXISTS `emplois_two_activities_grouped` (
  `id_matiere1` int(11) NOT NULL,
  `id_matiere2` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  PRIMARY KEY (`id_matiere1`,`id_matiere2`,`id_classe`),
  KEY `id_matiere2_idx` (`id_matiere2`),
  KEY `fk_emplois_two_activities_grouped_classe1_idx` (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emploi_groupe_fet`
--

CREATE TABLE IF NOT EXISTS `emploi_groupe_fet` (
  `id_groupe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(20) DEFAULT NULL,
  `classe_id_classe` int(11) NOT NULL,
  `annee_scolaire_annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_groupe`),
  KEY `fk_emploi_groupe_fet_classe1_idx` (`classe_id_classe`),
  KEY `fk_emploi_groupe_fet_annee_scolaire1_idx` (`annee_scolaire_annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `emploi_temps`
--

CREATE TABLE IF NOT EXISTS `emploi_temps` (
  `id_prof` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_jour` int(11) NOT NULL,
  `id_horaire` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_groupe` int(11) NOT NULL,
  PRIMARY KEY (`id_salle`,`id_classe`,`id_jour`,`id_horaire`,`id_matiere`,`id_groupe`,`id_prof`),
  KEY `fk_emploi_temps_fonctionaire1_idx` (`id_prof`),
  KEY `fk_emploi_temps_classe1_idx` (`id_classe`),
  KEY `fk_emploi_temps_jour1_idx` (`id_jour`),
  KEY `fk_emploi_temps_horaire1_idx` (`id_horaire`),
  KEY `fk_emploi_temps_matiere1_idx` (`id_matiere`),
  KEY `fk_emploi_temps_emploi_groupe_fet1_idx` (`id_groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emploi_temps_hours_list`
--

CREATE TABLE IF NOT EXISTS `emploi_temps_hours_list` (
  `active` int(11) DEFAULT NULL,
  `id_hour` int(11) NOT NULL,
  `hour_name` varchar(45) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_hour`),
  KEY `fk_emploi_temps_hours_list_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `emploi_temps_matiere_preferances_horaires`
--

CREATE TABLE IF NOT EXISTS `emploi_temps_matiere_preferances_horaires` (
  `id_day` int(11) NOT NULL,
  `id_hour` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  PRIMARY KEY (`id_day`,`id_hour`,`id_matiere`),
  KEY `fk_emploi_temps_matiere_preferances_horaires_horaire1_idx` (`id_hour`),
  KEY `fk_emploi_temps_matiere_preferances_horaires_matiere1_idx` (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `envois_sms`
--

CREATE TABLE IF NOT EXISTS `envois_sms` (
  `id_sms` int(11) NOT NULL AUTO_INCREMENT,
  `etat` int(11) DEFAULT NULL,
  `contenu` varchar(500) DEFAULT NULL,
  `date_time` date NOT NULL DEFAULT '2000-01-01',
  `nbr` int(11) NOT NULL DEFAULT '0',
  `date_envois` date NOT NULL DEFAULT '2000-01-01',
  `prioritaire` int(11) DEFAULT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `nom_etudiant` varchar(50) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `id_session` int(11) NOT NULL,
  PRIMARY KEY (`id_sms`,`n_etudiant`,`id_classe`),
  KEY `fk_envois_sms_etudiant1_idx` (`n_etudiant`),
  KEY `fk_envois_sms_classe1_idx` (`id_classe`),
  KEY `fk_envois_sms_fonctionaire1_idx` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etablissement`
--

CREATE TABLE IF NOT EXISTS `etablissement` (
  `id_etablissement` int(11) NOT NULL AUTO_INCREMENT,
  `origine` int(11) DEFAULT NULL,
  `code_etablissement` varchar(100) DEFAULT NULL,
  `nom_etabli` varchar(100) DEFAULT NULL,
  `nom_etablissement_fr` varchar(100) DEFAULT NULL,
  `id_niveau_etablissement` int(11) NOT NULL,
  `id_commune` int(11) NOT NULL,
  `id_type_etablisssement` int(11) NOT NULL,
  PRIMARY KEY (`id_etablissement`),
  KEY `fk_etablissement_precedente_niveau_etablissement1_idx` (`id_niveau_etablissement`),
  KEY `fk_etablissement_precedente_commune1_idx` (`id_commune`),
  KEY `fk_etablissement_precedente_type_etablissement1_idx` (`id_type_etablisssement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etat_etablissement`
--

CREATE TABLE IF NOT EXISTS `etat_etablissement` (
  `id_etat` int(11) NOT NULL AUTO_INCREMENT,
  `etat_etablissement` varchar(200) DEFAULT NULL,
  `degat` varchar(500) DEFAULT NULL,
  `visite` varchar(500) DEFAULT NULL,
  `activite` varchar(500) DEFAULT NULL,
  `remarques` varchar(500) DEFAULT NULL,
  `date_etat` date DEFAULT NULL,
  `id_session` int(11) NOT NULL,
  PRIMARY KEY (`id_etat`),
  KEY `fk_etat_etablissement_fonctionaire1_idx` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etat_livre`
--

CREATE TABLE IF NOT EXISTS `etat_livre` (
  `id_etat_livre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_etat_livre` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_etat_livre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etat_reussite`
--

CREATE TABLE IF NOT EXISTS `etat_reussite` (
  `id_etat_reussite` int(11) NOT NULL AUTO_INCREMENT,
  `etat_reussite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_etat_reussite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant`
--

CREATE TABLE IF NOT EXISTS `etudiant` (
  `n_etudiant` int(11) NOT NULL DEFAULT '0',
  `nom_etudiant` varchar(45) NOT NULL,
  `tuteur_id_tuteur` int(11) NOT NULL,
  `prenom_etudiant` varchar(45) DEFAULT NULL,
  `nom_etudiant_ara` varchar(45) DEFAULT NULL,
  `prenom_etudiant_ara` varchar(45) DEFAULT NULL,
  `n_inscription` varchar(45) DEFAULT NULL,
  `date_inscription` date DEFAULT NULL,
  `dispense` varchar(5) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `lieu_naissance_ara` varchar(100) DEFAULT NULL,
  `bourse` varchar(5) DEFAULT NULL,
  `n_bourse` varchar(20) DEFAULT NULL,
  `etat_etudiant` varchar(20) DEFAULT NULL,
  `date_etat_etudiant` date DEFAULT NULL,
  `photo` varchar(100) DEFAULT NULL,
  `sexe` varchar(6) DEFAULT NULL,
  `nbr_annee_primaire` int(11) DEFAULT NULL,
  `nbr_annee_college` int(11) DEFAULT NULL,
  `n_certificat_depart` varchar(100) DEFAULT NULL,
  `date_certificat_depart` date DEFAULT NULL,
  `n_nationnal` varchar(50) DEFAULT NULL,
  `dossier_scolaire` varchar(100) DEFAULT NULL,
  `arrivee_dossier` int(11) DEFAULT '0',
  `date_arrivee_dossier` date DEFAULT NULL,
  `login` varchar(100) DEFAULT NULL,
  `pass` varchar(100) DEFAULT NULL,
  `hobbies` varchar(200) DEFAULT NULL,
  `nbr_annee_1lycee` int(11) DEFAULT NULL,
  `nbr_annee_2lycee` int(11) DEFAULT NULL,
  `nbr_annee_3lycee` int(11) DEFAULT NULL,
  `cin` varchar(20) DEFAULT NULL,
  `valeur_bourse_debut` double DEFAULT NULL,
  `valeur_bourse_fin` double DEFAULT NULL,
  `n_inscription_origine` varchar(100) DEFAULT NULL,
  `num_ordre` int(11) DEFAULT NULL,
  `codebare` varchar(100) DEFAULT NULL,
  `remarque` varchar(100) DEFAULT NULL,
  `moyenne_reussi_college` double DEFAULT NULL,
  `n_national_massar` varchar(100) DEFAULT NULL,
  `attente_attestation_depart` int(11) NOT NULL DEFAULT '0',
  `email` varchar(200) DEFAULT NULL,
  `activation_code` varchar(200) DEFAULT NULL,
  `new_etudiant` int(11) DEFAULT '0',
  `id_langue_etrangere` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  `date_bourse` date DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `etablis_prec` int(11) DEFAULT NULL,
  `id_etablissement_destination` int(11) DEFAULT NULL,
  `id_branche_precedente` int(11) DEFAULT NULL,
  `id_branche_orientation` int(11) DEFAULT NULL,
  `id_branche_prochaine` int(11) DEFAULT NULL,
  `active` int(11) DEFAULT '0',
  PRIMARY KEY (`n_etudiant`),
  KEY `fk_etudiant_tuteur_idx` (`tuteur_id_tuteur`),
  KEY `fk_etudiant_langue_etrangere1_idx` (`id_langue_etrangere`),
  KEY `fk_etudiant_specialite1_idx` (`id_specialite`),
  KEY `fk_etudiant_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `etablis_prec` (`etablis_prec`),
  KEY `id_etablissement_destination` (`id_etablissement_destination`),
  KEY `id_branche_orientation` (`id_branche_orientation`),
  KEY `id_branche_precedente` (`id_branche_precedente`),
  KEY `id_branche_orientation_2` (`id_branche_orientation`),
  KEY `id_branche_prochaine` (`id_branche_prochaine`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_classe`
--

CREATE TABLE IF NOT EXISTS `etudiant_classe` (
  `date_inscription` date DEFAULT NULL,
  `paiement` varchar(10) DEFAULT NULL,
  `nr_paiement` varchar(50) DEFAULT NULL,
  `date_paiement` date DEFAULT NULL,
  `prix` double DEFAULT NULL,
  `remarques` varchar(100) DEFAULT NULL,
  `type_paiement` varchar(100) DEFAULT NULL,
  `nb_echeance` int(11) DEFAULT NULL,
  `frais` double DEFAULT NULL,
  `reduction` double DEFAULT NULL,
  `moyenne_generale` double DEFAULT NULL,
  `frais_association` double DEFAULT NULL,
  `recus_associations` varchar(100) DEFAULT NULL,
  `date_reglement_association` date DEFAULT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_etat_reussite` int(11) NOT NULL,
  `id_association` int(11) NOT NULL,
  `etat_reussite` varchar(50) DEFAULT NULL,
  `etat_etudiant` varchar(50) DEFAULT NULL,
  `recus_association` int(11) DEFAULT NULL,
  `id_user_association` int(11) DEFAULT NULL,
  `paiement_association` varchar(10) DEFAULT NULL,
  `id_branche_precedente_orientation` int(11) DEFAULT NULL,
  `orientation_accepter` int(11) DEFAULT NULL,
  `moyenne_orientation` double DEFAULT NULL,
  `id_branche_demander` int(11) DEFAULT NULL,
  `date_demande_orientation` date DEFAULT NULL,
  PRIMARY KEY (`n_etudiant`,`id_classe`),
  UNIQUE KEY `id_branche_precedente_orientation` (`id_branche_precedente_orientation`),
  KEY `fk_etudiant_classe_classe1_idx` (`id_classe`),
  KEY `fk_etudiant_classe_etat_reussite1_idx` (`id_etat_reussite`),
  KEY `fk_etudiant_classe_association_parenteleve_parametre1_idx` (`id_association`),
  KEY `id_branche_demander` (`id_branche_demander`),
  KEY `orientation_accepter` (`orientation_accepter`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `etudiant_liste_attente`
--

CREATE TABLE IF NOT EXISTS `etudiant_liste_attente` (
  `id_etudiant` int(11) NOT NULL AUTO_INCREMENT,
  `nom_etudiant` varchar(50) DEFAULT NULL,
  `prenom_etudiant` varchar(50) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(100) DEFAULT NULL,
  `lieu_naissance_ara` varchar(100) DEFAULT NULL,
  `sexe` varchar(6) DEFAULT NULL,
  `n_national` varchar(50) DEFAULT NULL,
  `remarque` varchar(100) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `moyenne_generale` varchar(20) DEFAULT NULL,
  `date_demande` date DEFAULT NULL,
  `priorite` int(11) DEFAULT NULL,
  `intermediare` varchar(100) DEFAULT NULL,
  `etablis_prec` int(11) NOT NULL,
  `id_langue_etrangere` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  `id_specialite` int(11) NOT NULL,
  PRIMARY KEY (`id_etudiant`),
  KEY `fk_etudiant_liste_attente_etablissement_precedente1_idx` (`etablis_prec`),
  KEY `fk_etudiant_liste_attente_langue_etrangere1_idx` (`id_langue_etrangere`),
  KEY `fk_etudiant_liste_attente_niveau_scolaire1_idx` (`id_niveau`),
  KEY `fk_etudiant_liste_attente_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_etudiant_liste_attente_branche1_idx` (`id_branche`),
  KEY `fk_etudiant_liste_attente_specialite1_idx` (`id_specialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `fonctionaire`
--

CREATE TABLE IF NOT EXISTS `fonctionaire` (
  `n_fonc` int(11) NOT NULL AUTO_INCREMENT,
  `nom_fonc` varchar(50) DEFAULT NULL,
  `prenom_fonc` varchar(50) DEFAULT NULL,
  `nom_fonc_ara` varchar(50) DEFAULT NULL,
  `prenom_fonc_ara` varchar(50) DEFAULT NULL,
  `matricule` int(11) DEFAULT NULL,
  `nationalite` varchar(50) DEFAULT NULL,
  `cin` varchar(20) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(50) DEFAULT NULL,
  `sexe` varchar(6) DEFAULT NULL,
  `echelon` int(11) DEFAULT NULL,
  `date_echelon` date DEFAULT NULL,
  `cadre_actuel` varchar(100) DEFAULT NULL,
  `date_nomination_etab` date DEFAULT NULL,
  `situation_familiale` varchar(30) DEFAULT NULL,
  `nbr_enfants` int(11) DEFAULT NULL,
  `adresse` varchar(100) DEFAULT NULL,
  `ville` varchar(30) DEFAULT NULL,
  `telephone` varchar(20) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `photo_fonc` varchar(100) DEFAULT NULL,
  `date_travail` date DEFAULT NULL,
  `login` varchar(30) DEFAULT NULL,
  `pass` varchar(30) DEFAULT NULL,
  `code_fonctionaire` varchar(100) DEFAULT NULL,
  `date_titularisation` date DEFAULT NULL,
  `date_cadre` date DEFAULT NULL,
  `date_echel` date DEFAULT NULL,
  `type_acces_echel` varchar(50) DEFAULT NULL,
  `enciennete_echel` varchar(20) DEFAULT NULL,
  `date_tache` date DEFAULT NULL,
  `date_nomination_delegation` date DEFAULT NULL,
  `date_nomination_academie` date DEFAULT NULL,
  `type_fonc` varchar(40) DEFAULT NULL,
  `date_situation_familiale` date DEFAULT NULL,
  `echel` varchar(60) DEFAULT NULL,
  `mode_affectaion` varchar(100) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_conjoint` int(11) NOT NULL,
  `id_tache` int(11) NOT NULL,
  `id_cycle` int(11) NOT NULL,
  `activation` int(11) DEFAULT NULL,
  PRIMARY KEY (`n_fonc`),
  KEY `fk_fonctionaire_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_fonctionaire_matiere1_idx` (`id_matiere`),
  KEY `fk_fonctionaire_conjoint1_idx` (`id_conjoint`),
  KEY `fk_fonctionaire_tache1_idx` (`id_tache`),
  KEY `fk_fonctionaire_cycle_enseignement1_idx` (`id_cycle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `frais`
--

CREATE TABLE IF NOT EXISTS `frais` (
  `nom_frais` varchar(20) NOT NULL,
  `prix` double DEFAULT NULL,
  `code_frais` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`code_frais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `frais_inscription`
--

CREATE TABLE IF NOT EXISTS `frais_inscription` (
  `id_frais` int(11) NOT NULL AUTO_INCREMENT,
  `association_parents` double DEFAULT NULL,
  `association_sportif` double DEFAULT NULL,
  `assurance_scolaire` double DEFAULT NULL,
  PRIMARY KEY (`id_frais`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `groupe`
--

CREATE TABLE IF NOT EXISTS `groupe` (
  `id_groupe` int(11) NOT NULL AUTO_INCREMENT,
  `nom_groupe` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id_groupe`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `historique_fonc`
--

CREATE TABLE IF NOT EXISTS `historique_fonc` (
  `id_historique` int(11) NOT NULL AUTO_INCREMENT,
  `etablissement` varchar(50) DEFAULT NULL,
  `ville` varchar(20) DEFAULT NULL,
  `profession` varchar(50) DEFAULT NULL,
  `debut` int(11) DEFAULT NULL,
  `fin` int(11) DEFAULT NULL,
  `n_fon` int(11) NOT NULL,
  PRIMARY KEY (`id_historique`),
  KEY `fk_historique_fonc_fonctionaire1_idx` (`n_fon`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `horaire`
--

CREATE TABLE IF NOT EXISTS `horaire` (
  `id_horaire` int(11) NOT NULL AUTO_INCREMENT,
  `horaire` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_horaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `incidents`
--

CREATE TABLE IF NOT EXISTS `incidents` (
  `id_incident` int(11) NOT NULL AUTO_INCREMENT,
  `lieu_incident` varchar(100) DEFAULT NULL,
  `concerne` varchar(200) DEFAULT NULL,
  `procedure_prise` varchar(500) DEFAULT NULL,
  `date_incident` date DEFAULT NULL,
  `nature_incident` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_incident`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `informations_fiche_inscription`
--

CREATE TABLE IF NOT EXISTS `informations_fiche_inscription` (
  `id_fiche` int(11) NOT NULL AUTO_INCREMENT,
  `ligne1` varchar(500) DEFAULT NULL,
  `ligne2` varchar(500) DEFAULT NULL,
  `ligne3` varchar(500) DEFAULT NULL,
  `ligne4` varchar(500) DEFAULT NULL,
  `ligne5` varchar(500) DEFAULT NULL,
  `ligne6` varchar(500) DEFAULT NULL,
  `ligne7` varchar(500) DEFAULT NULL,
  `num_recus` int(11) DEFAULT NULL,
  `num_recus_depart` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_fiche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `infos_etablissement`
--

CREATE TABLE IF NOT EXISTS `infos_etablissement` (
  `nom_etablissement` varchar(100) NOT NULL,
  `code_etablissement` varchar(50) DEFAULT NULL,
  `adresse_etablissement` varchar(250) DEFAULT NULL,
  `ville_etablissement` varchar(50) DEFAULT NULL,
  `email_etablissement` varchar(50) DEFAULT NULL,
  `site_etablissement` varchar(50) DEFAULT NULL,
  `tel_etablissement` varchar(20) DEFAULT NULL,
  `academie` varchar(300) DEFAULT NULL,
  `ministere` varchar(200) DEFAULT NULL,
  `code_statique` varchar(50) DEFAULT NULL,
  `annee_debut` int(11) DEFAULT NULL,
  `academie_fr` varchar(200) DEFAULT NULL,
  `ville_fr` varchar(200) DEFAULT NULL,
  `nom_etablissement_fr` varchar(200) DEFAULT NULL,
  `nom_log` varchar(20) DEFAULT NULL,
  `nom_img` varchar(20) DEFAULT NULL,
  `home` text,
  `delegation` varchar(100) DEFAULT NULL,
  `royaume_maroc` varchar(100) DEFAULT NULL,
  `mot_de_passe_email` varchar(60) DEFAULT NULL,
  `fb_page` varchar(200) DEFAULT NULL,
  `license` varchar(100) DEFAULT NULL,
  `delegation_fr` varchar(100) DEFAULT NULL,
  `royaume_maroc_fr` varchar(100) DEFAULT NULL,
  `ministere_fr` varchar(100) DEFAULT NULL,
  `codedel` int(11) DEFAULT NULL,
  `code_reg` int(11) DEFAULT NULL,
  `adresse_fr` varchar(200) DEFAULT NULL,
  `tafouid` int(11) DEFAULT NULL,
  `id_moufwad` int(11) DEFAULT NULL,
  `date_debut_tafouid` date DEFAULT NULL,
  `date_fin_tafouid` date DEFAULT NULL,
  `sms_user` varchar(100) DEFAULT NULL,
  `sms_password` varchar(100) DEFAULT NULL,
  `sms_credit` int(11) DEFAULT NULL,
  `version_gesma` varchar(20) DEFAULT NULL,
  `royaume_maroc_tifinagh` varchar(200) DEFAULT NULL,
  `ministere_tifinagh` varchar(200) DEFAULT NULL,
  `academie_tifinagh` varchar(200) DEFAULT NULL,
  `delegation_tifinagh` varchar(200) DEFAULT NULL,
  `serveur_sms` varchar(200) DEFAULT 'megacom.myvnc.com',
  `nom_etalissement_tifinagh` varchar(200) DEFAULT NULL,
  `fond_gesma` int(11) DEFAULT NULL,
  `loi_interne` text,
  `smtp_mail` varchar(100) DEFAULT NULL,
  `mobile_directeur` varchar(20) DEFAULT NULL,
  `id_commune` int(11) NOT NULL,
  `id_etablissement_precedente` int(11) NOT NULL,
  `id_delegation` int(11) NOT NULL,
  `service_sms` int(11) DEFAULT '0',
  PRIMARY KEY (`nom_etablissement`,`id_etablissement_precedente`,`id_delegation`),
  KEY `fk_infos_etablissement_commune1_idx` (`id_commune`),
  KEY `fk_infos_etablissement_etablissement1_idx` (`id_etablissement_precedente`),
  KEY `fk_infos_etablissement_delegation1_idx` (`id_delegation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `info_article`
--

CREATE TABLE IF NOT EXISTS `info_article` (
  `id_info_article` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_article` int(11) DEFAULT NULL,
  `designation` varchar(30) DEFAULT NULL,
  `id_groupe` int(11) NOT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_info_article`),
  KEY `fk_info_article_groupe1_idx` (`id_groupe`),
  KEY `fk_info_article_categorie_article1_idx` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `jour`
--

CREATE TABLE IF NOT EXISTS `jour` (
  `id_jour` int(11) NOT NULL,
  `jour` varchar(15) DEFAULT NULL,
  `jour_ara` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id_jour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `journal_login`
--

CREATE TABLE IF NOT EXISTS `journal_login` (
  `id_journal` int(11) NOT NULL AUTO_INCREMENT,
  `date_login` date DEFAULT NULL,
  `etat_login` varchar(20) DEFAULT NULL,
  `user_name` varchar(100) DEFAULT NULL,
  `user_computer` varchar(100) DEFAULT NULL,
  `id_fonctionaire` int(11) NOT NULL,
  PRIMARY KEY (`id_journal`),
  KEY `fk_journal_login_fonctionaire1_idx` (`id_fonctionaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `langue_etrangere`
--

CREATE TABLE IF NOT EXISTS `langue_etrangere` (
  `id_langue_etrangere` int(11) NOT NULL AUTO_INCREMENT,
  `nom_langue_etrangere` varchar(100) DEFAULT NULL,
  `code_galy` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_langue_etrangere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `id_livre` int(11) NOT NULL AUTO_INCREMENT,
  `nom_livre` varchar(45) DEFAULT NULL,
  `nom_auteur` varchar(45) DEFAULT NULL,
  `etat_livre` int(11) DEFAULT NULL,
  `disponibilite` varchar(20) DEFAULT NULL,
  `id_branche` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_theme` int(11) NOT NULL,
  `prix_emprunt` double DEFAULT NULL,
  PRIMARY KEY (`id_livre`),
  KEY `fk_livre_branche1_idx` (`id_branche`),
  KEY `fk_livre_niveau_scolaire1_idx` (`id_niveau`),
  KEY `fk_livre_matiere1_idx` (`id_matiere`),
  KEY `fk_livre_bibliotheque_theme1_idx` (`id_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `login`
--

CREATE TABLE IF NOT EXISTS `login` (
  `pseudo` varchar(50) NOT NULL,
  `password` varchar(100) NOT NULL,
  `id_fonc` int(11) NOT NULL,
  PRIMARY KEY (`pseudo`,`password`),
  KEY `fk_login_fonctionaire1_idx` (`id_fonc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `matiere`
--

CREATE TABLE IF NOT EXISTS `matiere` (
  `id_matiere` int(11) NOT NULL AUTO_INCREMENT,
  `nom_matiere` varchar(50) DEFAULT NULL,
  `abrev_matiere` varchar(10) DEFAULT NULL,
  `groupe` varchar(100) DEFAULT NULL,
  `dispatch` int(11) DEFAULT NULL,
  `nom_matiere_fr` varchar(50) DEFAULT NULL,
  `code_matiere_galy` int(11) DEFAULT NULL,
  `abreviation_ara` varchar(30) DEFAULT NULL,
  `abreviation_fr` varchar(30) DEFAULT NULL,
  `activites_integer` int(11) DEFAULT '1',
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_matiere`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `messages`
--

CREATE TABLE IF NOT EXISTS `messages` (
  `id_message` int(11) NOT NULL AUTO_INCREMENT,
  `type_emetteur` int(11) DEFAULT NULL,
  `type_recepteur` int(11) DEFAULT NULL,
  `objet` varchar(100) DEFAULT NULL,
  `date_message` date NOT NULL,
  `message` text,
  `vu` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_message`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `mois`
--

CREATE TABLE IF NOT EXISTS `mois` (
  `num_mois` int(11) NOT NULL,
  `nom_mois` varchar(100) DEFAULT NULL,
  `nom_mois_fr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`num_mois`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `niveau_etablissement`
--

CREATE TABLE IF NOT EXISTS `niveau_etablissement` (
  `id_niveau_etablissement` int(11) NOT NULL AUTO_INCREMENT,
  `nom_niveau_etablissement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_niveau_etablissement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `niveau_scolaire`
--

CREATE TABLE IF NOT EXISTS `niveau_scolaire` (
  `code_niveau` int(11) NOT NULL AUTO_INCREMENT,
  `niveau_scolaire` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`code_niveau`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `note`
--

CREATE TABLE IF NOT EXISTS `note` (
  `note` double NOT NULL,
  `trimestre` varchar(50) NOT NULL,
  `valide` int(11) DEFAULT NULL,
  `id_matiere` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_type` int(11) NOT NULL,
  PRIMARY KEY (`note`,`trimestre`,`id_matiere`,`id_classe`,`id_prof`,`id_semestre`,`id_type`),
  KEY `fk_note_matiere1_idx` (`id_matiere`),
  KEY `fk_note_classe1_idx` (`id_classe`),
  KEY `fk_note_fonctionaire1_idx` (`id_prof`),
  KEY `fk_note_semestre1_idx` (`id_semestre`),
  KEY `fk_note_note_type1_idx` (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `notes_administratives_ministerielles`
--

CREATE TABLE IF NOT EXISTS `notes_administratives_ministerielles` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `type_note` varchar(500) DEFAULT NULL,
  `num_note` varchar(100) DEFAULT NULL,
  `sujet_note` varchar(500) DEFAULT NULL,
  `lien_note` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_note`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `note_controle`
--

CREATE TABLE IF NOT EXISTS `note_controle` (
  `valide` int(11) NOT NULL DEFAULT '0',
  `id_etudiant` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_prof` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_controle` int(11) NOT NULL,
  PRIMARY KEY (`id_prof`,`id_classe`,`id_etudiant`,`id_semestre`),
  KEY `fk_note_controle_classe1_idx` (`id_classe`),
  KEY `fk_note_controle_fonctionaire1_idx` (`id_prof`),
  KEY `fk_note_controle_semestre1_idx` (`id_semestre`),
  KEY `fk_note_controle_controle1_idx` (`id_controle`),
  KEY `fk_note_controle_etudiant1` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `note_professionel`
--

CREATE TABLE IF NOT EXISTS `note_professionel` (
  `id_note` int(11) NOT NULL AUTO_INCREMENT,
  `note` double DEFAULT NULL,
  `type_note` varchar(50) DEFAULT NULL,
  `date_note` date DEFAULT NULL,
  `id_fonc` int(11) NOT NULL,
  PRIMARY KEY (`id_note`),
  KEY `fk_note_professionel_fonctionaire1_idx` (`id_fonc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `note_type`
--

CREATE TABLE IF NOT EXISTS `note_type` (
  `id_type` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `notices`
--

CREATE TABLE IF NOT EXISTS `notices` (
  `id_notice` int(11) NOT NULL AUTO_INCREMENT,
  `fichier` varchar(250) DEFAULT NULL,
  `titre` varchar(100) DEFAULT NULL,
  `id_type_notice` int(11) DEFAULT NULL,
  `sujet` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`id_notice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `nr_examen_regional`
--

CREATE TABLE IF NOT EXISTS `nr_examen_regional` (
  `nr_examen` int(11) NOT NULL,
  `id_salle` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_etudiant` int(11) NOT NULL,
  PRIMARY KEY (`nr_examen`,`id_salle`,`annee_scolaire`,`id_etudiant`),
  KEY `fk_nr_examen_regional_salle1_idx` (`id_salle`),
  KEY `fk_nr_examen_regional_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_nr_examen_regional_etudiant1_idx` (`id_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `orientation_etudiant`
--

CREATE TABLE IF NOT EXISTS `orientation_etudiant` (
  `n_record` varchar(100) NOT NULL,
  `n_etudiant` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  `id_etablissement` int(11) NOT NULL,
  KEY `fk_orientation_etudiant_branche1_idx` (`id_branche`),
  KEY `fk_orientation_etudiant_etablissement_precedente1_idx` (`id_etablissement`),
  KEY `fk_orientation_etudiant_etudiant1` (`n_etudiant`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `pages`
--

CREATE TABLE IF NOT EXISTS `pages` (
  `id_page` int(11) NOT NULL AUTO_INCREMENT,
  `titre_page` varchar(200) DEFAULT NULL,
  `id_categorie` int(11) NOT NULL,
  PRIMARY KEY (`id_page`),
  KEY `fk_pages_categorie1_idx` (`id_categorie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `photo`
--

CREATE TABLE IF NOT EXISTS `photo` (
  `id_photo` int(11) NOT NULL AUTO_INCREMENT,
  `nom_photo` varchar(200) DEFAULT NULL,
  `description_photo` text,
  `id_article` int(11) NOT NULL,
  `photocol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_photo`),
  KEY `fk_photo_article1_idx` (`id_article`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `planning_exam_n3`
--

CREATE TABLE IF NOT EXISTS `planning_exam_n3` (
  `id_planning` int(11) NOT NULL AUTO_INCREMENT,
  `jour1` varchar(200) DEFAULT NULL,
  `jour2` varchar(200) DEFAULT NULL,
  `jour3` varchar(200) DEFAULT NULL,
  `matiere1` varchar(200) DEFAULT NULL,
  `matiere2` varchar(200) DEFAULT NULL,
  `matiere3` varchar(200) DEFAULT NULL,
  `matiere4` varchar(200) DEFAULT NULL,
  `matiere5` varchar(200) DEFAULT NULL,
  `matiere6` varchar(200) DEFAULT NULL,
  `matiere7` varchar(200) DEFAULT NULL,
  `matiere8` varchar(200) DEFAULT NULL,
  `matiere9` varchar(200) DEFAULT NULL,
  `matiere10` varchar(200) DEFAULT NULL,
  `matiere11` varchar(200) DEFAULT NULL,
  `matiere12` varchar(200) DEFAULT NULL,
  `temp1` varchar(200) DEFAULT NULL,
  `temp2` varchar(200) DEFAULT NULL,
  `temp3` varchar(200) DEFAULT NULL,
  `temp4` varchar(200) DEFAULT NULL,
  `temp5` varchar(200) DEFAULT NULL,
  `temp6` varchar(200) DEFAULT NULL,
  `temp7` varchar(200) DEFAULT NULL,
  `temp8` varchar(200) DEFAULT NULL,
  `temp9` varchar(200) DEFAULT NULL,
  `temp10` varchar(200) DEFAULT NULL,
  `temp11` varchar(200) DEFAULT NULL,
  `temp12` varchar(200) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  PRIMARY KEY (`id_planning`,`annee_scolaire`),
  KEY `fk_planning_exam_n3_annee_scolaire1_idx` (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `planning_exam_prof`
--

CREATE TABLE IF NOT EXISTS `planning_exam_prof` (
  `id_exam` int(11) NOT NULL,
  PRIMARY KEY (`id_exam`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE IF NOT EXISTS `posts` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre_article` varchar(200) DEFAULT NULL,
  `contenu_article` text,
  `active` int(11) DEFAULT NULL,
  `type_auteur` int(11) DEFAULT NULL,
  `date_creation` date DEFAULT NULL,
  `id_admin` int(11) DEFAULT NULL,
  `nom_admin` varchar(30) DEFAULT NULL,
  `id_page` int(11) NOT NULL,
  PRIMARY KEY (`id`,`id_page`),
  KEY `fk_posts_categorie1_idx` (`id_page`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `rapport_etudiant`
--

CREATE TABLE IF NOT EXISTS `rapport_etudiant` (
  `id_rapport` int(11) NOT NULL AUTO_INCREMENT,
  `suggestion` varchar(50) DEFAULT NULL,
  `comportement` varchar(200) DEFAULT NULL,
  `valider` int(11) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_semestre` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `n_etudiant` int(11) NOT NULL,
  `n_fonc` int(11) NOT NULL,
  PRIMARY KEY (`id_rapport`,`id_semestre`),
  KEY `fk_rapport_etudiant_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_rapport_etudiant_semestre1_idx` (`id_semestre`),
  KEY `fk_rapport_etudiant_classe1_idx` (`id_classe`),
  KEY `fk_rapport_etudiant_etudiant1_idx` (`n_etudiant`),
  KEY `fk_rapport_etudiant_fonctionaire1_idx` (`n_fonc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `region`
--

CREATE TABLE IF NOT EXISTS `region` (
  `id_region` int(11) NOT NULL AUTO_INCREMENT,
  `libelle_region_ara` varchar(100) DEFAULT NULL,
  `libelle_region_fr` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_region`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `releves_notes_etudiants`
--

CREATE TABLE IF NOT EXISTS `releves_notes_etudiants` (
  `id_releves_notes_etudiants` int(11) NOT NULL AUTO_INCREMENT,
  `num_releves` varchar(20) DEFAULT NULL,
  `date_releves` date DEFAULT NULL,
  `n_etudiant` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_session` int(11) NOT NULL,
  PRIMARY KEY (`id_releves_notes_etudiants`),
  KEY `fk_releves_notes_etudiants_etudiant1_idx` (`n_etudiant`),
  KEY `fk_releves_notes_etudiants_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_releves_notes_etudiants_fonctionaire1_idx` (`id_session`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `reunion_pedagogique`
--

CREATE TABLE IF NOT EXISTS `reunion_pedagogique` (
  `date_reunion_debut` date DEFAULT NULL,
  `date_reunion_fin` date DEFAULT NULL,
  `lieu_reunion` varchar(200) DEFAULT NULL,
  `encadrant` varchar(250) DEFAULT NULL,
  `id_reunion_pedagogique` int(11) NOT NULL AUTO_INCREMENT,
  `date_reunion` date DEFAULT NULL,
  PRIMARY KEY (`id_reunion_pedagogique`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `salle`
--

CREATE TABLE IF NOT EXISTS `salle` (
  `id_salle` int(11) NOT NULL AUTO_INCREMENT,
  `nom_salle` varchar(45) DEFAULT NULL,
  `type_salle` varchar(20) DEFAULT NULL,
  `max_suporter` int(11) DEFAULT '1',
  `abrev_classe` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`id_salle`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `semestre`
--

CREATE TABLE IF NOT EXISTS `semestre` (
  `id_semestre` int(11) NOT NULL,
  `nom_semestre_ara` varchar(45) DEFAULT NULL,
  `nom_semestre_fr` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_semestre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `services_delegation`
--

CREATE TABLE IF NOT EXISTS `services_delegation` (
  `id_service` int(11) NOT NULL AUTO_INCREMENT,
  `nom_service` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `seuil_reuissite`
--

CREATE TABLE IF NOT EXISTS `seuil_reuissite` (
  `moyenne` double DEFAULT NULL,
  `annee` int(11) NOT NULL,
  `id_niveau` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  PRIMARY KEY (`annee`,`id_niveau`,`id_branche`),
  KEY `fk_seuil_reuissite_niveau_scolaire1_idx` (`id_niveau`),
  KEY `fk_seuil_reuissite_branche1_idx` (`id_branche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `site_administrateurs`
--

CREATE TABLE IF NOT EXISTS `site_administrateurs` (
  `id_admin` int(11) NOT NULL AUTO_INCREMENT,
  `nom_admin` varchar(200) DEFAULT NULL,
  `prenom_admin` varchar(200) DEFAULT NULL,
  `email_admin` varchar(200) DEFAULT NULL,
  `login_admin` varchar(200) DEFAULT NULL,
  `motdepasse_admin` varchar(200) DEFAULT NULL,
  `level` int(11) DEFAULT NULL,
  `photo` varchar(200) DEFAULT NULL,
  `telephone` varchar(200) DEFAULT NULL,
  `adresse` text,
  `profession` varchar(200) DEFAULT NULL,
  `date_naissance` date DEFAULT NULL,
  `lieu_naissance` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_admin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site_association_rapport`
--

CREATE TABLE IF NOT EXISTS `site_association_rapport` (
  `id_rapport` int(11) NOT NULL AUTO_INCREMENT,
  `titre_rapport` varchar(200) DEFAULT NULL,
  `text_rapport` text,
  `piece_rapport` varchar(300) DEFAULT NULL,
  PRIMARY KEY (`id_rapport`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site_circulaire`
--

CREATE TABLE IF NOT EXISTS `site_circulaire` (
  `id_circulaire` int(11) NOT NULL AUTO_INCREMENT,
  `titre_circulaire` varchar(200) DEFAULT NULL,
  `piece_circulaire` varchar(200) DEFAULT NULL,
  `type_emetteur` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_circulaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site_events`
--

CREATE TABLE IF NOT EXISTS `site_events` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titre_event` varchar(100) DEFAULT NULL,
  `date_event` date DEFAULT NULL,
  `texte_event` text,
  `photo` varchar(600) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site_liens_utiles`
--

CREATE TABLE IF NOT EXISTS `site_liens_utiles` (
  `id_lien` int(11) NOT NULL AUTO_INCREMENT,
  `texte_lien` varchar(200) DEFAULT NULL,
  `url` text,
  PRIMARY KEY (`id_lien`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `site_slides`
--

CREATE TABLE IF NOT EXISTS `site_slides` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `url_slide` varchar(200) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `specialisation`
--

CREATE TABLE IF NOT EXISTS `specialisation` (
  `id_spec` int(11) NOT NULL AUTO_INCREMENT,
  `code_spec` varchar(10) DEFAULT NULL,
  `designation_spec` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_spec`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `specialite`
--

CREATE TABLE IF NOT EXISTS `specialite` (
  `id_specialite` int(11) NOT NULL AUTO_INCREMENT,
  `nom_specialite` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_specialite`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `structure_ecole_nbr_classe_prochaine`
--

CREATE TABLE IF NOT EXISTS `structure_ecole_nbr_classe_prochaine` (
  `nombre` int(11) DEFAULT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `id_branche` int(11) NOT NULL,
  PRIMARY KEY (`annee_scolaire`,`id_branche`),
  KEY `fk_structure_ecole_nbr_classe_prochaine_branche1_idx` (`id_branche`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `suivi_educatif`
--

CREATE TABLE IF NOT EXISTS `suivi_educatif` (
  `date_suivi` date NOT NULL,
  `remarque` varchar(250) DEFAULT NULL,
  `heure_debut` int(11) DEFAULT NULL,
  `heure_fin` int(11) NOT NULL,
  `controleur` varchar(200) DEFAULT NULL,
  `id_fonctionaire` int(11) NOT NULL,
  PRIMARY KEY (`date_suivi`,`id_fonctionaire`),
  KEY `fk_suivi_educatif_fonctionaire1_idx` (`id_fonctionaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `surveillance_exam_prof`
--

CREATE TABLE IF NOT EXISTS `surveillance_exam_prof` (
  `id_surveillance` int(11) NOT NULL AUTO_INCREMENT,
  `temps_surveillance1` varchar(200) DEFAULT NULL,
  `temps_surveillance2` varchar(200) DEFAULT NULL,
  `jour_surveillance` varchar(200) DEFAULT NULL,
  `id_prof` int(11) NOT NULL,
  `annee_scolaire` int(11) NOT NULL,
  `jour` int(11) NOT NULL,
  PRIMARY KEY (`id_surveillance`),
  KEY `fk_surveillance_exam_prof_fonctionaire1_idx` (`id_prof`),
  KEY `fk_surveillance_exam_prof_annee_scolaire1_idx` (`annee_scolaire`),
  KEY `fk_surveillance_exam_prof_jour1_idx` (`jour`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `table_exam_niv3`
--

CREATE TABLE IF NOT EXISTS `table_exam_niv3` (
  `annee_scolaire` int(11) NOT NULL,
  `nombre_etudiant` int(11) DEFAULT NULL,
  `nombre_salle` int(11) DEFAULT NULL,
  `num_exam_etudiant` int(11) DEFAULT NULL,
  PRIMARY KEY (`annee_scolaire`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `tache`
--

CREATE TABLE IF NOT EXISTS `tache` (
  `id_tache` int(11) NOT NULL AUTO_INCREMENT,
  `designation_tache` varchar(50) DEFAULT NULL,
  `code_tache` varchar(10) DEFAULT NULL,
  `designation_tache_fr` varchar(50) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_tache`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tchat`
--

CREATE TABLE IF NOT EXISTS `tchat` (
  `id_tchat` int(11) NOT NULL AUTO_INCREMENT,
  `text_tchat` text,
  `tchatcol` varchar(45) DEFAULT NULL,
  `id_emetteur` int(11) NOT NULL,
  `id_receptteur` int(11) NOT NULL,
  PRIMARY KEY (`id_tchat`),
  KEY `id_emetteur_idx` (`id_emetteur`),
  KEY `id_receptteur_idx` (`id_receptteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tchat_session`
--

CREATE TABLE IF NOT EXISTS `tchat_session` (
  `id_session` int(11) NOT NULL AUTO_INCREMENT,
  `ip_session` varchar(40) DEFAULT NULL,
  `user_pc` varchar(40) DEFAULT NULL,
  `id_fonc` int(11) NOT NULL,
  PRIMARY KEY (`id_session`),
  KEY `fk_tchat_session_fonctionaire1_idx` (`id_fonc`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `themes`
--

CREATE TABLE IF NOT EXISTS `themes` (
  `id_theme` int(11) NOT NULL AUTO_INCREMENT,
  `nom_theme` varchar(200) DEFAULT NULL,
  `active` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `tuteur`
--

CREATE TABLE IF NOT EXISTS `tuteur` (
  `id_tuteur` int(11) NOT NULL,
  PRIMARY KEY (`id_tuteur`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `type_certificat_professionel`
--

CREATE TABLE IF NOT EXISTS `type_certificat_professionel` (
  `id_certificat` int(11) NOT NULL AUTO_INCREMENT,
  `code_certificat` varchar(10) DEFAULT NULL,
  `designation_certificat` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_certificat`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_diplome`
--

CREATE TABLE IF NOT EXISTS `type_diplome` (
  `id_type_dip` int(11) NOT NULL AUTO_INCREMENT,
  `code_type` varchar(10) DEFAULT NULL,
  `designation_diplome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_type_dip`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_etablissement`
--

CREATE TABLE IF NOT EXISTS `type_etablissement` (
  `id_type_etablisssement` int(11) NOT NULL AUTO_INCREMENT,
  `nom_type_etablissement` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_type_etablisssement`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `type_notice`
--

CREATE TABLE IF NOT EXISTS `type_notice` (
  `id_type_notice` int(11) NOT NULL AUTO_INCREMENT,
  `type_notice` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`id_type_notice`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `absence_etudiant`
--
ALTER TABLE `absence_etudiant`
  ADD CONSTRAINT `fk_absence_etudiant_annee_scolaire1` FOREIGN KEY (`annee_scol`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_etudiant_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_etudiant_etudiant1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_etudiant_mois1` FOREIGN KEY (`id_mois`) REFERENCES `mois` (`num_mois`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_etudiant_semestre1` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `absence_fonctionaire`
--
ALTER TABLE `absence_fonctionaire`
  ADD CONSTRAINT `fk_absence_fonctionaire_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_fonctionaire_fonctionaire1` FOREIGN KEY (`id_fonctionaire`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_fonctionaire_mois1` FOREIGN KEY (`id_mois`) REFERENCES `mois` (`num_mois`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_fonctionaire_semestre1` FOREIGN KEY (`semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `absence_sms`
--
ALTER TABLE `absence_sms`
  ADD CONSTRAINT `fk_absence_sms_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_sms_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_sms_mois1` FOREIGN KEY (`id_mois`) REFERENCES `mois` (`num_mois`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_sms_semestre1` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_absence_sms_tuteur1` FOREIGN KEY (`tuteur_id_tuteur`) REFERENCES `tuteur` (`id_tuteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `article`
--
ALTER TABLE `article`
  ADD CONSTRAINT `fk_article_info_article1` FOREIGN KEY (`id_info_article`) REFERENCES `info_article` (`id_info_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `article_web`
--
ALTER TABLE `article_web`
  ADD CONSTRAINT `fk_article_web_pages1` FOREIGN KEY (`id_page`) REFERENCES `pages` (`id_page`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `association_revenue_externe`
--
ALTER TABLE `association_revenue_externe`
  ADD CONSTRAINT `fk_association_revenue_externe_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `association_revenue_interne`
--
ALTER TABLE `association_revenue_interne`
  ADD CONSTRAINT `fk_association_revenue_interne_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `association_traitement_sur_banque`
--
ALTER TABLE `association_traitement_sur_banque`
  ADD CONSTRAINT `fk_association_traitement_sur_banque_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `branche`
--
ALTER TABLE `branche`
  ADD CONSTRAINT `fk_branche_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `certificat_depart`
--
ALTER TABLE `certificat_depart`
  ADD CONSTRAINT `fk_certificat_depart_annee_scolaire1` FOREIGN KEY (`annee`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_depart_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_depart_etablissement_precedente1` FOREIGN KEY (`id_ecole`) REFERENCES `etablissement` (`id_etablissement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_depart_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_depart_fonctionaire1` FOREIGN KEY (`id_session`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `certificat_professionel`
--
ALTER TABLE `certificat_professionel`
  ADD CONSTRAINT `fk_certificat_professionel_fonctionaire1` FOREIGN KEY (`n_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_professionel_specialisation1` FOREIGN KEY (`id_spec`) REFERENCES `specialisation` (`id_spec`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_professionel_type_certificat_professionel1` FOREIGN KEY (`id_type_certificat`) REFERENCES `type_certificat_professionel` (`id_certificat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `certificat_scolaire`
--
ALTER TABLE `certificat_scolaire`
  ADD CONSTRAINT `fk_certificat_scolaire_annee_scolaire1` FOREIGN KEY (`annee`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_scolaire_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_scolaire_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `certificat_travail`
--
ALTER TABLE `certificat_travail`
  ADD CONSTRAINT `fk_certificat_travail_annee_scolaire1` FOREIGN KEY (`annee`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_certificat_travail_fonctionaire1` FOREIGN KEY (`n_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `classe`
--
ALTER TABLE `classe`
  ADD CONSTRAINT `fk_classe_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_fonctionaire1` FOREIGN KEY (`id_surv`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_langue_etrangere1` FOREIGN KEY (`id_langue`) REFERENCES `langue_etrangere` (`id_langue_etrangere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_specialite1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `classe_groupe`
--
ALTER TABLE `classe_groupe`
  ADD CONSTRAINT `fk_classe_groupe_annee_scolaire1` FOREIGN KEY (`annee`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_groupe_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_groupe_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `classe_prof`
--
ALTER TABLE `classe_prof`
  ADD CONSTRAINT `fk_classe_prof_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_prof_classe_groupe1` FOREIGN KEY (`id_groupe`) REFERENCES `classe_groupe` (`id_groupe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_prof_fonctionaire1` FOREIGN KEY (`id_prof`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_classe_prof_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `coefficient`
--
ALTER TABLE `coefficient`
  ADD CONSTRAINT `fk_coefficient_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_coefficient_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_coefficient_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commentaire_reply`
--
ALTER TABLE `commentaire_reply`
  ADD CONSTRAINT `fk_commentaire_reply_commentaire1` FOREIGN KEY (`id_commentaire`) REFERENCES `commentaire` (`id_comm`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commune`
--
ALTER TABLE `commune`
  ADD CONSTRAINT `fk_commune_delegation1` FOREIGN KEY (`n_delegation`) REFERENCES `delegation` (`n_delegation`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `controle`
--
ALTER TABLE `controle`
  ADD CONSTRAINT `fk_controle_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_controle_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `convocation_absence`
--
ALTER TABLE `convocation_absence`
  ADD CONSTRAINT `fk_convocation_absence_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `cours`
--
ALTER TABLE `cours`
  ADD CONSTRAINT `fk_cours_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cours_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_cours_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_emetter` FOREIGN KEY (`id_emetteur`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `delegation`
--
ALTER TABLE `delegation`
  ADD CONSTRAINT `fk_delegation_region1` FOREIGN KEY (`n_region`) REFERENCES `region` (`id_region`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `delegue_responsable_classe`
--
ALTER TABLE `delegue_responsable_classe`
  ADD CONSTRAINT `fk_delegue_responsable_classe_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_delegue_responsable_classe_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `detail_emprunt`
--
ALTER TABLE `detail_emprunt`
  ADD CONSTRAINT `fk_detail_emprunt_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_emprunt_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_emprunt_livre1` FOREIGN KEY (`id_livre`) REFERENCES `livre` (`id_livre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `detail_paiement`
--
ALTER TABLE `detail_paiement`
  ADD CONSTRAINT `fk_detail_paiement_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_paiement_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `detail_reunion`
--
ALTER TABLE `detail_reunion`
  ADD CONSTRAINT `fk_detail_reunion_fonctionaire1` FOREIGN KEY (`id_fonctionaire`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_reunion_reunion_pedagogique1` FOREIGN KEY (`id_reunion_pedagogique`) REFERENCES `reunion_pedagogique` (`id_reunion_pedagogique`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `detail_services`
--
ALTER TABLE `detail_services`
  ADD CONSTRAINT `fk_detail_services_documents1` FOREIGN KEY (`id_doc`) REFERENCES `documents` (`id_doc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_services_fonctionaire1` FOREIGN KEY (`id_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_detail_services_services_delegation1` FOREIGN KEY (`id_service`) REFERENCES `services_delegation` (`id_service`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `diplome_fonc`
--
ALTER TABLE `diplome_fonc`
  ADD CONSTRAINT `fk_diplome_fonc_fonctionaire1` FOREIGN KEY (`n_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_diplome_fonc_specialisation1` FOREIGN KEY (`id_spec`) REFERENCES `specialisation` (`id_spec`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_diplome_fonc_type_diplome1` FOREIGN KEY (`id_type_dip`) REFERENCES `type_diplome` (`id_type_dip`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `economa_facture`
--
ALTER TABLE `economa_facture`
  ADD CONSTRAINT `fk_economa_facture_annee_scolaire2` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `economa_revenue_externe`
--
ALTER TABLE `economa_revenue_externe`
  ADD CONSTRAINT `fk_economa_revenue_externe_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `economa_revenue_interne`
--
ALTER TABLE `economa_revenue_interne`
  ADD CONSTRAINT `fk_economa_revenue_interne_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `economa_traitement_sur_banque`
--
ALTER TABLE `economa_traitement_sur_banque`
  ADD CONSTRAINT `fk_economa_traitement_sur_banque_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emplois_temps_days_list`
--
ALTER TABLE `emplois_temps_days_list`
  ADD CONSTRAINT `fk_emplois_temps_days_list_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emplois_temps_disponibility_prof`
--
ALTER TABLE `emplois_temps_disponibility_prof`
  ADD CONSTRAINT `fk_emplois_temps_disponibility_prof_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emplois_temps_disponibility_prof_fonctionaire1` FOREIGN KEY (`id_prof`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emplois_temps_disponibility_prof_horaire1` FOREIGN KEY (`id_hour`) REFERENCES `horaire` (`id_horaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emplois_temps_disponibility_prof_jour1` FOREIGN KEY (`id_day`) REFERENCES `jour` (`id_jour`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emplois_temps_hours_days`
--
ALTER TABLE `emplois_temps_hours_days`
  ADD CONSTRAINT `fk_emplois_temps_hours_days_annee_scolaire1` FOREIGN KEY (`annee_scolaire_annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emplois_temps_hours_days_horaire1` FOREIGN KEY (`id_hour`) REFERENCES `horaire` (`id_horaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emplois_temps_hours_days_jour1` FOREIGN KEY (`id_day`) REFERENCES `jour` (`id_jour`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emplois_two_activities_grouped`
--
ALTER TABLE `emplois_two_activities_grouped`
  ADD CONSTRAINT `fk_emplois_two_activities_grouped_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_matiere1` FOREIGN KEY (`id_matiere1`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_matiere2` FOREIGN KEY (`id_matiere2`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emploi_groupe_fet`
--
ALTER TABLE `emploi_groupe_fet`
  ADD CONSTRAINT `fk_emploi_groupe_fet_annee_scolaire1` FOREIGN KEY (`annee_scolaire_annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_groupe_fet_classe1` FOREIGN KEY (`classe_id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emploi_temps`
--
ALTER TABLE `emploi_temps`
  ADD CONSTRAINT `fk_emploi_temps_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_emploi_groupe_fet1` FOREIGN KEY (`id_groupe`) REFERENCES `emploi_groupe_fet` (`id_groupe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_fonctionaire1` FOREIGN KEY (`id_prof`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_horaire1` FOREIGN KEY (`id_horaire`) REFERENCES `horaire` (`id_horaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_jour1` FOREIGN KEY (`id_jour`) REFERENCES `jour` (`id_jour`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_salle1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emploi_temps_hours_list`
--
ALTER TABLE `emploi_temps_hours_list`
  ADD CONSTRAINT `fk_emploi_temps_hours_list_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `emploi_temps_matiere_preferances_horaires`
--
ALTER TABLE `emploi_temps_matiere_preferances_horaires`
  ADD CONSTRAINT `fk_emploi_temps_matiere_preferances_horaires_horaire1` FOREIGN KEY (`id_hour`) REFERENCES `horaire` (`id_horaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_matiere_preferances_horaires_jour1` FOREIGN KEY (`id_day`) REFERENCES `jour` (`id_jour`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_emploi_temps_matiere_preferances_horaires_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `envois_sms`
--
ALTER TABLE `envois_sms`
  ADD CONSTRAINT `fk_envois_sms_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_envois_sms_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_envois_sms_fonctionaire1` FOREIGN KEY (`id_session`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etablissement`
--
ALTER TABLE `etablissement`
  ADD CONSTRAINT `fk_etablissement_precedente_commune1` FOREIGN KEY (`id_commune`) REFERENCES `commune` (`n_commune`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etablissement_precedente_niveau_etablissement1` FOREIGN KEY (`id_niveau_etablissement`) REFERENCES `niveau_etablissement` (`id_niveau_etablissement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etablissement_precedente_type_etablissement1` FOREIGN KEY (`id_type_etablisssement`) REFERENCES `type_etablissement` (`id_type_etablisssement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etat_etablissement`
--
ALTER TABLE `etat_etablissement`
  ADD CONSTRAINT `fk_etat_etablissement_fonctionaire1` FOREIGN KEY (`id_session`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etudiant`
--
ALTER TABLE `etudiant`
  ADD CONSTRAINT `etudiant_ibfk_1` FOREIGN KEY (`etablis_prec`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `etudiant_ibfk_2` FOREIGN KEY (`id_etablissement_destination`) REFERENCES `etablissement` (`id_etablissement`),
  ADD CONSTRAINT `etudiant_ibfk_3` FOREIGN KEY (`id_branche_precedente`) REFERENCES `branche` (`id_branche`),
  ADD CONSTRAINT `etudiant_ibfk_4` FOREIGN KEY (`id_branche_orientation`) REFERENCES `branche` (`id_branche`),
  ADD CONSTRAINT `etudiant_ibfk_5` FOREIGN KEY (`id_branche_prochaine`) REFERENCES `branche` (`id_branche`),
  ADD CONSTRAINT `fk_etudiant_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_langue_etrangere1` FOREIGN KEY (`id_langue_etrangere`) REFERENCES `langue_etrangere` (`id_langue_etrangere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_specialite1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_tuteur` FOREIGN KEY (`tuteur_id_tuteur`) REFERENCES `tuteur` (`id_tuteur`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etudiant_classe`
--
ALTER TABLE `etudiant_classe`
  ADD CONSTRAINT `etudiant_classe_ibfk_1` FOREIGN KEY (`id_branche_precedente_orientation`) REFERENCES `branche` (`id_branche`),
  ADD CONSTRAINT `etudiant_classe_ibfk_2` FOREIGN KEY (`orientation_accepter`) REFERENCES `branche` (`id_branche`),
  ADD CONSTRAINT `etudiant_classe_ibfk_3` FOREIGN KEY (`id_branche_demander`) REFERENCES `branche` (`id_branche`),
  ADD CONSTRAINT `fk_etudiant_classe_association_parenteleve_parametre1` FOREIGN KEY (`id_association`) REFERENCES `association_parenteleve_parametre` (`id_association`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_classe_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_classe_etat_reussite1` FOREIGN KEY (`id_etat_reussite`) REFERENCES `etat_reussite` (`id_etat_reussite`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_classe_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `etudiant_liste_attente`
--
ALTER TABLE `etudiant_liste_attente`
  ADD CONSTRAINT `fk_etudiant_liste_attente_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_liste_attente_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_liste_attente_etablissement_precedente1` FOREIGN KEY (`etablis_prec`) REFERENCES `etablissement` (`id_etablissement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_liste_attente_langue_etrangere1` FOREIGN KEY (`id_langue_etrangere`) REFERENCES `langue_etrangere` (`id_langue_etrangere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_liste_attente_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_etudiant_liste_attente_specialite1` FOREIGN KEY (`id_specialite`) REFERENCES `specialite` (`id_specialite`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `fonctionaire`
--
ALTER TABLE `fonctionaire`
  ADD CONSTRAINT `fk_fonctionaire_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fonctionaire_conjoint1` FOREIGN KEY (`id_conjoint`) REFERENCES `conjoint` (`id_conjoint`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fonctionaire_cycle_enseignement1` FOREIGN KEY (`id_cycle`) REFERENCES `cycle_enseignement` (`id_cycle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fonctionaire_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_fonctionaire_tache1` FOREIGN KEY (`id_tache`) REFERENCES `tache` (`id_tache`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `historique_fonc`
--
ALTER TABLE `historique_fonc`
  ADD CONSTRAINT `fk_historique_fonc_fonctionaire1` FOREIGN KEY (`n_fon`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `infos_etablissement`
--
ALTER TABLE `infos_etablissement`
  ADD CONSTRAINT `fk_infos_etablissement_commune1` FOREIGN KEY (`id_commune`) REFERENCES `commune` (`n_commune`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infos_etablissement_delegation1` FOREIGN KEY (`id_delegation`) REFERENCES `delegation` (`n_delegation`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_infos_etablissement_etablissement1` FOREIGN KEY (`id_etablissement_precedente`) REFERENCES `etablissement` (`id_etablissement`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `info_article`
--
ALTER TABLE `info_article`
  ADD CONSTRAINT `fk_info_article_categorie_article1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie_article` (`id_categorie`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_info_article_groupe1` FOREIGN KEY (`id_groupe`) REFERENCES `groupe` (`id_groupe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `journal_login`
--
ALTER TABLE `journal_login`
  ADD CONSTRAINT `fk_journal_login_fonctionaire1` FOREIGN KEY (`id_fonctionaire`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `fk_livre_bibliotheque_theme1` FOREIGN KEY (`id_theme`) REFERENCES `bibliotheque_theme` (`id_theme`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livre_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livre_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_livre_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `login`
--
ALTER TABLE `login`
  ADD CONSTRAINT `fk_login_fonctionaire1` FOREIGN KEY (`id_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `note`
--
ALTER TABLE `note`
  ADD CONSTRAINT `fk_note_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_fonctionaire1` FOREIGN KEY (`id_prof`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_matiere1` FOREIGN KEY (`id_matiere`) REFERENCES `matiere` (`id_matiere`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_note_type1` FOREIGN KEY (`id_type`) REFERENCES `note_type` (`id_type`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_semestre1` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `note_controle`
--
ALTER TABLE `note_controle`
  ADD CONSTRAINT `fk_note_controle_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_controle_controle1` FOREIGN KEY (`id_controle`) REFERENCES `controle` (`id_controle`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_controle_etudiant1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_controle_fonctionaire1` FOREIGN KEY (`id_prof`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_note_controle_semestre1` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `note_professionel`
--
ALTER TABLE `note_professionel`
  ADD CONSTRAINT `fk_note_professionel_fonctionaire1` FOREIGN KEY (`id_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `nr_examen_regional`
--
ALTER TABLE `nr_examen_regional`
  ADD CONSTRAINT `fk_nr_examen_regional_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nr_examen_regional_etudiant1` FOREIGN KEY (`id_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_nr_examen_regional_salle1` FOREIGN KEY (`id_salle`) REFERENCES `salle` (`id_salle`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `orientation_etudiant`
--
ALTER TABLE `orientation_etudiant`
  ADD CONSTRAINT `fk_orientation_etudiant_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orientation_etudiant_etablissement_precedente1` FOREIGN KEY (`id_etablissement`) REFERENCES `etablissement` (`id_etablissement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_orientation_etudiant_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `fk_pages_categorie1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id_categorie`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `photo`
--
ALTER TABLE `photo`
  ADD CONSTRAINT `fk_photo_article1` FOREIGN KEY (`id_article`) REFERENCES `article` (`ref_article`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `planning_exam_n3`
--
ALTER TABLE `planning_exam_n3`
  ADD CONSTRAINT `fk_planning_exam_n3_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `posts`
--
ALTER TABLE `posts`
  ADD CONSTRAINT `fk_posts_page` FOREIGN KEY (`id_page`) REFERENCES `pages` (`id_page`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `rapport_etudiant`
--
ALTER TABLE `rapport_etudiant`
  ADD CONSTRAINT `fk_rapport_etudiant_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rapport_etudiant_classe1` FOREIGN KEY (`id_classe`) REFERENCES `classe` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rapport_etudiant_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rapport_etudiant_fonctionaire1` FOREIGN KEY (`n_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_rapport_etudiant_semestre1` FOREIGN KEY (`id_semestre`) REFERENCES `semestre` (`id_semestre`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `releves_notes_etudiants`
--
ALTER TABLE `releves_notes_etudiants`
  ADD CONSTRAINT `fk_releves_notes_etudiants_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_releves_notes_etudiants_etudiant1` FOREIGN KEY (`n_etudiant`) REFERENCES `etudiant` (`n_etudiant`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_releves_notes_etudiants_fonctionaire1` FOREIGN KEY (`id_session`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `seuil_reuissite`
--
ALTER TABLE `seuil_reuissite`
  ADD CONSTRAINT `fk_seuil_reuissite_annee_scolaire1` FOREIGN KEY (`annee`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seuil_reuissite_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seuil_reuissite_niveau_scolaire1` FOREIGN KEY (`id_niveau`) REFERENCES `niveau_scolaire` (`code_niveau`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `structure_ecole_nbr_classe_prochaine`
--
ALTER TABLE `structure_ecole_nbr_classe_prochaine`
  ADD CONSTRAINT `fk_structure_ecole_nbr_classe_prochaine_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_structure_ecole_nbr_classe_prochaine_branche1` FOREIGN KEY (`id_branche`) REFERENCES `branche` (`id_branche`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `suivi_educatif`
--
ALTER TABLE `suivi_educatif`
  ADD CONSTRAINT `fk_suivi_educatif_fonctionaire1` FOREIGN KEY (`id_fonctionaire`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `surveillance_exam_prof`
--
ALTER TABLE `surveillance_exam_prof`
  ADD CONSTRAINT `fk_surveillance_exam_prof_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_surveillance_exam_prof_fonctionaire1` FOREIGN KEY (`id_prof`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_surveillance_exam_prof_jour1` FOREIGN KEY (`jour`) REFERENCES `jour` (`id_jour`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `table_exam_niv3`
--
ALTER TABLE `table_exam_niv3`
  ADD CONSTRAINT `fk_table1_annee_scolaire1` FOREIGN KEY (`annee_scolaire`) REFERENCES `annee_scolaire` (`annee_scolaire`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tchat`
--
ALTER TABLE `tchat`
  ADD CONSTRAINT `id_emetteur` FOREIGN KEY (`id_emetteur`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `id_receptteur` FOREIGN KEY (`id_receptteur`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `tchat_session`
--
ALTER TABLE `tchat_session`
  ADD CONSTRAINT `fk_tchat_session_fonctionaire1` FOREIGN KEY (`id_fonc`) REFERENCES `fonctionaire` (`n_fonc`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

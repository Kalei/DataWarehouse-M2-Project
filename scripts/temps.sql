--
-- Structure de la table `temps`
--

CREATE TABLE IF NOT EXISTS `temps` (
  `id_date` datetime NOT NULL,
  `cpt_jour` int(11) DEFAULT NULL,
  `num_jour_semaine` int(11) DEFAULT NULL,
  `num_jour_mois` int(11) DEFAULT NULL,
  `num_jour_annee` int(11) DEFAULT NULL,
  `id_annee` int(11) DEFAULT NULL,
  `cpt_annee` int(11) DEFAULT NULL,
  `id_semestre` int(11) DEFAULT NULL,
  `cpt_semestre` int(11) DEFAULT NULL,
  `num_semestre` int(11) DEFAULT NULL,
  `id_trimestre` int(11) DEFAULT NULL,
  `cpt_trimestre` int(11) DEFAULT NULL,
  `num_trimestre` int(11) DEFAULT NULL,
  `id_mois` int(11) DEFAULT NULL,
  `cpt_mois` int(11) DEFAULT NULL,
  `num_mois` int(11) DEFAULT NULL,
  `id_semaine` int(11) DEFAULT NULL,
  `cpt_semaine` int(11) DEFAULT NULL,
  `num_semaine` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_date`),
  UNIQUE KEY `cpt_jour` (`cpt_jour`),
  KEY `cpt_annee` (`cpt_annee`),
  KEY `cpt_semestre` (`cpt_semestre`),
  KEY `cpt_trimestre` (`cpt_trimestre`),
  KEY `cpt_mois` (`cpt_mois`),
  KEY `cpt_semaine` (`cpt_semaine`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

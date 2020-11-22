-----------creation table UE------------
CREATE TABLE UE
(
	id_ue SERIAL PRIMARY KEY,
	classe VARCHAR,
	type VARCHAR,
	designation VARCHAR,
	description VARCHAR,
	interpretation VARCHAR,
	secteur VARCHAR,
  	geom geometry(POLYGON, 2154)
);

------------creation table Relation------------
CREATE TABLE RELATION
(
	id_relation SERIAL PRIMARY KEY,
	nature VARCHAR,
	ue_cible VARCHAR
);

------------creation table Photographie------------
CREATE TABLE PHOTOGRAPHIE(
	id_photo SERIAl PRIMARY KEY,
	commentaire VARCHAR,
	chemin VARCHAR
);

------------creation table Graphique------------
CREATE TABLE GRAPHIQUE(
	id_graph SERIAl PRIMARY KEY,
	minute VARCHAR
);

------------table lien relation/UE------------
CREATE TABLE ue_relation (
	id_ue INTEGER,
	id_relation INTEGER,
	PRIMARY KEY(id_ue, id_relation),
	FOREIGN KEY(id_ue) REFERENCES UE ON DELETE CASCADE,
	FOREIGN KEY(id_relation) REFERENCES RELATION ON DELETE CASCADE
);

------------table lien photographie/UE------------
CREATE TABLE "ue_photographie" (
	id_ue INTEGER,
	id_photo INTEGER,
	PRIMARY KEY(id_ue, id_photo),
	FOREIGN KEY(id_ue) REFERENCES UE ON DELETE CASCADE,
	FOREIGN KEY(id_photo) REFERENCES PHOTOGRAPHIE ON DELETE CASCADE
);

------------table lien graphique/UE------------
CREATE TABLE "ue_graphique"(
	id_ue INTEGER,
	id_graph INTEGER,
	PRIMARY KEY(id_ue, id_graph),
	FOREIGN KEY(id_ue) REFERENCES UE ON DELETE CASCADE,
	FOREIGN KEY(id_graph) REFERENCES GRAPHIQUE ON DELETE CASCADE
);


CREATE TABLE Fournisseur (
  idFournisseur INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Designation VARCHAR NULL,
  Adresse VARCHAR NULL,
  Tel VARCHAR NULL,
  PaysOrigine VARCHAR NULL,
  PRIMARY KEY(idFournisseur)
);

CREATE TABLE LigneSerti (
  idLigneSerti INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Typeligne VARCHAR NULL,
  PRIMARY KEY(idLigneSerti)
);

CREATE TABLE ProduitFini (
  idProduitFini INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Designation INTEGER UNSIGNED NULL,
  Description VARCHAR NULL,
  Format VARCHAR NULL,
  Milieux VARCHAR NULL,
  Type_2 VARCHAR NULL,
  Miette% INTEGER UNSIGNED NULL,
  PRIMARY KEY(idProduitFini)
);

CREATE TABLE EntreeStock (
  idEntreeStock INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  DateEntreST DATE NULL,
  Magasinier VARCHAR NULL,
  nb VARCHAR NULL,
  PRIMARY KEY(idEntreeStock)
);

CREATE TABLE MatiereP (
  IdMP INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  Fournisseur_idFournisseur INTEGER UNSIGNED NOT NULL,
  Lot VARCHAR NULL,
  Description VARCHAR NULL,
  Fournisseur VARCHAR NULL,
  DateFabrication DATE NULL,
  DatePeremption DATE NULL,
  Reste DECIMAL NULL,
  PRIMARY KEY(IdMP),
  INDEX MatiereP_FKIndex1(Fournisseur_idFournisseur),
  FOREIGN KEY(Fournisseur_idFournisseur)
    REFERENCES Fournisseur(idFournisseur)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE EntreeSTMP (
  idEntreeSTMP INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  EntreeStock_idEntreeStock INTEGER UNSIGNED NOT NULL,
  MatiereP_IdMP INTEGER UNSIGNED NOT NULL,
  QuantitEntree DECIMAL NULL,
  PRIMARY KEY(idEntreeSTMP),
  INDEX EntreeSTMP_FKIndex1(MatiereP_IdMP),
  INDEX EntreeSTMP_FKIndex2(EntreeStock_idEntreeStock),
  FOREIGN KEY(MatiereP_IdMP)
    REFERENCES MatiereP(IdMP)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(EntreeStock_idEntreeStock)
    REFERENCES EntreeStock(idEntreeStock)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE ProductionLigne (
  idProductionLigne INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  ProduitFini_idProduitFini INTEGER UNSIGNED NOT NULL,
  LigneSerti_idLigneSerti INTEGER UNSIGNED NOT NULL,
  DateProd DATE NULL,
  HDebut DATETIME NULL,
  HFin DATETIME NULL,
  quantitePL INTEGER UNSIGNED NULL,
  Lot INTEGER UNSIGNED NULL,
  LotF VARCHAR NULL,
  LotM VARCHAR NULL,
  CompteurBrut INTEGER UNSIGNED NULL,
  Avarie INTEGER UNSIGNED NULL,
  CompteurNet INTEGER UNSIGNED NULL,
  MoyennePoidsNet DECIMAL NULL,
  MoyennePoidsemb1 DECIMAL NULL,
  MoyennePoidEmb2 DECIMAL NULL,
  MPS_Eau DECIMAL NULL,
  PRIMARY KEY(idProductionLigne),
  INDEX ProductionLigne_FKIndex1(LigneSerti_idLigneSerti),
  INDEX ProductionLigne_FKIndex3(ProduitFini_idProduitFini),
  FOREIGN KEY(LigneSerti_idLigneSerti)
    REFERENCES LigneSerti(idLigneSerti)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(ProduitFini_idProduitFini)
    REFERENCES ProduitFini(idProduitFini)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE PaletteMP (
  idPaletteMP INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  MatiereP_IdMP INTEGER UNSIGNED NOT NULL,
  nbcolis INT NULL,
  Quantite DECIMAL NULL,
  PRIMARY KEY(idPaletteMP),
  INDEX PaletteMP_FKIndex1(MatiereP_IdMP),
  FOREIGN KEY(MatiereP_IdMP)
    REFERENCES MatiereP(IdMP)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Chariot (
  idChariot INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  PaletteMP_idPaletteMP INTEGER UNSIGNED NOT NULL,
  Quantité DECIMAL NULL,
  nbLingots INTEGER UNSIGNED NULL,
  PRIMARY KEY(idChariot),
  INDEX Chariot_FKIndex1(PaletteMP_idPaletteMP),
  FOREIGN KEY(PaletteMP_idPaletteMP)
    REFERENCES PaletteMP(idPaletteMP)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE SortieSTTMP (
  idSortieSTTMP INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  MatiereP_IdMP INTEGER UNSIGNED NOT NULL,
  DATESortiest DATE NULL,
  QuantiteSortie DECIMAL NULL,
  PRIMARY KEY(idSortieSTTMP),
  INDEX SortieSTTMP_FKIndex1(MatiereP_IdMP),
  FOREIGN KEY(MatiereP_IdMP)
    REFERENCES MatiereP(IdMP)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);

CREATE TABLE Consommation (
  idConsommation INTEGER UNSIGNED NOT NULL AUTO_INCREMENT,
  DateConsom DATE NULL,
  Chariot_idChariot INTEGER UNSIGNED NOT NULL,
  LigneSerti_idLigneSerti INTEGER UNSIGNED NOT NULL,
  Quantité DECIMAL NULL,
  Hdebut DATETIME NULL,
  HFin DATETIME NULL,
  PRIMARY KEY(idConsommation),
  INDEX Consommation_FKIndex1(LigneSerti_idLigneSerti),
  INDEX Consommation_FKIndex2(Chariot_idChariot),
  FOREIGN KEY(LigneSerti_idLigneSerti)
    REFERENCES LigneSerti(idLigneSerti)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION,
  FOREIGN KEY(Chariot_idChariot)
    REFERENCES Chariot(idChariot)
      ON DELETE NO ACTION
      ON UPDATE NO ACTION
);



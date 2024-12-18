from django.db import models

<<<<<<< HEAD
# Create your models here.
=======

class Fournisseur(models.Model):
    idFournisseur = models.AutoField(primary_key=True)
    Designation = models.CharField(max_length=255, null=True)
    Adresse = models.CharField(max_length=255, null=True)
    Tel = models.CharField(max_length=15, null=True)
    PaysOrigine = models.CharField(max_length=100, null=True)

    def __str__(self):
        return self.Designation

    class Meta:
        db_table = 'Fournisseur'  # Nom de la table dans la base de données


class LigneSerti(models.Model):
    idLigneSerti = models.AutoField(primary_key=True)
    Typeligne = models.CharField(max_length=100, null=True)

    def __str__(self):
        return self.Typeligne

    class Meta:
        db_table = 'LigneSerti'


class ProduitFini(models.Model):
    idProduitFini = models.AutoField(primary_key=True)
    Designation = models.CharField(max_length=255, null=True)
    Description = models.TextField(null=True)
    Format = models.CharField(max_length=50, null=True)
    Milieux = models.CharField(max_length=50, null=True)
    Type_2 = models.CharField(max_length=50, null=True)
    Miette = models.PositiveIntegerField(null=True)

    def __str__(self):
        return self.Designation

    class Meta:
        db_table = 'ProduitFini'


class EntreeStock(models.Model):
    idEntreeStock = models.AutoField(primary_key=True)
    DateEntreST = models.DateField(null=True)
    Magasinier = models.CharField(max_length=100, null=True)
    nb = models.CharField(max_length=50, null=True)

    def __str__(self):
        return f"{self.DateEntreST} - {self.Magasinier}"

    class Meta:
        db_table = 'EntreeStock'


class MatiereP(models.Model):
    IdMP = models.AutoField(primary_key=True)
    Fournisseur = models.ForeignKey(Fournisseur, on_delete=models.CASCADE)
    Lot = models.CharField(max_length=50, null=True)
    Description = models.CharField(max_length=255, null=True)
    DateFabrication = models.DateField(null=True)
    DatePeremption = models.DateField(null=True)
    Reste = models.DecimalField(max_digits=10, decimal_places=2, null=True)

    def __str__(self):
        return self.Lot

    class Meta:
        db_table = 'MatiereP'


class EntreeSTMP(models.Model):
    idEntreeSTMP = models.AutoField(primary_key=True)
    EntreeStock = models.ForeignKey(EntreeStock, on_delete=models.CASCADE)
    MatiereP = models.ForeignKey(MatiereP, on_delete=models.CASCADE)
    QuantitEntree = models.DecimalField(max_digits=10, decimal_places=2, null=True)

    def __str__(self):
        return f"{self.EntreeStock} - {self.MatiereP}"

    class Meta:
        db_table = 'EntreeSTMP'


class ProductionLigne(models.Model):
    idProductionLigne = models.AutoField(primary_key=True)
    ProduitFini = models.ForeignKey(ProduitFini, on_delete=models.CASCADE)
    LigneSerti = models.ForeignKey(LigneSerti, on_delete=models.CASCADE)
    DateProd = models.DateField(null=True)
    HDebut = models.DateTimeField(null=True)
    HFin = models.DateTimeField(null=True)
    quantitePL = models.PositiveIntegerField(null=True)
    Lot = models.PositiveIntegerField(null=True)
    LotF = models.CharField(max_length=50, null=True)
    LotM = models.CharField(max_length=50, null=True)
    CompteurBrut = models.PositiveIntegerField(null=True)
    Avarie = models.PositiveIntegerField(null=True)
    CompteurNet = models.PositiveIntegerField(null=True)
    MoyennePoidsNet = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    MoyennePoidsemb1 = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    MoyennePoidEmb2 = models.DecimalField(max_digits=10, decimal_places=2, null=True)
    MPS_Eau = models.DecimalField(max_digits=10, decimal_places=2, null=True)

    class Meta:
        db_table = 'ProductionLigne'


class PaletteMP(models.Model):
    matiere_p = models.ForeignKey(MatiereP, on_delete=models.DO_NOTHING)
    nbcolis = models.IntegerField(null=True, blank=True)
    quantite = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'PaletteMP'


class Chariot(models.Model):
    palette_mp = models.ForeignKey(PaletteMP, on_delete=models.DO_NOTHING)
    quantite = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    nb_lingots = models.PositiveIntegerField(null=True, blank=True)

    class Meta:
        db_table = 'Chariot'


class SortieSTTMP(models.Model):
    matiere_p = models.ForeignKey(MatiereP, on_delete=models.DO_NOTHING)
    date_sortie_st = models.DateField(null=True, blank=True)
    quantite_sortie = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)

    class Meta:
        db_table = 'SortieSTTMP'


class Consommation(models.Model):
    date_consom = models.DateField(null=True, blank=True)
    chariot = models.ForeignKey(Chariot, on_delete=models.DO_NOTHING)
    ligne_serti = models.ForeignKey(LigneSerti, on_delete=models.DO_NOTHING)
    quantite = models.DecimalField(max_digits=10, decimal_places=2, null=True, blank=True)
    hdebut = models.DateTimeField(null=True, blank=True)
    hfin = models.DateTimeField(null=True, blank=True)

    class Meta:
        db_table = 'Consommation'
>>>>>>> 51a7fb753dfb0ea1e034714bb32ada3689ffb780

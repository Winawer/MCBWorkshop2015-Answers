The GWAS (genome wide association study) data consists of a number of phenotypic (trait) measurements, and genetic measurements. We are looking for assocations between the trait measures and their genotype. We're looking at a collection of plants (The Asiatic Boojum Tree, Fouquieria ghengiskhanii), sampled (as seeds) from the steppes across Mongolia and into Siberia; and reared in the Baja Boojum Research Station Germplasm Collection.

[*\ collection\ site.xlsx] Excel files containing the phenotype info on the first sheet.
phenotypes in this case are seed weights. The phenotype measures are stored in a number of .xlsx files, each corresponding to a different collection site. 
    site - a geographic population from which the lines were collected
    line - a unique id for the genetic strain we have sampled (in this case, a single individual)
    [numeric id 1:20] - a replicate seed from the parent plant (note that seed phenotype is determined maternally, so even if seeds are outcrossed it shouldn't matter).

[P.*.seed.genotypes.csv] comma separated text files containing the genotype info   
genotyping was performed by at a mail order genotyping facility in Vladivostok "Petya I Volk Sovietski Geny" (bargaingenesforu.ru) for loci with known segregating markers. Genotyping was sanger sequencing of unique, size selected restriction fragments, on acrylamide gels, performed by political dissidents imprisoned on tax charges - uniquely reliable marker calls by a cost effective work force. 
    Plate - the batch plate id
    Samp - the well number (1:95 - a well per plate was reserved for QC)
    [alphanumeric id, 1:1000] - SNP id corresponding to the GenBank label
    
[genotype_key.csv] a link file mapping the genotype and phenotype information.
provided by PIVSG
    samp - a string comprising the phenotype "line" and "site" data separated by an underscore.
    genotypeLabels - a string comprising the "Plate" id, and the "Samp" well number, separated by underscores.
    
    
figures:
    www.jpg - Sonnenfield, 1999, "Wild Wild West". Warner Bros.

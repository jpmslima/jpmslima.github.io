# Protein databases

## Aims

- Use the different protein information databases.
- Characterize unknown proteins using not only sequence, but profiles, motifs and domains.
- Obtain information about the family of a particular protein.
- Obtain specific alignments and positioning matrices for a protein family.
- Check for protein allergenicity.
- Check for regions of a given protein that might be epitopes for B and T cells.

**Note:**
- This tutorial is ***only for didactic purposes***. <span style="color:red">**Its reproduction for any other purpose is neither permitted nor consented to by the course instructors.**</span>

## Using UniPROT

UniProt is a reference knowledge base for obtaining protein information, with *links* and cross-referenced information to many other databases. It is usually where the first information on a particular protein is obtained.

### When should I use Uniprot?

- For general information about a protein.
- It usually has the most complete annotation record for single proteins.
- SwissProt: annotated and reviewed proteins, with human intervention.
- To perform similarity search with known proteins.
- To find curated and already experimentally confirmed homologues.
- To find data related to natural mutants and variations associated with diseases or altered phenotype.
- To obtain information on structure and residues important for activity/function.

Similarity searches using BLAST can also be performed directly on the UniProt site. Let's see an example?

- Open the UNIPROT Home Page: [http://www.uniprot.org](http://www.uniprot.org)

- Click on the **BLAST** link (upper left corner).

![Uniprot](https://drive.google.com/uc?id=1O2WrhLUAyvZQcyikfaMCvPR7lSCs-jnY)

- Copy and paste the sequence below into the *Query* field:

```
>Seq5
MASFTTTTAAAASRLLPSSSSSISRLSLSSSSSSSSSLKCLRSSPLVSHLFLRQRGGSAYVTKTRFSTKC
YASDPAQLKNAREDIKELLQSKFCHPIMVRLGWHDAGTYNKDIKEWPQRGGANGSLSFDVELRHGANAGL
VNALKLLQPIKDKYSGVTYADLFQLASATAIEEAGGPTIPMKYGRVDATGPEQCPEEGRLPDAGPPSPAQ
HLRDVFYRMGLDDKDIVALSGAHTLGRSRPERSGWGKPETKYTKDGPGAPGGQSWTAEWLKFDNSYFKDI
KEKRDADLLVLPTDAALFEDPSFKVYAEKYAADQEAFFKDYAEAHAKLSNQGAKFDPAEGITLNGTPAGA
APEKFVAAKYSSNKRSELSDSMKEKIRAEYEGFGGSPNKPLPTNYFLNIMIVIGVLAVLSYLAGN
```

- Click on BLAST, and after the results appear, analyze the table of hits (Similar or same sequences present in the database).

- Check the first 6 *hits*.

- Click on the first *hit* and check the structure of the information contained in Uniprot.

## Getting Protein Structure Information from UniProt:

- Open the [UniProt](http://www.uniprot.org) website again:
- In the Query field, enter the term **PGH2_MOUSE**.
- Observe the results.
- In another browser window/tab, on the same page as above, search for the term **GYS2_HUMAN**.
- Observe the results and see how much information is present for these proteins.

### Important

UniProt has two ways to specify the record for a protein: the [*Entry name*](https://www.uniprot.org/help/entry_name) and the [*Accession number*](https://www.uniprot.org/help/accession_numbers). The former is a quick way to remember a particular entry, but it is not stable. The second is stable and is the record that should be used in publications or scientific papers. We used the *entry name* above. More information on how the information in a UniProt record is organized can be found in its [Manual](https://www.uniprot.org/help/uniprotkb_manual).

## Exploring the Protein Data Bank

The RCSB PDB is the main bank of experimentally resolved protein structures. This is where we get the template proteins for comparative modeling.

![Protein Data bank](https://drive.google.com/uc?id=1Fs3d5KEBhjurPznpbB4e0WEz8l9HI4vp)

#### When should I use the PDB database?

- To get experimentally resolved protein structures.
- To get structural information about a protein.
- To check and find homologous protein structures.
- To get information about important sites for enzyme activity.
- To obtain information about protein ligands.

Let's now check an entry in the PDB database:
- Open the Protein Data Bank (PDB) Home Page: [www.rcsb.org](www.rcsb.org)
- In the field "PDB ID or Text" enter the term: 3HTB
- From the opened page, obtain the following information:
  - Protein ID.
  - Source Organism.
  - Number of Polypeptide Chains.
  - Experimental Method by which the model was obtained.
  - Other related structures.
  - Mutations found (if any).
  - Click on the structure and observe the 3D model using the Jmol tool.

The record of a structure in the PDB bank is always linked to an *Accession number* of this protein in UniProt. Therefore, when opening the record from the PDB code, a direct link to the record in UniProt will be described below the *Macromolecules* part. You can also use Uniprot [ID Mapping](https://www.uniprot.org/id-mapping) to search among entries from different databases for the same protein.

> *There is a file that is frequently updated, which indexes between the Uniprot Accession number and the PDB code of a protein in the Protein Databank. The name of this file is pdbtosp.txt and it can be obtained at the [Uniprot FTP](ftp://ftp.uniprot.org/pub/databases/uniprot/current_release/knowledgebase/complete/docs/pdbtosp.txt). *Using scripting languages or even "Find/Find" commands in text editing programs, you quickly survey the experimentally resolved structures of a protein with the Uniprot Accession number.*

## Identifying the domains of a protein

Let's now identify the architecture of the domains that this protein below has and the family it belongs to. 

```
>1smd
GRTSIVHLFEWRWVDIALECERYLAPKGFGGVQVSPPNENVAIHNPFRPWWERYQPVSYK
LCTRSGNEDEFRNMVTRCNNVGVRIYVDAVINHMCGNAVSAGTSSTCGSYFNPGSRDFPA
VPYSGWDFNDGKCKTGSGDIENYNDATQVRDCRLSGLLDLALGKDYVRSKIAEYMNHLID
IGVAGFRIDASKHMWPGDIKAILDKLHNLNSNWFPEGSKPFIYQEVIDLGGEPIKSSDYF
GNGRVTEFKYGAKLGTVIRKWNGEKMSYLKNWGEGWGFMPSDRALVVVDNHDNQRGHGAG
GASILTFWDARLYKMAVGFMLAHPYGFTRVMSSYRWPRYFENGKDVNDWGPPNDNGVTK
EVTINPDTTCGNDWVCEHRWRQIRNMVNFRNVVDGQPFTNWYDNGSNQVVAFGRGNRGFIV
FNNDDWTFSLTLQTGLPAGTYCDVISGDKINGNCTGIKIYVSDDGKAHFSISNSAEDPFI
AIHAESKL
```

For this, we will first use the [CDD](https://www.ncbi.nlm.nih.gov/Structure/cdd/cdd.shtml) database (*Conserved Domain Databases*), which is linked to the NCBI. The tool that does this identification is [SPARCLE](https://www.ncbi.nlm.nih.gov/sparcle) (*Subfamily Protein Architecture Labeling Engine*), which is a resource that functionally characterizes and labels protein sequences that have been grouped by their conserved domain architecture. A domain architecture is defined as the sequence order of conserved domains in a protein sequence (CDD-NCBI).

### When should I use CDD?

- To search for conserved domains of proteins.
- To find information about protein families.
- Including superfamilies and subfamilies.
- To obtain specific PSSM arrays for each protein family <sup>1</sup>.
- To obtain multiple sequence alignments from representatives of each family, and from the most distant and the most representative.
- To verify proximity relationships between protein families.

Using SPARCLE can be done in two ways: from an amino acid sequence or by a keyword. To use from sequence we will use [CD-Search](https://www.ncbi.nlm.nih.gov/Structure/cdd/wrpsb.cgi):
- Open [CD-Search](https://www.ncbi.nlm.nih.gov/Structure/cdd/wrpsb.cgi).
- Copy the sequence fasta ``1smd`` into the query box, as indicated in the figure below:

![CD-Search](https://drive.google.com/uc?id=1gZN4gt1dg691yccE_LYKPoV9SMHsvHdd)

- Leave the options already checked in the ***Options*** field.
- Click on ***Submit***.

The first result that is returned is a screen like the following:

![CD-Search](https://drive.google.com/uc?id=10_Mk0lN62Mao7wuH-80GD5Q7P5ZVV0oo)

In this, the following can be identified:

- The protein classification (*Protein Classification*), with the link to the domain architecture ID (from SPARCLE).
- The superfamily (*Superfamilies*) and the specific hits (*Specific hits*) within this superfamily.
- The identified domains (*Domain hits*).

> **Question**: *How many domains does this protein have?*

In the list of domains click on the first one and see the description of the family that contains this domain. It is a screen like the one shown below:

![Domain cd11317](https://drive.google.com/uc?id=1n5dLGgolp4x8cWcfg3LgP0dTRRRC0fkM)

Scroll down this page until the alignment of proteins belonging to this CD is shown. The default option is to align the *most diverse members*, i.e. those with the least similar sequences.

Three residues (DED triad) are important for the catalytic activity of this protein and can be highlighted by clicking the *Catalytic Site* tab. They will be highlighted in the alignment obtained further down this page.

> ***Can we say that the marked residues are indeed characteristic of this family?***
> 
> *Yes. This can be verified by clicking on* ***catalytic site**, in the ***Conserved Features/Sites*** box.

> <sup>1</sup>*The PSSM viewer and links are not available at CDD/NCBI anymore. So, do not worry if you can follow the steps below.*

The Position-Specific Score Matrix (PSSM) for this family can be obtained from the ***Statistics*** box on the left side. Click on the link indicated by the arrow, as represented in the figure below:

![Obtenção da PSSM](https://drive.google.com/uc?id=1d_CVkuQy7OqLq-87RJNU4VINVpLyRDzg)

On the newly opened page, the PSSM matrix can be seen. 

![PSSM description page](https://drive.google.com/uc?id=1q4PH2yFhyDMbZLH1MwcaqQt3X_nTtwry)

For each position in the sequence of the proteins in this family, the possibility of changes between the amino acids is denoted:

- In the first part, the probability that that position contains each amino acid is represented in the form of stacked bars.
- Below, we have the amino acids present in the consensus sequence, that is, the residue that occurs most often in that position, when considering all proteins in this family.
- Just below, we have the *master* sequence. The master sequence is the first sequence listed in the CD alignment. It is a real protein, and it is the sequence to which all the other sequences in the CD alignment are aligned. Whenever possible, the master sequence will be a sequence with a resolved 3D structure (a PDB). In the case of NCBI-curated CDs, a CD or one of its top CDs will always have a master sequence with a resolved 3D structure.

Under the ``Download Table File`` button (indicated by a red box in the figure above), the PSSM can be downloaded, to be used in a search using PSI-BLAST (Tutorial 105). For example, if the next step is to check for distant homologs of the sequence ``1smd``, present in sequences of metagenome samples (for possible biotechnology applications), by means of a PSI-BLAST, we will do it like this (also follow the pictures):

![PSI-BLAST with 1smd](https://drive.google.com/uc?id=1IQ15CkIH6ODaV9g66wE_YHXt6ePRHZMQ)

>*Unfortunately, it seems that PSSM viewer and the download link are not available anymore.*

- Use [BLASTp](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome), to run a search against the **env_nr** bank (*Metagenomic proteins*). Don't forget to paste the sequence ``1smd``` into the search field.
- In the ***Program Selection*** section, select PSI-BLAST. 
- Click on ***Algorithm parameters***.

![Choosing the PSSM in PSI-BLAST](https://drive.google.com/uc?id=127lj9XPqUs0WgbScpvJ99f1k5EXS62eT)

- In the ***PSI/PHI/DELTA BLAST*** section, there is a ***Upload PSSM*** option. Click to select the file and choose the previously saved PSSM file, which has the name ``cd11317_res.txt`` that was saved earlier (can also be obtained from the link).

- Click BLAST and check the results.

## Using Pfam and InterPro

[Pfam](http://pfam.xfam.org) is another bank for obtaining functional information on protein families and domains. From it, it is also possible to obtain multiple alignments of protein sequences from the same family (like the CDD) and obtain profiles (*profiles*) of *Hidden Markov Models* (HMMs). Such profiles are demonstrated in a graphical form, called *HMM Logos*.

> ***HMMs:*** * *It is a statistical model for any system that can be represented as a succession of transitions between discrete states.*

### When should I use Pfam?

- To obtain information on protein families and domains.

- To obtain functional information.

- To obtain multiple alignments of protein sequences from the same family.

- To obtain profiles and *Hidden Markov Models*:
  
  - This is a statistical model for any system that can be represented as a succession of transitions between discrete states.

In this part we will also use the sequence ``1smd``. To do this follow the steps below:

![Performing a query on Pfam](https://drive.google.com/uc?id=1uNWnTKC6MRxhXbFGLDowUGM3wQMAr3O4)

- Open the [Pfam](http://pfam.xfam.org) page.
- Click on ***Sequence Search***.
- Copy the sequence of the protein ``1smd`` into the given field.
- Wait for the results.

The first page of results will be as follows:

![Pfam Results - 1smd](https://drive.google.com/uc?id=1_s3MRUG96IkRq8DFUsXltJPqZrEwTTPt)

- Now click on the link corresponding to the alpha-amylase family.
- Look at all the results by clicking on the navigation menu on the right.

> *See mainly the items* ***Domain organization***, ***HMM Logo*** *and* ***Alignments***.

![Clan CL0058](https://drive.google.com/uc?id=17LI_2R-73k5PoEIDroub96LVV5guKXCp)

In the ***Summary*** part there is a tab indicating the [**InterPro**](http://www.ebi.ac.uk/interpro/) code for this protein family, which is [IPR006047](http://www.ebi.ac.uk/interpro/entry/IPR006047).

In InterPro similar information is also available and sequence searches can also be performed.

### When should I use InterPro?

- To get general information about a protein.
- To obtain information about the structure and residues important for activity.
- To obtain information linked with other biological databases.

> ***Which database to use?***
> 
> *This is not a trivial question. It is important that you explore the information available in each bank and extract as much information about the protein of interest as possible. As you can see, although there is a redundancy in the available information, each bank has its own specificity and particularity.

## Using PROSITE

The [PROSITE](http://prosite.expasy.org) database is another very useful database for obtaining functional and protein family and domain information. 

### When should I use PROSITE?

- To get information on protein families and domains.
- To obtain functional information.
- To obtain the sequence signatures that characterize protein families.
- Use for similarity searches using PHI-BLAST.

For this example, we will use the sequence below:

```
>Enzyme_Test_1
MVKIVTVKTQAYQDQKPGTSGLRKRVKVFQSSANYAENFIQSIISTVEPAQRQEATLVVGGDGRFYMKEAIQLIARIA
AANGIGRLVIGQNGILSTPAVSCIIRKIKAIGGIILTASHNPGGPNGDFGIKFNISNGGPAPEAITDKIFQISKTIEE
YAVCPDLKVDLGVLGKQFDLENKFKPFTVEIVDSVEAYATMLRSIFDFSALKELLSGPNRLKIRIDAMHGVVGPYVK
KILCEELGAPANSAVNCVPLEDFGGHHPDPNLTYAADLVETMKSGEHDFGAAFDGDGDRNMILGKHGFFVNPSVAV
IAANIFSIPYFQTGVRGFARSMPTSGALDRVASATKIALYETPTGWKFFGNLMDASKLSLCGEESFGTGSDHIREKD
GLWAVLAWLSILATRKQSVEDILKDHWQKYGRNFFTRYDYEEVEAEGANKMMKDLEALMFDRSFVGKQFSANDKVYTV
EKADNFEYSDPVDGSISRNQGLRLIFTDGSRIVFRLSGTGSAGATIRLYIDSYEKDVAKINQDPQVMLAPLISIALKV
SQLQERTGRTAPTVIT
```

**Steps:**

- Open the [PROSITE](http://prosite.expasy.org) home page.
- In the ***Quick Scan mode of ScanProsite*** box, paste the above sequence.
- Check the ***Exclude motifs with a high probability of occurrence from the scan*** option.

> *This option is for excluding linear motifs in the protein sequence that are very common, in numerous proteins.*

- Click ***Scan***.
- Look at the results, which should look like the picture below:

![PROSITE Results](https://drive.google.com/uc?id=1aQoj0d_0dKAFTS6w96mEu1iSi8A-MSaO)

The results show that between positions 111 and 120 there is a signature of phosphoglucomutase and phosphomannomutase phosphoserine type enzymes. Click on the link indicated above ([PS00710](http://prosite.expasy.org/cgi-bin/prosite/nicedoc.pl?PS00710)) and see the information on this motif.

On this same page, further down, we have a table called ***PGM_PMM, PS00710; Phosphoglucomutase and phosphomannomutase phosphoserine signature (PATTERN)***. In it we have the following standard consensus:

```
Consensus pattern:
[GSA]-[LIVMF]-x-[LIVM]-[ST]-[PGA]-S-H-[NIC]-P
```

This is the PROSITE signature of this type of protein. It can be used in a PHI-BLAST search (see tutorial 105) to identify proteins that have this signature in similarity searches using BLAST. 

### Let's take an example?

You want to check which proteins obtained from environmental metagenome samples have this phosphoglycomutase signature, for a possible biotechnological application. To do this, follow the steps below (also follow the picture):

![PHI-BLAST](https://drive.google.com/uc?id=1tasfVqBbRi7gBC_pZJNmWKAVC-MWcndw)

- Use [BLASTp](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome), to run a search against the **env_nr** bank (*Metagenomic proteins*). Don't forget to paste the sequence ``Enzyme_Test_1`` in the search field.
- In the ***Program Selection*** section, select PHI-BLAST. When you click PSI-BLAST, a box below opens. Here you enter the PROSITE signature above. 
- Click BLAST and wait for the results (It may take a while!!!).
- Check the results.

> *Is there anything promising?*

## *One More Thing*

The [Jena Library](http://jenalib.leibniz-fli.de/IMAGE.html) site aggregates known protein information from various databases (some seen in this tutorial itself).

![Jena Library](https://drive.google.com/uc?id=1YV9fzlWu6WllyUi0R9-kxQTAQwTy2LWf)

To do a test, put the code ```1smd``` in the ***QuickSearch*** field in the upper right corner of the page and click ***Go***. On the next page, information present in other protein databases will be returned, with links to the specific page of the entry.

# Immunoinformatics Databases

## Epitope prediction for B- and T-type cells

From the identification of pathogen surface proteins and using similarity searches one can infer B and T cell epitopes for any sequence. For this, the *knowledge database* of the *Immune Epitope Database and Analysis Resource* ([IEDB](http://www.iedb.org)) is an essential tool for antigenicity and immunogenicity studies.

![IEDB Home Page](https://drive.google.com/uc?id=1EtDo5kafIm-OepZ7WUr6jnuqzhOURyiU)

In this example, we will use a shrimp tropomyosin sequence *Litopenaeus vannamei*:

```
>Lit v 1 tropomyosin [Litopenaeus vannamei]
MDAIKKKMQAMKLEKDNAMDRADTLEQQNKEANNRAEKSEEEVHNLQKRMQQLENDLDQVQESLLKANIQ
LVEKDKALSNAEGEVAALNRRIQLLEEDLERSEERLNTATTKLAEASQAADESERMRKVLENRSLSDEER
MDALENQLKEARFLAEEADRKYDEVARKLAMVEADLERAEERAETGESKIVELEEELRVVGNNLKSLEVS
EEKANQREEAYKEQIKTLTNKLKAAEARAEFAERSVQKLQKEVDRLEDELVNEKEKYKSITDELDQTFSE
LSGY
```

### T-cell epitopes

Let's first check which regions of this protein might be possible T-cell epitopes (In the leftmost ***Epitope Analysis Resource*** box).

#### MHCI

- Click on ***MHC I Binding***.
- On the next page, copy and paste the above sequence.
- Leave the recommended option for the prediction method (*Prediction Method*).
- For simplification purposes, we will analyze only the human allele **HLA-A-01:01**. In the box next to it, put *All lengths*.
- Note the resulting table, which should look similar to the one below:

![MHC-I](https://drive.google.com/uc?id=1I15nBppFgWhV2sMoktH9fGhuEF5agxD6)

In the table above, it shows the Allele, the position in the sequence, the size and sequence of the peptide, and in the last column the *Percentile Rank*. Segundo o método, quanto menor for este percentil, melhor será a ligação com o MHCI. Selecione a caixa ```Check to expand the result```. A tabela será expandida com os seguintes resultados:

![MHC-II](https://drive.google.com/uc?id=1xxnUUunheMMG6EnOeQAZ77CvTVvFEK5J)

Another important result is reported: IC<sub>50</sub> (nM). It is the nanomolar concentration needed to bind half of the molecules.

>*The predicted output is given in units of IC50nM. Therefore a lower number indicates higher affinity. As a rough guideline, peptides with IC50 values <50 nM are considered high affinity, <500 nM intermediate affinity and <5000 nM low affinity. Most known epitopes have high or intermediate affinity. Some epitopes have low affinity, but no known T-cell epitope has an IC50 value greater than 5000.  While the output of the predictions is quantitative, there are systematic deviations from experimental IC50 values. For example, the makeup of the training data and the prediction methods used have a non-trivial impact on the range of predicted IC50 values. A detailed evaluation of the correlation between predicted IC50 and antigenicity of peptides is currently being conducted which will help to better interpret prediction results.  In addition to the IC50 values for each peptide, a percentile rank is generated by comparing the peptide's IC50 against those of a set of random peptides from SWISSPROT database. A small numbered percentile rank indicates high affinity. For the 'consensus' and 'IEDB recommended' methods, the median percentile rank of the methods used is reported as the representative percentile rank. (From [MHC-I help](http://tools.iedb.org/mhci/help/) do IEDB).*

#### MHCII

- Click on ***MHC II Binding***.
- On the next page, copy and paste the sequence above.
- For simplification purposes we will analyze only the human allele **DRB1*01:01**.
- Note the resulting table (figure below), which will be of similar interpretation to the table obtained for MHC-I.

![MHC-II](https://drive.google.com/uc?id=1t49lmVGTIoPHgM0Pj1Rwcrr6-jF3am9W)

> *The choice of allele(s) is of extreme importance in this type of analysis. In this tutorial only one allele has been used for simplification purposes, but when working with **immunoinformatics**, a very thorough research on the set of alleles that will be used is recommended.*

### B-cell epitopes

Now let's check which regions of this protein could be possible B-cell epitopes. 

Go back to the IEDB home page. Look in the leftmost frame for the options: ***Epitope Analysis Resource***, click on *Antigen Sequence Properties*, under ***B Cell Epitope Prediction***).

![IEDB - B Cells](https://drive.google.com/uc?id=1G7xPAKyuzhsvOuVVtf4O_KNPx0KNmIRH)

On the next page, follow the steps:

- Paste the sequence into the larger field. Remove the fasta header (as in the picture below).
- Leave the option checked by default (***Bepipred Linear Epitope Prediction***).
- Click on ***Submit***.
- Observe the results.

![IEDB - B-cells](https://drive.google.com/uc?id=13Gp5kIS87XQ7A6QL0PbYY_AqaD6HneWV)

In the graph shown as results, the regions in yellow represent regions of the submitted sequence with a high possibility of being B-cell epitopes. Check the sequences of these regions.

![IEDB-Results](https://drive.google.com/uc?id=1WlRyRhVO_GWgnfB6UI0K65p-WsTetydH)

### Let's do a first test?

Check if regions of the protein below, from Zika virus, can be used for a possible vaccine. To do this, perform the search for B and T cell epitopes as shown above.

```
>Proteina Zika
GKAFEATVRGAKRMAVLGDTAWDFGSVGGALNSLGKGIHQIFGAAFKSLFGGMSWFSQILIGTLLMWLGLNTKNGSISLMCLALGGVLIFLSTAVSA
```

### Searching for a specific disease

On the IEDB homepage you can also search for already known epitopes (by prediction, experimentally validated or used in available kits) from the disease name (e.g. Covid-19), as shown in the picture below:

![Searching from disease - IEDB](https://drive.google.com/uc?id=1UvBY48AtyWXNPRyclaSnQrYUCY2zYhjU)

Click on ``Search`` and analyze the results.

All the epitopes and antigens already catalogued for the causative agent proteins will be listed in the resulting table. There you also have access to the various information associated with each epitope sequence. This tool is very useful for you to check if a certain epitope has not been identified before.

## Allergenicity Prediction

Allergenic proteins are those that have the potential to cause allergies in humans. Allergenicity testing is one of the first steps in evaluating the biotechnological potential of a particular protein. For example, regions of this protein can be used as vaccines, but if they cause allergies, the potential for application diminishes considerably. Allergenicity prediction is also strictly necessary in the case of commercial deployment of transgenic products, whether for food or cosmetic purposes.

For prediction of the allergenic potential of a particular protein, we will also use the above shrimp tropomyosin sequence. There are several databases that can be used to find similarities with already proven allergenic proteins, such as:

- [AllergenOnline](http://www.allergenonline.org)
- [SDAP - Structural Database of Allergenic Proteins](https://fermi.utmb.edu)
- [AllerMatch](http://www.allermatch.org)

> *Always check that the databases you are using are being updated. This is of fundamental importance, since a new allergenic protein may have been identified more recently. For example, AllerMatch has not received any updates for a while.*

We will use the database [AllergenOnline](http://www.allergenonline.org), maintained by the University of Nebraska. There you can search by name, code, and also by sequence. Let's query by sequence:

![AllergenOnline Home Page](https://drive.google.com/uc?id=1CvUtsJVu_MedCFEPhVjIi0IfHJpKZ9dJ)

- Open the [AllergenOnline] home page (http://www.allergenonline.org).
- On the left side, click on ***Sequence Search Allergen Database***.
- Paste the sequence into the ***Sequence Entry*** box.
- In the search method, there are 3 options:
  - *Full fasta*: to check for whole protein similarity *query*. We use this case to check overall similarity.
  - *Sliding 80mer Window*: does the search in "windows" every 80 amino acids, with overlap. In this case it is to check if the *query* protein has similar internal regions with known allergenic proteins.
  - 8mer Exact Match*: does a search for regions of 8 amino acids exactly. We use it to see if the protein has exact smaller regions that might be allergenic.
- Click *Sliding 80mer Window*, and then ***Submit*** to start the search.
- Check the results.

Let's repeat the analysis with SDAP:

- Open the [SDAP] page(https://fermi.utmb.edu).
- On the left side, click on ***FASTA Search in SDAP***.
- On the new page, paste the shrimp tropomyosin sequence and click ***Search***.
- Check the results.

The [IEDB](http://www.iedb.org) also has a tool to check antigen conservation, which is quite valid for checking allergenicity potential as well.

- Open the [IEDB](http://www.iedb.org) page.
- In the ***Epitope Analysis Tools*** box, click on the ***Conservation Across Antigens*** option
- On the new page, put in the first box (***Step 1. Epitope Sequence(s)***) one of the sequences obtained in the B-cell epitope search (in the previous item), for example the short sequence below (one of those found in the search):

```
QQLENDLDQV
```

- In the second box (***Step 2. Protein Sequence(s)***), paste the sequence below:

```
>AIO08865.1 Der f 10 allergen, partial [Dermatophagoides farinae]
MEAIKKKMQAMKLEKDNAIDRAEIAEQKARDANLRAEKSEEEVRALQKKIQQQIENELDQVQEQLSAANTK
LEEKEKALQTAEGDVAALNRRIQLIEEDLERSEERLKIATAKLEEASQSADESERMRKMLEHRSITDEER
MDGLENQLKEARMMAEDADRKYDEVARKVLAMVEADLERAEERAETGESKIVELEEELRVVGNNLKSLEVS
EEKAQQREEAYEQIRIMTAKLKEAEARAEFAERSVQKLQKEVDRLEDELVHEKEKYKSISDELDQTFAE
LTG
```

- In ***Sequence identity threshold:***, check the 60% option, so that we look for sequence with at least 60% similarity.
- Leave the rest of the options as default and click ***Submit***.
- In the resulting table, view the result and click ***Go***.

The sequence of *Dermatophagoides farinae* (common mite) shows a conserved epitope relative to that of shrimp. Therefore, it is likely that it is also allergenic.

### Exercise

Check whether the sequence below is allergenic:

```
>Der f 1
RPASIKTFEEFKKAFNKNYATVEEEEVARKNFLESLKYVEANKGAINHLSDLSLDEFKNR
YLMSAEAEAFEFEQLKTQFDLNAETSACRINSVNVPSELDLRSLRTVTPIRMQGGCGSCWAFSG
VAATESAYLAYRNTSLDLSEQELVDCASQHGCHGDTIPRGIEYIQNGVVEERSYPYVAR
EQCRRPNSQHYGISNYCQIYPPDVKQIREALTQTHTAIAVIIGIKDLRAFQHYDGRTII
QRDNGYQPNYHAVNIVGYGSTQGVDYWIVRNSWDTT
```

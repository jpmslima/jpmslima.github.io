# Similarity searches using protein sequences

In the following steps, you should learn:

- Searching for similarities among sequences using the different BLAST versions.
- Discover information about a protein using the primary structure (sequence).
- Search for homologous proteins that have low sequence similarity.

**Notice:**
- This tutorial was adapted from the BLAST tutorials available at NCBI. The original content has been translated and modified in part its structure ***only for didactic purposes***. <span style="color:red">**Any reproduction of it for any other purpose is neither permitted nor consented to by the course instructor.**</span>

## BLASTp

Use [BLASTp](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastp&PAGE_TYPE=BlastSearch&LINK_LOC=blasthome), to run a search against the **nr** bank (*non redundant protein database*) to find vertebrate proteins homologous to the protein below:

```
>C.elegans protein
MFHPGMTSQPSTSNQMYYDPLYGAEQIVQCNPMDYHQANILCGMQYFNNSHNRYPLLPQMPPQFTNDHPY
DFPNVPTISTLDEASSFNGFLIPSQPSSYNNNNISCVFTPTPCTSSQASSQPPPTPTVNPTPIPPNAGAV
LTTAMDSCQQISHVLQCYQQGGEDSDFVRKAIESLVKKLKDKRIELDALITAVTSNGKQPTGCVTIQRSL
DGRLQVAGRKGVPHVVYARIWRWPKVVSKNELVKLVQCQTSSDHPDNICINPYHYERVVSNRITSADQSLH
VENSPMKSEYLGDAGVIDSCSDWPNTPPDNNFNGGFAPDQPQLVTPIISDIPIDLNQIYVPTPPQLLDNW
CSIIYYELDTPIGETFKVSARDHGKVIVDGGMDPHGENEGRLCLGALSNVHRTEASEKARIHIGRGVELT
AHADGNISITSNCKIFVRSGYLDYTHGSEYSSKAHRFTPNESSFTVFDIRWAYMQMLRRSRSSNEAVRAQ
AAAVAGYAPMSVMPAIMPDSGVDRMRRDFCTIAISFVKAWGDVYQRKTIKETPCWIEVTLHRPLQILDQL
LKNSSQFGSS
```

After a few minutes, you should have a result like the one below. Click on the place indicated to switch to the traditional BLAST results page:

![Example of a BLASTn result between 2 sequences](https://drive.google.com/uc?id=14tdccH2BgW8ksapmRVlkH6A468psJq9a)

> *On the traditional page, the results are more accessible, however, feel free to use the newer version.*

- Based on the *hit* identical to *C. elegans*, what is the identity of this protein?

Above the graphical summary of the BLAST search is the link ***Taxonomy Report*** (See figure below). Click and look at the new page that opens.

![Taxonomy Report](https://drive.google.com/uc?id=1I58CAsoPWIrU7h86d2lEEIpLaBdhhzfU)

- What do you notice on this new page?
- Look on this page for records of homologous proteins of bird species.
- Look for the hit with the species *Xenopus laevis* and check the BLAST alignment parameters between these sequences.

> *We will come back to this protein in the PSI-BLAST example.*

## BLASTx

The easiest way to obtain a target sequence is to search its coding sequence in biological databases (in genome or transcriptome projects). DNA sequencing is usually more accessible than methods of obtaining amino acid sequences. To perform the similarity search from the nucleotide coding sequence, you have two options:

- Translate the nucleotide sequence in the 3 *frames* (open read frames) and submit the resulting sequences to similarity searches using BLASTp. This translation can be performed using tools from [EXPASY](https://web.expasy.org/cgi-bin/translate/dna2aa.cgi) or [EBI](https://www.ebi.ac.uk/Tools/st/).
- Use [BLASTx](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&PAGE_TYPE=BlastSearch&BLAST_SPEC=&LINK_LOC=blasttab&LAST_PAGE=blastn&QUERY=AB823629.1). This variation of BLAST translates the input nucleotide sequence (*Query*) and compares it with protein banks.

To be more practical and straightforward, we will use the search [BLASTx](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&PAGE_TYPE=BlastSearch&BLAST_SPEC=&LINK_LOC=blasttab&LAST_PAGE=blastn&QUERY=AB823629.1), with the sequence in the ```fasta``` format below:

```
>AB823629.1
GAATGCATACATGGCTTCCTCCAACTTACTCTCCCTAGCCCTCTTCCTTGTGCTTCTCACCCACGCAAAC
TCAGCCAGCCAAACCTCCTTCAGCTTCCAAAGGTTCAACGAAACCAACCTTATCCTCCAACGCGATGCCA
CCGTCTCATCCAAAGGCCAGTTACGACTAACCAATGTTAATGACAACGGAGAACCCACGTTGAGCTCTCT
GGGCCGTGCCTTCTACTCCGCCCCCATCCAAATCTGGGACAACACCACCGGCGCCGTGGCCAGCTTCGCC
ACCTCCTTCACATTCAATATCGACGTTCCCAACAATTCAGGACCCGCCGATGGCCTTGCCTTTGTTCTCC
TCCCCGTGGGCTCTCAGCCCAAAGACAAAGGCGGTCTTCTAGGTCTGTTCAACAACTACAAATACGACAG
CAATGCCCATACTGTGGCTGTGGAGTTCGACACCCTCTACAACGTTCACTGGGACCCCAAACCGCGTCAT
ATTGGCATCGACGTGAACTCCATCAAGTCTATCAAAACGACGACGTGGGATTTTGTCAAAGGAGAAAACG
CGGAGGTTCTGATCACCTATGACTCCTCCACGAAGCTCTTGGTGGCTTCTCTGGTTTACCCTTCTCTGAA
AACAAGCTTCATCGTCTCTGACACAGTGGACCTGAAGAGCGTTCTTCCCGAGTGGGTGATCGTTGGGTTC
ACTGCCACCACTGGGATTACTAAAGGGAACGTTGAAACGAACGACATCCTCTCTTGGTCTTTTGCTTCCA
AGCTCTCCGATGGCACCACATCTGAAGCTTTGAATCTTGCCAACTTCGCCCTCAACCAAATCCTCTAG
```

Now let's see if there is other proteins similar to this one that have an experimentally known 3D structure. For this we will use a [BLASTx](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PROGRAM=blastx&PAGE_TYPE=BlastSearch&BLAST_SPEC=&LINK_LOC=blasttab&LAST_PAGE=blastn&QUERY=AB823629.1). On the BLASTx search page, remember to change the *Database* field to ***Protein Data Bank (pdb)***. However, we do not want to receive *hits* from the genus *Phaseolus*. To do this, in the *Organism* field, we put the name *Phaseolus* (taxid: 3883) and click *Exclude* (See the figure below).

![BlastX](https://drive.google.com/uc?id=1SdKtOtwJ4NP7V1yNk36JXmymZJqhBh0R)

Click BLAST and wait for the results.
- What is the percent identity of the pdb entry most similar to this sequence?

## PSI-BLAST

The Sma-4 protein from *C. elegans* that we used earlier belongs to a large family of proteins involved in TGF-beta mediated signaling. (Go back to the BLASTp search from the beginning of this tutorial). Some members of this family are not readily identified in a normal BLASTp search, because they already had many modifications over evolutionary time in their sequences. However, other more distant homologs of Sma-4 can be found using the more specific PSI-BLAST sensitive to the specific amino acid position in the proteins. 

Start a PSI-BLAST search with the accession number for the *C. elegans* Sma-4 protein, **P45897.1**, as a query. To use PSI-BLAST, you start as an ordinary BLASTp and select the PSI-BLAST option below (see the figure below):

![PSI-BLAST](https://drive.google.com/uc?id=14QUOcRl8ZjvOhX7g1Pn0m9erL3NAlCek)

Notice the first output of results. It does not differ much from the output of a normal BLASTp, except that it is formatted differently. The sequences are already marked/selected. There is a line between results corresponding to the PSI-BLAST inclusion threshold of 0.005. The position-specific information from a multiple alignment of the sequences above this line is used to generate a position-specific score matrix (PSSM) in the next iteration.

Now we will do a new round of iteration. In this one the program will calculate a new PSSM and will look for proteins that have less similar sequences, but still respect the probabilities from the PSSM. Now click the *Go* button next to *Run PSI-BLAST iteration 2*. 

The hits not found in the previous search will appear highlighted in yellow.

- What is the first yellow *hit* found? What is the sequence similarity?

You can continue by performing new iteration steps. After a few more iterations no more new sequences will be found. At this point it is said that the search has reached convergence.

> *In recent years the NCBI has launched the Delta-BLAST tool, which gives similar results to PSI-BLAST, but in a faster way and more integrated with the regular BLAST.*

## PHI-BLAST

PHI-BLAST searches for sequences that have a certain pattern or signature. Let's initially do a BLASTp search, using the sequence below:

```
>Protein_X
MCPANIAPVCCYGYSTGSYTTPNVCLCKCVLDTFVLYEGLCRITHDKFKPPRDDILCLQVYDPVCCRIHGVVVTESNGCFCYVRGGTVVPGTCSSMFPPPFASPQIS
```

- How many *hits* were found?

Although only these sequences were found, there may be other proteins that have a similar sequence signature to these proteins. From a multiple alignment of the obtained proteins, the following sequence signature was assembled:

```
C-x(5)-PVCC-x(1,4)-G-x(1,6)-T-x(2)-N-x(1)-C-x(7,14)-G-x(1)-C-x(1,5)-[HN]-x(4)-P
```

> *We will not show this procedure now. What can be described is that they correspond to regions that have the same amino acids, separated by very different ones. This signature has to be written in the format of the [PROSITE](http://prosite.expasy.org) database.*

Now we will use this pattern, as a search pattern in PHI-BLAST. On the BLASTp home page, select **PHI-BLAST** (it is just below PSI-BLAST - see the picture below). Clicking on PSI-BLAST opens a box below. In it you enter the signature above. Click BLAST and wait for the results (It can take a while).

![PHI-BLAST](https://drive.google.com/uc?id=1V3svK_WdQk4YtbF7rykFK54O3Es5PJC-)

- Did new proteins appear in this search?
- How similar are these new proteins?
[![UChile](https://drive.google.com/uc?id=1xeSo8MOvqmgO4q_6lyidauaKOjdTPu3t)](http://www.postgradoquimica.cl/informacion-diplomado-en-bioinformatica-y-biologia-computacional/)

# Inferring Phylogenies using MEGAX

A *crash course*.

Now we're going to use [this dataset](https://drive.google.com/uc?export=download&id=13bsRE3MGmkKOL0mjT-DigvzerH0BDau6) to construct the phylogenetic trees. For this we will use MEGAX.

- Open the alignment. In the next window, click in `Analyze` as DAMBE (protein coding nucleotide sequences and the genetic code).

- Test of the nucleotide substitution model.

![MegaX](https://drive.google.com/uc?id=1wLm3EXhDCQmuHFz5Pb2uVDCoEuRpR7nu)

> *The test of nucleotide substitution model sometimes gives as result models which are not present in MEGA options. In these cases, you have to choose a model that has the necessary parameters suitable to represent your sequence alignment. Although highly recommended, especially for beginners in phylogenetic analyses, this test is not critical.*

- Examine the alignment statistics. Click in the TA icon on the right, to launch the Data Explorer.

![Alignment Statistics](https://drive.google.com/uc?id=1p-pnFBOtuax4tOSnje_9yRtk3NYWfUlb)

- Construct a Neighbor-joining Phylogenetic tree, with a bootstrap test. Use *Complete deletion* on this dataset. You can use Tamura-Nei 93, since GTR model does not exist for the Neighbor-Joining method. Don't forget to examine the gamma-shape parameter for the TN93 model and the proportion of invariant sites (if needed).

![NJ1](https://drive.google.com/uc?id=154bLdf-YWWWqh45jPsSMzB_evUTiqVAY)

![NJ2](https://drive.google.com/uc?id=1bHzxYugGBK6osY08ftYZxSfxk2hmvxgK)

- Construct a phylogenetic tree using Parsimony and also Maximum Likelihood. For the later, you can use the GTR model (General Time-reversible), selected by the test of the nucleotide substitution model. Also use *Complete deletion* on both methods.

![ML](https://drive.google.com/uc?id=1pJrWPVrGaixRwdUfih_wk_z5j4K665K2)

> *In the ML method, you don't need to adjust a specific gamma-shape parameter, you just have to set to use Gamma* 

- Do not forget to root the trees when necessary and to save the trees.

> *The tree demonstrated below is not rooted with the most plausible outgroup!*

![Rooting the tree](https://drive.google.com/uc?id=1_OBQqcVeeVVAI6_qMFrtFGxhil7mql3S)

### Exercise:

- Which species do you choose to be the outgroup of the above dataset? Explain.

- Compare the obtained trees and explain the phylogeny, always looking for supporting (or not) bootstrap values.
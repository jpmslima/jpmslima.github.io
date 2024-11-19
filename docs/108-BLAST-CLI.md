# Usando no BLAST na linha de comando

***Observações:***

- Este tutorial é ***apenas para fins didáticos***. <span style="color:red">**A reprodução dele para qualquer outro fim não é permitida e nem consentida.**</span>
- Para executar este tutorial você necessitará dos arquivos obtidos no tutorial anterior **Instalando o NCBI-Entrez-Direct-E-utilities**.
- O usuário de cada discente para acesso ao servidor tem restrições e o endereço IP de cada acesso é registrado. Muito cuidado ao usar.
- Para instalação do BLAST em sua própria máquina UNIX siga as instruções contidas [AQUI](https://blast.ncbi.nlm.nih.gov/Blast.cgi?PAGE_TYPE=BlastDocs&DOC_TYPE=Download).

## Criando um banco BLAST

Uma das grandes vantagens do BLAST, que o levou a ser a ferramenta padrão para busca de similaridades, é a sua rapidez. Apesar de ser uma heurística, os resultados de suas buscas são confiáveis, desde que bem explorados pelo pesquisador. Uns dos motivos de tal rapidez na comparação é a indexação que o programa faz nas sequências do banco de dados, especificamente com as "*sementes*" contidas nas sequências. Essa indexação é parte do processo de formatação do banco BLAST, que deve ser realizado antes da utilização do programa. A suíte de programas vem com um aplicativo chamado `makeblastdb` que é utilizado para tal fim.

>  *Em versões antigas do BLAST (BLAST legacy) o comando era o formatdb, mas foi descontinuado. Apenas tenha cuidado ao verificar a versão do BLAST antes de preparar o banco de sequências.*

Os *inputs* para a criação do banco serão os dois arquivos no formato fasta (os multifastas) baixados no item anterior. Outros arquivos com anotações e sequências também podem ser utilizados como *input*, mas por simplicidade iremos começar com a criação a partir de um arquivo multifasta.

- Vamos primeiro criar o banco de sequências nucleotídicas, usando o arquivo `G6PD-craniata-NTs.fasta`. Para isso execute o seguinte comando:

```shell
makeblastdb -dbtype nucl -in G6PD-craniata-NTs.fasta -title g6pd-nt -hash_index -out g6pd-nt
```

- Os argumentos do executável `makeblastdb` significam:
  
  - `-dbtype`: o tipo de sequência biológica. `nucl` significa nucleotídeos.
  
  - `-in`: o arquivo com as sequências que serão utilizadas para criar o banco.
  
  - `-title`: o título do banco de dados, que deve ser único para cada banco criado.
  
  - `-hash_index`: Possibilita a criação de valores de *hash* para as sequências do banco. Estes valores são usados para determinar rapidamente se um determinado dado de sequência existe neste banco de dados BLAST. Não é obrigatória para todos os bancos.
  
  - `-out`: o nome do banco de dados a ser criado. Caso essa opção não seja colocada, o nome a ser criado será igual ao do arquivo de entrada.

- A saída será similar a seguinte:

```shell
Building a new DB, current time: 04/20/2022 16:49:03
New DB name:   /home/jpmslima/blastDB/g6pd-nt
New DB title:  g6pd-nt
Sequence type: Nucleotide
Keep MBits: T
Maximum file size: 1000000000B
Adding sequences from FASTA; added 262 sequences in 0.00907397 seconds.
```

- Agora vamos criar o banco com sequências de aminoácidos, tendo como *input* as sequências contidas no arquivo `G6PD-craniata-AA.fasta`. Para isso execute o comando abaixo:

```shell
makeblastdb -dbtype prot -in G6PD-craniata-AA.fasta -title g6pd-aa -hash_index -out g6pd-aa
```

- Os argumentos são basicamente os mesmos, no entanto, note que houve mudança no `dbtype` devido as sequências serem de aminoácidos. 

Agora que temos os dois bancos criados, iremos realizar as buscas por similiaridade.

## Realizando buscas de similaridade

Vamos executar agora buscas utilizando como *query* (sequência consulta) as duas sequências baixadas, a `NT-teste.fasta` e `AA-teste.fasta`. É muito importante que saibas a utilidade de cada *"sabor"* do programa BLAST e o tipo de comparação que eles realizam.

Iniciaremos com uma busca BLASTn (sequência de nucleotídeos contra um banco de sequências nucleotídicas). Execute o seguinte comando:

```shell
blastn -query NT-teste.fasta -db g6pd-nt -out busca1.txt
```

- Os argumentos são:
  
  - `-query`: arquivo contendo a sequência consulta.
  
  - `-db`: nome do banco contra o qual a busca será realizada.
  
  - `-out`: nome do arquivo de saída para a busca realizada.

- Analise os resultados, abrindo o arquivo `busca1.txt` com o comando `more` ou com o editor `nano` . Houve *hits* nessa sua busca?

Agora iremos realizar uma busca BLASTp (sequência de aminoácidos contra um banco de sequências de proteínas). Para isso, execute o seguinte comando:

```shell
blastp -query AA-teste.fasta -db g6pd-aa -out busca2.txt
```

- Verifique que os argumentos são similares ao do BLASTn acima. E agora, houve *hits* nesta busca? Explique.

Podemos fazer uma "busca cruzada" utilizando o BLASTx (sequência traduzida de nucleotídeos contra um banco de sequências proteicas), com o comando:

```shell
blastx -query NT-teste.fasta -db g6pd-aa -out busca3.txt
```

E agora vamos executar um tBLASTn (sequência de aminoácidos contra um banco de sequências nucleotídicas traduzidas) e um tBLASTx (sequência de nucleotídeos traduzida contra um banco de sequências nucleotídicas traduzidas):

```shell
tblastn -query AA-teste.fasta -db g6pd-nt -out busca4.txt
tblastx -query NT-teste.fasta -db g6pd-nt -out busca5.txt
```

Verifique as diferenças entra as buscas, analisando os arquivos de saída.

## Outras opções de formatos de saída e documentação

A grande vantagem do BLAST local via linha comando é a facilidade na obtenção dos formatos de saída. Nos exemplos acima, só usamos a saída básica do BLAST, aquela que vocês já conhecem. No entanto, muitas vezes precisamos customizar a saída da busca de similaridade para facilitar a análise dos resultados ou fazer integração com outros programas ou bancos de dados em SQL. A saída pode até ser em um formato html (usando o argumento `-html`), para visualizares com os links *hits*-alinhamento funcionando. A opção é dada por um argumento `-outfmt`. Veja as opções com o comando:

```shell
blastn -help
```

Os formatos de saída estarão na seção abaixo:

```shell
*** Formatting options
 -outfmt <String>
   alignment view options:
     0 = Pairwise,
     1 = Query-anchored showing identities,
     2 = Query-anchored no identities,
     3 = Flat query-anchored showing identities,
     4 = Flat query-anchored no identities,
     5 = BLAST XML,
     6 = Tabular,
     7 = Tabular with comment lines,
     8 = Seqalign (Text ASN.1),
     9 = Seqalign (Binary ASN.1),
    10 = Comma-separated values,
    11 = BLAST archive (ASN.1),
    12 = Seqalign (JSON),
    13 = Multiple-file BLAST JSON,
    14 = Multiple-file BLAST XML2,
    15 = Single-file BLAST JSON,
    16 = Single-file BLAST XML2,
    17 = Sequence Alignment/Map (SAM),
    18 = Organism Report

   Options 6, 7, 10 and 17 can be additionally configured to produce
   a custom format specified by space delimited format specifiers,
   or in the case of options 6, 7, and 10, by a token specified
   by the delim keyword. E.g.: "17 delim=@ qacc sacc score".
   The delim keyword must appear after the numeric output format
   specification.
   The supported format specifiers for options 6, 7 and 10 are:
           qseqid means Query Seq-id
              qgi means Query GI
             qacc means Query accesion
          qaccver means Query accesion.version
             qlen means Query sequence length
           sseqid means Subject Seq-id
        sallseqid means All subject Seq-id(s), separated by a ';'
              sgi means Subject GI
           sallgi means All subject GIs
             sacc means Subject accession
          saccver means Subject accession.version
          sallacc means All subject accessions
             slen means Subject sequence length
           qstart means Start of alignment in query
             qend means End of alignment in query
           sstart means Start of alignment in subject
             send means End of alignment in subject
             qseq means Aligned part of query sequence
             sseq means Aligned part of subject sequence
           evalue means Expect value
         bitscore means Bit score
            score means Raw score
           length means Alignment length
           pident means Percentage of identical matches
           nident means Number of identical matches
         mismatch means Number of mismatches
         positive means Number of positive-scoring matches
          gapopen means Number of gap openings
             gaps means Total number of gaps
             ppos means Percentage of positive-scoring matches
           frames means Query and subject frames separated by a '/'
           qframe means Query frame
           sframe means Subject frame
             btop means Blast traceback operations (BTOP)
           staxid means Subject Taxonomy ID
         ssciname means Subject Scientific Name
         scomname means Subject Common Name
       sblastname means Subject Blast Name
        sskingdom means Subject Super Kingdom
          staxids means unique Subject Taxonomy ID(s), separated by a ';'
                (in numerical order)
        sscinames means unique Subject Scientific Name(s), separated by a ';'
        scomnames means unique Subject Common Name(s), separated by a ';'
       sblastnames means unique Subject Blast Name(s), separated by a ';'
                (in alphabetical order)
       sskingdoms means unique Subject Super Kingdom(s), separated by a ';'
                (in alphabetical order) 
           stitle means Subject Title
       salltitles means All Subject Title(s), separated by a '<>'
          sstrand means Subject Strand
            qcovs means Query Coverage Per Subject
          qcovhsp means Query Coverage Per HSP
           qcovus means Query Coverage Per Unique Subject (blastn only)
   When not provided, the default value is:
   'qaccver saccver pident length mismatch gapopen qstart qend sstart send
   evalue bitscore', which is equivalent to the keyword 'std'
   The supported format specifier for option 17 is:
               SQ means Include Sequence Data
               SR means Subject as Reference Seq
   Default = `0'
```

Você também pode limitar as buscas a:

- Número de sequências.

- % de identidade e % de cobertura.

- *E-value* e *bit-escore*.

Os argumentos específicos de cada versão também podem ser consultados com os comandos:

```shell
blastp -help
blastx -help
tblastn -help
```

Ou você pode consultar o manual completo do BLAST [nesta página](https://www.ncbi.nlm.nih.gov/books/NBK279690/).

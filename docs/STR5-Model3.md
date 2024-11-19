# Modelagem Comparativa de Proteínas 3

Exemplo de modelagem básica utilizando o Modeller em linha de comando. A utilização do Modeller desta forma traz inúmeras funções e possibilidades de modelagem adicionais, que não são possíveis em sua interface com o UCSF Chimera. 

### Observações:

- Este tutorial foi traduzido e adaptado dos tutoriais do programa Modeller (Andrej Sali - [https://salilab.org/modeller/](https://salilab.org/modeller/)).
- Para instalar o Modeller, baixe o arquivo para a sua versão de sistema operacional e siga as instruções descritas [AQUI](https://salilab.org/modeller/download_installation.html).

Após a instalação, verifique o arquivo *config.py*, dentro do diretório *../modeller9.XX/modlib/modeller* (Em sistemas Ubuntu, quando instalado pelo comando:

```
$ sudo apt-get install modeler
```
O diretório de instalação é */usr/lib/modeller9.XX/modlib/modeller*. Dentro deste diretório, o arquivo *config.py* deve conter as seguintes linhas:

```
install_dir = r'/usr/lib/modeller9.XX'
license = 'MODELIRANJE'
```
**Importante:**

Esta licença é exclusivamente didática-acadêmica e deve ser requisitada por todos que utilizam ou utilizarão o programa. A licença pode ser requisitada [AQUI](https://salilab.org/modeller/registration.html). Normalmente um e-mail institucional é necessário.

- Não esqueça de abrir e editar os scripts abaixo quando necessário (e vai ser necessário), utilizando um editor de texto simples.
- Os arquivos necessários estão no arquivo **basic_model.zip**, colocado na página do curso ou podem ser obtidos diretamente [AQUI].

### Modelagem de uma sequência com alta identidade/similaridade a um molde

Modelando a enzima abaixo:

```    
>P1
MSEAAHVLITGAAGQIGYILSHWIASGELYGDRQVYLHLLDIPPAMNRLTALTMELEDCAFPHLAGFVATTDPKA
AFKDIDCAFLVASMPLKPGQVRADLISSNSVIFKNTGEYLSKWAKPSVKVLVIGNPDNTNCEIAMLHAKNLKPEN
FSSLSMLDQNRAYYEVASKLGVDVKDVHDIIVWGNHGESMVADLTQATFTKEGKTQKVVDVLDHDYVFDTFFKKI
GHRAWDILEHRGFTSAASPTKAAIQHMKAWLFGTAPGEVLSMGIPVPEGNPYGIKPGVVFSFPCNVDKEGKIHVV
EGFKVNDWLREKLDFTEKDLFHEKEIALNHLAQGG
```

- Obtenha informações desta enzima, utilizando a ferramenta BLAST do banco de dados [UNIPROT](http://www.uniprot.org/).

### *Um pequeno histórico*

A enzima _Trichomonas vaginalis_ apresenta uma forma da enzima lactato desidrogenase (TvLDH) que possui alta similaridade a enzima malato desidrogenase (TvMDH) da mesma espécie. Esta similaridade é muitas vezes maior que a similaridade com lactato desidrogenases de outros organismos. Devido a este fato, levanta-se a hipótese de que a TvLDH se originou a partir da TvMDH por convergência evolutiva relativamente recente. 

Faremos assim, a construção de modelos comparativos para a TvLDH e TvMDH para estudar as sequências em seu contexto estrutural.

### Procurando por estruturas relacionadas a TvLDH

O primeiro passo é colocar a sequência fasta acima no formato PIR (_Protein Information Resource_). Este formato permite a inserção de informações adicionais às sequências.

```        
>P1;TvLDH
sequence:TvLDH:::::::0.00: 0.00
MSEAAHVLITGAAGQIGYILSHWIASGELYGDRQVYLHLLDIPPAMNRLTALTMELEDCAFPHLAGFVATTDPKA
AFKDIDCAFLVASMPLKPGQVRADLISSNSVIFKNTGEYLSKWAKPSVKVLVIGNPDNTNCEIAMLHAKNLKPEN
FSSLSMLDQNRAYYEVASKLGVDVKDVHDIIVWGNHGESMVADLTQATFTKEGKTQKVVDVLDHDYVFDTFFKKI
GHRAWDILEHRGFTSAASPTKAAIQHMKAWLFGTAPGEVLSMGIPVPEGNPYGIKPGVVFSFPCNVDKEGKIHVV
EGFKVNDWLREKLDFTEKDLFHEKEIALNHLAQGG*
```

_Clique [AQUI](https://salilab.org/modeller/9v8/manual/node454.html) para saber mais informações sobre o formato .pir._

### Busca por sequências relacionadas de estrutura conhecida (pdb).

É realizado pelo comando **profile.build()** do MODELLER. Este conjunto de instruções está descrito no script *build_profile_.py*. Ele faz o seguinte:

1. Inicializa o *‘environment’* para a modelagem, criando um objeto ‘environ’.

2. Cria um objeto ‘sequence_db’, chamando-o de ‘sdb’. Estes objetos são utilizados para conter grandes bancos de dados de sequências proteicas.

3. Lê um arquivo de texto contendo sequências não redundantes do PDB a 95% de identidade para o banco sdb. Para isto há necessidade de um arquivo, *pdb_95.pir* fornecido na página do MODELLER. Este arquivo também está no formato PIR, e nele, sequências com que possuem menos de 30 ou mais que 4000 resíduos são descartadas, e os resíduos “não-padrão” são removidos.

4. Escreve um arquivo binário contendo todas as sequências lida na etapa anterior.

5. Lê o arquivo binário. _Nota: Se o plano é utilizar o banco várias vezes, as duas primeiras etapas só precisam ser realizadas na primeira vez, para produzir o banco binário. Nas corridas subsequentes, estas duas etapas podem ser omitidas._

6. Cria um novo objeto ‘alignment’, chamando-o ‘aln’, lê a sequência _query_ TvLDH do arquivo “TvLDH.ali”, e o converte para um perfil (chamaremos _profile_) ‘prf’. Os Profiles contêm informações similares ao alinhamento, mas são mais compactos e melhores para busca em banco de dados de sequências.

7. Procura dentro do banco ’sdb’ o profile quero criado. Daí os _matches_ do banco são adicionados ao perfil.
h. Escreve um profile da sequência _query_ e seus homólogos/similares em dois formatos: ali (pir) e ‘prf’.

```py
from modeller import *

log.verbose()
env = environ()

#-- Prepare the input files

#-- Read in the sequence database
sdb = sequence_db(env)
sdb.read(seq_database_file='pdb_95.pir', seq_database_format='PIR',
         chains_list='ALL', minmax_db_seq_len=(30, 4000), clean_sequences=True)

#-- Write the sequence database in binary form
sdb.write(seq_database_file='pdb_95.bin', seq_database_format='BINARY',
          chains_list='ALL')

#-- Now, read in the binary database
sdb.read(seq_database_file='pdb_95.bin', seq_database_format='BINARY',
         chains_list='ALL')

#-- Read in the target sequence/alignment
aln = alignment(env)
aln.append(file='TvLDH.ali', alignment_format='PIR', align_codes='ALL')

#-- Convert the input sequence/alignment into
#   profile format
prf = aln.to_profile()

#-- Scan sequence database to pick up homologous sequences
prf.build(sdb, matrix_offset=-450, rr_file='${LIB}/blosum62.sim.mat',
          gap_penalties_1d=(-500, -50), n_prof_iterations=1,
          check_profile=False, max_aln_evalue=0.01)

#-- Write out the profile in text format
prf.write(file='build_profile.prf', profile_format='TEXT')

#-- Convert the profile back to alignment format
aln = prf.to_alignment()

#-- Write out the alignment file
aln.write(file='build_profile.ali', alignment_format='PIR')
```

Usando a linha de comando, execute:

```shell
$ mod9.20 build_profile.py 
```

> **Nota:** *Se outra versão do Modeller for utilizada, apenas trocar o número.* 

O comando **profile.build(  )** (`prf.build()`) tem muitas opções. Neste exemplo `rr_file` está ajustado para usa a matriz BLOSUM62. Os parâmetros `matrix_offset` e `gap_penalties_1d` estão ajustados para valores apropriados para a esta matriz. Ainda, neste exemplo, apenas uma iteração será realizada, ajustando o parâmetro `n_prof_iterations` em 1. Portanto, não há necessidade de checar o desvio de profile (`check_profile` ajustado para FALSE). Finalmente, o parâmetro `max_aln_evalue` está ajustado para 0.01, que é relativo ao _E-value_ de corte para inclusão no profile. Note que, este valor deve ser ajustado de acordo com o caso da modelagem.

### Selecionando os Moldes (_templates_)

Procure por erros e avisos no arquivo de log `build-profile.log`. Caso não exista, abra em um editor de texto o arquivo de profile `build_profile.prf`. Verifique os resultados. As 6 primeiras linhas comentadas indicam os parâmetros de _input_ utilizados. O restante são as similaridades. As colunas mais importantes são:

- A 2a (código do PDB do banco comparada).

- A 11a (percentagem de identidade entre a TvLDH e a sequência do pdb, normalizados pelo comprimento do alinhamento).

- 12a (_E-value_ do alinhamento).

Deste arquivo, escolhemos 6 sequências, cujo alinhamento retornou _E-value_ igual a 0.0:

- **1bdm:A, 5mdh:A, 1b8p:A, 1civ:A, 7mdh:A, and 1smk:A**

> *Todos podem ser utilizados, mas dentre eles há algum mais adequado para ser utilizado na modelagem?*

Para selecionar o molde mais apropriado dentre as 6 estruturas acima, nós utilizaremos o comando `alignment.compare_structures()` para avaliar a similaridade estrutural e de sequência entre os moldes, utilizando o script *compare.py*. Abra o arquivo em um editor de texto.

Nesta etapa, você já deverá ter todos os 6 arquivos PDBs escolhidos na etapa acima. O objeto ‘aln’ é criado e o Python é utilizado para instruir o MODELLER a ler cada um dos PDBs. O argumento `model_segment` é utilizado para retirar apenas cadeias únicas de cada PDB. Depois o `append_model` é utilizado para adicionar a estrutura ao alinhamento.

Agora, todas as estruturas estão no alinhamento, mas elas não estão alinhadas idealmente uma as outras. Então, o programa **malign** será utilizado para calcular um alinhamento 3D. O comando **malign3d** realiza uma superposição iterativa (*least-squares*) das estruturas 3D, usando o alinhamento múltiplo como ponto de partida. O comando `compare_structures` compara as estruturas de acordo com o alinhamento construído pelo malign3D, calculando os desvios RMS e o DRMS entre as posições atômicas e distâncias, diferenças entre os ângulos  da cadeia principal e das cadeias laterais, percentagem de identidade das sequências, etc. Finalmente, o comando `id_table` escreve um arquivo com distâncias par-a-par das sequências que podem ser utilizadas diretamente como input para o comando `dendrogram`, que calcula uma árvore de clusterização.

Para isso, rode:

```shell
$ mod9.20 compare.py
```

Agora abra o arquivo **compare.log** em um editor de texto e o verifique com atenção.

**A escolha neste caso:**

- A comparação demonstra que 1civ:A e 7mdh:A são muito similares, tanto em sequência, como em estrutura. No entanto, 7mdh:A tem uma resolução cristalográfica melhor (2.4 verso 2.8 Å), o que elimina 1civ:A. Um segundo grupo de estruturas (5mdh, 1bdm e 1b8p) compartilham algumas similaridades. A partir deste grupo, 5mdh tem a pior resolução e portanto é excluído, deixando apenas 1bdm e 1b8p). 1smk é a estrutura mais diversa deste grupo de possíveis moldes. No entanto, é o único com a menor identidade de sequência a query (34%). Finalmente, 1bdm é escolhida em relação a 1b8p e 7mdh porque possui um Fator-R cristalográfico melhor (16.9%) e maior similaridade a query (45%).

> *A estrutura da TvLDH foi discutida em uma publicação de 2016 ([Steindel et al. 2016](https://www.ncbi.nlm.nih.gov/pubmed/?term=26889885)) e está sob o código [4UUM](https://www.rcsb.org/structure/4UUM). Continuaremos com o tutorial como se ela não tivesse sido resolvida (utilizando bancos anteriores do pdb) e no final iremos comparar os modelos obtidos com a estrutura dela.*


### Alinhando TvLDH com o molde

Como temos apenas um molde, usaremos o comando `align2d()` no MODELLER. Apesar dele usar um algoritmo de programação dinâmica, ele é diferente de outros métodos-padrão de alinhamento porque leva em conta a informação estrutural no molde quando construindo um alinhamento. Esta tarefa é alcançada por meio de função de _GAP Penalty_ variável que tende a colocar _gaps_ em regiões curvas ou expostas ao solvente, fora de segmentos de estrutura secundária, e entre duas posições que estão perto em espaço. Como resultado, os erros de alinhamento são reduzidos 1/3. Esta melhora no alinhamento se torna ainda mais imprescindível quando a similaridade entre as sequências decresce e o número de _gaps_ aumenta. Neste exemplo a similaridade é alta e qualquer método de alinhamento com parâmetros razoáveis resultaria no mesmo alinhamento ou em um muito próximo. Verifique o script **align2d.py**, que realiza este alinhamento.

```py
from modeller import *

env = environ()
aln = alignment(env)
mdl = model(env, file='1bdm', model_segment=('FIRST:A','LAST:A'))
aln.append_model(mdl, align_codes='1bdmA', atom_files='1bdm.pdb')
aln.append(file='TvLDH.ali', align_codes='TvLDH')
aln.align2d()
aln.write(file='TvLDH-1bdmA.ali', alignment_format='PIR')
aln.write(file='TvLDH-1bdmA.pap', alignment_format='PAP')
```

Neste, um objeto `environ` é criado como *input* para os comandos posteriores. Cria-se um alinhamento vazio ‘aln’ e então um novo modelo proteico ‘mdl’, no qual é lido a cadeia A do arquivo PDB **1bdm**. O comando `append_model()` transfere a sequência PDB deste modelo para o alinhamento e atribui o nome “1bdmA” (align_codes). Daí a sequência TvLDH também é inserida. O comando `align2d()` é então executado para alinhar as duas sequências. O alinhamento é escrito em 2 formatos, PIR (TvLDH-1bdmA.ali) e PAP (TvLDH-1bdmA.pap). O formato PIR será usado pelo MODELLLER, e o PAP é para facilitar a inspeção visual pelo usuário.

Executar:

```shell
$ mod9.20 align2d.py
```

### Construção do Modelo

Uma vez o alinhamento alvo-molde é construído, o MODELLER calcula um modelo #D do alvo de forma completamente automática, utilizando a classe `automodel`. O script abaixo irá gerar 5 modelos similares a TvLDH baseado no molde **1bdm:A** e no seu alinhamento.
Script **model-single.py**:

```py
from modeller import *
from modeller.automodel import *
from modeller import soap_protein_od

env = environ()
a = automodel(env, alnfile='TvLDH-1bdmA.ali',
              knowns='1bdmA', sequence='TvLDH',
              assess_methods=(assess.DOPE,
                              soap_protein_od.Scorer(),
                              assess.GA341))
a.starting_model = 1
a.ending_model = 5
a.make()
```

A primeira linha carrega a classe `automodel` e a prepara para uso. Um objeto `automodel ‘a’` é criado, e parâmetros para guiar o processo de construção do modelo são ajustados. `alnfile` indica o arquivo do alinhamento alvo-molde no formato PIR. `knowns` define a estrutura do molde conhecida no arquivo **alnfile** (TvLDH-1bdma.ali). `sequence` define o nome da sequência alvo no **alnfile**. `assess_methods` requer um ou mais escores de avaliação. `starting_model` e `ending_model` definem o número de modelos que serão calculados. A última linha `make` é a que calcula os modelos.

Executar:

```shell
$ mod9.20 model-single.py
```

O arquivo de saída mais importante é o **model-single.log**, o qual reporta aviso, erros, e outras informações importantes, incluindo as restrições de entrada para a modelagem que permaneceram violadas no modelo final. As últimas linhas dão um sumário de todos os modelos construídos e alguns escores de avaliação básicos.

Arquivo *model-single.log*

```
>> Summary of successfully produced models:
Filename                          molpdf     DOPE score    GA341 score
----------------------------------------------------------------------
TvLDH.B99990001.pdb           1763.56104   -38079.76172        1.00000
TvLDH.B99990002.pdb           1560.93396   -38515.98047        1.00000
TvLDH.B99990003.pdb           1712.44104   -37984.30859        1.00000
TvLDH.B99990004.pdb           1720.70801   -37869.91406        1.00000
TvLDH.B99990005.pdb           1840.91772   -38052.00781        1.00000
```

### Avaliação Inicial dos Modelos

Se mais de um modelo foi gerado para o mesmo alvo, o _melhor_ modelo pode ser selecionado de várias maneiras. A etapa de avaliação de um modelo é uma das mais importantes e será expandida posteriormente utilizando vários outros escores.

Utilizando apenas os dados desta modelagem, você pode escolher o modelo com menor valor da função objetiva do MODELLER (molpdf), ou dos escores de avaliação DOPE ou SOAP, ou o modelo com o escore GA341 mais alto. Os escores adicionais só serão calculados se as linhas relativas a eles no script *model-single.py* forem desmarcadas (*uncommented*). O escore SOAP precisa de arquivos adicionais. Todos eles não são medidas absolutas.

Antes de avaliar os modelos em outras ferramentas, o script *evaluate_model.py* pode ser utilizado para verificar o DOPE ao longo de toda cadeia, comparando-o com o molde. No exemplo abaixo, utilizamos o Modelo 1.
Script *evaluate_model.py*

```py
from modeller import *
from modeller.scripts import complete_pdb

log.verbose()    # request verbose output
env = environ()
env.libs.topology.read(file='$(LIB)/top_heav.lib') # read topology
env.libs.parameters.read(file='$(LIB)/par.lib') # read parameters

# read model file
mdl = complete_pdb(env, 'TvLDH.B99990001.pdb')

# Assess with DOPE:
s = selection(mdl)   # all atom selection
s.assess_dope(output='ENERGY_PROFILE NO_REPORT', file='TvLDH.profile',
              normalize_profile=True, smoothing_window=15) 
```

Neste script utilizamos o script **complete_pdb** para ler o arquivo PDB e prepará-lo para os cálculos de energia. O DOPE é então calculado com o comando **assess_dope**, e adicionalmente um perfil energético é calculado dentro de uma janela de 15 resíduos e normalizados pelo número de restrições agindo em cada resíduo. O perfil (no arquivo TvLDH.profile) é utilizado como input para um programa de gráfico. Não esqueça de editar o script para dar como entrada o modelo de melhor pontuação (Verificado no arquivo *model_single.log*).

Rode agora o script *evaluate_model.py*:

```shell
$ mod9.20 evaluate_model.py
```

Agora rode o script *evaluate_template.py*, para ter o *profile* da estrutura 1bdm, para comparar os DOPEs escores entre o modelo e o molde.

```shell
$ mod9.20 evaluate_template.py
```

Agora podemos utilizar o script *plot_profiles.py* (com o matplolib do Python) ou o programa GNUPLOT para obter o gráfico:

```shell
$ python plot_profiles.py
```

ou

```shell
$ gnuplot
> plot "TvLDH.profile" using 1:42 with lines
```

- Quais região(-ões) você escolheria para melhorar a modelagem?


## Visualização e comparação

Visualize os modelos e o molde no Chimera, utilizando a ferramenta (são menus):
 
- ***Tools > Structure comparison > MatchMaker***.

Baixe o arquivo da estrutura resolvida da TvLDH, PDB [4UUM](https://www.rcsb.org/structure/4UUM) e compare as 3 estruturas utilizando o comando acima.
 
Na ferramenta:

- ***Tools > Sequence > Sequence*** veja a sequência primária do molde. 
* No item de menu ***Info*** obtenha as anotações do molde do banco UNIPROT.

> *Os sítios importantes para catálise estão conservados no seu modelo?*
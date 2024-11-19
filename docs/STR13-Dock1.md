# *Docking* Proteína-Ligante - Básico

*Utilizando o Chimera como uma interface para atracamento utilizando o Autodock Vina (1).*

**Observações:** Adaptado e traduzido a partir do tutorial "*VINA with UCSF Chimera*" construído por José R. Valverde, disponível [AQUI](http://www.free-bit.org/course/2014-SriLanka/pdf/034-chimera_vina.pdf), apenas para fins didáticos nas disciplinas de bioinformática na graduação e pós-graduação do IMD/UFRN.

## Primeira Parte: preparando o receptor.

- Abrir o programa UCSF Chimera. Clique em Fetch e em pdb, coloque o código 1GVN. A estrutura é imediatamente visualizada após o download.
- A etapa de preparação é crucial para o processo de atracamento. Primeiro faremos a preparação da proteína receptora. Para isso vá no menu e siga os passos abaixo:
	- *Tools > Surface/Binding Analysis > Dock Prep.*
- Vamos remover o solvente e ajeitar os resíduos não-padrões, utilizados para o processo de cristalização. Adicionalmente os átomos de hidrogênio e as cargas serão adicionadas. Para isso marque as opções:
	- *Delete Solvent.*
	- *Change: Marque todas as caixas.*
	- *Add Hydrogens.*
	- *Add Charges.*
	- *Write Mol2 file.*
- Uma caixa de diálogo abre logo depois para a adição de hidrogênios. Nesta caixa, deixe as opções padrões:
	- *Method: also consider H—bonds.*
	- *Protonation states for: Residue-name-based para todos os resíduos.*

> *Você pode especificar o estado de protonação para resíduos específicos se necessário.*

- Após a adição dos H, uma outra caixa, chamada *Assign charges for Dock Prep* aparecerá. Nesta atribuiremos as cargas da proteína utilizando um campo de força AMBER. Este campo de força, no entanto, não contém carga para a maioria dos átomos não-proteicos. Para estes, temos 2 opções:
	- AM1-BCC - *Baseado em mecânica quântica, semi-empírico. Preciso. Lento.*
	- Gasteiger - *Regras empíricas. Rápido.*
- Agora vamos especificar as cargas líquidas. Após a adição dos H, uma caixa de diálogo aparece, contendo *Specify Net Charges*. 
- Para moléculas não-proteicas no modelo (se incluídas):
	- Especifique a carga líquida esperada para todas as moléculas ou especifique como computar as as cargas para cada átomo nas moléculas.
	- Geralmente, para resíduos proteicos e moléculas não-proteicas, o chimera irá checar que a soma das cargas atômicas levará a um número inteiro que coincide com a carga esperada.
- Salve o receptor *“preparado"* como um arquivo .mol2: ```1gvn.mol2```.


## Segunda Parte: preparando o Ligante.

O ligante que iremos trabalhar é a molécula de uridina-difosfato-N-acetilglucosamina (UNAG ou ND1). A estrutura deste ligante pode ser obtida nos seguintes bancos de dados:

- [PDB](https://www3.rcsb.org/ligand/UD1)
- [ZINC](http://zinc.docking.org/substance/53683876)
- [PubChem](https://pubchem.ncbi.nlm.nih.gov/compound/445675#section=Top)

O arquivo do ligante pode ser obtido a partir do arquivo .mol2 do banco de dados do ZINC, ou pode ser construído no próprio UCSF Chimera, usando o SMILES (*simplified-molecular input-entry system*), seguindo os passos abaixo:

- *Tools > Structure Editing > Build Structure.*
- No diálogo, clicar em ```SMILES string```. Colar o código e dar um nome a molécula (UNAG).
- Clicar em ```Apply```.

> *O arquivo .mol2 pode também ser aberto diretamente no UCSF Chimera.*

## Terceira Parte: preparando e executando o Dock

- Ir no menu: 
	- *Tools > Surface/Binding Analysis > AutoDock Vina* 

Agora vamos selecionar as moléculas e atribuir o que é cada uma. Primeiro vamos dar um nome base para todos os arquivos gerados do dock. (Ex. 1gvn+unag).

- Especificar o receptor e o ligante:
	- Receptor: **1GVN**.
	- Ligante: **UNAG**.

Depois de especificados receptor e ligante, iremos agora selecionar uma área para exploração. A fronteira será delimitada na forma de um paralelepípedo para a procura. Marcar e preencher da seguinte forma:

- Clique em ```Enclose the active site using the mouse``` e preencha os valores abaixo:
	- *Center:* —15 / 35 / 60 
	- *Size:* 25 / 25 / 25

Observe agora as (clicando em expandir) as opções do Receptor e do Ligante. Expanda as opções avançadas (*Advanced options*):

- Selecione o número de modos de ligação para serem gerados: 9.
- Selecione a intensidade da busca: valores mais baixos irão ser processados mais rapidamente, mas serão menos exatos.
- Selecione o limiar de corte para ser reportado. Posicionamentos com escores fora desta faixa de kcal/mol em relação ao melhor serão descartados.

Agora expanda o menu ```Executable location```. Você usar a opção ```Opal web service```, onde o *dock* será executado remotamente. Você pode também baixar os executáveis do AutoDock Vina a partir do site do programa: [http://vina.scripps.edu](http://vina.scripps.edu). 

> *Use o que melhor convir. A instalação local do recomenda-se a instalação do Autodock Vina é sempre recomendada, principalmente se estiveres usando uma máquina com sistema baseado em UNIX.*

Assegure-se de tudo está correto, com o seguinte *cheklist*:

- Receptor é **1GVN**, Ligante é **UNAG**. 
- A caixa verde engloba completamente o sítio ativo.
- As opções do receptor e do ligante estão corretas.
- A exatidão, limiar e posicionamento estão da maneira que você quer.
- O executável correto do Autodock Vina foi escolhido.

Depois de conferido, clique em ```OK``` e espere o processo terminar.

## Quarta Parte: inspecionando os resultados

Após o término do processo, o Chimera irá abrir a interface ```View Dock```. Nesta teremos um resultado tabular dos posicionamentos selecionados. A partir dela, você poderá:

- Modificar a ordem de classificação.
- Computar as propriedades e adicioná-las a tabela.
- Organizar os posicionamentos em:
	- Viáveis.
	- Apagados.
	- Excluídos.

Agora iremos verificar as ligações de H entre o ligante e o receptor, que é uma etapa importante de avaliação do processo de docking. 

- Clique em: *HBonds > Add counter to entire receptor.*
- Apenas queremos as ligações de H entre o ligante e o receptor, portanto clique na opção ```Inter-model```.
- Queremos distinguir as ligações de H inexatas: ```Color H­bonds not meeting precise criteria differently```.
- Não queremos ligações intramoleculares ou intra-resíduos.
- Nós queremos ver todas: ```If endpoint atom hidden, show endpoint residue```. 

Agora inspecione as ligações de H. Elas contribuem de forma significativa para a estabilidade da ligação. Você pode classificar os confôrmeros de acordo com as ligações de H formadas.

Compare com uma estrutura de referência: [1gvn+unag.pdb](https://drive.google.com/uc?export=download&id=1F6Tcn0yeC1sHZshbSq6_uxB5DQqvITPU) (também inserida no SIGAA).
# Busca e integração em Bancos de Dados - Exemplo 1

Prof. Gustavo de Souza (DBq/BioME/UFRN)

- O tutorial abaixo é ***apenas para fins didáticos***. <span style="color:red">**A reprodução dele para qualquer outro fim não é permitida e nem consentida.**</span>

## Identificação e caracterização *in silico* de uma enzima

Partiremos agora de um exemplo para caracterização de uma enzima a partir da sequência de aminoácidos, a partir do *E.C. number* (*Enzyme Comission*) e do próprio nome da enzima.

### Primeira Parte: Obtendo informações Gerais
A sequência abaixo corresponde a sequência primária de uma enzima do metabolismo.

```
>Enzyme_Test_1
MVKIVTVKTQAYQDQKPGTSGLRKRVKVFQSSANYAENFIQSIISTVEPAQRQEATLVVGGDGRFYMKEAIQLIARIAA
ANGIGRLVIGQNGILSTPAVSCIIRKIKAIGGIILTASHNPGGPNGDFGIKFNISNGGPAPEAITDKIFQISKTIEEYA
VCPDLKVDLGVLGKQQFDLENKFKPFTVEIVDSVEAYATMLRSIFDFSALKELLSGPNRLKIRIDAMHGVVGPYVKKIL
CEELGAPANSAVNCVPLEDFGGHHPDPNLTYAADLVETMKSGEHDFGAAFDGDGDRNMILGKHGFFVNPSDSVAVIAAN
IFSIPYFQQTGVRGFARSMPTSGALDRVASATKIALYETPTGWKFFGNLMDASKLSLCGEESFGTGSDHIREKDGLWAV
LAWLSILATRKQSVEDILKDHWQKYGRNFFTRYDYEEVEAEGANKMMKDLEALMFDRSFVGKQFSANDKVYTVEKADNF
EYSDPVDGSISRNQGLRLIFTDGSRIVFRLSGTGSAGATIRLYIDSYEKDVAKINQDPQVMLAPLISIALKVSQLQERT
GRTAPTVIT
```
A partir de uma busca por similaridade em bancos de dados biológicos (BLAST contra o NCBI e/ou contra o Uniprot), identifique e caracterize esta enzima de acordo com os seguintes itens:
- O nome da enzima.
- O organismo do qual ela faz parte.
- O seu número E.C. (Consulte o banco de dados BRENDA - [https://www.brenda-enzymes.org/](https://www.brenda-enzymes.org/)).
- Reação enzimática.
- Identifique o substrato da enzima.
- Produto formado.
- Via metabólica.
- Substratos alternativos.
- Inibidores.

>*É importante prestar bem atenção nas páginas e nos links que os bancos de dados fornecem. Essas páginas mudam com uma certa periodicidade, mas as informações gerais tendem a se manter integradas.*

### Segunda Parte: Informações genéticas
Alguns polimorfismos (SNPs) em genes estão associados à condições patológicas, como Erros Inatos do Metabolismo ou doenças que podem ser desenvolvidas ao longo da vida. Para isso, é vasta a quantidade de dados relativos a seres humanos, e a sua integração é extremamente necessária. O objetivo agora é verificar se mutações/modificações na enzima do exercício anterior estão relacionadas à situações patológicas.

Para isso, vá para a entrada do Genbank do gene que codifica para a enzima acima e procure as informações abaixo:
- Quais os SNPs já relatados para esta proteína em humanos?
  - Procure no menu que contém ***Related Information***.
- Existe alguma STS (sequence-tagged site) para amplificação específica deste gene por PCR? Veja os iniciadores que podem utilizados para isso.
- Existem condições associadas?
- Verificar a opção OMIM (*Online Mendelian Inheritance in Man®*) no menu Related Information.
- Verifique a sua direita a subdivisão dos resultados em dbSNPs e os UniSTS.

Condições ou doenças também podem ser procuradas diretamente no [OMIM](https://www.omim.org/). Para isso, abra a página do OMIM e faça uma busca, usando o nome da proteína acima. Verifique as informações para esta enzima.

### Terceira Parte: Estrutura e predição do efeito de modificações

A partir do número de acesso Uniprot (ou do *entry name*) da proteína iremos obter informações sobre a modelagem computacional automática dessa proteína e sobre a predição funcional de modificações de sua sequência a partir do [AlphaMissense](https://deepmind.google/discover/blog/a-catalogue-of-genetic-mutations-to-help-pinpoint-the-cause-of-diseases/). O número de acesso Uniprot pode ser obtido nas buscas realizadas na 1a e na 2a parte deste tutorial.

- Abra a página do [AlphaFoldDB](https://alphafold.ebi.ac.uk/).
- No campo de busca, coloque o número de acesso Uniprot ou o seu *entry name* e clique em `SEARCH`.
- Clique no resultado obtido.
  
No registro do AlphaFoldDB, você verá a estrutura tridimensional modelada e logo abaixo você verá um gráfico com a predição de impacto funcional realizada pelo AlphaMissense. Cada modificação prevista (troca de um aminoácido por qualquer um dos outros 19) em cada sítio da sequência primária pode ser observada no gráfico, que descreve o resultado em três categorias: Benginas (Azuis), Provavelmente Patogênicas (Vermelhas) e Efeito incerto (Gradiente entre azul e vermelho). Esta escala reflete o AlphaMissense escore (*am_score*), que varia entre 0 (mais benigna) até 1 (mais patogênica).

**Pergunta:**
Quais regiões da proteína são menos sensíveis a modificações?

>*Lembre-se que a predição de efeito funcional do AlphaMissense apesar de muito precisa, é apenas uma predição. O efeito funcional depende também de outros fatores.*


# Projeto Varejo - Consuelo

Recebemos dados com alguns problemas de estrutura. Recomendo que leia esse README em conjunto com o código feito pelo [Google Colab](https://colab.research.google.com/drive/13efcBLyRUKfaPaEG5CyPOlCrW2iXfT_r?usp=drive_link), para visualizar uma explicação passo a passo dos processos citados abaixo.


## 📚 *Bibliotecas utilizdas*
- ***Pandas*** (para manipulação de dataframes)


## ➡️ *lojas.csv*
### ‎ ↳ Erros encontrados:
- Encontramos incompatibilidades entre as colunas **cidades**, **países** e **região**

![erro lojas](imagens/erro_lojas.png)


### ✔ Tratando o erro:
- Primeiro criamos um dicionário python, onde as cidades são as chaves e os países os valores dos mesmos.
- Após isso criamos um laço de repetição onde o código irá identificar a cidade na tabela e irá adicionar, automaticamento, o país correspondente.
- Por fim, desconsideramos a coluna de região, visto que a mesma só estavam especificadas para as lojas instaladas no Brasil.

## ➡️ *vendas_online.json*
### ‎ ↳ Erros encontrados:
- Encontramos colunas duplicadas, com mesmas informações e propósito. Entretanto as células não seguiam a mesma lógica, gerando colunas vazias.

![erro vendas](imagens/erro_vendas.png)

### ✔ Tratando o erro:
- Descobrimos através de um laço de repetição, a exata linha onde essa tabela começa a se dividir.
- Preenchemos as células vazias da segunda metade da tabela com "duplicatas" das primeiras células.
- Terminado esse processo, excluímos as colunas que não farão falta em nossa tabela final.



## ➡️ *campanhas_marketing.csv* e *promocoes.csv*
### ‎ ↳ Erros encontrados:
- As datas estavam com horas, minutos e segundos idênticos em todas as células, então decidimos deixar as colunas de vendas mostrando apenas dia, mês e ano.

![erro campanhas](imagens/erro_campanhas.png)
![erro promocoes](imagens/erro_promocoes.png)

### ✔ Tratando o erro:
- Transformamos o tipo das colunas de *string* para *datetime*.
- A partir disso, apenas especificamos para o pandas mostrar as informações no formato ano/mês/dia.

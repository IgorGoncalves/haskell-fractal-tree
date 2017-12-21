# haskell-fractal-tree
Desenho de arvore fractal utilizando haskell, cabal e glossLib

# Configurações iniciais

A configuraço inicial usada pra instalaço no linux que utilizei foi baseada no  tutorial de Andrew Gibiansky, com algumas alterações e versão
- 1º Baixe ou clone o projeto para sua maquina local
- 2º Se você usa o [haskell plataform](https://www.haskell.org/platform/) provavelmente tem o cabal instalado em sua máquina, use o comando ```cabal -v```, instale caso não esteja incluido no seu sistema
- 3º Instale as dependencias do projeto executando ```cabal install```, pode ser necessário instalar o gloss globalmente, pelo comando ```cabal install gloss```, nesse etapa é possível que existam erros na instalaço por falta de depenencias, procure instalar as GLULib no seu sistema, elas estão relacionadas ao OpenGL, no meu caso o Fedora usa o pacore mesa-libGLU-devel
- 4º execute ```cabal clean``` e ```cabal run``` para executar o código

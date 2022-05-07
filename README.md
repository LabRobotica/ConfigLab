# Configuração Laboratório

Manual e scripts de configuração dos computadores do Laboratório de Robótica do Departamento de Engenharia Mecatrônica do CEFET-MG, bem como o mapa de rede e outras informações importantes.

## Computadores Desktop

### Sistema Operacional

Atualmente foi decidido padronizar todos os computadores com o sistema operacional Lubuntu 22.04, onde pode ser baixado pelo [link](https://lubuntu.me/downloads). Após baixa-lo, use o programa [Balena Etcher](https://github.com/balena-io/etcher/releases) para fazer o pendrive bootável. Coloque o pendrive e execute no modo live (try lubuntu).

#### Pré-particionamento

Instale o programa ```gparted``` e verifique o esquema de partições, caso seja necessário configure as partições conforme abaixo.

AVISO: Cuidado! A partição Home contem os dados dos usuários, verifique se todos fizeram backup caso seja necessario refazer a tabela de partições, ou de alguma forma alterar a partição Home. Caso esteja autorizado, pode formatar a partição home, apesar que não é necessário em todos os casos e preserva dados e configurações dos usuários.

Esquema de partições para instação para Dell Optiplex 760, com tabela de partições do tipo MBR:

|  Indicador | Apelido | Tamanho  | Tipo       | Flags |
|------------|---------|----------|------------|-------|
|  sda1      | Linux   | 50 GB    | ext4       | boot  |
|  sda2      | Home    | restante | ext4       |       |
|  sda3      | Swap    | 8 GB     | linux-swap |       |

Esquema de partições para instação para Dell Optiplex 7010, com tabela de partições do tipo GPT:

|  Indicador | Nome       | Apelido    | Tamanho  | Tipo       | Flags     |
|------------|------------|------------|----------|------------|-----------|
|  sda1      | ESP        | EFI        | 500 MB   | fat32      | boot, esp |
|  sda2      | Lubuntu    | Lubuntu    | 50 GB    | ext4       |           |
|  sda3      | Arch Linux | Arch Linux | 50 GB    | ext4       |           |
|  sda4      | Home       | Home       | restante | ext4       |           |
|  sda5      | Swap       | Swap       | 8 GB     | linux-swap |           |

DICA: No momento de definir o tamanho da partição Home, coloque o tamanho da partição Swap (8192 MB) na opção "free space following" (espaço livre restante).

OBS: Arch Linux também pode ser chamado de Debian/Fedora/Outros, conforme a necessidade, mas ambos não serão instalados neste script.

#### Instação

Inicie o instalador, siga o passo a passo, na parte de particionamento selecione a opção manual configure conforme abaixo.


- Não faça alterações, apenas configure os pontos de montagem conforme abaixo (Dell Optiplex 760):

|  Indicador | Ponto de montagem | Formatar |
|------------|-------------------|----------|
|  sda1      | /                 | Sim      |
|  sda2      | /home             | Não*      |
|  sda3      | swap              |          |

*Só formate a partição home em caso de necessidade.



- Não faça alterações, apenas configure os pontos de montagem conforme abaixo (Dell Optiplex 7010):

|  Indicador | Ponto de montagem | Formatar |
|------------|-------------------|----------|
|  sda1      | /boot/efi         | *        |
|  sda2      | /                 | Sim      |
|  sda4      | /home             | Não**    |
|  sda5      | swap              |          |

*Depende do caso.

** Só formate a partição home em caso de necessidade.

#### Página de configurações do usuário

Na página seguinte a configuração das partições:

- Nome completo do usuário: ```Aluno``` com 'A' maiúsculo.
- Nome do usuário: ```aluno``` com 'a' minúsculo.
- Senha: 123
- Login automárico sem pedir senha: Sim
- Nome do computador (hostname): ```labroboticaN``` onde N é o numero do computador em ordem crescente.

Quando a instalação finalizar, reinicie o computador.

### Configurando Usuários

Execute o comando

```bash
curl https://raw.githubusercontent.com/LabRobotica/RobixLinux/main/robix-debian.sh | sudo bash
```

para

- Criar uma senha para ```root```
- Criar um usuário para o Coordenador de Laboratório ```renato``` e o adiciona ao grupo sudo
- Criar um usuário para o SubCoordenador de Laboratório ```adriano``` e o adiciona ao grupo sudo
- Remover o usuário ```aluno``` do grupo sudo

e

```bash
sudo adduser NOME-DO-USUÁRIO
```

para adicionar outros usuários e

```bash
sudo adduser NOME-DO-USUÁRIO sudo
```

caso esse usuário esteja autorizado pelo Coordenador do Laboratório a ter privilégios administratívos.


### Instação de programas

Vá ao repositório [Linux Robótico](https://github.com/LabRobotica/Linux-Robotico) e siga as instruções.


## Computador servidor

Vá ao repositório [Servidor Robótico](https://github.com/LabRobotica/Servidor-Robotico) e siga as instruções.


## Computador industrial

Vá ao repositório [Config LPC](https://github.com/LabRobotica/Config-LPC) e siga as instruções.

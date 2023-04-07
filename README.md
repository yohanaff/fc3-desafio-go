# Desafio Docker Go do Full Cycle 3.0

Link da imagem: https://hub.docker.com/repository/docker/yohanaf/fullcycle/general

Passo a passso:

1. Criação do programa `main.go`.
2. Compilação do programa Go com a opção de compilação estática e arquitetura alpine. 

    `CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags="-w -s" -o fullcycle-rocks main.go`

    Explicação:

    `CGO_ENABLED=0`: Desabilita a ligação CGo, garantindo que a compilação do binário seja estática.

    `GOOS=linux`: Sistema operacional destino para o qual o código está sendo compilado.

    `GOARCH=amd64`: Arquitetura de destino para o qual o código está sendo compilado.

    `go build`: Compila pacotes, dependências e gera o executável

    `-ldflags="-w -s"`: Passa flags para o linker, `-w` desabilita a geração de informações de depuração e `-s`desabilita a geração da tabela de símbolos, fazendo com que o binário final tenha um tamanho menor.

    `-o fullcycle-rocks`: Nome do arquivo binário gerado pela compilação.

    `main.go`: Arquivo que será compilado.

3. Criação do `Dockerfile` no mesmo diretório.
4. Compilação da imagem Docker.

    `docker build -t fullcycle-rocks-image .`
5. Verificação do tamanho da imagme gerada (precisa ter menos de 2MB).

    `docker images | grep fullcycle-rocks-image`

6. Verificação do print "FullCycle Rocks!". 

    `docker run --rm fullcycle-rocks-image`
7. Login no Docker Hub.

    `docker login`

8. Alteração do nome da imagem para ser o mesmo do repositório no Docker Hub.

    `docker tag fullcycle-rocks-image usuario/fullcycle`
9. Push da imagem no Docker Hub.

    `docker push usuario/fullcycle`
10. Execução da imagem a partir do Docker Hub.

    `docker run --rm usuario/fullcycle`

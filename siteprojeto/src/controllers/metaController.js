var metaModel = require("../models/metaModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA metaController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
    metaModel.listar()
        .then(function (resultado) {
            if (resultado.length > 0) {
                res.status(200).json(resultado);
            } else {
                res.status(204).send("Nenhum resultado encontrado!")
            }
        }).catch(
            function (erro) {
                console.log(erro);
                console.log("Houve um erro ao realizar a consulta! Erro: ", erro.sqlMessage);
                res.status(500).json(erro.sqlMessage);
            }
        );
}

function cadastrar(req, res) {
    // Crie uma variável que vá recuperar os valores do arquivo meta.html
    var tipo = req.body.tipo;
    var fkMetaUsuario = req.body.fkMetaUsuario;

    // Faça as validações dos valores
     if (tipo == undefined) {
        res.status(400).send("Seu tipo está undefined!");
    } else if (fkMetaUsuario == undefined) {
        res.status(400).send("Sua fkMetaUsuario está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo metaModel.js
        metaModel.cadastrar(tipo, fkMetaUsuario)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o meta! Erro: ",
                        erro.sqlMessage
                    );
                    res.status(500).json(erro.sqlMessage);
                }
            );
    }
}

module.exports = {
    cadastrar,
    listar,
    testar
}
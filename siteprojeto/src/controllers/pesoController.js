var pesoModel = require("../models/pesoModel");

var sessoes = [];

function testar(req, res) {
    console.log("ENTRAMOS NA usuarioController");
    res.json("ESTAMOS FUNCIONANDO!");
}

function listar(req, res) {
      pesoModel.listar()
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
    // Crie uma variável que vá recuperar os valores do arquivo peso.html
    var kg = req.body.kg;
    var dtPeso = req.body.dtPeso;
    var fkCadastro = req.body.fkCadastro;

    // Faça as validações dos valores
     if (kg == undefined) {
        res.status(400).send("Seu tipo está undefined!");
    } else if (fkCadastro == undefined) {
        res.status(400).send("Sua fkpesoUsuario está undefined!");
    } else {
        
        // Passe os valores como parâmetro e vá para o arquivo pesoModel.js
        pesoModel.cadastrar(kg, dtPeso, fkCadastro)
            .then(
                function (resultado) {
                    res.json(resultado);
                }
            ).catch(
                function (erro) {
                    console.log(erro);
                    console.log(
                        "\nHouve um erro ao realizar o peso! Erro: ",
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
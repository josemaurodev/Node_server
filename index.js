const express = require ("express");

const app = express();

app.use(express.json());

app.use(express.urlencoded({
    extended: true
}));

const jogadorData = [];

app.listen(2000, ()=>{
    console.log("Connected to server at 2000");
})

//post api
app.post("/api/add_jogador", (req, res) => {
    
    console.log("Result", req.body);

    const jdata = {
        "id": jogadorData.length+1,
        "jnome": req.body.jnome,
        "jclube": req.body.jclube,
        "jcategoria": req.body.jcategoria,
        //"jgols": req.body.jgols,
        //"jcartoes": req.body.jcartoes,
        //"jsuspenso": req.body.jsuspenso,
    };

    jogadorData.push(jdata);
    console.log("Final", jdata);

    res.status(200).send({
        "status_code": 200,
        "message": "Jogador adicionado com sucesso",
        "jogador": jdata
    })
})

//get api
app.get("/api/get_jogador", (req, res) => {

    if(jogadorData.length > 0){
        res.status(200).send({
            'status_code': 200,
            'jogadores': jogadorData
        })
    }else{
        res.status(200).send({
            'status_code': 200,
            'jogadores': []
        })
    } 

})

//update api

app.post("/api/update/:id", (req, res) => {
    let id = parseInt(req.params.id); 
    let index = jogadorData.findIndex(j=>j.id === id);

    req.body.id = id;
    jogadorData[index] = req.body;

    
    res.status(200).send({
        'status': "Sucesso",
        'message': "Jogador editado com sucesso"
    })
})

app.post("/api/delete/:id", (req, res) => {
    let id = req.params.id*1; 
    let jogadorToUpdate = jogadorData.find(j=>j.id === id);
    let index = jogadorData.indexOf(jogadorToUpdate);

    jogadorData.splice(index, 1);

    res.status(204).send({

        'status': "sucesso",
        'message': "Jogador excluido"
    });
})
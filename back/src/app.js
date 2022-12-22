//Initialize the dependencies 

const express = require('express');
const cors = require('cors')
const setDatabase = require('./database');


const app = express();
const port = process.env.SERVER_PORT;
const database = setDatabase();


app.use(cors());
app.use(express.json())


app.get('/', (req, res) => {
    res.send("Hello world");
});

app.get('/test', (req, res) => {
    database.select('*').from('matcomp_employe').then(hope => res.send(hope))
})

app.listen(port, () => {
    console.log(`Server listening at the port ${port}`)
})


const express = require('express');
const app = express();
app.use(express.json());
const port = process.env.PORT || 3000;

//require para usar Prisma
const { PrismaClient } = require('@prisma/client');
const prisma = new PrismaClient();

//CORS
const cors = require("cors");
const corsOptions = { origin: "http://10.0.2.15:8081" };

app.use(cors(corsOptions));
//posible solucion a cors problem
app.use((req, res, next) => {
    res.header('Access-Control-Allow-Origin', '*');
    res.header('Access-Control-Allow-Headers', 'Authorization, X-API-KEY, Origin, X-Requested-With, Content-Type, Accept, Access-Control-Allow-Request-Method');
    res.header('Access-Control-Allow-Methods', 'GET, POST, OPTIONS, PUT, DELETE');
    res.header('Allow', 'GET, POST, OPTIONS, PUT, DELETE');
    next();
});
//
app.get('/',(req,res) => {
        res.json({message: 'alive'});
});

app.listen(port, () => {
        console.log(`Listen to requests on port ${port}`);
});
app.get('/sitios/', async(req,res)=> {
        const allSites= await prisma.sitios_prioritarios.findMany({});
        res.json(allSites);
});
app.get('/sitios/:id', async(req, res) => {
        const id = req.params.id;
        const site = await prisma.sitios_prioritarios.findUnique({where: {id: parseInt(id)}});
        res.json(site)
});
//app.post('/students/', async(req, res) => {
  //      const site = {
   //             name: req.body.name,
   //             lang: req.body.lang,
   //             missionCommander: req.body.missionCommander,
   //             enrollments : req.body.enrollments
   //     };
   //     const message = "Student Creado";
   //     await prisma.student.create({data:student});
  //      return res.json({message});
//});
//app.put('/students/:id',async(req,res) => {
//        const id = parseInt(req.params.id);
//        await prisma.student.update({
//                where: { id: id},
//                data: { hasCertification: req.body.hasCertification }
//        })
//        return res.json({message: "Actualizado Correctamente"});
//});
//app.delete('/students/:id',async(req,res) => {
//        const id = parseInt(req.params.id);
//        await prisma.student.delete({where: {id: id}});
//        return res.json({message: "Eliminado Correctamente"});
//});


import express from "express";
import cors from "cors";
import compression from "compression";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import mongoose, { Error } from "mongoose";
import router from "./router";
import "dotenv/config"

const app = express();
const MONGO_URL = process.env.MONGO_URL;
const PORT = process.env.PORT || 8080;
app.use(cors({credentials:true}));
app.use(compression());
app.use(bodyParser.json());
app.use(cookieParser());
app.use('/', router());

app.get('/', (req,res)=>{
    res.send(`Welcome to Animu Cal 🍕`);
});

app.listen(8000,()=>{console.log(`Listening on PORT ${PORT}`);
});
mongoose.connect(MONGO_URL);
mongoose.connection.on('error',(error : Error) =>{
    console.log(error);
})
import express from "express";
import cors from "cors";
import compression from "compression";
import bodyParser from "body-parser";
import router from "./router";
import "dotenv/config"
import connectToMongoDB from "./connect";
import helmet from "helmet";
import STATUS_CODES from "http-status-codes";
import { env } from "./helpers/env";

const app = express();
connectToMongoDB();

app.use(cors({credentials:true}));
app.use(helmet());
app.use(compression());
app.use(bodyParser.json());
app.use('/', router());

app.get('/', (req,res)=>{
    res.status(STATUS_CODES.OK).send(`Welcome to Animu Cal 🍕`);
});

export default app;
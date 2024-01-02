import express from "express";
import cors from "cors";
import compression from "compression";
import bodyParser from "body-parser";
import cookieParser from "cookie-parser";
import router from "./router";
import "dotenv/config"
import connectToMongoDB from "./connect";
import helmet from "helmet";
import STATUS_CODES from "http-status-codes";

const app = express();
connectToMongoDB();
const PORT = process.env.PORT || 8080;
app.use(cors({credentials:true}));
app.use(helmet());
app.use(compression());
app.use(bodyParser.json());
app.use(cookieParser());
app.use('/', router());

app.get('/', (req,res)=>{
    res.status(STATUS_CODES.OK).send(`Welcome to Animu Cal 🍕`);
});

app.listen(8000,()=>{console.log(`Listening on PORT ${PORT}`);
});

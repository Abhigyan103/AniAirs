import mongoose, { Error } from "mongoose";
import "dotenv/config"

const MONGO_URL = process.env.MONGO_URL_LOCAL as string;

export default async function connectToMongoDB() {
    mongoose.connect(MONGO_URL).then((v)=>console.log('Database Connected'));
    mongoose.connection.on('error',(error : Error) =>{
        console.log('Error ho gaya re baba!');
        console.log(error);
    });
}
import express from "express";
import { StatusCodes } from "http-status-codes";
import axios from "axios";
const data = require("./dummydata.json");

const api = 'https://api.jikan.moe/v4';

export const getTopRatedAnime=async (req:express.Request, res:express.Response) =>{
    // const resp =(await axios.get(api+'/top/anime')).data;

    res.json(data);
}

//TODO: other controllers
import express from "express";
import { StatusCodes } from "http-status-codes";
import axios from "axios";

const api = 'https://api.jikan.moe/v4/top';

export const getTopAnime=async (req:express.Request, res:express.Response) =>{
    const data =(await axios.get(api+'/anime')).data;

    res.json(data);
}

//TODO: getTopReviews
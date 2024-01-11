import express from "express";
import { StatusCodes } from "http-status-codes";
import axios from "axios";

const api = 'https://api.jikan.moe/v4/top';


/**
 * Retrieves the top rated anime currently.
 * @async
 * @param {express.Request} req - Express request object
 * @param {express.Request} res - Express response object
 * @throws {CustomAPIError} When API is not reponding or the request is not valid
 */
export const getTopAnime=async (req:express.Request, res:express.Response) =>{
    const data =(await axios.get(api+'/anime')).data;

    return res.json(data);
}

//TODO: getTopReviews
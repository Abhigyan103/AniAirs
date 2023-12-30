import { getTopRatedAnime } from '../controllers/anime';
import express from 'express';


export default (router : express.Router) =>{
    router.get('/anime/toprated/:page',getTopRatedAnime);
}
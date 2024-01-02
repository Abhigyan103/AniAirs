import { getTopAnime } from '../../controllers/api/top';
import express from 'express';


export default (router : express.Router) =>{
    router.get('/anime/toprated/:page',getTopAnime);
}
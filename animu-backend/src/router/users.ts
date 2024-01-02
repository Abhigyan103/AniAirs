import express from 'express';

import { getAllUsers } from '../controllers/users'; 
import { isAutheticated } from '../middlewares';

export default (router : express.Router) =>{
    router.get('/users',isAutheticated, getAllUsers);
}
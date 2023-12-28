import express from 'express';

import { deleteUser, getAllUsers } from '../controllers/users'; 
import { isAutheticated, isOwner } from '../middlewares';

export default (router : express.Router) =>{
    router.get('/users',isAutheticated, getAllUsers);
    router.delete('/users',isAutheticated,isOwner, deleteUser);
}
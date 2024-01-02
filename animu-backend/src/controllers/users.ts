import express from 'express';
import { deleteUserById, getUserById, getUsers } from '../db/users';

export const getAllUsers = async (req: express.Request, res: express.Response) =>{
    try {
        const users = await getUsers();
        res.status(200).json(users).end();
    }catch (error) {
        console.log(error);
        return res.sendStatus(400);
        
    }
}

export const deleteUser = async (req: express.Request, res: express.Response) =>{
    try {   
        const {_id} = req.body;
        const deletedUser =await deleteUserById(_id);
        res.status(200).json(deletedUser).end();
    }catch (error) {
        console.log(error);
        return res.sendStatus(400);
        
    }
}
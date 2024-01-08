import express from 'express';
import { deleteUserById, getUserById, getUsers } from '../db/users';
import mongoose from 'mongoose';

type User = {
    readonly _id: mongoose.ObjectId,
    username: string,
    email: string,
    authentication?: {
      password: string
    },
    createdAt: NativeDate,
    updatedAt: NativeDate,
    __v: number
  }

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
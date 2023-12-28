import express, {Request, Response, NextFunction} from "express";
import { get, merge} from "lodash";
import { getUserBySessionToken } from "../db/users";

export const isAutheticated = async (req : Request, res :Response, next : NextFunction) =>{
    try {
        const sessionToken = req.cookies['ANIMU_SESSION'];
        if(!sessionToken) {return res.sendStatus(401);}
        const existingUser = await getUserBySessionToken(sessionToken);
        if(!existingUser) {return res.sendStatus(401);}
        merge(req, {identity : existingUser});
        
        return next();
    }catch (error) {
        console.log(error);
        return res.sendStatus(403);
    }
}

export const isOwner = async (req : Request, res :Response, next : NextFunction) =>{
    try {
        const {_id} = req.body;
        const currentUserId = get(req, 'identity._id') as String;
        
        if(!currentUserId) {return res.sendStatus(401);}
        if(currentUserId.toString() !== _id) {
            return res.sendStatus(403);}
        return next();
    }catch (error) {
        console.log(error);
        return res.sendStatus(403);
    }
}
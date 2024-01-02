import express, {Request, Response, NextFunction} from "express";
import { get, merge} from "lodash";
import { StatusCodes } from "http-status-codes";
import "dotenv/config"
import jsonwebtoken from "jsonwebtoken";

export const isAutheticated = async (req : Request, res :Response, next : NextFunction) =>{
    try {

        const authHeader = req.headers['authorization']
        const token = authHeader && authHeader.split(' ')[1]
        if (token == null) return res.sendStatus(StatusCodes.UNAUTHORIZED)
        jsonwebtoken.verify(token,process.env.JWT_SECRET,(err,user)=>{
            if(err) return res.sendStatus(StatusCodes.FORBIDDEN);
            merge(req, {user});
            
            return next();
        });
    }catch (error) {
        console.log(error);
        return res.sendStatus(403);
    }
}
import express, {Router} from 'express';
import authentication from './authentication';
import users from './users';
import { StatusCodes } from 'http-status-codes';

const router = Router();

export default () : Router => {
    authentication(router);
    users(router);
    router.get('/healthcheck', (_, res)=>res.send(StatusCodes.OK));
    return router;
}
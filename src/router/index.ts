import express, {Router} from 'express';
import authentication from './authentication';
import users from './users';
import anime from './anime';
import { StatusCodes } from 'http-status-codes';

const router = Router();

export default () : Router => {
    authentication(router);
    users(router);
    anime(router);
    router.get('/healthcheck', (_, res)=>res.send(StatusCodes.OK));
    return router;
}
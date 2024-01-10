import supertest from "supertest";
import app from "../../../src/app";

describe('healthcheck',()=>{
    const request = supertest(app);
    
    it('should run successfully',async ()=>{
        const res= await request.get('/');
        expect(res.statusCode).toEqual(200);
    });
});
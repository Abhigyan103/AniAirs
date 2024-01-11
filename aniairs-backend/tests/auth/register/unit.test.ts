import app from '../../../src/app';
import supertest from 'supertest';

const exampleUser = {
    "password" : "hellobye",
    "email" : "emailnahihaimera@gmail.com",
    "username":"Abhigyan102"
}

describe('register', () => {
  const request = supertest(app);

  it('should register using example user',async ()=>{
    const res = await request.post('/auth/register').send(exampleUser);
    expect(res.statusCode).toBe(201);
  });
});
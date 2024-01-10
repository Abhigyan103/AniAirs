import app from '../../../src/app';
import supertest from 'supertest';

const exampleUser = {
    "password" : "hellobye",
    "email" : "emailhaimera@gmail.com"
}

describe('login', () => {
  const request = supertest(app);

  it('should login using example user',async ()=>{
    const res = await request.post('/auth/login').send(exampleUser);
    expect(res.statusCode).toBe(200);
  });
});
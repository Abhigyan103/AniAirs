import express from "express";
import { createUser, getUserByEmail, getUserByUsername } from "../db/users";
import { comparePassword, createJWT } from "../helpers";
import { StatusCodes } from "http-status-codes";

export const login = async (req: express.Request, res: express.Response) => {
  try {
    const { email, password } = req.body;
    if (!email || !password) return res.sendStatus(StatusCodes.UNAUTHORIZED);
    const user = await getUserByEmail(email).select(
      "+authentication.password"
    );
    if (!user) {
      return res.status(StatusCodes.UNAUTHORIZED).send("User doesn't exist");
    }
    const isPasswordCorrect = await comparePassword(user.authentication.password,password);
    if (!isPasswordCorrect) {
      return res.status(StatusCodes.UNAUTHORIZED).send('Invalid Password');
    }

    const token = createJWT(user);
    res.status(StatusCodes.OK).json({
      user: {
        email: user.email,
        username: user.username,
        token,
      },
    }).end();
  } catch (error) {
    console.log(error);
    return res.sendStatus(400);
  }
};

export const register = async (req: express.Request, res: express.Response) => {
  try {
    const { email, password, username } = req.body;
    if (!email || !password || !username) return res.sendStatus(400);
    if (await getUserByEmail(email)) {
      return res.status(403).send('Email already exists');
    }
    if (await getUserByUsername(username)) {
      return res.status(403).send('Username already exists');
    }
    const user = await createUser({ email,username, authentication:{password} });
    const token = createJWT(user);
    res.status(StatusCodes.CREATED).json({
      user: {
        email: user.email,
        username: user.username,
        token,
      },
    }).end();
  } catch (error) {
    console.log(error);
    return res.sendStatus(400);
  }
};

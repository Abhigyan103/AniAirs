import "dotenv/config"
import jsonwebtoken from "jsonwebtoken";
import bcrypt from "bcrypt";

export const createJWT = (user :any) =>{
  return jsonwebtoken.sign(
    { _id: user._id, email: user.email,username:user.username },
    process.env.JWT_SECRET,
    {
      expiresIn: process.env.JWT_LIFETIME,
    }
  );
};
export const comparePassword = async (canditatePassword : string,userPassword:string ) =>{
  const isMatch = await bcrypt.compare(canditatePassword, userPassword);
  return isMatch;
};
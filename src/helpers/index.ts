import "dotenv/config"
import jsonwebtoken from "jsonwebtoken";
import bcrypt from "bcrypt";

export const createJWT = (user :any) =>{
  return jsonwebtoken.sign(
    { userId: user._id, email: user.email },
    process.env.JWT_SECRET,
    {
      expiresIn: process.env.JWT_LIFETIME,
    }
  );
};
export const comparePassword = async function (userPassword:string, canditatePassword : string) {
  const isMatch = await bcrypt.compare(canditatePassword, userPassword);
  return isMatch;
};
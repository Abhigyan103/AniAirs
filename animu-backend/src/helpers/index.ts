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

export const createRefreshJWT = (user :any) =>{
  return jsonwebtoken.sign(
    { _id: user._id, email: user.email,username:user.username },
    process.env.JWT_REFRESH_SECRET
  );
};

export const comparePassword = async (canditatePassword : string,userPassword:string ) =>{
  const isMatch = await bcrypt.compare(canditatePassword, userPassword);
  return isMatch;
};
export const verifyRefreshToken = (refreshToken : string) =>{
  let user:string | jsonwebtoken.JwtPayload;
  
  jsonwebtoken.verify(refreshToken, process.env.JWT_REFRESH_SECRET, (err, userVal)=>{
    if(err) user= null;
    user=userVal;
  });  
  return user;
}
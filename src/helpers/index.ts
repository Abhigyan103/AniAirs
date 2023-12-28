import crypto from 'crypto';
import "dotenv/config"
const SECRET = process.env.SECRET;

export const random = () => crypto.randomBytes(128).toString("base64");
export const authentication = (salt: String, password: String) =>
  crypto.createHmac("sha256", [salt, password].join("/"))
    .update(SECRET)
    .digest("hex");

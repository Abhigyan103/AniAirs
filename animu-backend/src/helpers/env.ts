import {z} from "zod";

const envSchema = z.object({
    PORT :z.string().min(1),
    MONGO_URL :z.string(),
    MONGO_URL_LOCAL : z.string().min(1),
    JWT_SECRET:z.string().min(1),
    JWT_REFRESH_SECRET:z.string().min(1),
    JWT_LIFETIME:z.string().min(1),
});
export const env = envSchema.parse(process.env);
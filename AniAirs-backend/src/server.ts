import app from "./app";
import { env } from "./helpers/env";

const PORT = env.PORT || 8080;
app.listen(8000,()=>{console.log(`Listening on PORT ${PORT}`);
});

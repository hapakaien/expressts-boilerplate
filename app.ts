import express from 'express';
import helmet from 'helmet';
import compression from 'compression';

const app = express();
const PORT = process.env.PORT;

app.use(helmet());
app.use(compression());

app.get('/', (req, res) => res.send('Yo, hello world!'));
app.listen(PORT, () => {
	console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});

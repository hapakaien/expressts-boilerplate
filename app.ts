import express from 'express';
import helmet from 'helmet';
import compression from 'compression';

const app = express();
const PORT = 8080;

app.use(helmet());
app.use(compression());

app.get('/', (req, res) => res.send('Awesome Express + Typescript Server'));
app.listen(PORT, () => {
	console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});

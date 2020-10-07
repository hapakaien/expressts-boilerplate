import express from 'express';
import helmet from 'helmet';

const app = express();
const PORT = 8080;

app.use(helmet());

app.get('/', (req, res) => res.send('Awesome Express + Typescript Server'));
app.listen(PORT, () => {
	console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});

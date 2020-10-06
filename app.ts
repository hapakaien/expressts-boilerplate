import express from 'express';

const app = express();
const PORT = 8080;

app.get('/', (req, res) => res.send('Awesome Express + Typescript Server'));
app.listen(PORT, () => {
	console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});

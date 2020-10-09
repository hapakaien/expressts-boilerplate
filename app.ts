import app from './server';

const server = app;
const PORT = process.env.PORT || 3000;

server.listen(PORT, () => {
	console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});

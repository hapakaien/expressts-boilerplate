import express from 'express';
import helmet from 'helmet';
import compression from 'compression';

const app = express();

app.use(helmet());
app.use(compression());

app.get('/', (req, res) =>
	res.json({
		status: true,
		message: 'Yo!',
		data: null,
	}),
);

export default app;

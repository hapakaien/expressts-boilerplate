import request from 'supertest';
import app from '../server';

describe('Index route test', () => {
	it('Should pass index route', async (done) => {
		const res = await request(app).get('/');
		expect(res.status).toEqual(200);
		expect(res.body.message).toBe('Yo!');
		done();
	});

	it('Should failed access index route', async (done) => {
		const res = await request(app).post('/');
		expect(res.status).toEqual(404);
		done();
	});
});

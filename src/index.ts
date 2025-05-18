import { Hono } from 'hono';
import { readFile } from 'node:fs/promises';
import { join } from 'node:path';

const app = new Hono();

app.get('/', c => {
  return c.text('Hello Hono!');
});

app.get('/api/:year/:month', async c => {
  const { year, month } = c.req.param();
  const filePath = join(process.cwd(), year, `${month}.md`);

  try {
    const content = await readFile(filePath, 'utf-8');
    return c.text(content);
  } catch (e) {
    return c.json({ error: 'File not found' }, 404);
  }
});

export default app;

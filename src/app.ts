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

// Parse PORT environment variable with default of 8080
const port = parseInt(process.env.PORT || '8080', 10);

export default {
  port,
  hostname: '0.0.0.0', // Use 0.0.0.0 to listen on all network interfaces (important for Docker)
  fetch: app.fetch,
};

// Log the actual port being used
console.log(`Server starting on http://0.0.0.0:${port}`);

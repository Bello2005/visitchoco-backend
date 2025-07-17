import express from 'express';

const app = express();
const port = process.env.PORT || 3001;

app.get('/', (_, res) => {
  res.send('Hello from VisitChoco Backend!');
});

app.listen(port, () => {
  console.log(`Server running at http://localhost:${port}`);
});

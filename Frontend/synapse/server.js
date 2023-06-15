const jsonServer = require("json-server");
const server = jsonServer.create();
const router = jsonServer.router("db.json");
const middlewares = jsonServer.defaults();

server.use(middlewares);
server.use(router);

const port = 3000;
server.listen(port, () => {
  console.log(`JSON Server is running on port ${port}`);
});

server.get("/posts", (req, res) => {
  const posts = router.db.get("posts");
  res.json(posts);
});

server.get("/services", (req, res) => {
  const services = router.db.get("services");
  res.json(services);
});

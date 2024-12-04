db = db.getSiblingDB("defaultdb");
db.createUser({
  user: "defaultuser",
  pwd: "defaultuser123",
  roles: [{ role: "dbOwner", db: "defaultdb" }],
});

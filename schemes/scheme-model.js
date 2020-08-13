const db = require("../data/migrations/connection.js");

module.exports = {
  find,
  findById,
  findSteps,
  add,
  addStep,
  update,
  remove,
};

function find() {
  return db("schemes");
}

function findById(id) {
  if (id) {
    return db("schemes").where({ id }).first();
  } else {
    return null;
  }
}

function findSteps(id) {
  return db("steps as s")
    .join("schemes as sc", "s.scheme_id", "sc.id")
    .select("s.id", "sc.scheme_name", "s.step_number", "s.instructions")
    .where("sc.id", id);
}

async function add(scheme) {
  const [id] = await db("schemes").insert(scheme);
  return findById(id);
}

//---------------------------------------------------------------
//-- ADDSTEP
// async function addStep(step, id) {
//   const [id] = await db("schemes").where().insert(step);
//   return findById(id);
// }

async function addStep(step) {
  const [id] = await db("steps").insert(step);
  return findById(id).where("schemes.schemes_id", id);
}
//-----------------------------------------------------------------

function update(changes, id) {
  return db("schemes").where({ id }).update(changes, "*");
}

function remove(id) {
  return db("schemes").where({ id }).del();
}

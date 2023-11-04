const jwt = require("jsonwebtoken");
const { KDM_ACCESS_TOKEN } = require("./constants");

function verifyToken(request, response, next) {
  let jwtToken;
  const authHeader = request.headers["authorization"];
  if (authHeader !== undefined) {
    jwtToken = authHeader.split(" ")[1];
  }
  if (jwtToken === undefined) {
    response.status(400).json({ jwt_token: "No jwt token" });
  } else {
    jwt.verify(jwtToken, KDM_ACCESS_TOKEN, async (error, payload) => {
      if (error) {
        console.log("matching in jwt token");
        console.log(error);
        response.status(400).json({ jwt_token: "Invalid JWT Token" });
      } else {
        request.user = payload;

        next();
      }
    });
  }
}

module.exports = verifyToken;

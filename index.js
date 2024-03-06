// Import the 'http' module
const fs = require("fs");
const xlsx = require("xlsx");
const express = require("express");
const dotenv = require("dotenv").config();
const multer = require("multer");
const bodyParser = require("body-parser");
const mysql = require("mysql");
const path = require("path");
const bcrypt = require("bcrypt");
const jwt = require("jsonwebtoken");
const authenticateToken = require("./middleware/authenticateToken");
var nodemailer = require("nodemailer");
const app = express();
const connection = mysql.createConnection({
  host: "127.0.0.1",
  user: "root",
  password: "",
  database: "practitioner",
});
connection.connect((err) => {
  if (err) {
    console.error("Error connecting to MySQL: " + err.stack);
    return;
  }
  console.log("Connected to MySQL as ID " + connection.threadId);
});
app.use(function (req, res, next) {
  res.header("Access-Control-Allow-Origin", "*"); // Replace with the actual origin of your frontend
  res.header("Access-Control-Allow-Headers", "*");
  next();
});
app.use(bodyParser.json());
app.get("/api/all", authenticateToken, (req, res) => {
  var data = [];
  connection.query(
    "SELECT * FROM practitioner_list",
    (error, results, fields) => {
      if (error) throw error;
      data = JSON.stringify(results);
      res.json(results);
    }
  );
  // Send the data as a JSON response
});
app.get("/api/data", (req, res) => {
  var data = [];
  connection.query(
    "SELECT * FROM practitioner_list WHERE status = ?",
    ["active"],
    (error, results, fields) => {
      if (error) throw error;
      data = JSON.stringify(results);
      res.json(results);
      return;
    }
  );
  // Send the data as a JSON response
});
app.get("/api/metaData", (req, res) => {
  var data = [];
  connection.query(
    "SELECT * FROM practitioner_list",
    (error, results, fields) => {
      if (error) throw error;
      var specs = [];
      var tags = [];
      data = JSON.stringify(results);
      results.forEach((element) => {
        if (element.specialty != "") {
          specArray = element?.specialty?.split(",");
          specArray.forEach((subElement) => {
            var value;
            if (subElement.charAt(0) == " ") {
              value = subElement.substring(1);
            } else {
              value = subElement;
            }
            if (specs.indexOf(value) == -1) {
              specs.push(value);
            }
          });
        }
        if (element.specialty != "") {
          tagArray = element.tags.split(",");
          tagArray.forEach((subElement) => {
            var value;
            if (subElement.charAt(0) == " ") {
              value = subElement.substring(1);
            } else {
              value = subElement;
            }
            if (tags.indexOf(value) == -1) {
              tags.push(value);
            }
          });
        }
      });
      data = {
        tags: tags,
        specs: specs,
      };
      res.json(data);
    }
  );
  // Send the data as a JSON response
});
app.post("/api/new", (req, res) => {
  var newData = req.body;
  connection.query(
    "Select * FROM practitioner_list WHERE email = ?",
    [newData.email],
    (error, results, fields) => {
      if (error) throw error;
      if (results.length > 0) {
        res.json("duplicated");
      } else {
        connection.query(
          "INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone, sex, profileLink, availability, type, hide) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
          [
            newData.firstname,
            newData.lastname,
            newData.specialty,
            newData.imageURL,
            newData.upload,
            newData.tags,
            newData.meetinglink,
            newData.address,
            newData.city,
            newData.state,
            newData.zipcode,
            newData.country,
            newData.email,
            newData.phone,
            newData.sex,
            newData.profileLink,
            newData.availability,
            newData.type,
            newData.hide
          ],
          (error, results, fields) => {
            if (error) throw error;
            console.log("Inserted a new row with ID:", results.insertId);
            res.json("success");
          }
        );
      }
    }
  );
});
app.post("/api/admin_new", (req, res) => {
  var newData = req.body;
  connection.query(
    "Select * FROM practitioner_list WHERE email = ?",
    [newData.email],
    (error, results, fields) => {
      if (error) throw error;
      if (results.length > 0) {
        res.json("duplicated");
      } else {
        connection.query(
          "INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone, sex, status, review, `rank`, profileLink, availability, type, hide) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
          [
            newData.firstname,
            newData.lastname,
            newData.specialty,
            newData.imageURL,
            newData.upload,
            newData.tags,
            newData.meetinglink,
            newData.address,
            newData.city,
            newData.state,
            newData.zipcode,
            newData.country,
            newData.email,
            newData.phone,
            newData.sex,
            newData.status,
            newData.review,
            newData.rank,
            newData.profileLink,
            newData.availability,
            newData.type,
            newData.hide
          ],
          (error, results, fields) => {
            if (error) throw error;
            console.log("Inserted a new row with ID:", results.insertId);
            res.json(results.insertId);
          }
        );
      }
    }
  );
});
app.post("/api/update", (req, res) => {
  var newData = req.body;
  // Update operation
  const updateQuery =
    "UPDATE practitioner_list SET firstname =?, lastname =?, specialty =?, imageURL =?, tags =?, meetingLink =?, address =?, city =?, zipcode =?, state =?, phone =?, `rank` =?, review =?, email =?, country = ?, status =?, sex =?, hide =?, profileLink=?, availability = ?, type=?, upload=? WHERE id =?";
  const updateValues = [
    newData.firstname,
    newData.lastname,
    newData.specialty,
    newData.imageURL,
    newData.tags,
    newData.meetinglink,
    newData.address,
    newData.city,
    newData.zipcode,
    newData.state,
    newData.phone,
    newData.rank,
    newData.review,
    newData.email,
    newData.country,
    newData.status,
    newData.sex,
    newData.hide,
    newData.profileLink,
    newData.availability,
    newData.type,
    newData.upload,
    newData.id
  ]; // Replace with actual values
  connection.query(updateQuery, updateValues, (error, results, fields) => {
    if (error) throw error;
    console.log("Updated rows:", results.affectedRows);
    res.json("success");
  });
});
app.post("/api/updateDB", async (req, res) => {
  var newData = req.body;
  console.log(newData);
  if (newData.replace) {
    await connection.query(
      "DELETE FROM practitioner_list",
      (error, results, fields) => {}
    );
    // Add Admin
    await connection.query(
      "INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone, `rank`, review, status, role, password, sex) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
      [
        "Nima",
        "Farshid",
        "Bio-Well practitioner, Reiki Master, Sound Healer, Meditation Coach",
        "https://biohackingcongress.com/storage/users/June2023/9Q67Ebbs5rPLWWmWGZET.png",
        0,
        "Reiki, biowell, soundhealer, meditation",
        "https://calendly.com/nimafarshid/biowell",
        "11532 Via Lucerna Cir",
        "Windermere",
        "FL",
        "34786",
        "US",
        "nima02@yahoo.com",
        "407-230-8179",
        3,
        5,
        "active",
        0,
        "$2b$10$WZ9pp7nsSEcgglZD8W8oueFvDfSDKKY1VJ.wVWRGRKubqDlowH2UG",
        "Male",
      ],
      (error, results, fields) => {
        if (error) throw error;
      }
    );
  }
  // Add users
  newData.data.forEach(async (element, index) => {
    if (element["Email"] != "nima02@yahoo.com" && index != 0) {
      await connection.query(
        "INSERT INTO practitioner_list (firstname, lastname, specialty, imageURL, upload, tags, meetinglink, address, city, state, zipcode, country, email, phone, sex, availability) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
        [
          element["First Name"] || "",
          element["Last Name"] || "",
          element["Specialty"] || "",
          element["ImageURL"] || "",
          0,
          element["Tags"] || "",
          element["MeetingLink"] || "",
          element["Address"] || "",
          element["City"] || "",
          element["State"] || "",
          element["Zipcode"] || "",
          element["Country"] || "",
          element["Email"] || "",
          element["Phone"] || "",
          element["Sex"],
          element["Availability"],
        ],
        (error, results, fields) => {
          if (error) throw error;
        }
      );
    }
  });
  res.json("success");
  // Update operation
  // const updateQuery = 'UPDATE practitioner_list SET firstname = ?, lastname = ?, specialty = ?, imageURL = ?, tags = ?, meetingLink = ?, address = ?, city = ?, zipcode = ?, state = ?, phone = ?, rank = ?, review = ?, email = ?, country = ?, status = ? WHERE id = ?';
  // const updateValues = [newData.firstname, newData.lastname, newData.specialty, newData.imageURL, newData.tags, newData.meetinglink, newData.address, newData.city, newData.zipcode, newData.state, newData.phone, newData.rank, newData.review, newData.email, newData.country, newData.status, newData.id]; // Replace with actual values
  // connection.query(updateQuery, updateValues, (error, results, fields) => {
  //     if (error) throw error;
  //     console.log('Updated rows:', results.affectedRows);
  //     res.json('success');
  // });
});
app.post("/api/user", (req, res) => {
  var newData = req.body;
  // Update operation
  var newData = req.body;
  connection.query(
    "Select * FROM practitioner_list WHERE id = ?",
    [newData.id],
    (error, results, fields) => {
      if (error) throw error;
      res.json(results);
    }
  );
});
app.post("/api/remove", (req, res) => {
  var newData = req.body;
  // Update operation
  connection.query(
    "DELETE FROM practitioner_list WHERE id = ?",
    [newData.id],
    (error, results, fields) => {
      if (error) throw error;
      console.log("Deleted rows:", results.affectedRows);
      res.json("success");
    }
  );
});
app.post("/api/login", async (req, res) => {
  const newData = req.body;
  console.log(await bcrypt.hash("Pass1234!", 10));
  // $2b$10$WZ9pp7nsSEcgglZD8W8oueFvDfSDKKY1VJ.wVWRGRKubqDlowH2UG
  try {
    const query = "SELECT * FROM practitioner_list WHERE email = ?;";
    connection.query(query, [newData.email], async (error, results, fields) => {
      if (error) throw error;
      user = results;
      console.log(results);
      if (user.length === 0) {
        return res.status(401).json({ message: "Invalid credentials." });
      }
      const passwordMatch = await bcrypt.compare(
        newData.password,
        user[0].password
      );
      if (!passwordMatch) {
        console.log("bbb");
        return res.status(401).json({ message: "Invalid credentials." });
      }
      const token = jwt.sign(
        { username: user[0].firstname + user[0].lastname, userId: user[0].id },
        process.env.JWT_SECRET,
        { expiresIn: "1h" }
      );
      res.json({ token });
      return;
    });
  } catch (error) {
    console.error("Login error:", error);
    res.status(500).json({ message: "Internal server error." });
  }
});
app.post("/api/login_practitioner", async (req, res) => {
  const { email } = req.body;
  const query = "SELECT * FROM practitioner_list WHERE email = ?;";
  connection.query(query, [email], async (error, results, fields) => {
    if (error) throw error;
    user = results;
    if (user.length === 0) {
      return res.status(401).json({ message: "Invalid credentials." });
    }
    const token = jwt.sign(
      { username: user[0].firstname + user[0].lastname, userId: user[0].id },
      process.env.JWT_SECRET,
      { expiresIn: "1h" }
    );
    var transporter = nodemailer.createTransport({
      service: "gmail",
      auth: {
        user: "gaiahealersshopify@gmail.com",
        pass: "byep avju cnsz aqut",
      },
    });  
    var mailOptions = {
      from: "Gaia",
      to: email,
      subject: "Gaia Login",
      text: `Here is your login link: https://gaiapractitioner.com/user?token=${token}`,
    };
    transporter.sendMail(mailOptions, function (error, info) {
      if (error) {
        console.log(error);
        res.status(500).json({ message: "Internal server error" });
      } else {
        console.log("Email sent: " + info.response);
        res.json({ message: "success" });
      }
    });
  });
});
app.get("/api/user", authenticateToken, (req, res) => {
  const { userId } = req.user;
  const query = "SELECT * FROM practitioner_list WHERE id = ?;";
  connection.query(query, [userId], async (error, results, fields) => {
    if (error) throw error;
    user = results;
    res.json(user);
  });
  return;
});
app.post("/api/hide_info", authenticateToken, (req, res) => {
  let { id } = req;
  try {
    // const query = "UPDATE hide_info SET hide=1 WHERE id = 1;";
    // first get the current status
    const query = "SELECT * FROM practitioner_list WHERE id = ?;";
    connection.query(query, [id], async (error, results, fields) => {
      if (error) throw error;
      user = results;
      const hide = user[0].hide == 1 ? 0 : 1;
      const updateQuery = "UPDATE practitioner_list SET hide = ? WHERE id = ?";
      const updateValues = [hide, id]; // Replace with actual values
      connection.query(updateQuery, updateValues, (error, results, fields) => {
        if (error) throw error;
        console.log("Updated rows:", results.affectedRows);
        res.json("success");
      });
    });
  } catch (error) {
    console.error("failed to hide:", error);
    res.status(500).json({ message: "Internal server error." });
  }
});

// Customer
app.post("/api/customer_new", authenticateToken, (req, res) => {
  var newData = req.body;
  const { userId } = req.user;
  connection.query(
    "Select * FROM customer_list WHERE email = ?",
    [newData.email],
    async (error, results, fields) => {
      if (error) throw error;
      if (results.length > 0) {
        res.json("duplicated");
      } else {
        var cryptedPass = await bcrypt.hash(newData.password, 10)
        connection.query(
          "INSERT INTO customer_list (firstname, lastname, address, city, state, zipcode, country, email, phone, sex, password, practitioner ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)",
          [
            newData.firstname,
            newData.lastname,
            newData.address,
            newData.city,
            newData.state,
            newData.zipcode,
            newData.country,
            newData.email,
            newData.phone,
            newData.sex,
            cryptedPass,
            userId
          ],
          (error, results, fields) => {
            if (error) throw error;
            console.log("Inserted a new row with ID:", results.insertId);
            res.json("success");
          }
        );
      }
    }
  );
});
app.post("/api/customer/remove", (req, res) => {
  var newData = req.body;
  // Update operation
  connection.query(
    "DELETE FROM customer_list WHERE id = ?",
    [newData.id],
    (error, results, fields) => {
      if (error) throw error;
      console.log("Deleted rows:", results.affectedRows);
      res.json("success");
    }
  );
});

app.get("/api/user/customers", authenticateToken, (req, res) => {
  const { userId } = req.user;
  const query = "SELECT * FROM customer_list WHERE practitioner = ?;";
  connection.query(query, [userId], async (error, results, fields) => {
    if (error) throw error;

    user = results;

    res.json(user);
  });
  return;
});
app.post("/api/customer/update", async (req, res) => {
  var newData = req.body;
  
  // Update operation
  var cryptedPass = await bcrypt.hash(newData.password, 10)
  const updateQuery =
    "UPDATE customer_list SET firstname =?, lastname =?, address =?, city =?, zipcode =?, state =?, phone =?, email =?, country = ?, sex =?, password =?  WHERE id =?";
  const updateValues = [
    newData.firstname,
    newData.lastname,
    newData.address,
    newData.city,
    newData.zipcode,
    newData.state,
    newData.phone,
    newData.email,
    newData.country,
    newData.sex,
    cryptedPass,
    newData.id
  ]; // Replace with actual values

  connection.query(updateQuery, updateValues, (error, results, fields) => {
    if (error) throw error;
    console.log("Updated rows:", results.affectedRows);
    res.json("success");
  });
});

const storage = multer.diskStorage({
  destination: function (req, file, cb) {
    cb(null, "src/");
  },
  filename: function (req, file, cb) {
    cb(
      null,
      file.fieldname + "-" + Date.now() + path.extname(file.originalname)
    );
  },
});
const upload = multer({ storage: storage, dest: "src/" });
// Define the route to handle the file upload
app.post("/api/media", upload.single("image"), function (req, res, next) {
  // Send a response back to the frontend
  if (req.file) {
    res.send(req.file.filename);
  } else {
    res.status(400).send("File upload failed");
  }
});
app.use("/api/src", express.static(__dirname + "/src"));
app.use(async (req, res, next) => {
  const token = req.header("Authorization");
  if (token) {
    try {
      const [rows, fields] = await db.execute(
        "INSERT INTO tokens (token) VALUES (?)",
        [token]
      );
      console.log("Token saved to the database:", token);
    } catch (error) {
      console.error("Error saving token to the database:", error.message);
    }
  }
  next();
});
app.listen(3000, () => {
  console.log("Server started..");
});
var express = require('express');
var expressSession = require('express-session');
var mysql = require('mysql');
var bcrypt = require('bcrypt');
var bodyParser = require('body-parser');
const cloudinary = require("./utils/cloudinary");
const upload = require("./utils/multer");

var app = express();

var db = mysql.createConnection({
	host: 'localhost',
	user: 'root',
	password: 'Debu0210#',
	database: 'game',
	debug: false,
	multipleStatements: true
});

db.connect(function(err){
	if(err) {
		throw err;
	}
	console.log('database connected!!');
});

app.set("view engine", "ejs");
app.use(express.urlencoded({ extended: false }));
app.use(expressSession({secret: 'my top secret code', saveUninitialized: true, resave: false}));
app.use('/assets',express.static('assets'));
app.use(express.static(__dirname + '/assets'));

// app.use(express.bodyParser());
app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));



var result_ = 0;


app.get('/', function(req, res) {
	if(req.session.auth === undefined) {
		req.session.auth = 0;
	}

	if(req.session.auth === 0) {
		res.render('home');
	}
	else {
		res.redirect('/user');
	}
});

app.get('/login', function(req, res) {
	if(req.session.auth === undefined) {
		req.session.auth = 0;
	}

	if(req.session.auth === 0) {
		res.render('login');
	}
	else {
		res.redirect('/user');
	}
});

app.post('/login', function(req, res) {
	var email = req.body.email;
	req.session.email = email;
	var password = req.body.password;

	var data = `SELECT * FROM auth WHERE email = '${email}'`;
	var query = db.query(data, function(err, result) {
		if(err) {
			throw err;
		}
		else {
			if(result.length === 0) {
				res.redirect('/nousr');
			}
			else {
				bcrypt.compare(password, result[0]['password']).then(function(result1) {
					if(result1) {
						req.session.auth = 1;
						req.session.age = result[0]['age'];
						res.redirect('/user');
					}
					else {
						res.redirect('/nouser');
					}
				});
			}
		}
	});
});

app.get('/register', function(req, res) {
	if(req.session.auth === undefined) {
		req.session.auth = 0;
	}

	if(req.session.auth === 0) {
		res.render('register');
	}
	else {
		res.redirect('/user');
	}
});

app.post('/register', function(req, res) {
	var name = req.body.name;
	var email = req.body.email;
	var age = req.body.age;
	var password = req.body.password;
	var data = `SELECT * FROM auth WHERE email = '${email}'`;
	var query = db.query(data, function(err, result) {
		if(err) {
			throw err;
		}
		else if(result.length > 0) {
			res.redirect('/eae');
		}
		else if(result.length === 0) {
			bcrypt.hash(password, 10).then(function(hash) {
				var data1 = `INSERT INTO auth VALUES ('${name}', '${email}', '${hash}', '${age}'); INSERT INTO pro VALUES ('${email}', '0', '0', '0', '0', '0')`;
				var query1 = db.query(data1, function(err1, result1) {
					if(err1) {
						throw err1;
					}
					else {
						res.redirect('/');
					}
				});
			});
		}
	});
});

app.get('/user', function(req, res) {
	if(req.session.auth === 1) {
		var data = `SELECT * FROM pro WHERE email = '${req.session.email}'`;
		var query = db.query(data, function(err, result) {
			if(err)
				throw err;
			else
				res.render('user', {result: result});
		});
	}
	else {
		res.redirect('/');
	}
});

app.get('/add', function(req, res) {
	if(req.session.auth === 1) {
		res.render('add');
	}
	else {
		res.redirect('/');
	}
});

app.post('/add', upload.single("image"), async (req, res) => {

	var title = req.body.title;
	var qu = req.body.qu;
	var o1 = req.body.o1;
	var o2 = req.body.o2;
	var o3 = req.body.o3;
	var o4 = req.body.o4;
	var ca = req.body.ca;
	try {
		if(req.file === undefined) {
			var img = "";
			var imgId = "";
			var data = `INSERT INTO ques VALUES ('${title}', '${qu}', '${img}', '${imgId}', '${o1}', '${o2}', '${o3}', '${o4}', '${ca}', '${req.session.email}', '${req.session.age}')`;
            var query = db.query(data, function(err, result) {
                if(err)
                	throw err;
                else
                	res.redirect('/user');
            });
		} else {
			await cloudinary.uploader.upload(
				req.file.path, {
					width: 400,
					height: 400,
					gravity: "center",
					crop: "scale"
				},
				function(err, result) {
					if (err) {
						console.log("image Error");
						return res.redirect("/add");
					}
					req.body.image = result.secure_url;
					req.body.imageId = result.public_id;
					var img = req.body.image;
					var imgId = req.body.imageId;
					var data = `INSERT INTO ques VALUES ('${title}', '${qu}', '${img}', '${imgId}', '${o1}', '${o2}', '${o3}', '${o4}', '${ca}', '${req.session.email}', '${req.session.age}')`;
            		var query = db.query(data, function(err, result) {
                		if(err)
                			throw err;
                		else
                			res.redirect('/user');
            		});
				}, {
					moderation: "webpurify"
				}
			);
		}
	} catch (error) {
		console.log(error);
	}
});

app.get('/s_game', function(req, res) {
	if(req.session.auth === 1) {
		req.session.i = 0;
		req.session.score = 0;
		var data = `SELECT * FROM ques WHERE age = '${req.session.age}' AND code = 'admin@gmail.com' OR code = '${req.session.email}' ORDER BY RAND() LIMIT 10 `;
		var query = db.query(data, function(err, result) {
			if(err)
				throw err;
			else {
				req.session.result = result;
				res.redirect('/game');
			}
		});
	}
	else {
		res.redirect('/');
	}
});

app.get('/game', function(req, res) {
	if(req.session.auth === 1) {
		res.render('game', {result: [req.session.i, req.session.result[req.session.i]]});
	}
	else {
		res.redirect('/');
	}
});

app.get('/continue/:code', function(req,res) {
	if(req.session.auth === 1) {
		var code = req.params.code;
		if(code == 1)
			req.session.score++;
		req.session.i++;
		if(req.session.i === 10) {
			res.redirect('/score');
		}
		else
			res.redirect('/game');
	}
	else {
		res.redirect('/');
	}
});

app.get('/score', function(req, res) {
	if(req.session.auth === 1) {
		var data = `UPDATE pro SET g1 = g2, g2 = g3, g3 = g4, g4 = g5, g5 = ${req.session.score} WHERE email = '${req.session.email}'`;
		var query = db.query(data, function(err, result) {
			if(err)
				throw err;
			else {
				res.render('score', {result: req.session.score});
			}
		});
	}
	else
		res.redirect('/');
});

app.get('/logout', function(req, res) {
	req.session.auth = 0;
	res.redirect('/');
});

app.listen(4000, function(req, res) {
	console.log('server started!!')
});
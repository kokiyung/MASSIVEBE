import express from 'express'
import cors from 'cors'
import mysql from 'mysql'
import multer from 'multer'
import path from 'path'




const app = express();
app.use(express.json());
app.use(cors());
app.use(express.static('public'))

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, 'public/image')
    },
    filename: (req, file, cb) => {
        cb(null, file.fieldname + '_' + Date.now() + path.extname(file.originalname))
    } 
    
})

const upload = multer({
    storage: storage
})

const db = mysql.createConnection({
    host: "localhost",
    user: "root",
    password:"",
    database:"Pesanin"
})

app.get("/", (req,res) => {
    const sql = "SELECT * FROM product ORDER BY id_pro";
    db.query(sql, (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})
app.get("/transaksi", (req,res) => {
    const sql = "SELECT * FROM transaksi ORDER BY id_pro";
    db.query(sql, (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})
app.get("/cart/:id_pro", async (req,res) => {
    
     try {
        const productId = req.params.id_pro;
        console.log('Product ID:', productId);

        // Query the database for product details based on the product ID
        const [rows] = await db.query('SELECT * FROM product WHERE id_pro = ?', [productId]);

        if (rows.length === 0) {
            return res.status(404).json({ error: 'Product not found' });
        }

        // Send the product details as a JSON response
        res.json(rows[0]);
    } catch (error) {
        console.error(error);
        res.status(500).json({ error: 'Internal Server Error' });
    }
})



app.post('/payment', (req, res) => {
    const sql = "INSERT INTO transaksi VALUES (?)";
    const values = [
        "Test789",
        "Paket Hemat 53",
        "65000",
        req.body.name,
        req.body.date,
        req.body.time,
        req.body.pay,
        "WAITING",
        req.body.note
        

    ]
    db.query(sql, [values], (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})
app.post('/addpro',upload.single('image'), (req, res) => {
    const sql = "INSERT INTO product VALUES (?)";
    const values = [
        req.body.idpro,
        req.body.name,
        req.body.price,
        req.body.category,
        req.file.filename

    ]
    db.query(sql, [values], (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})
app.post('/loginuser', (req, res) => {  
    const sql = 'SELECT * FROM users WHERE username = ? AND password = ?';
    db.query(sql,[req.body.username,req.body.password],(err,data) => {
        if(err) return res.json("Login Failed");
        if(data.length > 0){
            return res.json("Login successfull")
        }else{
            return res.json(" Login Failed")
        }
    })
  });
  
app.post('/registeruser', (req, res) => {
    const sql = "INSERT INTO users VALUES (?)";
    const values = [
        req.body.username,
        req.body.name,
        req.body.phone,
        req.body.email,
        req.body.password

    ]
    db.query(sql, [values], (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})
app.post('/loginmitra', (req, res) => {  
    const sql = 'SELECT * FROM mitra WHERE username = ? AND password = ?';
    db.query(sql,[req.body.username,req.body.password],(err,data) => {
        if(err) return res.json("Login Failed");
        if(data.length > 0){
            return res.json("Login successfull")
        }else{
            return res.json(" Login Failed")
        }
    })
  });
  
app.post('/registermitra', (req, res) => {
    const sql = "INSERT INTO mitra VALUES (?)";
    const values = [
        req.body.username,
        req.body.name,
        req.body.phone,
        req.body.email,
        req.body.password

    ]
    db.query(sql, [values], (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})

app.put("/update/:id_pro", (req, res) => {
    const sql = "UPDATE product set name = ?, price = ?, category = ? WHERE id_pro = ?" ;
    const values = [
        req.body.name,
        req.body.price,
        req.body.category

    ]
    const id_pro = req.params.id_pro;
    db.query(sql, [...values, id_pro], (err, data) => {
        if(err) return res.json("Error");
        return res.json(data);
    })
})


app.put("/reject/:id_transaksi", (req, res) => {
    const sql = "UPDATE transaksi SET status = ? WHERE id_transaksi = ?";
    const id_transaksi = req.params.id_transaksi;
    const values = "Reject"; // Use "REJECT" as the new status
    db.query(sql, [values, id_transaksi], (err, data) => {
        if (err) return res.json("Error");
        return res.json(data);
    });
});
app.put("/accept/:id_transaksi", (req, res) => {
    const sql = "UPDATE transaksi SET status = ? WHERE id_transaksi = ?";
    const id_transaksi = req.params.id_transaksi;
    const values = "Accept"; // Use "REJECT" as the new status
    db.query(sql, [values, id_transaksi], (err, data) => {
        if (err) return res.json("Error");
        return res.json(data);
    });
});

app.delete("/product/:id_pro", (req, res) => {
    const sql = "DELETE FROM product WHERE id_pro = ?" ;
    const id_pro = req.params.id_pro;
    db.query(sql, [id_pro], (err, data) => {
        if(err) return res.json("Erroe");
        return res.json(data);
    })
})

app.listen(8081, () =>{
    console.log("listening");
})

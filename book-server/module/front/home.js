const express = require('express');
const async = require('async');
const router = express.Router();


//首页
router.get('/', (req, res) => {
    let data = {};
    data.username = req.session.username;
    data.aid = req.session.aid;
	console.log('发起请求')
    let sql = 'SELECT * FROM books  limit 10';
    conn.query(sql, (err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        };
        //    console.log(result)
        res.json(result);
    })

});

//图书页
router.get('/books', (req, res) => {
    let data = {};
    data.username = req.session.username;
    data.aid = req.session.aid;
    data.sort = req.query.sort;
    data.class = req.query.class ? req.query.class : '%';
    data.b_name = req.query.b_name ? "%"+req.query.b_name+"%" : '%'
    // console.log(req.query)
    // console.log(data)
    let sql;
    if (data.sort == 'news') {
        sql = 'SELECT * FROM books WHERE b_class LIKE ?  AND b_name like ? ORDER BY b_update  limit 10';
    } else if (data.sort == 'hot') {
        sql = 'SELECT * FROM books WHERE b_class LIKE ?  AND b_name like ? ORDER BY b_score  desc limit 10';
    } else {
        sql = 'SELECT * FROM books WHERE b_class LIKE ?  AND b_name like ? limit 10';
    }
    conn.query(sql,[data.class,data.b_name],(err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        };
        // console.log(result)
        res.json(result);
    })

});

//单个图书页
router.get('/onebook', (req, res) => {
    let data = {};
    data.username = req.session.username;
    data.aid = req.session.aid;
    data.b_id = req.query.b_id;
    data.collection={};
    //查找电影信息
    let sql1 = 'SELECT * FROM books  where b_id=?';
    conn.query(sql1, data.b_id, (err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        };
        data.books = result;
        // res.json(data);
    });
    //查找评论
    let sql2 = 'SELECT * FROM talk WHERE  b_id=?  AND t_status=1';
    conn.query(sql2, data.b_id, (err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        };
        data.talks = result.reverse();
        // res.json(data)
    });
    //查找收藏
    let sql3 = 'SELECT * FROM collection WHERE  b_id=?  AND u_id=?';
    conn.query(sql3, [data.b_id,data.aid],(err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        };
        if(result){
            data.collection.col='取消收藏';
            data.collection.colstatus=1;
        } else {
            data.collection.col='收藏';
            data.collection.colstatus=0;
        }
        res.json(data)
    });

});

//提交评论
router.post('/talkup', (req, res) => {
    // console.log(req.body)
    let d = req.body;
    let data = {};
    data.username = req.session.username;
    data.aid = req.session.aid;
    data.t_text = d.talktext;
    data.b_id = d.b_id;
    let sql = 'INSERT INTO talk VALUES (?,?,?,?,?,?,?);'
    let data0 = [null, data.t_text, data.b_id, data.aid, data.username, new Date().toLocaleString(), 1]
    conn.query(sql, data0, (err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        }
    });
    //查找评论
    let sql2 = 'SELECT * FROM talk WHERE  b_id=?  AND t_status=1';
    conn.query(sql2, data.b_id, (err, result) => {
        if (err) {
            console.log(err);
            res.json({ r: 'db_err' });
            return;
        };
        data.talks = result.reverse();
        res.json(data)
    });
});

//收藏
router.get('/col', (req, res) => {
    let data = {};
    data.username = req.session.username;
    data.aid = req.session.aid;
    data.b_id = req.query.b_id;
    data.status = req.query.c_status;
    console.log(data);
    if (data.status == 0) {
        let sql = 'INSERT INTO collection VALUES (?,?,?,?,?);'
        let data0 = [null, data.aid, data.b_id, new Date().toLocaleString(), 1];
        conn.query(sql, data0, (err, result) => {
            if (err) {
                console.log(err);
                res.json({ r: 'db_err' });
                return;
            }
            res.json({ col:'取消收藏',c_status:1 });
        })
    } else {
        let sql = 'DELETE FROM collection WHERE u_id=? AND b_id=?'
        let data0 = [data.aid, data.b_id];
        conn.query(sql, data0, (err, result) => {
            if (err) {
                console.log(err);
                res.json({ r: 'db_err' });
                return;
            }
            res.json({ col:'收藏',c_status:0 });
        })
    }

})

//推荐
router.get('/score', (req, res) => {
    // console.log(req)
    let data = {};
    data.username = req.session.username;
    data.aid = req.session.aid;
    data.b_id = req.query.b_id;
    data.status = req.query.s_status;
    console.log(data);
    if (data.status == 0) {
        let sql = 'INSERT INTO score VALUES (?,?,?,?,?);';
        let data0 = [null, data.aid, data.b_id, new Date().toLocaleString(), 1];
        conn.query(sql, data0, (err, result) => {
            if (err) {
                console.log(err);
                res.json({ r: 'db_err' });
                return;
            }
        });
        // let sql1='UPDATE books SET b_score = b_score+1';
        // conn.query(sql1, data0, (err, result) => {
        //     if (err) {
        //         console.log(err);
        //         res.json({ r: 'db_err' });
        //         return;
        //     }
        // });

        res.json({ score:'取消推荐',s_status:1 });

    } else {
        let sql = 'DELETE FROM score WHERE u_id=? AND b_id=?'
        let data0 = [data.aid, data.b_id];
        conn.query(sql, data0, (err, result) => {
            if (err) {
                console.log(err);
                res.json({ r: 'db_err' });
                return;
            }
            res.json({ score:'推荐',s_status:0 });
        })
    }

})
module.exports = router;
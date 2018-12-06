const express = require('express');
const async = require('async');
const router = express.Router();

//注册
router.post('/signup', (req, res) => {
    let d = req.body;
    // //首先验证验证码
    // console.log(d.coder)
    // console.log(req.session)
    // if(d.coder.toLowerCase() != req.session.coder.toLowerCase()){
    //     res.json({r:'coder_err'});
    //     return ;
    // }
    // //进行数据输入
    let sql = 'SELECT * from user where u_name=?';
    conn.query(sql, d.name, (err, result) => {
        // //账号是不是存在
        if (!result.length) {
            let sql = 'INSERT into user (u_name,u_tel,u_password,u_sex) VALUES (?,?,?,?)';
            conn.query(sql, [d.name, d.tel, d.password, d.sex], (err, result) => {
                if (err) {
                    console.log(err);
                    res.json({ r: 'db_err' });
                    return;
                };
                res.json({ r: "ok" })
            })
        }
        else {
            res.json({ r: "error" })
        }
    });

});

//登录
router.post('/login', (req, res)=>{
    let d = req.body;
    // //进行数据验证
    let sql = 'SELECT * FROM user WHERE u_status = 1 AND u_name = ?';
    conn.query(sql, d.name, (err, result)=>{
        //账号是不是存在
        if(!result.length){
            res.json({r:'u_not'});
            return ;
        }
        //判断密码是否正确
        if(d.password!= result[0].u_password){
            res.json({r:'p_err'});
            return ;
        }
        //登录成功
        //保存session信息
        req.session.aid = result[0].u_id;
        req.session.username = result[0].u_name;
        //更新状态
        let sql = 'UPDATE user SET  u_lasttime = ? u_status = ? WHERE u_name = ?';
        conn.query(sql, [new Date().toLocaleString(),0,result[0].u_name], (err, result)=>{
            res.json({r:'ok',username:d.name});
        });
        
    });
});


module.exports = router;
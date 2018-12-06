<template>
    <div class="footer-box">
        <div class="footer">
            <span>{{msg1}}</span>
            <ul class="footer-link">
                <li>
                    <a href="###">成为译者</a>
                </li>
                <li>
                    <a href="###">成为作者</a>
                </li>
                <li>
                    <a href="###">加入我们</a>
                </li>
                <li>
                    <a href="###">联系我们</a>
                </li>
            </ul>
            <div class="footer-bottom">
                京ICP备11039595号 京公网安备11010502011375 新出发京零字第东110150号 统一社会信用代码 91110101777086608F
            </div>
        </div>
    </div>
</template>

<script>
export default {
  name: "Footer",
  data() {
    return {
      msg1:"2005-2018 © 非读BOOK文化发展有限公司 · All Rights Reserved"
    };
  }
};
</script>

<style>
    .footer-box {
        background-color: #f2f2f2;
        color: #666;
        padding: 30px 0;
    }
    .footer {
        padding: 0 180px;
        font-size: 14px;
    }
    .footer-link {
        float: right;
    }
    .footer-link li{
        float: left;
        padding: 0 20px;
        list-style-type: none;

    }
    .footer-link li a {
        color: #23527c;
        font-size: 14px;

    }
    .footer-link li a:hover {
        color: #e71
    }
    .footer-bottom {
        color: #cccccc;
        margin-top: 25px
    }
</style>


---
title: Ví dụ
slug: Web/SVG/Guides/Namespaces_crash_course/Example
page-type: guide
sidebar: svgref
---

Trong ví dụ này, chúng ta dùng [XHTML](/en-US/docs/Glossary/XHTML), [SVG](/en-US/docs/Web/SVG), [JavaScript](/en-US/docs/Web/JavaScript) và [DOM](/en-US/docs/Web/API/Document_Object_Model) để tạo chuyển động cho một bầy "mote". Những mote này chịu sự điều khiển bởi hai nguyên tắc cơ bản. Thứ nhất, mỗi mote cố gắng di chuyển về phía con trỏ chuột, và thứ hai, mỗi mote cố gắng di chuyển ra xa vị trí trung bình của bầy mote. Kết hợp lại, ta có được một hành vi rất tự nhiên.

[Xem ví dụ](https://mdn.dev/archives/media/samples/svg/swarm-of-motes.xhtml). Ví dụ được liên kết này được viết theo các thực hành tốt nhất năm 2006. Ví dụ bên dưới đã được cập nhật theo các thực hành tốt nhất của JavaScript hiện đại. Cả hai đều hoạt động.

```xml
<?xml version='1.0'?>
<html xmlns="http://www.w3.org/1999/xhtml"
  xmlns:svg="http://www.w3.org/2000/svg">
  <head>
  <title>Một bầy mote</title>
  <style>
  <![CDATA[
label,
input {
  width: 150px;
  display: block;
  float: left;
  margin-bottom: 10px;
}
label {
  text-align: right;
  width: 75px;
  padding-right: 20px;
}
br {
  clear: left;
}
  ]]>
  </style>
  </head>
  <body onload='update()'>
    <svg:svg id='display' width='400' height='300'>
      <svg:circle id='cursor' cx='200'
cy='150' r='7' fill='blue' fill-opacity='0.5'/>
    </svg:svg>

    <p>Một bầy mote, được chi phối bởi hai nguyên tắc cơ bản.
    Thứ nhất, mỗi mote cố gắng di chuyển về phía con trỏ, và
    thứ hai, mỗi mote cố gắng di chuyển ra xa vị trí trung bình
    của bầy mote. Kết hợp lại, ta có được một hành vi trông rất
    tự nhiên.
    </p>

    <div>
    (C) 2006 <a id='email-me' href='#'>Nick Johnson</a>

    <script>
    <![CDATA[
      // ngăn bot spam
      let email = "@riovia.net";
      email = "nick" + email;
      document.getElementById("email-me").href = "mailto:" + email;
    ]]>
    </script>
    Phần mềm này hoàn toàn miễn phí để bạn sử dụng theo bất kỳ cách nào,
    và không đi kèm bất kỳ bảo hành nào.
    </div>

    <form action="" onsubmit="return false;">
      <p>
      <label>Số lượng mote:</label>
        <input id='num_motes' value='5'/>
        <br/>

      <label>Vận tốc tối đa:</label>
        <input id='max_velocity' value='15'/>
        <br/>

      <label>Lực hút về con trỏ:</label>
        <input id='attract_cursor' value='6'/>
        <br/>

      <label>Lực đẩy từ các mote khác:</label>
        <input id='repel_peer' value='5'/>
        <br/>
      </p>
    </form>

  <script>
  <![CDATA[
    // Mảng các mote
    let motes;

    // Lấy phần tử hiển thị.
    function Display() {
      return document.getElementById("display");
    }

    // Xác định kích thước của phần tử hiển thị.
    // Trả về dưới dạng bộ đôi (x,y) trong một mảng
    function Dimensions() {
      // Phần tử kết xuất của chúng ta
      const display = Display();
      const width = parseInt(display.getAttributeNS(null, "width"), 10);
      const height = parseInt(display.getAttributeNS(null, "height"), 10);

      return [width, height];
    }

    // Hàm này được gọi bởi sự kiện di chuyển chuột
    const mouse_x = 200;
    const mouse_y = 150;
    function OnMouseMove(evt) {
      mouse_x = evt.clientX;
      mouse_y = evt.clientY;

      const widget = document.getElementById("cursor");
      widget.setAttributeNS(null, "cx", mouse_x);
      widget.setAttributeNS(null, "cy", mouse_y);
    }
    document.onmousemove = OnMouseMove;

    // Xác định (x,y) của con trỏ
    function Cursor() {
      return [mouse_x, mouse_y];
    }

    // Xác định vị trí trung bình (x,y) của bầy mote
    function AverageMotePosition() {
      if (!motes || motes.length === 0) {
        return [0, 0];
      }

      const sum_x = 0;
      const sum_y = 0;
      for (const mote of motes) {
        sum_x += mote.x;
        sum_y += mote.y;
      }

      return [sum_x / motes.length, sum_y / motes.length];
    }

    // Một bộ sinh số ngẫu nhiên gọn hơn, trả về số nguyên
    function Rand(modulo) {
      return Math.round(Math.random() * (modulo - 1));
    }

    // Lớp Mote
    function Mote() {
      // Kích thước của vùng vẽ.
      const dims = Dimensions();
      const width = dims[0];
      const height = dims[1];

      // Chọn một tọa độ ngẫu nhiên để bắt đầu.
      this.x = Rand(width);
      this.y = Rand(height);

      // Vận tốc ban đầu bằng 0.
      this.vx = this.vy = 0;

      // Một phần tử trực quan, ban đầu là null
      this.elt = null;
    }

    // Biến nó thành một lớp.
    new Mote();

    // Mote::applyForce() — Điều chỉnh vận tốc
    // hướng về vị trí đã cho.
    // Cảnh báo: đây là giả vật lý — không thực sự
    // tuân theo bất kỳ nguyên lý vật lý /thực/ nào.
    Mote.prototype.applyForce = function (pos, mag) {
      if (pos[0] > this.x) {
        this.vx += mag;
      } else if (pos[0] < this.x) {
        this.vx -= mag;
      }

      if (pos[1] > this.y) {
        this.vy += mag;
      } else if (pos[1] < this.y) {
        this.vy -= mag;
      }
    };

    // Mote::capVelocity() — Áp dụng giới hạn trên
    // cho vận tốc của mote.
    Mote.prototype.capVelocity = function () {
      const max = parseInt(document.getElementById("max_velocity").value, 10);

      if (max < this.vx) {
        this.vx = max;
      } else if (-max > this.vx) {
        this.vx = -max;
      }

      if (max < this.vy) {
        this.vy = max;
      } else if (-max > this.vy) {
        this.vy = -max;
      }
    };

    // Mote::capPosition() — Áp dụng giới hạn trên/dưới
    // cho vị trí của mote.
    Mote.prototype.capPosition = function () {
      const dims = Dimensions();
      if (this.x < 0) {
        this.x = 0;
      } else if (this.x >= dims[0]) {
        this.x = dims[0] - 1;
      }

      if (this.y < 0) {
        this.y = 0;
      } else if (this.y >= dims[1]) {
        this.y = dims[1] - 1;
      }
    };

    // Mote::move() — di chuyển một mote, cập nhật màn hình.
    Mote.prototype.move = function () {
      // Áp lực hút về con trỏ.
      const attract = parseInt(document.getElementById("attract_cursor").value, 10);
      const cursor = Cursor();
      this.applyForce(cursor, attract);

      // Áp lực đẩy ra khỏi vị trí trung bình của bầy mote.
      const repel = parseInt(document.getElementById("repel_peer").value, 10);
      const average = AverageMotePosition();
      this.applyForce(average, -repel);

      // Thêm một chút ngẫu nhiên vào vận tốc.
      this.vx += Rand(3) - 1;
      this.vy += Rand(3) - 1;

      // Đặt giới hạn trên cho vận tốc.
      this.capVelocity();

      // Áp dụng vận tốc.
      const old_x = this.x;
      const old_y = this.y;
      this.x += this.vx;
      this.y += this.vy;
      this.capPosition();

      // Vẽ nó.
      if (this.elt === null) {
        const svg = "http://www.w3.org/2000/svg";
        this.elt = document.createElementNS(svg, "line");
        this.elt.setAttributeNS(null, "stroke", "green");
        this.elt.setAttributeNS(null, "stroke-width", "3");
        this.elt.setAttributeNS(null, "stroke-opacity", "0.5");
        Display().appendChild(this.elt);
      }

      this.elt.setAttributeNS(null, "x1", old_x);
      this.elt.setAttributeNS(null, "y1", old_y);

      this.elt.setAttributeNS(null, "x2", this.x);
      this.elt.setAttributeNS(null, "y2", this.y);
    };

    function update() {
      // Lần gọi đầu tiên?
      if (!motes) {
        motes = [];
      }

      // Cần có bao nhiêu mote?
      let num = parseInt(document.getElementById("num_motes").value, 10);
      if (num < 0) {
        num = 0;
      }

      // Đảm bảo chúng ta có đúng số lượng đó...
      // Ít hơn?
      while (motes.length < num) {
        motes.push(new Mote());
      }

      // Hay nhiều hơn?
      if (num === 0) {
        motes = [];
      } else if (motes.length > num) {
        motes = motes.slice(0, num - 1);
      }

      // Di chuyển một mote ngẫu nhiên
      if (motes.length > 0) {
        motes[Rand(motes.length)].move();
      }

      // Và làm lại sau 1/100 giây
      setTimeout(() => update(), 10);
    }
  ]]>
  </script>
  </body>
</html>
```

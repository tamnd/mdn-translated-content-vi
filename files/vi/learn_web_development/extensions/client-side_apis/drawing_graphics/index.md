---
title: Vẽ đồ họa
slug: Learn_web_development/Extensions/Client-side_APIs/Drawing_graphics
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_APIs/Video_and_audio_APIs", "Learn_web_development/Extensions/Client-side_APIs/Client-side_storage", "Learn_web_development/Extensions/Client-side_APIs")}}

Trình duyệt có một số công cụ lập trình đồ họa rất mạnh mẽ, từ ngôn ngữ Đồ họa Vector có thể mở rộng ([SVG](/en-US/docs/Web/SVG)), đến các API để vẽ trên các phần tử HTML {{htmlelement("canvas")}}, (xem [Canvas API](/en-US/docs/Web/API/Canvas_API) và [WebGL](/en-US/docs/Web/API/WebGL_API)). Bài viết này cung cấp phần giới thiệu về canvas và các tài nguyên khác để bạn có thể tìm hiểu thêm.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>
        Quen thuộc với <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a>, <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">CSS</a>, và <a href="/en-US/docs/Learn_web_development/Core/Scripting">JavaScript</a>, đặc biệt là <a href="/en-US/docs/Learn_web_development/Core/Scripting/Object_basics">kiến thức cơ bản về đối tượng JavaScript</a> và kiến thức cốt lõi về API như <a href="/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting">lập trình DOM</a> và <a href="/en-US/docs/Learn_web_development/Core/Scripting/Network_requests">Yêu cầu mạng</a>.
      </td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Các khái niệm và trường hợp sử dụng được bật bởi các API được đề cập trong bài học này.</li>
          <li>Cú pháp cơ bản và cách sử dụng <code>&lt;canvas&gt;</code> và các API liên quan.</li>
          <li>Sử dụng bộ đếm thời gian và <code>requestAnimationFrame()</code> để thiết lập vòng lặp hoạt ảnh.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Đồ họa trên Web

Ban đầu Web chỉ là văn bản, điều này rất nhàm chán, vì vậy các hình ảnh đã được giới thiệu — đầu tiên qua phần tử {{htmlelement("img")}} và sau này qua các thuộc tính CSS như {{cssxref("background-image")}}, và [SVG](/en-US/docs/Web/SVG).

Tuy nhiên điều này vẫn chưa đủ. Mặc dù bạn có thể sử dụng [CSS](/en-US/docs/Learn_web_development/Core/Styling_basics) và [JavaScript](/en-US/docs/Learn_web_development/Core/Scripting) để tạo hoạt ảnh (và thao tác theo cách khác) với các hình ảnh vector SVG — vì chúng được biểu diễn bằng đánh dấu — vẫn không có cách nào để làm điều tương tự cho các hình ảnh bitmap, và các công cụ có sẵn khá hạn chế. Web vẫn không có cách để tạo hiệu quả các hoạt ảnh, trò chơi, cảnh 3D và các yêu cầu khác thường được xử lý bởi các ngôn ngữ cấp thấp hơn như C++ hoặc Java.

Tình hình bắt đầu cải thiện khi các trình duyệt bắt đầu hỗ trợ phần tử {{htmlelement("canvas")}} và [Canvas API](/en-US/docs/Web/API/Canvas_API) liên quan vào năm 2004. Như bạn sẽ thấy bên dưới, canvas cung cấp một số công cụ hữu ích để tạo các hoạt ảnh 2D, trò chơi, trực quan hóa dữ liệu và các loại ứng dụng khác, đặc biệt khi kết hợp với một số API khác mà nền tảng web cung cấp, nhưng có thể khó hoặc không thể làm cho chúng có thể truy cập được.

Ví dụ dưới đây cho thấy một hoạt ảnh quả bóng nảy 2D dựa trên canvas đơn giản mà chúng ta đã gặp trong mô-đun [Giới thiệu đối tượng JavaScript](/en-US/docs/Learn_web_development/Extensions/Advanced_JavaScript_objects/Object_building_practice):

```html hidden live-sample___bouncing-balls
<h1>bouncing balls</h1>
<canvas></canvas>
```

```css hidden live-sample___bouncing-balls
html,
body {
  margin: 0;
}

html {
  font-family: "Helvetica Neue", "Helvetica", "Arial", sans-serif;
  height: 100%;
}

body {
  overflow: hidden;
  height: inherit;
}

h1 {
  font-size: 2rem;
  letter-spacing: -1px;
  position: absolute;
  margin: 0;
  top: -4px;
  right: 5px;

  color: transparent;
  text-shadow: 0 0 4px white;
}
```

```js hidden live-sample___bouncing-balls
// set up canvas

const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

const width = (canvas.width = window.innerWidth);
const height = (canvas.height = window.innerHeight);

// function to generate random number

function random(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
}

// function to generate random RGB color value

function randomRGB() {
  return `rgb(${random(0, 255)} ${random(0, 255)} ${random(0, 255)})`;
}

const balls = [];

class Ball {
  constructor(x, y, velX, velY, color, size) {
    this.x = x;
    this.y = y;
    this.velX = velX;
    this.velY = velY;
    this.color = color;
    this.size = size;
  }

  draw() {
    ctx.beginPath();
    ctx.fillStyle = this.color;
    ctx.arc(this.x, this.y, this.size, 0, 2 * Math.PI);
    ctx.fill();
  }

  update() {
    if (this.x + this.size >= width) {
      this.velX = -Math.abs(this.velX);
    }
    if (this.x - this.size <= 0) {
      this.velX = Math.abs(this.velX);
    }
    if (this.y + this.size >= height) {
      this.velY = -Math.abs(this.velY);
    }
    if (this.y - this.size <= 0) {
      this.velY = Math.abs(this.velY);
    }
    this.x += this.velX;
    this.y += this.velY;
  }

  collisionDetect() {
    for (const ball of balls) {
      if (!(this === ball)) {
        const dx = this.x - ball.x;
        const dy = this.y - ball.y;
        const distance = Math.sqrt(dx * dx + dy * dy);

        if (distance < this.size + ball.size) {
          ball.color = this.color = randomRGB();
        }
      }
    }
  }
}

while (balls.length < 25) {
  const size = random(10, 20);
  const ball = new Ball(
    random(0 + size, width - size),
    random(0 + size, height - size),
    random(-7, 7),
    random(-7, 7),
    randomRGB(),
    size,
  );

  balls.push(ball);
}

function loop() {
  ctx.fillStyle = "rgb(0 0 0 / 25%)";
  ctx.fillRect(0, 0, width, height);

  for (const ball of balls) {
    ball.draw();
    ball.update();
    ball.collisionDetect();
  }

  requestAnimationFrame(loop);
}

loop();
```

{{EmbedLiveSample("bouncing-balls", "100%", 400)}}

## Cơ bản về Canvas 2D

Để thiết lập canvas, bạn cần một phần tử {{htmlelement("canvas")}} trong HTML:

```html
<canvas width="320" height="240"></canvas>
```

Điều này tạo ra một canvas 320 x 240 pixel trên trang.

Bên trong thẻ `<canvas>`, bạn có thể đặt một số nội dung dự phòng, hiển thị nếu canvas không được hỗ trợ trong trình duyệt của người dùng.

Bây giờ hãy xem cách tạo ngữ cảnh 2D canvas và thực hiện vẽ một số hình trên đó.

### Thiết lập ngữ cảnh

Để vẽ trên canvas bằng JavaScript, bạn phải trước tiên lấy tham chiếu đến phần tử canvas, sau đó lấy ngữ cảnh kết xuất đồ họa 2D:

```js
const canvas = document.querySelector(".myCanvas");
const width = (canvas.width = window.innerWidth);
const height = (canvas.height = window.innerHeight);

const ctx = canvas.getContext("2d");
```

Tiếp theo, chúng ta đặt màu nền bằng cách điền vào toàn bộ canvas với màu đen:

```js
ctx.fillStyle = "rgb(0 0 0)";
ctx.fillRect(0, 0, width, height);
```

### Vẽ hình chữ nhật

Sử dụng `fillRect()` để vẽ hình chữ nhật được lấp đầy:

```js
ctx.fillStyle = "rgb(255 0 0)";
ctx.fillRect(50, 50, 100, 150);
```

Bốn tham số là: tọa độ X và Y của góc trên bên trái, và chiều rộng và chiều cao.

### Vẽ đường và hình

Sử dụng `strokeRect()` để vẽ đường viền hình chữ nhật, `beginPath()`, `moveTo()`, `lineTo()` và `stroke()` để vẽ đường thẳng.

### Vẽ vòng tròn

Sử dụng phương thức `arc()` để vẽ vòng tròn:

```js
ctx.fillStyle = "rgb(0 0 255)";
ctx.beginPath();
ctx.arc(150, 106, 50, degToRad(0), degToRad(360), false);
ctx.fill();
```

### Văn bản

Canvas cũng có thể hiển thị văn bản:

```js
ctx.strokeStyle = "white";
ctx.lineWidth = 1;
ctx.font = "36px arial";
ctx.strokeText("Canvas text", 50, 50);

ctx.fillStyle = "red";
ctx.font = "48px georgia";
ctx.fillText("Canvas text", 50, 150);
```

### Vẽ hình ảnh

Bạn có thể vẽ hình ảnh vào canvas:

```js
const image = new Image();
image.src = "firefox.png";
image.addEventListener("load", () => ctx.drawImage(image, 20, 20));
```

## Vòng lặp và hoạt ảnh

Chúng ta có thể kết hợp canvas với `requestAnimationFrame()` để tạo hoạt ảnh:

```js
function loop() {
  ctx.fillStyle = "rgb(0 0 0 / 25%)";
  ctx.fillRect(0, 0, width, height);

  for (const ball of balls) {
    ball.draw();
    ball.update();
    ball.collisionDetect();
  }

  requestAnimationFrame(loop);
}

loop();
```

Quá trình tạo hoạt ảnh canvas thường bao gồm các bước sau:

1. Xóa nội dung canvas (ví dụ: bằng `fillRect()` hoặc `clearRect()`).
2. Lưu trạng thái (nếu cần) bằng `save()`.
3. Vẽ đồ họa bạn đang tạo hoạt ảnh.
4. Khôi phục các cài đặt bạn đã lưu trong bước 2, bằng `restore()`.
5. Gọi `requestAnimationFrame()` để lên lịch vẽ khung tiếp theo của hoạt ảnh.

## WebGL

Bây giờ đã đến lúc rời khỏi 2D, và xem xét nhanh canvas 3D. Nội dung canvas 3D được chỉ định bằng [WebGL API](/en-US/docs/Web/API/WebGL_API), là một API hoàn toàn riêng biệt so với Canvas API 2D, mặc dù cả hai đều kết xuất trên các phần tử {{htmlelement("canvas")}}.

WebGL dựa trên [OpenGL](/en-US/docs/Glossary/OpenGL) (Thư viện đồ họa mở), và cho phép bạn giao tiếp trực tiếp với [GPU](/en-US/docs/Glossary/GPU) của máy tính. Do đó, viết WebGL thuần túy gần với các ngôn ngữ cấp thấp như C++ hơn JavaScript thông thường; nó khá phức tạp nhưng cực kỳ mạnh mẽ.

### Sử dụng thư viện

Do sự phức tạp của nó, hầu hết mọi người viết mã đồ họa 3D bằng cách sử dụng thư viện JavaScript bên thứ ba như [Three.js](/en-US/docs/Games/Techniques/3D_on_the_web/Building_up_a_basic_demo_with_Three.js), [PlayCanvas](/en-US/docs/Games/Techniques/3D_on_the_web/Building_up_a_basic_demo_with_PlayCanvas), hoặc [Babylon.js](/en-US/docs/Games/Techniques/3D_on_the_web/Building_up_a_basic_demo_with_Babylon.js). Hầu hết chúng hoạt động theo cách tương tự, cung cấp chức năng để tạo các hình dạng nguyên thủy và tùy chỉnh, định vị camera và ánh sáng xem, bao phủ bề mặt với kết cấu, và nhiều hơn nữa.

## Tóm tắt

Tại thời điểm này, bạn nên có ý tưởng hữu ích về những điều cơ bản của lập trình đồ họa sử dụng Canvas và WebGL và những gì bạn có thể làm với các API này. Hãy vui vẻ!

## Xem thêm

Ở đây chúng ta chỉ đề cập đến những điều cơ bản thực sự của canvas — còn rất nhiều điều để tìm hiểu! Các bài viết dưới đây sẽ đưa bạn xa hơn.

- [Hướng dẫn Canvas](/en-US/docs/Web/API/Canvas_API/Tutorial) — Một loạt hướng dẫn rất chi tiết giải thích những gì bạn nên biết về canvas 2D chi tiết hơn nhiều so với những gì được đề cập ở đây.
- [Hướng dẫn WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial) — Một loạt hướng dẫn dạy những điều cơ bản của lập trình WebGL thuần túy.
- [Xây dựng demo cơ bản với Three.js](/en-US/docs/Games/Techniques/3D_on_the_web/Building_up_a_basic_demo_with_Three.js) — hướng dẫn Three.js cơ bản.
- [Phát triển trò chơi](/en-US/docs/Games) — trang đích cho phát triển trò chơi web trên MDN.

## Ví dụ

- [Violent theremin](https://github.com/mdn/webaudio-examples/tree/main/violent-theremin) — Sử dụng Web Audio API để tạo âm thanh và canvas để tạo hình ảnh trực quan đẹp đi kèm.
- [Voice change-o-matic](https://github.com/mdn/webaudio-examples/tree/main/voice-change-o-matic) — Sử dụng canvas để trực quan hóa dữ liệu âm thanh thời gian thực từ Web Audio API.

{{PreviousMenuNext("Learn_web_development/Extensions/Client-side_APIs/Video_and_audio_APIs", "Learn_web_development/Extensions/Client-side_APIs/Client-side_storage", "Learn_web_development/Extensions/Client-side_APIs")}}

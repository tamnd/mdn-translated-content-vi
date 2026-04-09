---
title: Hoạt ảnh cơ bản
slug: Web/API/Canvas_API/Tutorial/Basic_animations
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial/Compositing", "Web/API/Canvas_API/Tutorial/Advanced_animations")}}

Vì chúng tôi đang sử dụng JavaScript để kiểm soát các phần tử {{HTMLElement("canvas")}} nên việc tạo hoạt ảnh (tương tác) cũng rất dễ dàng. Trong chương trình này, chúng tôi sẽ xem xét cách thực hiện một số hoạt động cơ bản.

Có chế độ tối đa nhất có thể là khi một hình ảnh được vẽ, nó sẽ được giữ nguyên như vậy. Nếu chúng ta cần chuyển nó, chúng ta phải vẽ lại nó và mọi thứ được vẽ trước đó. Phải mất rất nhiều thời gian để vẽ lại các khung phức tạp và hiệu suất phụ thuộc nhiều vào tốc độ của máy tính đang chạy.

## Các bước hoạt động cơ bản

Đây là bước bạn cần thực hiện để vẽ khung:

1. **Xóa khung**
   Trừ khi bạn sẽ vẽ đầy đủ các dạng hình vẽ (ví dụ: hình nền), bạn cần xóa tất cả các dạng đã được vẽ trước đó. Cách dễ dàng nhất để thực hiện công việc này là sử dụng phương pháp {{domxref("CanvasRenderingContext2D.clearRect", "clearRect()")}}.
2. **Lưu trạng thái**
   Nếu bạn đang thay đổi bất kỳ cài đặt nào (chẳng hạn như loại, chuyển đổi, v.v.) ảnh hưởng đến canvas trạng thái và bạn muốn đảm bảo trạng thái ban đầu được sử dụng mỗi khi khung được vẽ, bạn cần lưu trạng thái ban đầu đó.
3. **Vẽ dưới dạng hoạt ảnh**
   Bước mà bạn thực hiện hiển thị khung hình thực tế.
4. **Khôi phục trạng thái**
   Nếu bạn đã lưu trạng thái, vui lòng khôi phục nó trước khi vẽ khung mới.

## Kiểm soát hoạt động

Các dạng hình ảnh được vẽ vào canvas bằng cách sử dụng canvas phương thức trực tiếp tiếp theo hoặc bằng cách gọi các tùy chỉnh hàm. Trong trường hợp bình thường, chúng tôi chỉ tìm thấy những kết quả này xuất hiện trên khung vẽ khi thực hiện xong lệnh. Ví dụ: không thể tạo ảnh hoạt động trong vòng lặp `for`.

Điều đó có nghĩa là họ cần một cách để thực hiện các chức năng vẽ của mình trong một khoảng thời gian. Có hai cách để điều khiển hoạt động như thế này.

### Cập nhật lịch trình

Đầu tiên là các chức năng {{domxref("Window.setInterval", "setInterval()")}}, {{domxref("Window.setTimeout", "setTimeout()")}} và {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}}, có thể được sử dụng để gọi một chức năng cụ thể trong một khoảng thời gian nhất định.

- {{domxref("Window.setInterval", "setInterval()")}}
  - : Bắt đầu thực hiện các chức năng liên tục được chỉ định bởi `function` mỗi mili giây `delay`.
- {{domxref("Window.setTimeout", "setTimeout()")}}
  - : Thực thi chức năng `function` được định nghĩa chỉ trong `delay` mili giây.
- {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}}
  - : Trình duyệt biết rằng bạn muốn thực hiện hoạt động và yêu cầu trình duyệt yêu cầu gọi một chức năng được chỉ định để cập nhật hoạt động trước lần sơn lại tiếp theo.

Nếu bạn không muốn bất kỳ tương tác nào của người dùng, bạn có thể sử dụng hàm `setInterval()` để thực thi mã hóa được cung cấp nhiều lần. Nếu muốn tạo trò chơi, chúng tôi có thể sử dụng các bàn phím hoặc chuột của các sự kiện để điều khiển hoạt động và sử dụng `setTimeout()`. Bằng cách cài đặt trình nghe bằng {{domxref("EventTarget.addEventListener", "addEventListener()")}}, chúng tôi nắm bắt được mọi hoạt động tương tác của người dùng và thực hiện các chức năng hoạt động của hình ảnh.

> [!NOTE]
> Trong các ví dụ bên dưới, chúng tôi sẽ sử dụng phương pháp {{domxref("Window.requestAnimationFrame()")}} để điều khiển hoạt động. Phương thức `requestAnimationFrame` cung cấp một cách tạo hình ảnh mượt mà và hiệu quả hơn bằng cách gọi khung hoạt động khi hệ thống sẵn sàng vẽ khung. Số lần gọi lại thường là 60 lần/giây và có thể giảm xuống thấp hơn khi chạy ở nền tab. Để biết thêm thông tin về hoạt động vòng lặp, đặc biệt dành cho trò chơi, hãy xem bài viết [Giải thích trò chơi điện tử](/en-US/docs/Games/Anatomy) trong [Khu vực phát triển trò chơi](/en-US/docs/Games) của chúng tôi.

## Một hệ mặt trời hoạt ảnh

Ví dụ này mô phỏng một mô hình nhỏ của hệ mặt trời của chúng ta.

### HTML

```html
<canvas id="canvas" width="300" height="300"></canvas>
```

### JavaScript

```js
const sun = new Image();
const moon = new Image();
const earth = new Image();
const ctx = document.getElementById("canvas").getContext("2d");

function init() {
  sun.src = "canvas_sun.png";
  moon.src = "canvas_moon.png";
  earth.src = "canvas_earth.png";
  window.requestAnimationFrame(draw);
}

function draw() {
  ctx.globalCompositeOperation = "destination-over";
  ctx.clearRect(0, 0, 300, 300); // clear canvas

  ctx.fillStyle = "rgb(0 0 0 / 40%)";
  ctx.strokeStyle = "rgb(0 153 255 / 40%)";
  ctx.save();
  ctx.translate(150, 150);

  // Earth
  const time = new Date();
  ctx.rotate(
    ((2 * Math.PI) / 60) * time.getSeconds() +
      ((2 * Math.PI) / 60000) * time.getMilliseconds(),
  );
  ctx.translate(105, 0);
  ctx.fillRect(0, -12, 40, 24); // Shadow
  ctx.drawImage(earth, -12, -12);

  // Moon
  ctx.save();
  ctx.rotate(
    ((2 * Math.PI) / 6) * time.getSeconds() +
      ((2 * Math.PI) / 6000) * time.getMilliseconds(),
  );
  ctx.translate(0, 28.5);
  ctx.drawImage(moon, -3.5, -3.5);
  ctx.restore();

  ctx.restore();

  ctx.beginPath();
  ctx.arc(150, 150, 105, 0, Math.PI * 2, false); // Earth orbit
  ctx.stroke();

  ctx.drawImage(sun, 0, 0, 300, 300);

  window.requestAnimationFrame(draw);
}

init();
```

### Kết quả

{{EmbedLiveSample("An_animated_solar_system", "310", "340")}}

## Một đồng hồ hoạt ảnh

Ví dụ: đây vẽ một đồng hồ hoạt ảnh, hiển thị thời gian hiện tại của bạn.

### HTML

```html
<canvas id="canvas" width="150" height="150">The current time</canvas>
```

### JavaScript

```js
function clock() {
  const now = new Date();
  const canvas = document.getElementById("canvas");
  const ctx = canvas.getContext("2d");
  ctx.save();
  ctx.clearRect(0, 0, 150, 150);
  ctx.translate(75, 75);
  ctx.scale(0.4, 0.4);
  ctx.rotate(-Math.PI / 2);
  ctx.strokeStyle = "black";
  ctx.fillStyle = "white";
  ctx.lineWidth = 8;
  ctx.lineCap = "round";

  // Hour marks
  ctx.save();
  for (let i = 0; i < 12; i++) {
    ctx.beginPath();
    ctx.rotate(Math.PI / 6);
    ctx.moveTo(100, 0);
    ctx.lineTo(120, 0);
    ctx.stroke();
  }
  ctx.restore();

  // Minute marks
  ctx.save();
  ctx.lineWidth = 5;
  for (let i = 0; i < 60; i++) {
    if (i % 5 !== 0) {
      ctx.beginPath();
      ctx.moveTo(117, 0);
      ctx.lineTo(120, 0);
      ctx.stroke();
    }
    ctx.rotate(Math.PI / 30);
  }
  ctx.restore();

  const sec = now.getSeconds();
  // To display a clock with a sweeping second hand, use:
  // const sec = now.getSeconds() + now.getMilliseconds() / 1000;
  const min = now.getMinutes();
  const hr = now.getHours() % 12;

  ctx.fillStyle = "black";

  // Write image description
  canvas.innerText = `The time is: ${hr}:${min}`;

  // Write Hours
  ctx.save();
  ctx.rotate(
    (Math.PI / 6) * hr + (Math.PI / 360) * min + (Math.PI / 21600) * sec,
  );
  ctx.lineWidth = 14;
  ctx.beginPath();
  ctx.moveTo(-20, 0);
  ctx.lineTo(80, 0);
  ctx.stroke();
  ctx.restore();

  // Write Minutes
  ctx.save();
  ctx.rotate((Math.PI / 30) * min + (Math.PI / 1800) * sec);
  ctx.lineWidth = 10;
  ctx.beginPath();
  ctx.moveTo(-28, 0);
  ctx.lineTo(112, 0);
  ctx.stroke();
  ctx.restore();

  // Write seconds
  ctx.save();
  ctx.rotate((sec * Math.PI) / 30);
  ctx.strokeStyle = "#D40000";
  ctx.fillStyle = "#D40000";
  ctx.lineWidth = 6;
  ctx.beginPath();
  ctx.moveTo(-30, 0);
  ctx.lineTo(83, 0);
  ctx.stroke();
  ctx.beginPath();
  ctx.arc(0, 0, 10, 0, Math.PI * 2, true);
  ctx.fill();
  ctx.beginPath();
  ctx.arc(95, 0, 10, 0, Math.PI * 2, true);
  ctx.stroke();
  ctx.fillStyle = "transparent";
  ctx.arc(0, 0, 3, 0, Math.PI * 2, true);
  ctx.fill();
  ctx.restore();

  ctx.beginPath();
  ctx.lineWidth = 14;
  ctx.strokeStyle = "#325FA2";
  ctx.arc(0, 0, 142, 0, Math.PI * 2, true);
  ctx.stroke();

  ctx.restore();

  window.requestAnimationFrame(clock);
}

window.requestAnimationFrame(clock);
```

### Kết quả

> [!NOTE]
> Mặc dù cập nhật chỉ hồ sơ mỗi giây một lần nhưng hình ảnh được cập nhật ở tốc độ 60 khung hình mỗi giây (hoặc ở tốc độ làm mới màn hình của trình duyệt web của bạn).
> Để hiển thị đồng hồ với kim giây quét, hãy thay thế `const sec` định nghĩa ở trên bằng phiên bản đã được nhận xét.

{{EmbedLiveSample("An_animated_clock", "180", "200")}}

## Một bức tranh toàn cảnh lặp lại

Trong ví dụ này, ảnh toàn cảnh được cuộn từ trái sang phải. Chúng tôi đang sử dụng [hình ảnh về Công viên Quốc gia Yosemite](https://commons.wikimedia.org/wiki/File:Capitan_Meadows,_Yosemite_National_Park.jpg) mà chúng tôi lấy từ Wikipedia, nhưng bạn có thể sử dụng bất kỳ hình ảnh nào lớn hơn khung vẽ.

### HTML

Bao HTML bao gồm {{HTMLElement("canvas")}} trong đó hình ảnh được cuộn. Lưu ý rằng chiều rộng và chiều cao được chỉ định ở đây phải khớp với giá trị của biến `canvasXSize` và `canvasYSize` trong JavaScript mã hóa.

```html
<canvas id="canvas" width="800" height="200"
  >Yosemite National Park, meadow at the base of El Capitan</canvas
>
```

### JavaScript

```js
const img = new Image();

// User Variables - customize these to change the image being scrolled, its
// direction, and the speed.
img.src = "capitan_meadows_yosemite_national_park.jpg";
const canvasXSize = 800;
const canvasYSize = 200;
const speed = 30; // lower is faster
const scale = 1.05;
const y = -4.5; // vertical offset

// Main program
const dx = 0.75;
let imgW;
let imgH;
let x = 0;
let clearX;
let clearY;
let ctx;

img.onload = () => {
  imgW = img.width * scale;
  imgH = img.height * scale;

  if (imgW > canvasXSize) {
    // Image larger than canvas
    x = canvasXSize - imgW;
  }

  // Check if image dimension is larger than canvas
  clearX = Math.max(imgW, canvasXSize);
  clearY = Math.max(imgH, canvasYSize);

  // Get canvas context
  ctx = document.getElementById("canvas").getContext("2d");

  // Set refresh rate
  return setInterval(draw, speed);
};

function draw() {
  ctx.clearRect(0, 0, clearX, clearY); // clear the canvas

  // If image is <= canvas size
  if (imgW <= canvasXSize) {
    // Reset, start from beginning
    if (x > canvasXSize) {
      x = -imgW + x;
    }

    // Draw additional image1
    if (x > 0) {
      ctx.drawImage(img, -imgW + x, y, imgW, imgH);
    }

    // Draw additional image2
    if (x - imgW > 0) {
      ctx.drawImage(img, -imgW * 2 + x, y, imgW, imgH);
    }
  } else {
    // Image is > canvas size
    // Reset, start from beginning
    if (x > canvasXSize) {
      x = canvasXSize - imgW;
    }

    // Draw additional image
    if (x > canvasXSize - imgW) {
      ctx.drawImage(img, x - imgW + 1, y, imgW, imgH);
    }
  }

  // Draw image
  ctx.drawImage(img, x, y, imgW, imgH);

  // Amount to move
  x += dx;
}
```

### Kết quả

{{EmbedLiveSample("A_looping_panorama", "830", "250")}}

## Chuột theo hình ảnh động

### HTML

```html
<canvas id="cw"
  >Animation creating multi-colored disappearing stream of light that follow the
  cursor as it moves over the image
</canvas>
```

### CSS

```css
#cw {
  position: fixed;
  z-index: -1;
}

body {
  margin: 0;
  padding: 0;
  background-color: rgb(0 0 0 / 5%);
}
```

### JavaScript

```js
const canvas = document.getElementById("cw");
const context = canvas.getContext("2d");
context.globalAlpha = 0.5;

const cursor = {
  x: innerWidth / 2,
  y: innerHeight / 2,
};

let particlesArray = [];

generateParticles(101);
setSize();
anim();

addEventListener("mousemove", (e) => {
  cursor.x = e.clientX;
  cursor.y = e.clientY;
});

addEventListener(
  "touchmove",
  (e) => {
    e.preventDefault();
    cursor.x = e.touches[0].clientX;
    cursor.y = e.touches[0].clientY;
  },
  { passive: false },
);

addEventListener("resize", () => setSize());

function generateParticles(amount) {
  for (let i = 0; i < amount; i++) {
    particlesArray[i] = new Particle(
      innerWidth / 2,
      innerHeight / 2,
      4,
      generateColor(),
      0.02,
    );
  }
}

function generateColor() {
  let hexSet = "0123456789ABCDEF";
  let finalHexString = "#";
  for (let i = 0; i < 6; i++) {
    finalHexString += hexSet[Math.ceil(Math.random() * 15)];
  }
  return finalHexString;
}

function setSize() {
  canvas.height = innerHeight;
  canvas.width = innerWidth;
}

function Particle(x, y, particleTrailWidth, strokeColor, rotateSpeed) {
  this.x = x;
  this.y = y;
  this.particleTrailWidth = particleTrailWidth;
  this.strokeColor = strokeColor;
  this.theta = Math.random() * Math.PI * 2;
  this.rotateSpeed = rotateSpeed;
  this.t = Math.random() * 150;

  this.rotate = () => {
    const ls = {
      x: this.x,
      y: this.y,
    };
    this.theta += this.rotateSpeed;
    this.x = cursor.x + Math.cos(this.theta) * this.t;
    this.y = cursor.y + Math.sin(this.theta) * this.t;
    context.beginPath();
    context.lineWidth = this.particleTrailWidth;
    context.strokeStyle = this.strokeColor;
    context.moveTo(ls.x, ls.y);
    context.lineTo(this.x, this.y);
    context.stroke();
  };
}

function anim() {
  requestAnimationFrame(anim);

  context.fillStyle = "rgb(0 0 0 / 5%)";
  context.fillRect(0, 0, canvas.width, canvas.height);

  particlesArray.forEach((particle) => particle.rotate());
}
```

### Kết quả

{{EmbedLiveSample("Mouse_following_animation", "500", "500")}}

## Các ví dụ khác

- [Hình ảnh động nâng cao](/en-US/docs/Web/API/Canvas_API/Tutorial/Advanced_animations)
  - : Chúng ta sẽ xem xét một số kỹ thuật hoạt ảnh và vật lý nâng cao trong chương trình tiếp theo.

{{PreviousNext("Web/API/Canvas_API/Tutorial/Compositing", "Web/API/Canvas_API/Tutorial/Advanced_animations")}}

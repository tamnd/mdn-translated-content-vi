---
title: Hoạt ảnh nâng cao
slug: Web/API/Canvas_API/Tutorial/Advanced_animations
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial/Basic_animations", "Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas")}}

Trong chương trước, chúng ta đã thực hiện một số [hoạt ảnh cơ bản](/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations) và biết cách khiến mọi thứ chuyển động. Trong phần này, chúng ta sẽ xem xét kỹ hơn về chuyển động và sẽ thêm một số vật lý để làm cho hoạt ảnh của chúng ta nâng cao hơn.

## Vẽ một quả bóng

Chúng ta sẽ sử dụng một quả bóng cho nghiên cứu hoạt ảnh của mình, vì vậy trước tiên hãy vẽ quả bóng đó lên khung vẽ. Đoạn mã sau sẽ thiết lập cho chúng ta.

```html
<canvas id="canvas" width="600" height="300"></canvas>
```

Như thường lệ, trước tiên chúng ta cần bối cảnh vẽ. Để vẽ quả bóng, chúng ta sẽ tạo một đối tượng `ball` chứa các thuộc tính và phương thức `draw()` để vẽ nó trên canvas.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");

const ball = {
  x: 100,
  y: 100,
  radius: 25,
  color: "blue",
  draw() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
  },
};

ball.draw();
```

Không có gì đặc biệt ở đây, quả bóng thực chất là một hình tròn đơn giản và được vẽ bằng phương pháp {{domxref("CanvasRenderingContext2D.arc()", "arc()")}}.

## Thêm vận tốc

Bây giờ chúng ta đã có một quả bóng, chúng ta đã sẵn sàng thêm một hoạt ảnh cơ bản như chúng ta đã học trong [chương cuối](/en-US/docs/Web/API/Canvas_API/Tutorial/Basic_animations) của hướng dẫn này. Một lần nữa, {{domxref("window.requestAnimationFrame()")}} giúp chúng ta điều khiển hoạt ảnh. Quả bóng chuyển động bằng cách thêm một vectơ vận tốc vào vị trí. Đối với mỗi khung hình, chúng tôi cũng {{domxref("CanvasRenderingContext2D.clearRect", "clear", "", 1)}} canvas để loại bỏ các vòng tròn cũ khỏi các khung hình trước đó.

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let raf;

const ball = {
  x: 100,
  y: 100,
  vx: 5,
  vy: 2,
  radius: 25,
  color: "blue",
  draw() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
  },
};

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ball.draw();
  ball.x += ball.vx;
  ball.y += ball.vy;
  raf = window.requestAnimationFrame(draw);
}

canvas.addEventListener("mouseover", (e) => {
  raf = window.requestAnimationFrame(draw);
});

canvas.addEventListener("mouseout", (e) => {
  window.cancelAnimationFrame(raf);
});

ball.draw();
```

## Ranh giới

Nếu không có bất kỳ thử nghiệm va chạm ranh giới nào, quả bóng của chúng tôi sẽ nhanh chóng chạy ra khỏi khung vẽ. Chúng ta cần kiểm tra xem vị trí `x` và `y` của quả bóng có nằm ngoài kích thước canvas hay không và đảo ngược hướng của vectơ vận tốc. Để làm như vậy, chúng tôi thêm các bước kiểm tra sau vào phương pháp `draw`:

```js
if (
  ball.y + ball.vy > canvas.height - ball.radius ||
  ball.y + ball.vy < ball.radius
) {
  ball.vy = -ball.vy;
}
if (
  ball.x + ball.vx > canvas.width - ball.radius ||
  ball.x + ball.vx < ball.radius
) {
  ball.vx = -ball.vx;
}
```

### Bản demo đầu tiên

Chúng ta hãy xem nó hoạt động như thế nào cho đến nay.

#### HTML

```html
<canvas id="canvas" width="600" height="300"></canvas>
```

```css hidden
#canvas {
  border: 1px solid black;
}
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let raf;

const ball = {
  x: 100,
  y: 100,
  vx: 5,
  vy: 2,
  radius: 25,
  color: "blue",
  draw() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
  },
};

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ball.draw();
  ball.x += ball.vx;
  ball.y += ball.vy;

  if (
    ball.y + ball.vy > canvas.height - ball.radius ||
    ball.y + ball.vy < ball.radius
  ) {
    ball.vy = -ball.vy;
  }
  if (
    ball.x + ball.vx > canvas.width - ball.radius ||
    ball.x + ball.vx < ball.radius
  ) {
    ball.vx = -ball.vx;
  }

  raf = window.requestAnimationFrame(draw);
}

canvas.addEventListener("mouseover", (e) => {
  raf = window.requestAnimationFrame(draw);
});

canvas.addEventListener("mouseout", (e) => {
  window.cancelAnimationFrame(raf);
});

ball.draw();
```

#### Kết quả

Di chuyển chuột vào khung vẽ để bắt đầu hoạt ảnh.

{{EmbedLiveSample("First_demo", "610", "340")}}

## Tăng tốc

Để làm cho chuyển động trở nên chân thực hơn, bạn có thể chơi với vận tốc như thế này, ví dụ:

```js
ball.vy *= 0.99;
ball.vy += 0.25;
```

Điều này làm chậm vận tốc thẳng đứng của mỗi khung hình, để cuối cùng quả bóng sẽ nảy trên sàn.

### Bản demo thứ hai

#### HTML

```html
<canvas id="canvas" width="600" height="300"></canvas>
```

```css hidden
#canvas {
  border: 1px solid black;
}
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let raf;

const ball = {
  x: 100,
  y: 100,
  vx: 5,
  vy: 2,
  radius: 25,
  color: "blue",
  draw() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
  },
};

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  ball.draw();
  ball.x += ball.vx;
  ball.y += ball.vy;
  ball.vy *= 0.99;
  ball.vy += 0.25;

  if (
    ball.y + ball.vy > canvas.height - ball.radius ||
    ball.y + ball.vy < ball.radius
  ) {
    ball.vy = -ball.vy;
  }
  if (
    ball.x + ball.vx > canvas.width - ball.radius ||
    ball.x + ball.vx < ball.radius
  ) {
    ball.vx = -ball.vx;
  }

  raf = window.requestAnimationFrame(draw);
}

canvas.addEventListener("mouseover", (e) => {
  raf = window.requestAnimationFrame(draw);
});

canvas.addEventListener("mouseout", (e) => {
  window.cancelAnimationFrame(raf);
});

ball.draw();
```

#### Kết quả

{{EmbedLiveSample("Second_demo", "610", "340")}}

## Hiệu ứng kéo dài

Cho đến bây giờ chúng tôi đã sử dụng phương pháp {{domxref("CanvasRenderingContext2D.clearRect", "clearRect")}} khi xóa các khung hình trước đó. Nếu bạn thay thế phương pháp này bằng {{domxref("CanvasRenderingContext2D.fillRect", "fillRect")}} bán trong suốt, bạn có thể dễ dàng tạo hiệu ứng kéo dài.

```js
ctx.fillStyle = "rgb(255 255 255 / 30%)";
ctx.fillRect(0, 0, canvas.width, canvas.height);
```

### Bản demo thứ ba

#### HTML

```html
<canvas id="canvas" width="600" height="300"></canvas>
```

```css hidden
#canvas {
  border: 1px solid black;
}
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let raf;

const ball = {
  x: 100,
  y: 100,
  vx: 5,
  vy: 2,
  radius: 25,
  color: "blue",
  draw() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
  },
};

function draw() {
  ctx.fillStyle = "rgb(255 255 255 / 30%)";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ball.draw();
  ball.x += ball.vx;
  ball.y += ball.vy;
  ball.vy *= 0.99;
  ball.vy += 0.25;

  if (
    ball.y + ball.vy > canvas.height - ball.radius ||
    ball.y + ball.vy < ball.radius
  ) {
    ball.vy = -ball.vy;
  }
  if (
    ball.x + ball.vx > canvas.width - ball.radius ||
    ball.x + ball.vx < ball.radius
  ) {
    ball.vx = -ball.vx;
  }

  raf = window.requestAnimationFrame(draw);
}

canvas.addEventListener("mouseover", (e) => {
  raf = window.requestAnimationFrame(draw);
});

canvas.addEventListener("mouseout", (e) => {
  window.cancelAnimationFrame(raf);
});

ball.draw();
```

#### Kết quả

{{EmbedLiveSample("Third_demo", "610", "340")}}

## Thêm điều khiển chuột

Ví dụ: để kiểm soát bóng, chúng ta có thể làm cho nó di chuyển theo con chuột bằng cách sử dụng sự kiện [`mousemove`](/en-US/docs/Web/API/Element/mousemove_event). Sự kiện [`click`](/en-US/docs/Web/API/Element/click_event) thả bóng và để nó nảy trở lại.

### Bản demo thứ tư

#### HTML

```html
<canvas id="canvas" width="600" height="300"></canvas>
```

```css hidden
#canvas {
  border: 1px solid black;
}
```

#### JavaScript

```js
const canvas = document.getElementById("canvas");
const ctx = canvas.getContext("2d");
let raf;
let running = false;

const ball = {
  x: 100,
  y: 100,
  vx: 5,
  vy: 1,
  radius: 25,
  color: "blue",
  draw() {
    ctx.beginPath();
    ctx.arc(this.x, this.y, this.radius, 0, Math.PI * 2, true);
    ctx.closePath();
    ctx.fillStyle = this.color;
    ctx.fill();
  },
};

function clear() {
  ctx.fillStyle = "rgb(255 255 255 / 30%)";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
}

function draw() {
  clear();
  ball.draw();
  ball.x += ball.vx;
  ball.y += ball.vy;

  if (
    ball.y + ball.vy > canvas.height - ball.radius ||
    ball.y + ball.vy < ball.radius
  ) {
    ball.vy = -ball.vy;
  }
  if (
    ball.x + ball.vx > canvas.width - ball.radius ||
    ball.x + ball.vx < ball.radius
  ) {
    ball.vx = -ball.vx;
  }

  raf = window.requestAnimationFrame(draw);
}

canvas.addEventListener("mousemove", (e) => {
  if (!running) {
    clear();
    ball.x = e.clientX;
    ball.y = e.clientY;
    ball.draw();
  }
});

canvas.addEventListener("click", (e) => {
  if (!running) {
    raf = window.requestAnimationFrame(draw);
    running = true;
  }
});

canvas.addEventListener("mouseout", (e) => {
  window.cancelAnimationFrame(raf);
  running = false;
});

ball.draw();
```

#### Kết quả

Di chuyển quả bóng bằng chuột và thả nó ra bằng một cú nhấp chuột.

{{EmbedLiveSample("Fourth_demo", "610", "340")}}

## Đột phá

Chương ngắn này chỉ giải thích một số kỹ thuật để tạo hoạt ảnh nâng cao hơn. Còn nhiều nữa! Bạn nghĩ thế nào về việc thêm một mái chèo, một số viên gạch và biến bản demo này thành một trò chơi [Breakout](https://en.wikipedia.org/wiki/Breakout_%28video_game%29)? Hãy xem khu vực [Phát triển trò chơi](/en-US/docs/Games) của chúng tôi để biết thêm các bài viết liên quan đến trò chơi.

## Xem thêm

- {{domxref("window.requestAnimationFrame()")}}

{{PreviousNext("Web/API/Canvas_API/Tutorial/Basic_animations", "Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas")}}

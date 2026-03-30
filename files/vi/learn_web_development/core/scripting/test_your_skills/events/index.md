---
title: "Kiểm tra kỹ năng: Sự kiện"
short-title: "Kiểm tra: Sự kiện"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Events
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Event_bubbling","Learn_web_development/Core/Scripting/Object_basics", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Giới thiệu về sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Thao tác DOM: Hữu ích cần biết

Một số câu hỏi dưới đây yêu cầu bạn viết một số mã thao tác [DOM](/en-US/docs/Glossary/DOM) để hoàn thành — chẳng hạn như tạo các phần tử HTML mới, đặt nội dung văn bản của chúng bằng các giá trị chuỗi cụ thể, và lồng chúng vào trong các phần tử hiện có trên trang — tất cả thông qua JavaScript.

Chúng ta chưa dạy điều này một cách rõ ràng trong khóa học, nhưng bạn sẽ thấy một số ví dụ sử dụng nó, và chúng ta muốn bạn tự nghiên cứu về các DOM API bạn cần để trả lời thành công các câu hỏi. Một điểm khởi đầu tốt là hướng dẫn [Giới thiệu về DOM scripting](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting) của chúng ta.

## Sự kiện 1

Nhiệm vụ sự kiện đầu tiên của chúng ta liên quan đến {{htmlelement("button")}} mà, khi được nhấp, cập nhật nhãn văn bản của nó. HTML không nên thay đổi; chỉ có JavaScript.

Để hoàn thành nhiệm vụ, tạo trình lắng nghe sự kiện khiến văn bản bên trong nút (`btn`) thay đổi khi được nhấp, và thay đổi lại khi được nhấp một lần nữa.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("events-1", "100%", 80) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```css hidden live-sample___events-1 live-sample___events-1-finish
p {
  color: purple;
  margin: 0.5em 0;
}

* {
  box-sizing: border-box;
}

button {
  display: block;
  margin: 20px 0 20px 20px;
}

canvas {
  border: 1px solid black;
}
```

```html hidden live-sample___events-1 live-sample___events-1-finish
<button class="off">Machine is off</button>
```

```js live-sample___events-1
const btn = document.querySelector("button");

// Add your code here
```

Ví dụ cập nhật sẽ hoạt động như thế này (hãy thử nhấn nút):

{{ EmbedLiveSample("events-1-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js live-sample___events-1-finish
const btn = document.querySelector("button");

btn.addEventListener("click", () => {
  if (btn.className === "on") {
    btn.textContent = "Machine is off";
    btn.className = "off";
  } else {
    btn.textContent = "Machine is on";
    btn.className = "on";
  }
});
```

</details>

## Sự kiện 2

Bây giờ chúng ta sẽ xem xét các sự kiện bàn phím.

Để hoàn thành nhiệm vụ này, tạo trình lắng nghe sự kiện di chuyển vòng tròn quanh canvas được cung cấp khi các phím WASD được nhấn trên bàn phím. Vòng tròn được vẽ bằng hàm `drawCircle()`, nhận các tham số sau làm đầu vào:

- `x` — tọa độ x của vòng tròn.
- `y` — tọa độ y của vòng tròn.
- `size` — bán kính của vòng tròn.

> [!WARNING]
> Khi kiểm tra mã của bạn, bạn phải tập trung vào canvas trước khi thử các lệnh bàn phím (ví dụ: nhấp vào nó, hoặc tab đến nó bằng bàn phím). Nếu không, chúng sẽ không hoạt động.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("events-2", "100%", 350) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```html hidden live-sample___events-2 live-sample___events-2-finish
<canvas width="480" height="320" tabindex="0"> </canvas>
```

```css hidden live-sample___events-2 live-sample___events-2-finish
* {
  box-sizing: border-box;
}

canvas {
  border: 1px solid black;
}
```

```js live-sample___events-2
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

function drawCircle(x, y, size) {
  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  ctx.beginPath();
  ctx.fillStyle = "black";
  ctx.arc(x, y, size, 0, 2 * Math.PI);
  ctx.fill();
}

let x = 50;
let y = 50;
const size = 30;

drawCircle(x, y, size);
// Don't edit the code above here!

// Add your code here
```

Ví dụ cập nhật sẽ hoạt động như thế này (nhấp vào nó rồi thử các điều khiển bàn phím):

{{ EmbedLiveSample("events-2-finish", "100%", 350) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

window.addEventListener("keydown", (e) => {
  switch (e.key) {
    case "a":
      x -= 5;
      break;
    case "d":
      x += 5;
      break;
    case "w":
      y -= 5;
      break;
    case "s":
      y += 5;
      break;
  }

  drawCircle(x, y, size);
});
```

```js hidden live-sample___events-2-finish
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

function drawCircle(x, y, size) {
  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);

  ctx.beginPath();
  ctx.fillStyle = "black";
  ctx.arc(x, y, size, 0, 2 * Math.PI);
  ctx.fill();
}

let x = 50;
let y = 50;
const size = 30;

drawCircle(x, y, size);

window.addEventListener("keydown", (e) => {
  switch (e.key) {
    case "a":
      x -= 5;
      break;
    case "d":
      x += 5;
      break;
    case "w":
      y -= 5;
      break;
    case "s":
      y += 5;
      break;
  }

  drawCircle(x, y, size);
});
```

</details>

## Sự kiện 3

Trong nhiệm vụ sự kiện tiếp theo, bài kiểm tra kiến thức của bạn về sự kiện nổi bong bóng. Chúng ta muốn bạn đặt trình lắng nghe sự kiện trên phần tử cha của các `<button>` (`<div class="button-bar"> … </div>`) mà, khi được kích hoạt bằng cách nhấp vào bất kỳ nút nào, sẽ đặt nền của `button-bar` thành màu được chứa trong thuộc tính `data-color` của nút.

Chúng ta muốn bạn giải quyết vấn đề này mà không cần lặp qua tất cả các nút và gán cho mỗi nút trình lắng nghe sự kiện riêng.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("events-3", "100%", 80) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```html hidden live-sample___events-3 live-sample___events-3-finish
<div class="button-bar">
  <button data-color="red">Red</button>
  <button data-color="yellow">Yellow</button>
  <button data-color="green">Green</button>
  <button data-color="purple">Purple</button>
</div>
```

```css hidden live-sample___events-3 live-sample___events-3-finish
* {
  box-sizing: border-box;
}

html,
body,
.button-bar {
  height: 100%;
}

.button-bar {
  display: flex;
  align-items: center;
  justify-content: space-around;
}

button {
  padding: 5px 10px;
}
```

```js live-sample___events-3
const buttonBar = document.querySelector(".button-bar");

// Add your code here
```

Ví dụ cập nhật sẽ hoạt động như thế này (hãy thử nhấn các nút):

{{ EmbedLiveSample("events-3-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js live-sample___events-3-finish
const buttonBar = document.querySelector(".button-bar");

function setColor(e) {
  buttonBar.style.backgroundColor = e.target.getAttribute("data-color");
}

buttonBar.addEventListener("click", setColor);
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Event_bubbling","Learn_web_development/Core/Scripting/Object_basics", "Learn_web_development/Core/Scripting")}}

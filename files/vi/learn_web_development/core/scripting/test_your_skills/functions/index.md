---
title: "Kiểm tra kỹ năng: Hàm"
short-title: "Kiểm tra: Hàm"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Functions
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Return_values","Learn_web_development/Core/Scripting/Events", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu các bài viết [Hàm — các khối mã có thể tái sử dụng](/en-US/docs/Learn_web_development/Core/Scripting/Functions), [Xây dựng hàm của riêng bạn](/en-US/docs/Learn_web_development/Core/Scripting/Build_your_own_function), và [Giá trị trả về của hàm](/en-US/docs/Learn_web_development/Core/Scripting/Return_values) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Thao tác DOM: Hữu ích cần biết

Một số câu hỏi dưới đây yêu cầu bạn viết một số mã thao tác [DOM](/en-US/docs/Glossary/DOM) để hoàn thành — chẳng hạn như tạo các phần tử HTML mới, đặt nội dung văn bản của chúng bằng các giá trị chuỗi cụ thể, và lồng chúng vào trong các phần tử hiện có trên trang — tất cả thông qua JavaScript.

Chúng ta chưa dạy điều này một cách rõ ràng trong khóa học, nhưng bạn sẽ thấy một số ví dụ sử dụng nó, và chúng ta muốn bạn tự nghiên cứu về các DOM API bạn cần để trả lời thành công các câu hỏi. Một điểm khởi đầu tốt là hướng dẫn [Giới thiệu về DOM scripting](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting) của chúng ta.

## Thử thách tương tác

Trước tiên, chúng ta cung cấp cho bạn một thử thách tương tác thú vị liên quan đến giá trị trả về của hàm, được tạo bởi [đối tác học tập](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds) của chúng ta, [Scrimba](https://scrimba.com/home).

Xem scrim nhúng và hoàn thành nhiệm vụ trên dòng thời gian (biểu tượng bóng ma nhỏ) bằng cách làm theo hướng dẫn và chỉnh sửa mã. Khi bạn hoàn thành, bạn có thể tiếp tục xem scrim để kiểm tra xem giải pháp của giáo viên khớp với giải pháp của bạn như thế nào.

<mdn-scrim-inline url="https://scrimba.com/learn-javascript-c0v/~02h" scrimtitle="Returning values in functions" survey="true"></scrim-inline>

## Hàm 1

Để hoàn thành nhiệm vụ hàm đầu tiên của chúng ta:

1. Định nghĩa hàm `chooseName()` in một tên ngẫu nhiên từ mảng được cung cấp (`names`) vào đoạn văn được cung cấp (`para`).
2. Gọi hàm `chooseName()` một lần.

<!-- Code shared across examples -->

```html hidden live-sample___functions-1 live-sample___functions-3 live-sample___functions-4 live-sample___functions-1-finish
<p></p>
```

```css hidden live-sample___functions-1 live-sample___functions-3 live-sample___functions-4 live-sample___functions-1-finish
* {
  box-sizing: border-box;
}

p {
  color: purple;
  margin: 0.5em 0;
}
```

<!-- Example-specific code -->

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("functions-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___functions-1
const names = [
  "Chris",
  "Li Kang",
  "Anne",
  "Francesca",
  "Mustafa",
  "Tina",
  "Bert",
  "Jada",
];
const para = document.querySelector("p");

// Don't edit the code above here!

// Add your code here
```

Mã cập nhật của bạn sẽ xuất ra một tên ngẫu nhiên:

{{ EmbedLiveSample("functions-1-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

function chooseName() {
  const randomNumber = Math.floor(Math.random() * names.length);
  const choice = names[randomNumber];
  para.textContent = choice;
}

chooseName();
```

```js hidden live-sample___functions-1-finish
const names = [
  "Chris",
  "Li Kang",
  "Anne",
  "Francesca",
  "Mustafa",
  "Tina",
  "Bert",
  "Jada",
];
const para = document.querySelector("p");

function chooseName() {
  const randomNumber = Math.floor(Math.random() * names.length);
  const choice = names[randomNumber];
  para.textContent = choice;
}

chooseName();
```

</details>

## Hàm 2

Nhiệm vụ này yêu cầu bạn tạo hàm vẽ hình chữ nhật trên phần tử `<canvas>` được cung cấp (biến tham chiếu `canvas`, ngữ cảnh có trong `ctx`), dựa trên năm biến đầu vào được cung cấp:

- `x` — tọa độ x của hình chữ nhật.
- `y` — tọa độ y của hình chữ nhật.
- `width` — chiều rộng của hình chữ nhật.
- `height` — chiều cao của hình chữ nhật.
- `color` — màu sắc của hình chữ nhật.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị trong `<canvas>`):

{{ EmbedLiveSample("functions-2", "100%", 180) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```html hidden live-sample___functions-2 live-sample___functions-2-finish
<canvas width="240" height="160"></canvas>
```

```css hidden live-sample___functions-2 live-sample___functions-2-finish
canvas {
  border: 1px solid black;
}
```

```js live-sample___functions-2
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
const x = 50;
const y = 60;
const width = 100;
const height = 75;
const color = "blue";

// Don't edit the code above here!

// Add your code here
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("functions-2-finish", "100%", 180) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

function drawSquare(x, y, width, height, color) {
  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.fillStyle = color;
  ctx.fillRect(x, y, width, height);
}

drawSquare(x, y, width, height, color);
```

```js hidden live-sample___functions-2-finish
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
const x = 50;
const y = 60;
const width = 100;
const height = 75;
const color = "blue";

function drawSquare(x, y, width, height, color) {
  ctx.fillStyle = "white";
  ctx.fillRect(0, 0, canvas.width, canvas.height);
  ctx.fillStyle = color;
  ctx.fillRect(x, y, width, height);
}

drawSquare(x, y, width, height, color);
```

</details>

## Hàm 3

Trong nhiệm vụ này, bạn quay lại vấn đề được đặt ra trong Nhiệm vụ 1, với mục tiêu thực hiện ba cải tiến.

Để hoàn thành nhiệm vụ:

1. Tái cấu trúc mã tạo số ngẫu nhiên thành một hàm riêng gọi là `random()`, nhận hai tham số là giới hạn chung mà số ngẫu nhiên phải nằm trong khoảng, và trả về kết quả.
2. Cập nhật hàm `chooseName()` để nó sử dụng hàm số ngẫu nhiên, nhận mảng để chọn từ đó làm tham số (làm cho nó linh hoạt hơn), và trả về kết quả.
3. In kết quả trả về vào `textContent` của đoạn văn (`para`).

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("functions-3", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___functions-3
const names = [
  "Chris",
  "Li Kang",
  "Anne",
  "Francesca",
  "Mustafa",
  "Tina",
  "Bert",
  "Jada",
];
const para = document.querySelector("p");

// Don't edit the code above here!

// Update the code below here

function chooseName() {
  const randomNumber = Math.floor(Math.random() * names.length);
  const choice = names[randomNumber];
  para.textContent = choice;
}

chooseName();
```

Chúng ta chưa cung cấp nội dung hoàn chỉnh cho nhiệm vụ này vì nó trông giống với điểm khởi đầu. Mã chỉ được tái cấu trúc.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

function random(min, max) {
  const num = Math.floor(Math.random() * (max - min)) + min;
  return num;
}

function chooseName(array) {
  const choice = array[random(0, array.length)];
  return choice;
}

para.textContent = chooseName(names);
```

```js hidden
const names = [
  "Chris",
  "Li Kang",
  "Anne",
  "Francesca",
  "Mustafa",
  "Tina",
  "Bert",
  "Jada",
];
const para = document.querySelector("p");

function random(min, max) {
  const num = Math.floor(Math.random() * (max - min)) + min;
  return num;
}

function chooseName(array) {
  const choice = array[random(0, array.length)];
  return choice;
}

para.textContent = chooseName(names);
```

</details>

## Hàm 4

Trong nhiệm vụ này, chúng ta có một mảng tên và đang sử dụng {{jsxref("Array.filter()")}} để lấy mảng chỉ chứa các tên ngắn hơn 5 ký tự. Bộ lọc hiện đang được truyền một hàm được đặt tên `isShort()`. Hàm này kiểm tra độ dài của tên, trả về `true` nếu tên ngắn hơn 5 ký tự, và `false` nếu không.

Để hoàn thành nhiệm vụ, hãy cập nhật mã để chức năng bên trong `isShort()` thay vào đó được bao gồm trực tiếp bên trong lời gọi `filter()` như một hàm mũi tên. Xem bạn có thể làm cho nó gọn gàng như thế nào.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("functions-4", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___functions-4
const names = [
  "Chris",
  "Li Kang",
  "Anne",
  "Francesca",
  "Mustafa",
  "Tina",
  "Bert",
  "Jada",
];
const para = document.querySelector("p");

// Don't edit the code above here!

// Update the code below here

function isShort(name) {
  return name.length < 5;
}

const shortNames = names.filter(isShort);
para.textContent = shortNames;
```

Chúng ta chưa cung cấp nội dung hoàn chỉnh cho nhiệm vụ này vì nó trông giống với điểm khởi đầu. Mã chỉ được tái cấu trúc.

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

// Update the code below here

const shortNames = names.filter((name) => name.length < 5);
para.textContent = shortNames;
```

```js hidden
const names = [
  "Chris",
  "Li Kang",
  "Anne",
  "Francesca",
  "Mustafa",
  "Tina",
  "Bert",
  "Jada",
];
const para = document.querySelector("p");

const shortNames = names.filter((name) => name.length < 5);
para.textContent = shortNames;
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Return_values","Learn_web_development/Core/Scripting/Events", "Learn_web_development/Core/Scripting")}}

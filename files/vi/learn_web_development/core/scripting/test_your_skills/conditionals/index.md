---
title: "Kiểm tra kỹ năng: Điều kiện"
short-title: "Kiểm tra: Điều kiện"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Conditionals
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Conditionals", "Learn_web_development/Core/Scripting/Loops", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Đưa ra quyết định trong mã của bạn — điều kiện](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Điều kiện 1

Trong nhiệm vụ này, bạn được cung cấp hai biến:

- `season` — chứa một chuỗi cho biết mùa hiện tại là gì.
- `response` — bắt đầu chưa được khởi tạo, nhưng sau đó được sử dụng để lưu trữ phản hồi sẽ được in ra bảng kết quả.

Để hoàn thành nhiệm vụ:

1. Tạo một câu lệnh điều kiện kiểm tra xem `season` có chứa chuỗi "summer" không, và nếu có thì gán một chuỗi cho `response` đưa ra thông báo phù hợp về mùa cho người dùng. Nếu không, nó nên gán một chuỗi chung cho `response` cho người dùng biết chúng ta không biết đó là mùa gì.
2. Thêm một câu lệnh điều kiện khác kiểm tra xem `season` có chứa chuỗi "winter" không, và gán một chuỗi phù hợp cho `response`.

<!-- Code shared across examples -->

```html hidden live-sample___conditionals-1 live-sample___conditionals-2 live-sample___conditionals-3 live-sample___conditionals-1-finish live-sample___conditionals-2-finish live-sample___conditionals-3-finish
<section></section>
```

```css hidden live-sample___conditionals-1 live-sample___conditionals-2 live-sample___conditionals-3 live-sample___conditionals-1-finish live-sample___conditionals-2-finish live-sample___conditionals-3-finish
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

{{ EmbedLiveSample("conditionals-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___conditionals-1
let season = "summer";
let response;

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = response;
section.appendChild(para1);
```

Trạng thái ban đầu của đầu ra cập nhật của bạn sẽ trông như thế này:

{{ EmbedLiveSample("conditionals-1-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
let season = "summer";
let response;

if (season === "summer") {
  response = "It's probably nice and warm where you are; enjoy the sun!";
} else if (season === "winter") {
  response = "I hope you are not too cold. Put some warm clothes on!";
} else {
  response =
    "I don't know what the season is where you are. Hope you are well.";
}

// Don't edit the code below here!
// ...
```

```js hidden live-sample___conditionals-1-finish
let season = "summer";
let response;

if (season === "summer") {
  response = "It's probably nice and warm where you are; enjoy the sun!";
} else if (season === "winter") {
  response = "I hope you are not too cold. Put some warm clothes on!";
} else {
  response =
    "I don't know what the season is where you are. Hope you are well.";
}

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = response;
section.appendChild(para1);
```

</details>

## Điều kiện 2

Đối với nhiệm vụ này, bạn được cho ba biến:

- `machineActive`: Chứa chỉ báo về việc máy trả lời có được bật hay không (`true`/`false`).
- `score`: Chứa điểm số của bạn trong một trò chơi tưởng tượng. Điểm này được đưa vào máy trả lời, cung cấp phản hồi để chỉ ra bạn đã làm tốt như thế nào.
- `response`: Bắt đầu chưa được khởi tạo, nhưng sau đó được sử dụng để lưu trữ phản hồi sẽ được in ra bảng kết quả.

Để hoàn thành nhiệm vụ:

1. Tạo cấu trúc `if...else` kiểm tra xem máy có đang bật không và đặt thông báo vào biến `response` nếu không, cho người dùng biết cần bật máy.
2. Bên trong `if...else` đầu tiên, lồng thêm một `if...else` khác đặt các thông báo phù hợp vào biến `response` tùy thuộc vào giá trị của `score` — nếu máy đang bật. Các bài kiểm tra điều kiện khác nhau (và các phản hồi tương ứng) như sau:
   - Điểm dưới 0 hoặc trên 100 — "This is not possible, an error has occurred."
   - Điểm từ 0 đến 19 — "That was a terrible score — total fail!"
   - Điểm từ 20 đến 39 — "You know some things, but it's a pretty bad score. Needs improvement."
   - Điểm từ 40 đến 69 — "You did a passable job, not bad!"
   - Điểm từ 70 đến 89 — "That's a great score, you really know your stuff."
   - Điểm từ 90 đến 100 — "What an amazing score! Did you cheat? Are you for real?"

Sau khi nhập mã của bạn, hãy thử thay đổi `machineActive` thành `true`, và `score` thành một vài giá trị khác nhau để xem nó có hoạt động không.
Lưu ý rằng, đối với phạm vi bài tập này, chuỗi `Your score is __` sẽ vẫn hiển thị trên màn hình bất kể giá trị của biến `machineActive`.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("conditionals-2", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___conditionals-2
let response;
let score = 75;
let machineActive = false;

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
para1.textContent = `Your score is ${score}`;
para2.textContent = response;
section.appendChild(para1);
section.appendChild(para2);
```

Trạng thái ban đầu của đầu ra cập nhật của bạn sẽ trông như thế này:

{{ EmbedLiveSample("conditionals-2-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
let response;
let score = 75;
let machineActive = false;

if (machineActive) {
  if (score < 0 || score > 100) {
    response = "This is not possible, an error has occurred.";
  } else if (score >= 0 && score < 20) {
    response = "That was a terrible score — total fail!";
  } else if (score >= 20 && score < 40) {
    response =
      "You know some things, but it's a pretty bad score. Needs improvement.";
  } else if (score >= 40 && score < 70) {
    response = "You did a passable job, not bad!";
  } else if (score >= 70 && score < 90) {
    response = "That's a great score, you really know your stuff.";
  } else if (score >= 90 && score <= 100) {
    response = "What an amazing score! Did you cheat? Are you for real?";
  }
} else {
  response = "The machine is turned off. Turn it on to process your score.";
}

// Don't edit the code below here!
// ...
```

```js hidden live-sample___conditionals-2-finish
let response;
let score = 75;
let machineActive = false;

if (machineActive) {
  if (score < 0 || score > 100) {
    response = "This is not possible, an error has occurred.";
  } else if (score >= 0 && score < 20) {
    response = "That was a terrible score — total fail!";
  } else if (score >= 20 && score < 40) {
    response =
      "You know some things, but it's a pretty bad score. Needs improvement.";
  } else if (score >= 40 && score < 70) {
    response = "You did a passable job, not bad!";
  } else if (score >= 70 && score < 90) {
    response = "That's a great score, you really know your stuff.";
  } else if (score >= 90 && score <= 100) {
    response = "What an amazing score! Did you cheat? Are you for real?";
  }
} else {
  response = "The machine is turned off. Turn it on to process your score.";
}

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
para1.textContent = `Your score is ${score}`;
para2.textContent = response;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

## Điều kiện 3

Đối với nhiệm vụ cuối cùng, bạn được cho bốn biến:

- `machineActive`: Chứa chỉ báo về việc máy đăng nhập có được bật hay không (`true`/`false`).
- `pwd`: Chứa mật khẩu đăng nhập của người dùng.
- `machineResult`: Bắt đầu chưa được khởi tạo, nhưng sau đó được sử dụng để lưu trữ phản hồi sẽ được in ra bảng kết quả, cho người dùng biết máy có đang bật không.
- `pwdResult`: Bắt đầu chưa được khởi tạo, nhưng sau đó được sử dụng để lưu trữ phản hồi sẽ được in ra bảng kết quả, cho người dùng biết liệu lần đăng nhập của họ có thành công không.

Để hoàn thành nhiệm vụ:

1. Tạo cấu trúc `if...else` kiểm tra xem máy có đang bật không và đặt thông báo vào biến `machineResult` cho biết máy đang bật hay tắt.
2. Nếu máy đang bật, chúng ta cũng muốn một câu lệnh điều kiện thứ hai chạy để kiểm tra xem `pwd` có bằng `cheese` không. Nếu vậy, nó nên gán một chuỗi cho `pwdResult` cho người dùng biết họ đã đăng nhập thành công. Nếu không, nó nên gán một chuỗi khác cho `pwdResult` cho người dùng biết lần đăng nhập của họ không thành công. Chúng ta muốn bạn thực hiện điều này trong một dòng duy nhất, sử dụng thứ gì đó không phải là cấu trúc `if...else`.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("conditionals-3", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___conditionals-3
let machineActive = true;
let pwd = "cheese";

let machineResult;
let pwdResult;

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
para1.textContent = machineResult;
para2.textContent = pwdResult;
section.appendChild(para1);
section.appendChild(para2);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("conditionals-3-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
let machineActive = true;
let pwd = "cheese";

let machineResult;
let pwdResult;

if (machineActive) {
  machineResult = "Machine is active. Trying login.";
  pwdResult =
    pwd === "cheese"
      ? "Login successful."
      : "Password incorrect; login failed.";
} else {
  machineResult = "Machine is inactive. Activate and try logging in again.";
}

// Don't edit the code below here!
// ...
```

```js hidden live-sample___conditionals-3-finish
let machineActive = true;
let pwd = "cheese";

let machineResult;
let pwdResult;

if (machineActive) {
  machineResult = "Machine is active. Trying login.";
  pwdResult =
    pwd === "cheese"
      ? "Login successful."
      : "Password incorrect; login failed.";
} else {
  machineResult = "Machine is inactive. Activate and try logging in again.";
}

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
para1.textContent = machineResult;
para2.textContent = pwdResult;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Conditionals", "Learn_web_development/Core/Scripting/Loops", "Learn_web_development/Core/Scripting")}}

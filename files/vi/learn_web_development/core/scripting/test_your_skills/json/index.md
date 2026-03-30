---
title: "Kiểm tra kỹ năng: JSON"
short-title: "Kiểm tra: JSON"
slug: Learn_web_development/Core/Scripting/Test_your_skills/JSON
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/JSON","Learn_web_development/Core/Scripting/House_data_UI", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Làm việc với JSON](/en-US/docs/Learn_web_development/Core/Scripting/JSON) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## JSON 1

Nhiệm vụ duy nhất trong bài viết này liên quan đến việc truy cập dữ liệu JSON và sử dụng nó trên trang của bạn. Dữ liệu JSON về một số con mèo mẹ và các mèo con của chúng có sẵn trong [sample.json](https://github.com/mdn/learning-area/blob/main/javascript/oojs/tasks/json/sample.json). JSON được tải vào trang dưới dạng chuỗi văn bản và có sẵn trong tham số `catString` của hàm `displayCatInfo()`.

Để hoàn thành nhiệm vụ, hãy điền vào các phần còn thiếu của hàm `displayCatInfo()` để lưu trữ:

- Tên của ba con mèo mẹ, được phân tách bằng dấu phẩy, trong biến `motherInfo`.
- Tổng số mèo con, và có bao nhiêu con đực và con cái, trong biến `kittenInfo`.

Các giá trị của các biến này sau đó được in ra màn hình trong các đoạn văn.

Một số gợi ý/câu hỏi:

- Dữ liệu JSON được cung cấp dưới dạng văn bản trong hàm `displayCatInfo()`. Bạn cần phân tích cú pháp nó thành JSON trước khi có thể lấy bất kỳ dữ liệu nào từ nó.
- Bạn có thể muốn sử dụng vòng lặp bên ngoài để lặp qua các con mèo và thêm tên của chúng vào chuỗi biến `motherInfo`, và vòng lặp bên trong để lặp qua tất cả mèo con, cộng tổng tất cả/đực/cái mèo con, và thêm các chi tiết đó vào chuỗi biến `kittenInfo`.
- Tên con mèo mẹ cuối cùng nên có "and" trước nó, và dấu chấm sau nó. Làm thế nào để đảm bảo điều này có thể hoạt động, bất kể có bao nhiêu con mèo trong JSON?
- Tại sao các dòng `para1.textContent = motherInfo;` và `para2.textContent = kittenInfo;` ở bên trong hàm `displayCatInfo()`, và không phải ở cuối script? Điều này có liên quan đến mã bất đồng bộ.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("json-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```html hidden live-sample___json-1 live-sample___json-1-finish
<p class="one"></p>
<p class="two"></p>
```

```css hidden live-sample___json-1 live-sample___json-1-finish
p {
  color: purple;
  margin: 0.5em 0;
}

* {
  box-sizing: border-box;
}
```

```js live-sample___json-1
const para1 = document.querySelector(".one");
const para2 = document.querySelector(".two");
let motherInfo = "The mother cats are called ";
let kittenInfo;
const requestURL =
  "https://mdn.github.io/learning-area/javascript/oojs/tasks/json/sample.json";

fetch(requestURL)
  .then((response) => response.text())
  .then((text) => displayCatInfo(text));

// Don't edit the code above here!

function displayCatInfo(catString) {
  let total = 0;
  let male = 0;

  // Add your code here

  // Don't edit the code below here!

  para1.textContent = motherInfo;
  para2.textContent = kittenInfo;
}
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("json-1-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

function displayCatInfo(catString) {
  let total = 0;
  let male = 0;

  const cats = JSON.parse(catString);

  for (let i = 0; i < cats.length; i++) {
    for (const kitten of cats[i].kittens) {
      total++;
      if (kitten.gender === "m") {
        male++;
      }
    }

    if (i < cats.length - 1) {
      motherInfo += `${cats[i].name}, `;
    } else {
      motherInfo += `and ${cats[i].name}.`;
    }
  }

  kittenInfo = `There are ${total} kittens in total, ${male} males and ${
    total - male
  } females.`;

  // Don't edit the code below here!

  para1.textContent = motherInfo;
  para2.textContent = kittenInfo;
}
```

```js hidden live-sample___json-1-finish
const para1 = document.querySelector(".one");
const para2 = document.querySelector(".two");
let motherInfo = "The mother cats are called ";
let kittenInfo;
const requestURL =
  "https://mdn.github.io/learning-area/javascript/oojs/tasks/json/sample.json";

fetch(requestURL)
  .then((response) => response.text())
  .then((text) => displayCatInfo(text));

function displayCatInfo(catString) {
  let total = 0;
  let male = 0;

  const cats = JSON.parse(catString);

  for (let i = 0; i < cats.length; i++) {
    for (const kitten of cats[i].kittens) {
      total++;
      if (kitten.gender === "m") {
        male++;
      }
    }

    if (i < cats.length - 1) {
      motherInfo += `${cats[i].name}, `;
    } else {
      motherInfo += `and ${cats[i].name}.`;
    }
  }

  kittenInfo = `There are ${total} kittens in total, ${male} males and ${
    total - male
  } females.`;

  para1.textContent = motherInfo;
  para2.textContent = kittenInfo;
}
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/JSON","Learn_web_development/Core/Scripting/House_data_UI", "Learn_web_development/Core/Scripting")}}

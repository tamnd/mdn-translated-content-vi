---
title: "Kiểm tra kỹ năng: Toán học"
short-title: "Kiểm tra: Toán học"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Math
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Math", "Learn_web_development/Core/Scripting/Strings", "Learn_web_development/Core/Scripting")}}

Mục tiêu của các bài kiểm tra trên trang này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Toán học cơ bản trong JavaScript — số và toán tử](/en-US/docs/Learn_web_development/Core/Scripting/Math) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Toán học 1

Hãy bắt đầu bằng cách kiểm tra kiến thức của bạn về các toán tử toán học cơ bản.
Bạn sẽ tạo bốn giá trị số, cộng hai giá trị lại với nhau, trừ một giá trị khỏi giá trị khác, sau đó nhân các kết quả.
Cuối cùng, bạn sẽ viết một bài kiểm tra để chứng minh rằng giá trị này là số chẵn.

Để hoàn thành nhiệm vụ:

1. Tạo bốn biến chứa số. Đặt tên biến một cách có ý nghĩa.
2. Cộng hai biến đầu tiên lại và lưu kết quả trong biến khác.
3. Trừ biến thứ tư khỏi biến thứ ba và lưu kết quả trong biến khác.
4. Nhân kết quả từ bước **2** và **3** và lưu kết quả trong biến gọi là `finalResult`.
5. Kiểm tra xem `finalResult` có phải là số chẵn bằng cách sử dụng một trong các [toán tử số học](/en-US/docs/Learn_web_development/Core/Scripting/Math#arithmetic_operators). Lưu kết quả (`0` cho chẵn, `1` cho lẻ) trong biến gọi là `evenOddResult`.

Để vượt qua bài kiểm tra này, `finalResult` nên có giá trị `48` và `evenOddResult` nên có giá trị `0`.

<!-- Code shared across examples -->

```html hidden live-sample___math-1 live-sample___math-2 live-sample___math-3 live-sample___math-1-finish live-sample___math-2-finish live-sample___math-3-finish
<section></section>
```

```css hidden live-sample___math-1 live-sample___math-2 live-sample___math-3 live-sample___math-1-finish live-sample___math-2-finish live-sample___math-3-finish
* {
  box-sizing: border-box;
}

p {
  color: purple;
  margin: 0.5em 0;
}
```

<!-- Example-specific code -->

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("math-1", "100%", 80) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___math-1
let finalResult;
let evenOddResult;

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
const finalResultCheck =
  finalResult === 48 ? `Yes, well done!` : `No, it is ${finalResult}`;
para1.textContent = `Is the finalResult 48? ${finalResultCheck}`;
const para2 = document.createElement("p");
const evenOddResultCheck =
  evenOddResult === 0
    ? "The final result is even!"
    : "The final result is odd. Hrm.";
para2.textContent = evenOddResultCheck;
section.appendChild(para1);
section.appendChild(para2);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("math-1-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

const number1 = 4;
const number2 = 8;
const number3 = 12;
const number4 = 8;

const additionResult = number1 + number2;
const subtractionResult = number3 - number4;

finalResult = additionResult * subtractionResult;

evenOddResult = finalResult % 2;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___math-1-finish
let finalResult;
let evenOddResult;

const number1 = 4;
const number2 = 8;
const number3 = 12;
const number4 = 8;

const additionResult = number1 + number2;
const subtractionResult = number3 - number4;

finalResult = additionResult * subtractionResult;

evenOddResult = finalResult % 2;

const section = document.querySelector("section");
const para1 = document.createElement("p");
const finalResultCheck =
  finalResult === 48 ? `Yes, well done!` : `No, it is ${finalResult}`;
para1.textContent = `Is the finalResult 48? ${finalResultCheck}`;
const para2 = document.createElement("p");
const evenOddResultCheck =
  evenOddResult === 0
    ? "The final result is even!"
    : "The final result is odd. Hrm.";
para2.textContent = evenOddResultCheck;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

## Toán học 2

Trong nhiệm vụ thứ hai, bạn được cung cấp hai phép tính với kết quả được lưu trong các biến `result` và `result2`.
Bạn cần lấy các phép tính, nhân chúng lại và định dạng kết quả thành hai chữ số thập phân.

Để hoàn thành nhiệm vụ:

1. Nhân `result` và `result2` và gán kết quả trở lại `result` (sử dụng ký hiệu ngắn gọn gán).
2. Định dạng `result` để nó có hai chữ số thập phân và lưu vào biến gọi là `finalResult`.
3. Kiểm tra kiểu dữ liệu của `finalResult` bằng `typeof`. Nếu nó là `string`, hãy chuyển đổi nó sang kiểu `number` và lưu kết quả trong biến gọi là `finalNumber`.

Để vượt qua bài kiểm tra này, `finalNumber` nên có kết quả là `4633.33`. Bạn có thể cần xem xét thứ tự ưu tiên của toán tử và thêm hoặc sửa đổi một số dấu ngoặc đơn vào các biểu thức đầu vào để có đầu ra đúng.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("math-2", "100%", 80) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___math-2
// Final result should be 4633.33

let result = 7 + 13 / 9 + 7;
let result2 = (100 / 2) * 6;

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = `Your finalResult is ${finalResult}`;
const para2 = document.createElement("p");
const finalNumberCheck =
  isNaN(finalNumber) === false
    ? "finalNumber is a number type. Well done!"
    : `Oops! finalNumber is not a number.`;
para2.textContent = finalNumberCheck;
section.appendChild(para1);
section.appendChild(para2);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("math-2-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js-nolint
// Final result should be 4633.33

let result = (7 + 13 / 9) + 7;
let result2 = 100 / 2 * 6;

result *= result2;

const finalResult = result.toFixed(2);

const finalNumber = Number(finalResult);

// Don't edit the code below here!
// ...
```

```js hidden live-sample___math-2-finish
let result = 7 + 13 / 9 + 7;
let result2 = (100 / 2) * 6;

result *= result2;
const finalResult = result.toFixed(2);
const finalNumber = Number(finalResult);

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = `Your finalResult is ${finalResult}`;
const para2 = document.createElement("p");
const finalNumberCheck =
  isNaN(finalNumber) === false
    ? "finalNumber is a number type. Well done!"
    : `Oops! finalNumber is not a number.`;
para2.textContent = finalNumberCheck;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

## Toán học 3

Trong nhiệm vụ cuối cùng cho bài viết này, chúng ta muốn bạn viết một số bài kiểm tra.

Để hoàn thành nhiệm vụ:

1. Có ba nhóm, mỗi nhóm bao gồm một câu lệnh và hai biến. Đối với mỗi nhóm, hãy viết bài kiểm tra chứng minh hoặc bác bỏ câu lệnh được đưa ra.
2. Lưu kết quả của các bài kiểm tra đó trong các biến gọi là `weightComparison`, `heightComparison`, và `pwdMatch`, tương ứng.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("math-3", "100%", 80) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___math-3
// Statement 1: The elephant weighs less than the mouse
const eleWeight = 1000;
const mouseWeight = 2;
// Statement 2: The Ostrich is taller than the duck
const ostrichHeight = 2;
const duckHeight = 0.3;
// Statement 3: The two passwords match
const pwd1 = "stromboli";
const pwd2 = "stROmBoLi";

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
const para3 = document.createElement("p");
const weightTest = weightComparison
  ? "True — elephants do weigh less than mice!?"
  : "False — of course an elephant is heavier than a mouse!";
const heightTest = heightComparison
  ? "True — an ostrich is indeed taller than a duck!"
  : "False — apparently a duck is taller than an ostrich!?";
const pwdTest = pwdMatch
  ? "True — the passwords match."
  : "False — the passwords do not match; please check them";
para1.textContent = weightTest;
section.appendChild(para1);
para2.textContent = heightTest;
section.appendChild(para2);
para3.textContent = pwdTest;
section.appendChild(para3);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("math-3-finish", "100%", 100) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js-nolint
// ...
// Don't edit the code above here!

const weightComparison = eleWeight < mouseWeight;
const heightComparison = ostrichHeight > duckHeight;
const pwdMatch = pwd1 === pwd2;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___math-3-finish
// Statement 1: The elephant weighs less than the mouse
const eleWeight = 1000;
const mouseWeight = 2;
// Statement 2: The Ostrich is taller than the duck
const ostrichHeight = 2;
const duckHeight = 0.3;
// Statement 3: The two passwords match
const pwd1 = "stromboli";
const pwd2 = "stROmBoLi";

const weightComparison = eleWeight < mouseWeight;
const heightComparison = ostrichHeight > duckHeight;
const pwdMatch = pwd1 === pwd2;

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
const para3 = document.createElement("p");
const weightTest = weightComparison
  ? "True — elephants do weigh less than mice!?"
  : "False — of course an elephant is heavier than a mouse!";
const heightTest = heightComparison
  ? "True — an ostrich is indeed taller than a duck!"
  : "False — apparently a duck is taller than an ostrich!?";
const pwdTest = pwdMatch
  ? "True — the passwords match."
  : "False — the passwords do not match; please check them";
para1.textContent = weightTest;
section.appendChild(para1);
para2.textContent = heightTest;
section.appendChild(para2);
para3.textContent = pwdTest;
section.appendChild(para3);
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Math", "Learn_web_development/Core/Scripting/Strings", "Learn_web_development/Core/Scripting")}}

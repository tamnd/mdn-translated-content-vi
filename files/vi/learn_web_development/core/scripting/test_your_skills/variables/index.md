---
title: "Kiểm tra kỹ năng: Biến"
short-title: "Kiểm tra: Biến"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Variables
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Variables", "Learn_web_development/Core/Scripting/Math", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Lưu trữ thông tin bạn cần — Biến](/en-US/docs/Learn_web_development/Core/Scripting/Variables) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Thử thách tương tác

Trước tiên, chúng ta cung cấp cho bạn một thử thách biến tương tác thú vị được tạo bởi [đối tác học tập](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds) của chúng ta, [Scrimba](https://scrimba.com/home).

Xem scrim nhúng và hoàn thành nhiệm vụ trên dòng thời gian (biểu tượng bóng ma nhỏ) bằng cách làm theo hướng dẫn và chỉnh sửa mã. Khi bạn hoàn thành, bạn có thể tiếp tục xem scrim để kiểm tra xem giải pháp của giáo viên khớp với giải pháp của bạn như thế nào.

<mdn-scrim-inline url="https://scrimba.com/learn-javascript-c0v/~011" scrimtitle="Variables practice" survey="true"></scrim-inline>

## Biến 1

Để hoàn thành nhiệm vụ này, hãy thêm một dòng mới để sửa giá trị được lưu trong biến `myName` hiện có thành tên của bạn.

<!-- Code shared across examples -->

```html hidden live-sample___variables-1 live-sample___variables-2 live-sample___variables-1-finish live-sample___variables-2-finish
<section></section>
```

```css hidden live-sample___variables-1 live-sample___variables-2 live-sample___variables-1-finish live-sample___variables-2-finish
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

{{ EmbedLiveSample("variables-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___variables-1
let myName = "Paul";

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para = document.createElement("p");
para.textContent = myName;
section.appendChild(para);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("variables-1-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

myName = "Chris";

// Don't edit the code below here!
// ...
```

```js hidden live-sample___variables-1-finish
let myName = "Paul";

myName = "Chris";

const section = document.querySelector("section");
const para = document.createElement("p");
para.textContent = myName;
section.appendChild(para);
```

</details>

## Biến 2

Nhiệm vụ cuối cùng bây giờ — trong trường hợp này bạn được cung cấp một số mã hiện có có hai lỗi trong đó. Panel kết quả sẽ xuất ra tên `Chris`, và một câu về độ tuổi Chris sẽ có sau 20 năm nữa. Chúng ta muốn bạn sửa vấn đề và sửa đầu ra.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("variables-2", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___variables-2
// Fix the following code

const myName = "Default";
myName = "Chris";

let myAge = "42";

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
para1.textContent = myName;
para2.textContent = `In 20 years, I will be ${myAge + 20}`;
section.appendChild(para1);
section.appendChild(para2);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("variables-2-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// Turn the const into a let, so the value can be changed
let myName = "Default";
myName = "Chris";

// myAge needs to have a number datatype
let myAge = 42;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___variables-2-finish
let myName = "Default";
myName = "Chris";
let myAge = 42;

const section = document.querySelector("section");
const para1 = document.createElement("p");
const para2 = document.createElement("p");
para1.textContent = myName;
para2.textContent = `In 20 years, I will be ${myAge + 20}`;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

## Xem thêm

Xem [Practice time - Part 3: let and const](https://scrimba.com/learn-javascript-c0v/~059?via=mdn) <sup>[_Đối tác học tập MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> từ Scrimba: Một thử thách tương tác cung cấp nhiều bài kiểm tra về `let` và `const`.

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Variables", "Learn_web_development/Core/Scripting/Math", "Learn_web_development/Core/Scripting")}}

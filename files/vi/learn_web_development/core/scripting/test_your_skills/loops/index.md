---
title: "Kiểm tra kỹ năng: Vòng lặp"
short-title: "Kiểm tra: Vòng lặp"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Loops
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Loops","Learn_web_development/Core/Scripting/Functions", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Lặp qua mã](/en-US/docs/Learn_web_development/Core/Scripting/Loops) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Thao tác DOM: Hữu ích cần biết

Một số câu hỏi dưới đây yêu cầu bạn viết một số mã thao tác [DOM](/en-US/docs/Glossary/DOM) để hoàn thành — chẳng hạn như tạo các phần tử HTML mới, đặt nội dung văn bản của chúng bằng các giá trị chuỗi cụ thể, và lồng chúng vào trong các phần tử hiện có trên trang — tất cả thông qua JavaScript.

Chúng ta chưa dạy điều này một cách rõ ràng trong khóa học, nhưng bạn sẽ thấy một số ví dụ sử dụng nó, và chúng ta muốn bạn tự nghiên cứu về các DOM API bạn cần để trả lời thành công các câu hỏi. Một điểm khởi đầu tốt là hướng dẫn [Giới thiệu về DOM scripting](/en-US/docs/Learn_web_development/Core/Scripting/DOM_scripting) của chúng ta.

## Vòng lặp 1

Trong nhiệm vụ vòng lặp đầu tiên, chúng ta muốn bạn viết một vòng lặp cơ bản lặp qua tất cả các phần tử trong mảng `myArray` được cung cấp và in chúng ra màn hình trong các phần tử danh sách ([`<li>`](/en-US/docs/Web/HTML/Reference/Elements/li)). Chúng nên được thêm vào `list` được cung cấp.

<!-- Code shared across examples -->

```html hidden live-sample___loops-1 live-sample___loops-2 live-sample___loops-3 live-sample___loops-1-finish live-sample___loops-2-finish live-sample___loops-3-finish
<section></section>
```

```css hidden live-sample___loops-1 live-sample___loops-2 live-sample___loops-3 live-sample___loops-1-finish live-sample___loops-2-finish live-sample___loops-3-finish
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

{{ EmbedLiveSample("loops-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___loops-1
const myArray = ["tomatoes", "chick peas", "onions", "rice", "black beans"];
const list = document.createElement("ul");
const section = document.querySelector("section");
section.appendChild(list);

// Don't edit the code above here!

// Add your code here
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("loops-1-finish", "100%", 150) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

for (let item of myArray) {
  const listItem = document.createElement("li");
  listItem.textContent = item;
  list.appendChild(listItem);
}
```

```js hidden live-sample___loops-1-finish
const myArray = ["tomatoes", "chick peas", "onions", "rice", "black beans"];
const list = document.createElement("ul");
const section = document.querySelector("section");
section.appendChild(list);

for (let item of myArray) {
  const listItem = document.createElement("li");
  listItem.textContent = item;
  list.appendChild(listItem);
}
```

</details>

## Vòng lặp 2

Trong nhiệm vụ tiếp theo này, chúng ta muốn bạn viết một chương trình đơn giản, cho một tên, tìm kiếm trong mảng [đối tượng](/en-US/docs/Glossary/Object) chứa tên và số điện thoại và, nếu tìm thấy tên, xuất tên và số điện thoại vào một đoạn văn.

Bạn được cung cấp ba biến để bắt đầu:

- `name`: Chứa tên cần tìm kiếm.
- `para`: Chứa tham chiếu đến một đoạn văn, sẽ được sử dụng để báo cáo kết quả.
- `phonebook`: Chứa các mục danh bạ điện thoại để tìm kiếm.

> [!NOTE]
> Nếu bạn chưa đọc về đối tượng, đừng lo! Hiện tại, tất cả những gì bạn cần biết là cách truy cập cặp thành viên-giá trị. Bạn có thể đọc về đối tượng trong hướng dẫn [Kiến thức cơ bản về đối tượng JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Object_basics).

Để hoàn thành nhiệm vụ:

1. Viết một vòng lặp lặp qua mảng `phonebook` và tìm kiếm `name` được cung cấp. Bạn nên sử dụng loại vòng lặp mà bạn chưa sử dụng trong nhiệm vụ trước.
2. Nếu tìm thấy `name`, viết tên đó và `number` liên quan vào `textContent` của đoạn văn được cung cấp (`para`), theo dạng "&lt;name>'s number is &lt;number>." Sau đó, thoát khỏi vòng lặp trước khi nó chạy hết.
3. Nếu không có đối tượng nào chứa `name`, in "Name not found in the phonebook" vào `textContent` của đoạn văn được cung cấp.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("loops-2", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___loops-2
const name = "Mustafa";
const para = document.createElement("p");

const phonebook = [
  { name: "Chris", number: "1549" },
  { name: "Li Kang", number: "9634" },
  { name: "Anne", number: "9065" },
  { name: "Francesca", number: "3001" },
  { name: "Mustafa", number: "6888" },
  { name: "Tina", number: "4312" },
  { name: "Bert", number: "7780" },
  { name: "Jada", number: "2282" },
];

const section = document.querySelector("section");
section.appendChild(para);

// Don't edit the code above here!

// Add your code here
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("loops-2-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

for (let i = 0; i < phonebook.length; i++) {
  if (phonebook[i].name === name) {
    para.textContent = `${phonebook[i].name}'s number is ${phonebook[i].number}.`;
    break;
  }

  if (i === phonebook.length - 1) {
    para.textContent = "Name not found in the phonebook";
  }
}
```

```js hidden live-sample___loops-2-finish
const name = "Mustafa";
const para = document.createElement("p");

const phonebook = [
  { name: "Chris", number: "1549" },
  { name: "Li Kang", number: "9634" },
  { name: "Anne", number: "9065" },
  { name: "Francesca", number: "3001" },
  { name: "Mustafa", number: "6888" },
  { name: "Tina", number: "4312" },
  { name: "Bert", number: "7780" },
  { name: "Jada", number: "2282" },
];

const section = document.querySelector("section");
section.appendChild(para);

for (let i = 0; i < phonebook.length; i++) {
  if (phonebook[i].name === name) {
    para.textContent = `${phonebook[i].name}'s number is ${phonebook[i].number}.`;
    break;
  }

  if (i === phonebook.length - 1) {
    para.textContent = "Name not found in the phonebook";
  }
}
```

</details>

## Vòng lặp 3

Trong nhiệm vụ cuối cùng này, bạn sẽ kiểm tra từng số từ `500` xuống đến `2` xem số nào là số nguyên tố, sử dụng hàm kiểm tra được cung cấp, và in ra các số nguyên tố.

Bạn được cung cấp:

- `i`: Bắt đầu với giá trị `500`; được dự định sử dụng như một biến lặp.
- `para`: Chứa tham chiếu đến một đoạn văn, sẽ được sử dụng để báo cáo kết quả.
- `isPrime()`: Một hàm, khi được truyền một số, trả về `true` nếu số đó là số nguyên tố, và `false` nếu không.

Để hoàn thành nhiệm vụ:

1. Viết một vòng lặp lặp qua từng số từ `500` xuống đến `2` (1 không được tính là số nguyên tố), và chạy hàm `isPrime()` được cung cấp trên mỗi số.
2. Đối với mỗi số không phải là số nguyên tố, tiếp tục sang lần lặp tiếp theo. Đối với mỗi số _là_ số nguyên tố, thêm nó vào `textContent` của đoạn văn cùng với một dấu phân cách nào đó.

Bạn nên sử dụng loại vòng lặp mà bạn chưa sử dụng trong hai nhiệm vụ trước.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("loops-3", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___loops-3
let i = 500;
const para = document.createElement("p");
const section = document.querySelector("section");
function isPrime(num) {
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}
// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

section.appendChild(para);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("loops-3-finish", "100%", 120) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

do {
  if (isPrime(i)) {
    para.textContent += `${i}, `;
  }
  i--;
} while (i > 1);

// Don't edit the code below here!
// ...
```

```js hidden live-sample___loops-3-finish
let i = 500;
const para = document.createElement("p");
const section = document.querySelector("section");
function isPrime(num) {
  for (let i = 2; i < num; i++) {
    if (num % i === 0) {
      return false;
    }
  }
  return true;
}

do {
  if (isPrime(i)) {
    para.textContent += `${i}, `;
  }
  i--;
} while (i > 1);

section.appendChild(para);
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Loops","Learn_web_development/Core/Scripting/Functions", "Learn_web_development/Core/Scripting")}}

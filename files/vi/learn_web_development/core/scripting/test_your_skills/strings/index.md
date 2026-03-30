---
title: "Kiểm tra kỹ năng: Chuỗi"
short-title: "Kiểm tra: Chuỗi"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Strings
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Useful_string_methods", "Learn_web_development/Core/Scripting/Arrays", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu các bài viết [Xử lý văn bản — chuỗi trong JavaScript](/en-US/docs/Learn_web_development/Core/Scripting/Strings) và [Các phương thức chuỗi hữu ích](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Chuỗi 1

Trong nhiệm vụ chuỗi đầu tiên, chúng ta bắt đầu nhỏ. Bạn đã có nửa đầu của một câu trích dẫn nổi tiếng trong biến gọi là `quoteStart`, và chúng ta muốn bạn hoàn thành nó.

Để hoàn thành nhiệm vụ:

1. Tra cứu nửa còn lại của câu trích dẫn, và thêm nó vào ví dụ trong biến gọi là `quoteEnd`.
2. Ghép hai chuỗi lại với nhau thành một chuỗi duy nhất chứa câu trích dẫn đầy đủ. Lưu kết quả trong biến gọi là `finalQuote`.
3. Bạn sẽ thấy có lỗi tại điểm này. Bạn có thể sửa vấn đề với `quoteStart`, để câu trích dẫn đầy đủ hiển thị đúng không?

<!-- Code shared across examples -->

```html hidden live-sample___strings-1 live-sample___strings-2 live-sample___strings-3 live-sample___strings-4 live-sample___strings-1-finish live-sample___strings-2-finish live-sample___strings-3-finish live-sample___strings-4-finish
<section></section>
```

```css hidden live-sample___strings-1 live-sample___strings-2 live-sample___strings-3 live-sample___strings-4 live-sample___strings-1-finish live-sample___strings-2-finish live-sample___strings-3-finish live-sample___strings-4-finish
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

{{ EmbedLiveSample("strings-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js-nolint live-sample___strings-1
const quoteStart = 'Don't judge each day by the harvest you reap ';

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = finalQuote;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("strings-1-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js-nolint
// You need to escape the quote
const quoteStart = 'Don\'t judge each day by the harvest you reap ';

const quoteEnd = "but by the seeds that you plant.";

const finalQuote = `${quoteStart}${quoteEnd}`;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___strings-1-finish
const quoteStart = "Don't judge each day by the harvest you reap ";

const quoteEnd = "but by the seeds that you plant.";

const finalQuote = `${quoteStart}${quoteEnd}`;

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = finalQuote;
section.appendChild(para1);
```

</details>

## Chuỗi 2

Trong nhiệm vụ này, bạn được cung cấp hai biến, `quote` và `substring`, chứa hai chuỗi.

Để hoàn thành nhiệm vụ:

1. Lấy độ dài của câu trích dẫn và lưu vào biến gọi là `quoteLength`.
2. Tìm vị trí chỉ mục nơi `substring` xuất hiện trong `quote`, và lưu giá trị đó trong biến gọi là `index`.
3. Sử dụng kết hợp các biến bạn có và các thuộc tính/phương thức chuỗi có sẵn để rút gọn câu trích dẫn gốc thành "I do not like green eggs and ham.", và lưu vào biến gọi là `revisedQuote`.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("strings-2", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___strings-2
const quote = "I do not like green eggs and ham. I do not like them, Sam-I-Am.";
const substring = "green eggs and ham";

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
section.innerHTML = " ";
const para1 = document.createElement("p");
para1.textContent = `The quote is ${quoteLength} characters long.`;
const para2 = document.createElement("p");
para2.textContent = revisedQuote;
section.appendChild(para1);
section.appendChild(para2);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("strings-2-finish", "100%", 80) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

const quoteLength = quote.length;
const index = quote.indexOf(substring);
const revisedQuote = quote.slice(0, index + substring.length + 1);

// Don't edit the code below here!
// ...
```

```js hidden live-sample___strings-2-finish
const quote = "I do not like green eggs and ham. I do not like them, Sam-I-Am.";
const substring = "green eggs and ham";

const quoteLength = quote.length;
const index = quote.indexOf(substring);
const revisedQuote = quote.slice(0, index + substring.length + 1);

const section = document.querySelector("section");
section.innerHTML = " ";
const para1 = document.createElement("p");
para1.textContent = `The quote is ${quoteLength} characters long.`;
const para2 = document.createElement("p");
para2.textContent = revisedQuote;
section.appendChild(para1);
section.appendChild(para2);
```

</details>

## Chuỗi 3

Trong nhiệm vụ chuỗi tiếp theo, bạn được cho cùng câu trích dẫn mà bạn đã có ở nhiệm vụ trước, nhưng nó bị lỗi! Chúng ta muốn bạn sửa và cập nhật nó.

Để hoàn thành nhiệm vụ:

1. Thay đổi kiểu chữ để đúng dạng câu (tất cả chữ thường, ngoại trừ chữ hoa ở đầu câu). Lưu câu trích dẫn mới trong biến gọi là `fixedQuote`.
2. Trong `fixedQuote`, thay thế "green eggs and ham" bằng món ăn khác mà bạn thực sự không thích.
3. Còn một sửa nhỏ nữa — thêm dấu chấm vào cuối câu trích dẫn, và lưu phiên bản cuối cùng trong biến gọi là `finalQuote`.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("strings-3", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___strings-3
const quote = "I dO nOT lIke gREen eGgS anD HAM";

// Don't edit the code above here!

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = finalQuote;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("strings-3-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

let fixedQuote = quote.toLowerCase();
const firstLetter = fixedQuote.slice(0, 1);
fixedQuote = fixedQuote.replace(firstLetter, firstLetter.toUpperCase());
fixedQuote = fixedQuote.replace("green eggs and ham", "pickled onions");
const finalQuote = `${fixedQuote}.`;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___strings-3-finish
const quote = "I dO nOT lIke gREen eGgS anD HAM";

let fixedQuote = quote.toLowerCase();
const firstLetter = fixedQuote.slice(0, 1);
fixedQuote = fixedQuote.replace(firstLetter, firstLetter.toUpperCase());
fixedQuote = fixedQuote.replace("green eggs and ham", "pickled onions");
const finalQuote = `${fixedQuote}.`;

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = finalQuote;
section.appendChild(para1);
```

</details>

## Chuỗi 4

Trong nhiệm vụ chuỗi cuối cùng, chúng ta đã cho bạn tên của một định lý, hai giá trị số và một chuỗi chưa hoàn chỉnh (các phần cần thêm được đánh dấu bằng dấu hoa thị (`*`)). Chúng ta muốn bạn thay đổi giá trị của chuỗi.

Để hoàn thành nhiệm vụ:

1. Thay đổi chuỗi từ chuỗi ký tự thông thường thành chuỗi mẫu (template literal).
2. Thay thế bốn dấu hoa thị bằng bốn biểu thức nhúng trong chuỗi mẫu. Chúng nên là:
   1. Tên của định lý.
   2. Hai giá trị số chúng ta có.
   3. Độ dài cạnh huyền của tam giác vuông, giả sử hai cạnh còn lại có độ dài bằng hai giá trị chúng ta có. Bạn cần tra cứu cách tính từ những gì bạn có. Thực hiện phép tính bên trong biểu thức nhúng.

Điểm khởi đầu của nhiệm vụ trông như thế này:

{{ EmbedLiveSample("strings-4", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___strings-4
const theorem = "Pythagorean theorem";

const a = 5;
const b = 8;

// Don't edit the code above here!

// Edit the string literal
const myString =
  "Using *, we can work out that if the two shortest sides of a right-angled triangle have lengths of * and *, the length of the hypotenuse is *.";

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = myString;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("strings-4-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
// ...
// Don't edit the code above here!

const myString = `Using ${theorem}, we can work out that if the two shortest sides of a right-angled triangle have lengths of ${a} and ${b},
  the length of the hypotenuse is ${Math.sqrt(a ** 2 + b ** 2)}.`;

// Don't edit the code below here!
// ...
```

```js hidden live-sample___strings-4-finish
const theorem = "Pythagorean theorem";

const a = 5;
const b = 8;

const myString = `Using ${theorem}, we can work out that if the two shortest sides of a right-angled triangle have lengths of ${a} and ${b},
  the length of the hypotenuse is ${Math.sqrt(a ** 2 + b ** 2)}.`;

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = myString;
section.appendChild(para1);
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Useful_string_methods", "Learn_web_development/Core/Scripting/Arrays", "Learn_web_development/Core/Scripting")}}

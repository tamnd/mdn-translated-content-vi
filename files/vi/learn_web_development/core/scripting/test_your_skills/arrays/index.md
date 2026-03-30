---
title: "Kiểm tra kỹ năng: Mảng"
short-title: "Kiểm tra: Mảng"
slug: Learn_web_development/Core/Scripting/Test_your_skills/Arrays
page-type: learn-module-assessment
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Arrays", "Learn_web_development/Core/Scripting/Silly_story_generator", "Learn_web_development/Core/Scripting")}}

Mục tiêu của bài kiểm tra kỹ năng này là giúp bạn đánh giá xem bạn đã hiểu bài viết [Mảng](/en-US/docs/Learn_web_development/Core/Scripting/Arrays) hay chưa.

> [!NOTE]
> Để được giúp đỡ, hãy đọc hướng dẫn sử dụng [Kiểm tra kỹ năng](/en-US/docs/Learn_web_development#test_your_skills) của chúng tôi. Bạn cũng có thể liên hệ với chúng tôi qua một trong các [kênh liên lạc](/en-US/docs/MDN/Community/Communication_channels).

## Thử thách tương tác

Trước tiên, chúng ta cung cấp cho bạn một thử thách mảng tương tác thú vị được tạo bởi [đối tác học tập](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds) của chúng ta, [Scrimba](https://scrimba.com/home).

Xem scrim nhúng và hoàn thành nhiệm vụ trên dòng thời gian (biểu tượng bóng ma nhỏ) bằng cách làm theo hướng dẫn và chỉnh sửa mã. Khi bạn hoàn thành, bạn có thể tiếp tục xem scrim để kiểm tra xem giải pháp của giáo viên khớp với giải pháp của bạn như thế nào.

<mdn-scrim-inline url="https://scrimba.com/learn-javascript-c0v/~05e" scrimtitle="Render images from an array" survey="true"></scrim-inline>

> [!NOTE]
> Nhiệm vụ này khá là mục tiêu mở rộng, vì nó dựa vào các tính năng JavaScript mà bạn chưa được học cụ thể trong khóa học. Hãy cố gắng hết sức và tìm kiếm thông tin trực tuyến về bất cứ điều gì bạn không chắc.

## Mảng 1

Nhiệm vụ này cung cấp cho bạn một số bài tập mảng cơ bản:

1. Tạo một mảng ba phần tử, và lưu vào biến gọi là `myArray`. Các phần tử có thể là bất cứ thứ gì bạn muốn — ví dụ như các món ăn yêu thích hoặc ban nhạc?
2. Tiếp theo, sửa đổi hai phần tử đầu tiên trong mảng bằng ký hiệu ngoặc vuông và phép gán.
3. Cuối cùng, thêm một phần tử mới vào đầu mảng.

<!-- Code shared across examples -->

```html hidden live-sample___arrays-1 live-sample___arrays-2 live-sample___arrays-3 live-sample___arrays-4 live-sample___arrays-1-finish live-sample___arrays-2-finish live-sample___arrays-3-finish live-sample___arrays-4-finish
<section></section>
```

```css hidden live-sample___arrays-1 live-sample___arrays-2 live-sample___arrays-3 live-sample___arrays-4 live-sample___arrays-1-finish live-sample___arrays-2-finish live-sample___arrays-3-finish live-sample___arrays-4-finish
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

{{ EmbedLiveSample("arrays-1", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___arrays-1
// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = `Array: ${myArray}`;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("arrays-1-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
const myArray = ["cats", "dogs", "chickens"];

myArray[0] = "horses";
myArray[1] = "pigs";

myArray.unshift("crocodiles");

// Don't edit the code below here!
// ...
```

```js hidden live-sample___arrays-1-finish
const myArray = ["cats", "dogs", "chickens"];

myArray[0] = "horses";
myArray[1] = "pigs";

myArray.unshift("crocodiles");

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = `Array: ${myArray}`;
section.appendChild(para1);
```

</details>

## Mảng 2

Bây giờ hãy chuyển sang nhiệm vụ khác. Ở đây bạn được cung cấp một chuỗi để làm việc.

Để hoàn thành nhiệm vụ:

1. Chuyển đổi chuỗi thành mảng, loại bỏ các ký tự `+` trong quá trình đó. Lưu kết quả trong biến gọi là `myArray`.
2. Lưu độ dài của mảng trong biến gọi là `arrayLength`.
3. Lưu phần tử cuối cùng trong mảng vào biến gọi là `lastItem`.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("arrays-2", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___arrays-2
const myString = "Ryu+Ken+Chun-Li+Cammy+Guile+Sakura+Sagat+Juri";

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = `Array: ${myArray}`;
const para2 = document.createElement("p");
para2.textContent = `The length of the array is ${arrayLength}.`;
const para3 = document.createElement("p");
para3.textContent = `The last item in the array is "${lastItem}".`;
section.appendChild(para1);
section.appendChild(para2);
section.appendChild(para3);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("arrays-2-finish", "100%", 100) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
const myString = "Ryu+Ken+Chun-Li+Cammy+Guile+Sakura+Sagat+Juri";

let myArray = myString.split("+");

let arrayLength = myArray.length;

let lastItem = myArray[arrayLength - 1];

// Don't edit the code below here!
// ...
```

```js hidden live-sample___arrays-2-finish
const myString = "Ryu+Ken+Chun-Li+Cammy+Guile+Sakura+Sagat+Juri";
let myArray = myString.split("+");
let arrayLength = myArray.length;
let lastItem = myArray[arrayLength - 1];

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = `Array: ${myArray}`;
const para2 = document.createElement("p");
para2.textContent = `The length of the array is ${arrayLength}.`;
const para3 = document.createElement("p");
para3.textContent = `The last item in the array is "${lastItem}".`;
section.appendChild(para1);
section.appendChild(para2);
section.appendChild(para3);
```

</details>

## Mảng 3

Đối với nhiệm vụ mảng này, chúng ta cung cấp cho bạn mảng khởi đầu, và bạn sẽ làm việc theo chiều ngược lại. Bạn cần:

1. Xóa phần tử cuối cùng trong mảng.
2. Thêm hai tên mới vào cuối mảng.
3. Lặp qua từng phần tử trong mảng và thêm số chỉ mục của nó sau tên trong ngoặc đơn, ví dụ `Ryu (0)`. Lưu ý rằng chúng ta không dạy cách làm điều này trong bài viết Mảng, vì vậy bạn sẽ phải tự nghiên cứu.
4. Cuối cùng, nối các phần tử mảng lại thành một chuỗi duy nhất gọi là `myString`, với dấu phân cách là `"-"`.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("arrays-3", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___arrays-3
const myArray = [
  "Ryu",
  "Ken",
  "Chun-Li",
  "Cammy",
  "Guile",
  "Sakura",
  "Sagat",
  "Juri",
];

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = myString;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("arrays-3-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
const myArray = [
  "Ryu",
  "Ken",
  "Chun-Li",
  "Cammy",
  "Guile",
  "Sakura",
  "Sagat",
  "Juri",
];

myArray.pop();

myArray.push("Zangief");
myArray.push("Ibuki");

myArray.forEach((element, index) => {
  const newElement = `${element} (${index})`;
  myArray[index] = newElement;
});

const myString = myArray.join(" - ");

// Don't edit the code below here!
// ...
```

```js hidden live-sample___arrays-3-finish
const myArray = [
  "Ryu",
  "Ken",
  "Chun-Li",
  "Cammy",
  "Guile",
  "Sakura",
  "Sagat",
  "Juri",
];

myArray.pop();

myArray.push("Zangief");
myArray.push("Ibuki");

myArray.forEach((element, index) => {
  const newElement = `${element} (${index})`;
  myArray[index] = newElement;
});

const myString = myArray.join(" - ");

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = myString;
section.appendChild(para1);
```

</details>

## Mảng 4

Đối với nhiệm vụ mảng này, chúng ta cung cấp cho bạn một mảng khởi đầu liệt kê tên của một số loài chim.

Để hoàn thành nhiệm vụ:

1. Tìm chỉ mục của phần tử `"Eagles"`, và sử dụng nó để xóa phần tử `"Eagles"`.
2. Tạo một mảng mới từ mảng này, gọi là `eBirds`, chỉ chứa những loài chim từ mảng gốc có tên bắt đầu bằng chữ "E". Lưu ý rằng {{jsxref("String.prototype.startsWith()", "startsWith()")}} là cách tuyệt vời để kiểm tra xem một chuỗi có bắt đầu bằng một ký tự nhất định không.

Điểm khởi đầu của nhiệm vụ trông như thế này (chưa có gì hiển thị):

{{ EmbedLiveSample("arrays-4", "100%", 60) }}

Đây là mã cơ sở cho điểm khởi đầu này:

```js live-sample___arrays-4
const birds = ["Parrots", "Falcons", "Eagles", "Emus", "Caracaras", "Egrets"];

// Add your code here

// Don't edit the code below here!

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = eBirds;
section.appendChild(para1);
```

Đầu ra cập nhật sẽ trông như thế này:

{{ EmbedLiveSample("arrays-4-finish", "100%", 60) }}

<details>
<summary>Nhấp vào đây để hiển thị giải pháp</summary>

JavaScript hoàn chỉnh của bạn sẽ trông giống như thế này:

```js
const birds = ["Parrots", "Falcons", "Eagles", "Emus", "Caracaras", "Egrets"];

const eaglesIndex = birds.indexOf("Eagles");
birds.splice(eaglesIndex, 1);

function startsWithE(bird) {
  return bird.startsWith("E");
}
const eBirds = birds.filter(startsWithE);

// Don't edit the code below here!
// ...
```

```js hidden live-sample___arrays-4-finish
const birds = ["Parrots", "Falcons", "Eagles", "Emus", "Caracaras", "Egrets"];

const eaglesIndex = birds.indexOf("Eagles");
birds.splice(eaglesIndex, 1);

function startsWithE(bird) {
  return bird.startsWith("E");
}
const eBirds = birds.filter(startsWithE);

const section = document.querySelector("section");
const para1 = document.createElement("p");
para1.textContent = eBirds;
section.appendChild(para1);
```

</details>

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Arrays", "Learn_web_development/Core/Scripting/Silly_story_generator", "Learn_web_development/Core/Scripting")}}

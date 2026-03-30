---
title: Vòng lặp mã
short-title: Loops
slug: Learn_web_development/Core/Scripting/Loops
page-type: learn-module-chapter
sidebar: learnsidebar
---

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Conditionals","Learn_web_development/Core/Scripting/Test_your_skills/Loops", "Learn_web_development/Core/Scripting")}}

Ngôn ngữ lập trình rất hữu ích trong việc hoàn thành nhanh các tác vụ lặp đi lặp lại, từ nhiều phép tính cơ bản đến bất kỳ tình huống nào khác mà bạn có nhiều mục công việc tương tự cần hoàn thành. Ở đây chúng ta sẽ xem xét các cấu trúc vòng lặp có trong JavaScript để xử lý các nhu cầu như vậy.

<table>
  <tbody>
    <tr>
      <th scope="row">Điều kiện tiên quyết:</th>
      <td>Hiểu biết về <a href="/en-US/docs/Learn_web_development/Core/Structuring_content">HTML</a> và <a href="/en-US/docs/Learn_web_development/Core/Styling_basics">nền tảng CSS</a>, quen thuộc với các kiến thức cơ bản về JavaScript như đã học trong các bài trước.</td>
    </tr>
    <tr>
      <th scope="row">Kết quả học tập:</th>
      <td>
        <ul>
          <li>Hiểu mục đích của vòng lặp — một cấu trúc mã cho phép bạn làm điều gì đó rất nhiều lần mà không cần lặp lại cùng một mã cho mỗi lần lặp.</li>
          <li>Các loại vòng lặp chung như <code>for</code> và <code>while</code>.</li>
          <li>Lặp qua các tập hợp với các cấu trúc như <code>for...of</code> và <code>map()</code>.</li>
          <li>Thoát khỏi vòng lặp và tiếp tục.</li>
        </ul>
      </td>
    </tr>
  </tbody>
</table>

## Tại sao vòng lặp hữu ích?

Vòng lặp là tất cả về việc làm đi làm lại cùng một thứ. Thường thì mã sẽ hơi khác nhau mỗi vòng lặp, hoặc cùng mã sẽ chạy nhưng với các biến khác nhau.

### Ví dụ mã vòng lặp

Giả sử chúng ta muốn vẽ 100 vòng tròn ngẫu nhiên trên phần tử {{htmlelement("canvas")}} (nhấn nút _Update_ để chạy ví dụ lại nhiều lần để xem các bộ ngẫu nhiên khác nhau):

```html hidden
<button>Update</button> <canvas></canvas>
```

```css hidden
html {
  width: 100%;
  height: inherit;
  background: #dddddd;
}

canvas {
  display: block;
}

body {
  margin: 0;
}

button {
  position: absolute;
  top: 5px;
  left: 5px;
}
```

{{ EmbedLiveSample('Looping_code_example', '100%', 400) }}

Đây là mã JavaScript triển khai ví dụ này:

```js
const btn = document.querySelector("button");
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");

canvas.width = document.documentElement.clientWidth;
canvas.height = document.documentElement.clientHeight;

function random(number) {
  return Math.floor(Math.random() * number);
}

function draw() {
  ctx.clearRect(0, 0, canvas.width, canvas.height);
  for (let i = 0; i < 100; i++) {
    ctx.beginPath();
    ctx.fillStyle = "rgb(255 0 0 / 50%)";
    ctx.arc(
      random(canvas.width),
      random(canvas.height),
      random(50),
      0,
      2 * Math.PI,
    );
    ctx.fill();
  }
}

btn.addEventListener("click", draw);
```

### Có và không có vòng lặp

Bạn không cần phải hiểu tất cả mã ngay bây giờ, nhưng hãy xem phần mã thực sự vẽ 100 vòng tròn:

```js
for (let i = 0; i < 100; i++) {
  ctx.beginPath();
  ctx.fillStyle = "rgb(255 0 0 / 50%)";
  ctx.arc(
    random(canvas.width),
    random(canvas.height),
    random(50),
    0,
    2 * Math.PI,
  );
  ctx.fill();
}
```

Bạn nên hiểu ý tưởng cơ bản — chúng ta đang sử dụng vòng lặp để chạy 100 lần lặp của mã này, mỗi lần vẽ một vòng tròn ở vị trí ngẫu nhiên trên trang. `random(x)`, được định nghĩa trước đó trong mã, trả về một số nguyên giữa `0` và `x-1`.
Lượng mã cần thiết sẽ giống nhau cho dù chúng ta vẽ 100 vòng tròn, 1000, hay 10.000.
Chỉ cần thay đổi một số.

Nếu chúng ta không sử dụng vòng lặp ở đây, chúng ta sẽ phải lặp lại mã sau cho mỗi vòng tròn chúng ta muốn vẽ:

```js
ctx.beginPath();
ctx.fillStyle = "rgb(255 0 0 / 50%)";
ctx.arc(
  random(canvas.width),
  random(canvas.height),
  random(50),
  0,
  2 * Math.PI,
);
ctx.fill();
```

Điều này sẽ rất nhàm chán và khó bảo trì.

## Lặp qua một tập hợp

Hầu hết thời gian khi bạn sử dụng vòng lặp, bạn sẽ có một tập hợp các mục và muốn làm gì đó với mỗi mục.

Một loại tập hợp là {{jsxref("Array")}}, mà chúng ta đã gặp trong chương [Mảng](/en-US/docs/Learn_web_development/Core/Scripting/Arrays) của khóa học này.
Nhưng cũng có các tập hợp khác trong JavaScript, bao gồm {{jsxref("Set")}} và {{jsxref("Map")}}.

### Vòng lặp for...of

Công cụ cơ bản để lặp qua một tập hợp là vòng lặp {{jsxref("statements/for...of","for...of")}}:

```js
const cats = ["Leopard", "Serval", "Jaguar", "Tiger", "Caracal", "Lion"];

for (const cat of cats) {
  console.log(cat);
}
```

Trong ví dụ này, `for (const cat of cats)` nói:

1. Cho tập hợp `cats`, lấy mục đầu tiên trong tập hợp.
2. Gán nó cho biến `cat` và sau đó chạy mã giữa các dấu ngoặc nhọn `{}`.
3. Lấy mục tiếp theo, và lặp lại (2) cho đến khi bạn đạt đến cuối tập hợp.

### map() và filter()

JavaScript cũng có các vòng lặp chuyên biệt hơn cho các tập hợp, và chúng ta sẽ đề cập hai trong số đó ở đây.

Bạn có thể sử dụng `map()` để làm gì đó với mỗi mục trong tập hợp và tạo ra một tập hợp mới chứa các mục đã thay đổi:

```js
function toUpper(string) {
  return string.toUpperCase();
}

const cats = ["Leopard", "Serval", "Jaguar", "Tiger", "Caracal", "Lion"];

const upperCats = cats.map(toUpper);

console.log(upperCats);
// [ "LEOPARD", "SERVAL", "JAGUAR", "TIGER", "CARACAL", "LION" ]
```

Ở đây chúng ta truyền một hàm vào {{jsxref("Array.prototype.map()","cats.map()")}}, và `map()` gọi hàm một lần cho mỗi mục trong mảng, truyền mục vào. Sau đó nó thêm giá trị trả về từ mỗi lần gọi hàm vào một mảng mới, và cuối cùng trả về mảng mới. Trong trường hợp này hàm chúng ta cung cấp chuyển đổi mục thành chữ hoa, vì vậy mảng kết quả chứa tất cả mèo của chúng ta ở chữ hoa:

```js-nolint
[ "LEOPARD", "SERVAL", "JAGUAR", "TIGER", "CARACAL", "LION" ]
```

Bạn có thể sử dụng {{jsxref("Array.prototype.filter()","filter()")}} để kiểm tra từng mục trong tập hợp và tạo ra một tập hợp mới chỉ chứa các mục khớp:

```js
function lCat(cat) {
  return cat.startsWith("L");
}

const cats = ["Leopard", "Serval", "Jaguar", "Tiger", "Caracal", "Lion"];

const filtered = cats.filter(lCat);

console.log(filtered);
// [ "Leopard", "Lion" ]
```

Điều này trông rất giống `map()`, ngoại trừ hàm chúng ta truyền vào trả về một [boolean](/en-US/docs/Learn_web_development/Core/Scripting/Variables#booleans): nếu nó trả về `true`, thì mục được đưa vào mảng mới.
Hàm của chúng ta kiểm tra xem mục có bắt đầu bằng chữ "L" không, vì vậy kết quả là mảng chỉ chứa mèo có tên bắt đầu bằng "L":

```js-nolint
[ "Leopard", "Lion" ]
```

Lưu ý rằng `map()` và `filter()` đều thường được sử dụng với _biểu thức hàm_, mà bạn sẽ tìm hiểu trong bài học [Hàm](/en-US/docs/Learn_web_development/Core/Scripting/Functions).
Sử dụng biểu thức hàm, chúng ta có thể viết lại ví dụ trên để nhỏ gọn hơn nhiều:

```js
const cats = ["Leopard", "Serval", "Jaguar", "Tiger", "Caracal", "Lion"];

const filtered = cats.filter((cat) => cat.startsWith("L"));
console.log(filtered);
// [ "Leopard", "Lion" ]
```

## Vòng lặp for tiêu chuẩn

Trong ví dụ "vẽ vòng tròn" ở trên, bạn không có tập hợp các mục để lặp qua: bạn thực sự chỉ muốn chạy cùng một mã 100 lần.
Trong trường hợp như vậy, bạn có thể sử dụng vòng lặp {{jsxref("statements/for","for")}}.
Nó có cú pháp sau:

```js-nolint
for (initializer; condition; final-expression) {
  // code to run
}
```

Ở đây chúng ta có:

1. Từ khóa `for`, theo sau là một cặp dấu ngoặc đơn.
2. Bên trong dấu ngoặc đơn chúng ta có ba mục, được phân cách bởi dấu chấm phẩy:
   1. **Bộ khởi tạo** — đây thường là một biến được đặt thành một số, được tăng lên để đếm số lần vòng lặp đã chạy.
      Đôi khi nó cũng được gọi là **biến đếm**.
   2. **Điều kiện** — điều này xác định khi nào vòng lặp nên dừng lặp.
      Đây thường là một biểu thức có toán tử so sánh, một bài kiểm tra để xem điều kiện thoát đã được đáp ứng chưa.
   3. **Biểu thức cuối** — điều này luôn được đánh giá (hoặc chạy) mỗi khi vòng lặp đã thực hiện một lần lặp đầy đủ.
      Nó thường phục vụ để tăng (hoặc trong một số trường hợp giảm) biến đếm, để đưa nó đến gần điểm mà điều kiện không còn là `true`.

3. Một số dấu ngoặc nhọn chứa một khối mã — mã này sẽ được chạy mỗi khi vòng lặp lặp lại.

> [!NOTE]
> [Aside: Loops](https://scrimba.com/learn-javascript-c0v/~02a?via=mdn) từ Scrimba<sup>[_Đối tác học MDN_](/en-US/docs/MDN/Writing_guidelines/Learning_content#partner_links_and_embeds)</sup> cung cấp một phân tích tương tác hữu ích về cú pháp vòng lặp `for`.

### Tính bình phương

Hãy xem một ví dụ thực tế để chúng ta có thể hình dung rõ hơn những gì chúng làm.

```html hidden
<button id="calculate">Calculate</button>
<button id="clear">Clear</button>
<pre id="results"></pre>
```

```js
const results = document.querySelector("#results");

function calculate() {
  for (let i = 1; i < 10; i++) {
    const newResult = `${i} x ${i} = ${i * i}`;
    results.textContent += `${newResult}\n`;
  }
  results.textContent += "\nFinished!\n\n";
}

const calculateBtn = document.querySelector("#calculate");
const clearBtn = document.querySelector("#clear");

calculateBtn.addEventListener("click", calculate);
clearBtn.addEventListener("click", () => (results.textContent = ""));
```

Điều này cho chúng ta đầu ra sau:

{{ EmbedLiveSample('Calculating squares', '100%', 250) }}

Mã này tính bình phương cho các số từ 1 đến 9, và ghi ra kết quả. Phần cốt lõi của mã là vòng lặp `for` thực hiện phép tính.

Hãy phân tích dòng `for (let i = 1; i < 10; i++)` thành ba phần:

1. `let i = 1`: biến đếm, `i`, bắt đầu tại `1`. Lưu ý rằng chúng ta phải sử dụng `let` cho biến đếm, vì chúng ta đang gán lại nó mỗi khi đi vòng lặp.
2. `i < 10`: tiếp tục đi vòng lặp miễn là `i` nhỏ hơn `10`.
3. `i++`: thêm một vào `i` mỗi vòng lặp.

Bên trong vòng lặp, chúng ta tính bình phương của giá trị hiện tại của `i`, tức là: `i * i`. Chúng ta tạo một chuỗi biểu thị phép tính chúng ta đã thực hiện và kết quả, và thêm chuỗi này vào văn bản đầu ra. Chúng ta cũng thêm `\n`, để chuỗi tiếp theo chúng ta thêm sẽ bắt đầu trên một dòng mới. Vì vậy:

1. Trong lần chạy đầu tiên, `i = 1`, vì vậy chúng ta sẽ thêm `1 x 1 = 1`.
2. Trong lần chạy thứ hai, `i = 2`, vì vậy chúng ta sẽ thêm `2 x 2 = 4`.
3. Và cứ tiếp tục…
4. Khi `i` bằng `10`, chúng ta sẽ dừng chạy vòng lặp và chuyển thẳng đến đoạn mã tiếp theo bên dưới vòng lặp, in ra thông báo `Finished!` trên một dòng mới.

### Lặp qua tập hợp với vòng lặp for

Bạn có thể sử dụng vòng lặp `for` để lặp qua một tập hợp, thay vì vòng lặp `for...of`.

Hãy xem lại ví dụ `for...of` của chúng ta ở trên:

```js
const cats = ["Leopard", "Serval", "Jaguar", "Tiger", "Caracal", "Lion"];

for (const cat of cats) {
  console.log(cat);
}
```

Chúng ta có thể viết lại mã đó như thế này:

```js
const cats = ["Leopard", "Serval", "Jaguar", "Tiger", "Caracal", "Lion"];

for (let i = 0; i < cats.length; i++) {
  console.log(cats[i]);
}
```

Trong vòng lặp này, chúng ta bắt đầu `i` tại `0` và dừng khi `i` đạt đến độ dài của mảng.
Sau đó bên trong vòng lặp, chúng ta đang sử dụng `i` để truy cập từng mục trong mảng lần lượt.

Điều này hoạt động tốt, và trong các phiên bản đầu của JavaScript, `for...of` chưa tồn tại, vì vậy đây là cách tiêu chuẩn để lặp qua một mảng.
Tuy nhiên, nó có nhiều cơ hội hơn để đưa ra lỗi trong mã của bạn. Ví dụ:

- bạn có thể bắt đầu `i` tại `1`, quên rằng chỉ số mảng đầu tiên là không, không phải 1.
- bạn có thể dừng tại `i <= cats.length`, quên rằng chỉ số mảng cuối cùng là `length - 1`.

Vì những lý do như vậy, thường tốt nhất là sử dụng `for...of` nếu có thể.

Đôi khi bạn vẫn cần sử dụng vòng lặp `for` để lặp qua một mảng.
Ví dụ, trong mã bên dưới chúng ta muốn ghi ra một thông báo liệt kê mèo của chúng ta:

```js
const cats = ["Pete", "Biggles", "Jasmine"];

let myFavoriteCats = "My cats are called ";

for (const cat of cats) {
  myFavoriteCats += `${cat}, `;
}

console.log(myFavoriteCats); // "My cats are called Pete, Biggles, Jasmine, "
```

Câu đầu ra cuối cùng không được định dạng tốt:

```plain
My cats are called Pete, Biggles, Jasmine,
```

Chúng ta muốn xử lý con mèo cuối cùng khác đi, như thế này:

```plain
My cats are called Pete, Biggles, and Jasmine.
```

Nhưng để làm điều này, chúng ta cần biết khi nào chúng ta đang ở vòng lặp cuối cùng và để làm điều đó, chúng ta có thể sử dụng vòng lặp `for` và kiểm tra giá trị của `i`:

```js
const cats = ["Pete", "Biggles", "Jasmine"];

let myFavoriteCats = "My cats are called ";

for (let i = 0; i < cats.length; i++) {
  if (i === cats.length - 1) {
    // We are at the end of the array
    myFavoriteCats += `and ${cats[i]}.`;
  } else {
    myFavoriteCats += `${cats[i]}, `;
  }
}

console.log(myFavoriteCats); // "My cats are called Pete, Biggles, and Jasmine."
```

## Thoát khỏi vòng lặp với break

Nếu bạn muốn thoát khỏi vòng lặp trước khi tất cả các lần lặp đã hoàn thành, bạn có thể sử dụng câu lệnh [break](/en-US/docs/Web/JavaScript/Reference/Statements/break).
Chúng ta đã gặp điều này trong bài viết trước khi chúng ta xem xét [câu lệnh switch](/en-US/docs/Learn_web_development/Core/Scripting/Conditionals#switch_statements) — khi một case được đáp ứng trong câu lệnh switch phù hợp với biểu thức đầu vào, câu lệnh `break` ngay lập tức thoát khỏi câu lệnh switch và chuyển sang mã sau nó.

Vòng lặp cũng vậy — câu lệnh `break` sẽ ngay lập tức thoát khỏi vòng lặp và làm cho trình duyệt chuyển sang bất kỳ mã nào theo sau nó.

Giả sử chúng ta muốn tìm kiếm qua một mảng danh bạ và số điện thoại và chỉ trả về số chúng ta muốn tìm?
Đầu tiên, một số HTML đơn giản — một văn bản {{htmlelement("input")}} cho phép chúng ta nhập tên để tìm kiếm, một phần tử {{htmlelement("button")}} để gửi tìm kiếm, và một phần tử {{htmlelement("p")}} để hiển thị kết quả trong:

```html
<label for="search">Search by contact name: </label>
<input id="search" type="text" />
<button>Search</button>

<p></p>
```

Bây giờ đến JavaScript:

```js
const contacts = [
  "Chris:2232322",
  "Sarah:3453456",
  "Bill:7654322",
  "Mary:9998769",
  "Dianne:9384975",
];
const para = document.querySelector("p");
const input = document.querySelector("input");
const btn = document.querySelector("button");

btn.addEventListener("click", () => {
  const searchName = input.value.toLowerCase();
  input.value = "";
  input.focus();
  para.textContent = "";
  for (const contact of contacts) {
    const splitContact = contact.split(":");
    if (splitContact[0].toLowerCase() === searchName) {
      para.textContent = `${splitContact[0]}'s number is ${splitContact[1]}.`;
      break;
    }
  }
  if (para.textContent === "") {
    para.textContent = "Contact not found.";
  }
});
```

{{ EmbedLiveSample('Exiting_loops_with_break', '100%', 100) }}

1. Trước hết, chúng ta có một số định nghĩa biến — chúng ta có một mảng thông tin liên lạc, với mỗi mục là một chuỗi chứa tên và số điện thoại được phân cách bằng dấu hai chấm.
2. Tiếp theo, chúng ta gắn trình nghe sự kiện vào nút (`btn`) sao cho khi được nhấn, một số mã được chạy để thực hiện tìm kiếm và trả về kết quả.
3. Chúng ta lưu giá trị được nhập vào ô nhập văn bản trong biến `searchName`, trước khi làm trống ô nhập văn bản và tập trung lại, sẵn sàng cho lần tìm kiếm tiếp theo.
   Lưu ý rằng chúng ta cũng chạy phương thức [`toLowerCase()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase) trên chuỗi, để tìm kiếm không phân biệt chữ hoa chữ thường.
4. Bây giờ đến phần thú vị, vòng lặp `for...of`:
   1. Bên trong vòng lặp, trước tiên chúng ta tách danh bạ hiện tại tại ký tự dấu hai chấm và lưu hai giá trị kết quả trong mảng `splitContact`.
   2. Sau đó chúng ta sử dụng câu lệnh điều kiện để kiểm tra xem `splitContact[0]` (tên danh bạ, cũng được chuyển sang chữ thường với [`toLowerCase()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase)) có bằng `searchName` đã được nhập không.
      Nếu có, chúng ta nhập một chuỗi vào đoạn văn để báo cáo số danh bạ là gì, và sử dụng `break` để kết thúc vòng lặp.

5. Sau vòng lặp, chúng ta kiểm tra xem chúng ta có đặt danh bạ không, và nếu không, chúng ta đặt văn bản đoạn văn thành "Contact not found.".

> [!NOTE]
> Bạn có thể xem [mã nguồn đầy đủ trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/loops/contact-search.html) (cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/loops/contact-search.html)).

## Bỏ qua các lần lặp với continue

Câu lệnh [continue](/en-US/docs/Web/JavaScript/Reference/Statements/continue) hoạt động tương tự như `break`, nhưng thay vì thoát khỏi vòng lặp hoàn toàn, nó bỏ qua đến lần lặp tiếp theo của vòng lặp.
Hãy xem một ví dụ khác lấy một số làm đầu vào và chỉ trả về các số là bình phương của số nguyên (số nguyên).

HTML về cơ bản giống như ví dụ cuối — một đầu vào số đơn giản và một đoạn văn để đầu ra.

```html
<label for="number">Enter number: </label>
<input id="number" type="number" />
<button>Generate integer squares</button>

<p>Output:</p>
```

JavaScript cũng hầu hết giống nhau, mặc dù bản thân vòng lặp có một chút khác biệt:

```js
const para = document.querySelector("p");
const input = document.querySelector("input");
const btn = document.querySelector("button");

btn.addEventListener("click", () => {
  para.textContent = "Output: ";
  const num = input.value;
  input.value = "";
  input.focus();
  for (let i = 1; i <= num; i++) {
    let sqRoot = Math.sqrt(i);
    if (Math.floor(sqRoot) !== sqRoot) {
      continue;
    }
    para.textContent += `${i} `;
  }
});
```

Đây là đầu ra:

{{ EmbedLiveSample('Skipping_iterations_with_continue', '100%', 100) }}

1. Trong trường hợp này, đầu vào nên là một số (`num`). Vòng lặp `for` được đưa ra một biến đếm bắt đầu tại 1 (vì chúng ta không quan tâm đến 0 trong trường hợp này), điều kiện thoát nói rằng vòng lặp sẽ dừng khi biến đếm lớn hơn `num` đầu vào, và bộ lặp thêm 1 vào biến đếm mỗi lần.
2. Bên trong vòng lặp, chúng ta tìm căn bậc hai của mỗi số bằng cách sử dụng [`Math.sqrt(i)`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sqrt), sau đó kiểm tra xem căn bậc hai có phải là số nguyên hay không bằng cách kiểm tra xem nó có giống với chính nó khi đã được làm tròn xuống số nguyên gần nhất không (đây là điều mà [`Math.floor()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/floor) làm với số được truyền vào).
3. Nếu căn bậc hai và căn bậc hai làm tròn xuống không bằng nhau (`!==`), điều đó có nghĩa là căn bậc hai không phải là số nguyên, vì vậy chúng ta không quan tâm đến nó. Trong trường hợp như vậy, chúng ta sử dụng câu lệnh `continue` để bỏ qua đến lần lặp vòng lặp tiếp theo mà không ghi lại số ở bất kỳ đâu.
4. Nếu căn bậc hai là số nguyên, chúng ta bỏ qua khối `if` hoàn toàn, vì vậy câu lệnh `continue` không được thực thi; thay vào đó, chúng ta nối giá trị `i` hiện tại cộng một khoảng trắng vào cuối nội dung đoạn văn.

> [!NOTE]
> Bạn có thể xem [mã nguồn đầy đủ trên GitHub](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/loops/integer-squares.html) (cũng [xem nó chạy trực tiếp](https://mdn.github.io/learning-area/javascript/building-blocks/loops/integer-squares.html)).

## while và do...while

`for` không phải là loại vòng lặp chung duy nhất có trong JavaScript. Thực ra có nhiều loại khác và, mặc dù bạn không cần phải hiểu tất cả chúng ngay bây giờ, nhưng đáng để xem cấu trúc của một số loại khác để bạn có thể nhận ra các tính năng tương tự đang hoạt động theo một cách hơi khác.

Đầu tiên, hãy xem vòng lặp [`while`](/en-US/docs/Web/JavaScript/Reference/Statements/while). Cú pháp của vòng lặp này trông như thế này:

```js-nolint
initializer
while (condition) {
  // code to run

  final-expression
}
```

Điều này hoạt động theo cách rất giống với vòng lặp `for`, ngoại trừ biến khởi tạo được đặt trước vòng lặp, và biểu thức cuối được đưa vào bên trong vòng lặp sau mã cần chạy, thay vì hai mục này được đưa vào bên trong dấu ngoặc đơn.
Điều kiện được đưa vào bên trong dấu ngoặc đơn, được đặt trước bởi từ khóa `while` thay vì `for`.

Ba mục giống nhau vẫn còn hiện diện và chúng vẫn được định nghĩa theo cùng thứ tự như trong vòng lặp for.
Điều này là vì bạn phải có bộ khởi tạo được xác định trước khi bạn có thể kiểm tra xem điều kiện có đúng không.
Biểu thức cuối sau đó được chạy sau khi mã bên trong vòng lặp đã chạy (một lần lặp đã hoàn thành), điều này chỉ xảy ra nếu điều kiện vẫn đúng.

Hãy xem lại ví dụ danh sách mèo của chúng ta, nhưng được viết lại để sử dụng vòng lặp while:

```js
const cats = ["Pete", "Biggles", "Jasmine"];

let myFavoriteCats = "My cats are called ";

let i = 0;

while (i < cats.length) {
  if (i === cats.length - 1) {
    myFavoriteCats += `and ${cats[i]}.`;
  } else {
    myFavoriteCats += `${cats[i]}, `;
  }

  i++;
}

console.log(myFavoriteCats); // "My cats are called Pete, Biggles, and Jasmine."
```

> [!NOTE]
> Điều này vẫn hoạt động như mong đợi — hãy xem nó [chạy trực tiếp trên GitHub](https://mdn.github.io/learning-area/javascript/building-blocks/loops/while.html) (cũng xem [mã nguồn đầy đủ](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/loops/while.html)).

Vòng lặp [`do...while`](/en-US/docs/Web/JavaScript/Reference/Statements/do...while) rất giống, nhưng cung cấp một biến thể trên cấu trúc while:

```js-nolint
initializer
do {
  // code to run

  final-expression
} while (condition)
```

Trong trường hợp này, bộ khởi tạo lại đến đầu tiên, trước khi vòng lặp bắt đầu. Từ khóa trực tiếp đứng trước các dấu ngoặc nhọn chứa mã cần chạy và biểu thức cuối.

Sự khác biệt chính giữa vòng lặp `do...while` và vòng lặp `while` là _mã bên trong vòng lặp `do...while` luôn được thực thi ít nhất một lần_. Đó là vì điều kiện đến sau mã bên trong vòng lặp. Vì vậy, chúng ta luôn chạy mã đó, sau đó kiểm tra xem chúng ta có cần chạy lại không. Trong vòng lặp `while` và `for`, việc kiểm tra đến đầu tiên, vì vậy mã có thể không bao giờ được thực thi.

Hãy viết lại ví dụ liệt kê mèo của chúng ta lại để sử dụng vòng lặp `do...while`:

```js
const cats = ["Pete", "Biggles", "Jasmine"];

let myFavoriteCats = "My cats are called ";

let i = 0;

do {
  if (i === cats.length - 1) {
    myFavoriteCats += `and ${cats[i]}.`;
  } else {
    myFavoriteCats += `${cats[i]}, `;
  }

  i++;
} while (i < cats.length);

console.log(myFavoriteCats); // "My cats are called Pete, Biggles, and Jasmine."
```

> [!NOTE]
> Một lần nữa, điều này hoạt động như mong đợi — hãy xem nó [chạy trực tiếp trên GitHub](https://mdn.github.io/learning-area/javascript/building-blocks/loops/do-while.html) (cũng xem [mã nguồn đầy đủ](https://github.com/mdn/learning-area/blob/main/javascript/building-blocks/loops/do-while.html)).

> [!WARNING]
> Với bất kỳ loại vòng lặp nào, bạn phải đảm bảo rằng bộ khởi tạo được tăng lên, hoặc tùy thuộc vào trường hợp, giảm xuống, để điều kiện cuối cùng trở thành false.
> Nếu không, vòng lặp sẽ tiếp tục mãi, và trình duyệt sẽ buộc nó dừng, hoặc nó sẽ bị sập. Đây được gọi là **vòng lặp vô hạn**.

## Triển khai đếm ngược phóng tàu

Trong bài tập này, chúng ta muốn bạn in ra một đếm ngược phóng tàu đơn giản vào hộp đầu ra, từ 10 xuống đến Blastoff.

Để hoàn thành bài tập:

1. Nhấn **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Thêm mã để lặp từ 10 xuống 0. Chúng ta đã cung cấp cho bạn bộ khởi tạo — `let i = 10;`.
3. Đối với mỗi lần lặp, tạo một đoạn văn mới và thêm nó vào `<div>` đầu ra, mà chúng ta đã chọn bằng `const output = document.querySelector('.output');`. Chúng ta đã cung cấp cho bạn ba dòng mã bên trong các chú thích cần được sử dụng ở đâu đó bên trong vòng lặp:
   1. `const para = document.createElement('p');` — tạo một đoạn văn mới.
   2. `output.appendChild(para);` — thêm đoạn văn vào `<div>` đầu ra.
   3. `para.textContent =` — làm cho văn bản bên trong đoạn văn bằng với bất cứ điều gì bạn đặt ở bên phải, sau dấu bằng.
4. Đối với các số lần lặp khác nhau được liệt kê bên dưới, viết mã để chèn văn bản yêu cầu bên trong đoạn văn (bạn sẽ cần câu lệnh điều kiện và nhiều dòng `para.textContent =`):
   1. Nếu số là 10, in "Countdown 10" vào đoạn văn.
   2. Nếu số là 0, in "Blast off!" vào đoạn văn.
   3. Đối với bất kỳ số nào khác, chỉ in số đó vào đoạn văn.
5. Nhớ bao gồm bộ lặp! Tuy nhiên, trong ví dụ này chúng ta đang đếm xuống sau mỗi lần lặp, không phải lên, vì vậy bạn **không** muốn `i++` — bạn lặp xuống như thế nào?

> [!NOTE]
> Nếu bạn bắt đầu gõ vòng lặp (ví dụ `(while(i>=0)`), trình duyệt có thể bị mắc kẹt trong vòng lặp vô hạn vì bạn chưa nhập điều kiện kết thúc. Vì vậy hãy cẩn thận với điều này. Bạn có thể bắt đầu viết mã trong một chú thích để giải quyết vấn đề này và xóa chú thích sau khi hoàn thành.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị mắc kẹt, bạn có thể xem giải pháp bên dưới đầu ra trực tiếp.

```html hidden live-sample___loops-1
<div class="output"></div>
```

```css hidden live-sample___loops-1
html {
  font-family: sans-serif;
}

h2 {
  font-size: 16px;
}

.a11y-label {
  margin: 0;
  text-align: right;
  font-size: 0.7rem;
  width: 98%;
}

body {
  margin: 10px;
  background: #f5f9fa;
}

.output {
  height: 410px;
  overflow: auto;
}
```

```js live-sample___loops-1
const output = document.querySelector(".output");
output.textContent = "";

// let i = 10;

// const para = document.createElement('p');
// para.textContent = ;
// output.appendChild(para);
```

{{ EmbedLiveSample("loops-1", "100%", 200) }}

<details>
<summary>Nhấn vào đây để xem giải pháp</summary>

JavaScript hoàn chỉnh của bạn nên trông giống như thế này:

```js
const output = document.querySelector(".output");
output.textContent = "";

let i = 10;

while (i >= 0) {
  const para = document.createElement("p");
  if (i === 10) {
    para.textContent = `Countdown ${i}`;
  } else if (i === 0) {
    para.textContent = "Blast off!";
  } else {
    para.textContent = i;
  }

  output.appendChild(para);

  i--;
}
```

</details>

## Điền vào danh sách khách mời

Trong bài tập này, chúng ta muốn bạn lấy danh sách tên được lưu trong một mảng và đưa chúng vào danh sách khách mời. Nhưng không đơn giản như vậy — chúng ta không muốn để Phil và Lola vào vì họ tham lam và thô lỗ, và luôn ăn hết thức ăn! Chúng ta có hai danh sách, một cho khách được vào, và một cho khách bị từ chối.

Để hoàn thành bài tập:

1. Nhấn **"Play"** trong khối mã bên dưới để chỉnh sửa ví dụ trong MDN Playground.
2. Viết một vòng lặp sẽ lặp qua mảng `people`.
3. Trong mỗi lần lặp, kiểm tra xem mục mảng hiện tại có bằng "Phil" hoặc "Lola" không bằng câu lệnh điều kiện:
   1. Nếu có, nối mục mảng vào cuối `textContent` của đoạn văn `refused`, theo sau là dấu phẩy và khoảng trắng.
   2. Nếu không, nối mục mảng vào cuối `textContent` của đoạn văn `admitted`, theo sau là dấu phẩy và khoảng trắng.

Chúng ta đã cung cấp cho bạn:

- `refused.textContent +=` — phần đầu của dòng sẽ nối thứ gì đó vào cuối `refused.textContent`.
- `admitted.textContent +=` — phần đầu của dòng sẽ nối thứ gì đó vào cuối `admitted.textContent`.

Câu hỏi thưởng thêm — sau khi hoàn thành các tác vụ trên thành công, bạn sẽ còn lại hai danh sách tên, được phân cách bằng dấu phẩy, nhưng chúng sẽ không gọn gàng — sẽ có một dấu phẩy ở cuối mỗi cái. Bạn có thể tìm ra cách viết các dòng cắt dấu phẩy cuối trong mỗi trường hợp và thêm dấu chấm vào cuối không?
Hãy xem bài viết [Các phương thức chuỗi hữu ích](/en-US/docs/Learn_web_development/Core/Scripting/Useful_string_methods) để được trợ giúp.

Nếu bạn mắc lỗi, bạn có thể xóa công việc của mình bằng nút _Reset_ trong MDN Playground. Nếu bạn thực sự bị mắc kẹt, bạn có thể xem giải pháp bên dưới đầu ra trực tiếp.

```html hidden live-sample___loops-2
<div class="output">
  <p class="admitted">Admit:</p>
  <p class="refused">Refuse:</p>
</div>
```

```css hidden live-sample___loops-2
html {
  font-family: sans-serif;
}

h2 {
  font-size: 16px;
}

.a11y-label {
  margin: 0;
  text-align: right;
  font-size: 0.7rem;
  width: 98%;
}

body {
  margin: 10px;
  background: #f5f9fa;
}

.output {
  height: 100px;
  overflow: auto;
}
```

```js live-sample___loops-2
const people = [
  "Chris",
  "Anne",
  "Colin",
  "Terri",
  "Phil",
  "Lola",
  "Sam",
  "Kay",
  "Bruce",
];

const admitted = document.querySelector(".admitted");
const refused = document.querySelector(".refused");
admitted.textContent = "Admit: ";
refused.textContent = "Refuse: ";

// loop starts here

// refused.textContent += ...;
// admitted.textContent += ...;
```

{{ EmbedLiveSample("loops-2", "100%", 200) }}

<details>
<summary>Nhấn vào đây để xem giải pháp</summary>

JavaScript hoàn chỉnh của bạn nên trông giống như thế này:

```js
const people = [
  "Chris",
  "Anne",
  "Colin",
  "Terri",
  "Phil",
  "Lola",
  "Sam",
  "Kay",
  "Bruce",
];

const admitted = document.querySelector(".admitted");
const refused = document.querySelector(".refused");

admitted.textContent = "Admit: ";
refused.textContent = "Refuse: ";

for (const person of people) {
  if (person === "Phil" || person === "Lola") {
    refused.textContent += `${person}, `;
  } else {
    admitted.textContent += `${person}, `;
  }
}

refused.textContent = `${refused.textContent.slice(0, -2)}.`;
admitted.textContent = `${admitted.textContent.slice(0, -2)}.`;
```

</details>

## Bạn nên sử dụng loại vòng lặp nào?

Nếu bạn đang lặp qua một mảng hoặc một số đối tượng khác hỗ trợ điều đó, và không cần quyền truy cập vào vị trí chỉ số của mỗi mục, thì `for...of` là lựa chọn tốt nhất. Nó dễ đọc hơn và ít xảy ra lỗi hơn.

Đối với các mục đích sử dụng khác, vòng lặp `for`, `while`, và `do...while` phần lớn có thể hoán đổi cho nhau.
Tất cả chúng đều có thể được sử dụng để giải quyết cùng một vấn đề, và loại nào bạn sử dụng sẽ phụ thuộc chủ yếu vào sở thích cá nhân của bạn — loại nào bạn thấy dễ nhớ nhất hoặc trực quan nhất.
Chúng ta sẽ khuyến nghị `for`, ít nhất là lúc đầu, vì nó có thể là cách dễ nhớ nhất — bộ khởi tạo, điều kiện và biểu thức cuối đều phải được đặt gọn gàng vào dấu ngoặc đơn, vì vậy dễ thấy chúng ở đâu và kiểm tra xem bạn có thiếu chúng không.

Hãy xem tất cả chúng một lần nữa.

Đầu tiên `for...of`:

```js-nolint
for (const item of array) {
  // code to run
}
```

`for`:

```js-nolint
for (initializer; condition; final-expression) {
  // code to run
}
```

`while`:

```js-nolint
initializer
while (condition) {
  // code to run

  final-expression
}
```

và cuối cùng `do...while`:

```js-nolint
initializer
do {
  // code to run

  final-expression
} while (condition)
```

> [!NOTE]
> Cũng có các loại vòng lặp/tính năng khác, hữu ích trong các tình huống nâng cao/chuyên biệt và nằm ngoài phạm vi của bài viết này. Nếu bạn muốn tìm hiểu thêm về vòng lặp, hãy đọc [hướng dẫn Vòng lặp và lặp nâng cao](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration) của chúng ta.

## Tóm tắt

Bài viết này đã tiết lộ cho bạn các khái niệm cơ bản và các tùy chọn khác nhau có sẵn khi lặp mã trong JavaScript.
Bây giờ bạn nên hiểu rõ tại sao vòng lặp là một cơ chế tốt để xử lý mã lặp đi lặp lại và háo hức sử dụng chúng trong các ví dụ của riêng bạn!

Trong bài viết tiếp theo, chúng ta sẽ cung cấp cho bạn một số bài kiểm tra mà bạn có thể sử dụng để kiểm tra mức độ bạn đã hiểu và ghi nhớ thông tin này.

## Xem thêm

- [Vòng lặp và lặp chi tiết](/en-US/docs/Web/JavaScript/Guide/Loops_and_iteration)
- [Tham chiếu for...of](/en-US/docs/Web/JavaScript/Reference/Statements/for...of)
- [Tham chiếu câu lệnh for](/en-US/docs/Web/JavaScript/Reference/Statements/for)
- Tham chiếu [while](/en-US/docs/Web/JavaScript/Reference/Statements/while) và [do...while](/en-US/docs/Web/JavaScript/Reference/Statements/do...while)
- Tham chiếu [break](/en-US/docs/Web/JavaScript/Reference/Statements/break) và [continue](/en-US/docs/Web/JavaScript/Reference/Statements/continue)

{{PreviousMenuNext("Learn_web_development/Core/Scripting/Test_your_skills/Conditionals","Learn_web_development/Core/Scripting/Test_your_skills/Loops", "Learn_web_development/Core/Scripting")}}

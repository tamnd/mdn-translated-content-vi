---
title: Loops and iteration
slug: Web/JavaScript/Guide/Loops_and_iteration
page-type: guide
sidebar: jssidebar
---

{{PreviousNext("Web/JavaScript/Guide/Control_flow_and_error_handling", "Web/JavaScript/Guide/Functions")}}

Vòng lặp cung cấp cách nhanh chóng và dễ dàng để thực hiện điều gì đó lặp đi lặp lại. Chương này của [JavaScript Guide](/en-US/docs/Web/JavaScript/Guide) giới thiệu các câu lệnh lặp khác nhau có sẵn trong JavaScript.

Bạn có thể nghĩ về vòng lặp như một phiên bản máy tính của trò chơi mà bạn yêu cầu ai đó đi _X_ bước theo một hướng, rồi _Y_ bước theo hướng khác. Ví dụ, ý tưởng "Đi năm bước về phía đông" có thể được diễn đạt bằng vòng lặp như sau:

```js
for (let step = 0; step < 5; step++) {
  // Runs 5 times, with values of step 0 through 4.
  console.log("Walking east one step");
}
```

Có nhiều loại vòng lặp khác nhau, nhưng tất cả về cơ bản đều làm cùng một việc: lặp lại một hành động một số lần. (Lưu ý rằng số lần có thể là không!)

Các cơ chế vòng lặp khác nhau cung cấp các cách khác nhau để xác định điểm bắt đầu và kết thúc của vòng lặp. Có nhiều tình huống được phục vụ tốt hơn bởi một loại vòng lặp này so với loại khác.

Các câu lệnh vòng lặp được cung cấp trong JavaScript là:

- [Câu lệnh for](#for_statement)
- [Câu lệnh do...while](#do...while_statement)
- [Câu lệnh while](#while_statement)
- [Câu lệnh có nhãn](#labeled_statement)
- [Câu lệnh break](#break_statement)
- [Câu lệnh continue](#continue_statement)
- [Câu lệnh for...in](#for...in_statement)
- [Câu lệnh for...of](#for...of_statement)

## Câu lệnh for

Vòng lặp {{jsxref("Statements/for", "for")}} lặp cho đến khi điều kiện được chỉ định đánh giá thành false. Vòng lặp `for` trong JavaScript tương tự như vòng lặp `for` trong Java và C.

Một câu lệnh `for` trông như sau:

```js-nolint
for (initialization; condition; afterthought)
  statement
```

Khi một vòng lặp `for` thực thi, xảy ra điều sau:

1. Biểu thức khởi tạo `initialization`, nếu có, được thực thi. Biểu thức này thường khởi tạo một hoặc nhiều bộ đếm vòng lặp, nhưng cú pháp cho phép biểu thức ở bất kỳ mức độ phức tạp nào. Biểu thức này cũng có thể khai báo biến.
2. Biểu thức `condition` được đánh giá. Nếu giá trị của `condition` là true, các câu lệnh vòng lặp thực thi. Ngược lại, vòng lặp `for` kết thúc. (Nếu biểu thức `condition` bị bỏ qua hoàn toàn, điều kiện được giả định là true.)
3. `statement` thực thi. Để thực thi nhiều câu lệnh, hãy sử dụng [câu lệnh block](/en-US/docs/Web/JavaScript/Reference/Statements/block) (`{ }`) để nhóm chúng lại.
4. Nếu có, biểu thức cập nhật `afterthought` được thực thi.
5. Quyền điều khiển trở lại Bước 2.

### Ví dụ

Trong ví dụ bên dưới, hàm chứa câu lệnh `for` đếm số tùy chọn được chọn trong danh sách cuộn (phần tử [`<select>`](/en-US/docs/Web/HTML/Reference/Elements/select) cho phép chọn nhiều tùy chọn).

#### HTML

```html
<form name="selectForm">
  <label for="musicTypes"
    >Choose some music types, then click the button below:</label
  >
  <select id="musicTypes" name="musicTypes" multiple>
    <option selected>R&amp;B</option>
    <option>Jazz</option>
    <option>Blues</option>
    <option>New Age</option>
    <option>Classical</option>
    <option>Opera</option>
  </select>
  <button id="btn" type="button">How many are selected?</button>
</form>
```

#### JavaScript

Ở đây, câu lệnh `for` khai báo biến `i` và khởi tạo nó thành `0`. Nó kiểm tra rằng `i` nhỏ hơn số tùy chọn trong phần tử `<select>`, thực thi câu lệnh `if` tiếp theo, và tăng `i` thêm 1 sau mỗi lần lặp qua vòng lặp.

```js
function countSelected(selectObject) {
  let numberSelected = 0;
  for (let i = 0; i < selectObject.options.length; i++) {
    if (selectObject.options[i].selected) {
      numberSelected++;
    }
  }
  return numberSelected;
}

const btn = document.getElementById("btn");

btn.addEventListener("click", () => {
  const musicTypes = document.selectForm.musicTypes;
  console.log(`You have selected ${countSelected(musicTypes)} option(s).`);
});
```

## Câu lệnh do...while

Câu lệnh {{jsxref("statements/do...while", "do...while")}} lặp cho đến khi điều kiện được chỉ định đánh giá thành false.

Một câu lệnh `do...while` trông như sau:

```js-nolint
do
  statement
while (condition);
```

`statement` luôn được thực thi một lần trước khi điều kiện được kiểm tra. (Để thực thi nhiều câu lệnh, hãy sử dụng câu lệnh block (`{ }`) để nhóm chúng lại.)

Nếu `condition` là `true`, câu lệnh thực thi lại. Ở cuối mỗi lần thực thi, điều kiện được kiểm tra. Khi điều kiện là `false`, thực thi dừng lại và quyền điều khiển chuyển sang câu lệnh theo sau `do...while`.

### Ví dụ

Trong ví dụ sau, vòng lặp `do` lặp ít nhất một lần và lặp lại cho đến khi `i` không còn nhỏ hơn `5`.

```js
let i = 0;
do {
  i += 1;
  console.log(i);
} while (i < 5);
```

## Câu lệnh while

Câu lệnh {{jsxref("Statements/while", "while")}} thực thi các câu lệnh của nó miễn là điều kiện được chỉ định đánh giá thành `true`. Một câu lệnh `while` trông như sau:

```js-nolint
while (condition)
  statement
```

Nếu `condition` trở thành `false`, `statement` trong vòng lặp dừng thực thi và quyền điều khiển chuyển sang câu lệnh theo sau vòng lặp.

Kiểm tra điều kiện xảy ra _trước_ khi `statement` trong vòng lặp được thực thi. Nếu điều kiện trả về `true`, `statement` được thực thi và `condition` được kiểm tra lại. Nếu điều kiện trả về `false`, thực thi dừng lại và quyền điều khiển được chuyển sang câu lệnh theo sau `while`.

Để thực thi nhiều câu lệnh, hãy sử dụng câu lệnh block (`{ }`) để nhóm chúng lại.

### Ví dụ 1

Vòng lặp `while` sau lặp miễn là `n` nhỏ hơn `3`:

```js
let n = 0;
let x = 0;
while (n < 3) {
  n++;
  x += n;
}
```

Với mỗi lần lặp, vòng lặp tăng `n` và cộng giá trị đó vào `x`. Do đó, `x` và `n` nhận các giá trị sau:

- Sau lần đầu tiên: `n` = `1` và `x` = `1`
- Sau lần thứ hai: `n` = `2` và `x` = `3`
- Sau lần thứ ba: `n` = `3` và `x` = `6`

Sau khi hoàn thành lần thứ ba, điều kiện `n < 3` không còn là `true`, vì vậy vòng lặp kết thúc.

### Ví dụ 2

Tránh vòng lặp vô tận. Hãy đảm bảo điều kiện trong vòng lặp cuối cùng trở thành `false` — nếu không, vòng lặp sẽ không bao giờ kết thúc! Các câu lệnh trong vòng lặp `while` sau thực thi mãi mãi vì điều kiện không bao giờ trở thành `false`:

```js example-bad
// Infinite loops are bad!
while (true) {
  console.log("Hello, world!");
}
```

## Câu lệnh có nhãn

Một {{jsxref("Statements/label", "label")}} cung cấp một câu lệnh với một identifier cho phép bạn tham chiếu đến nó ở nơi khác trong chương trình. Ví dụ, bạn có thể sử dụng nhãn để xác định một vòng lặp, và sau đó sử dụng các câu lệnh `break` hoặc `continue` để chỉ ra liệu chương trình có nên ngắt vòng lặp hay tiếp tục thực thi của nó.

Cú pháp của câu lệnh có nhãn trông như sau:

```js-nolint
label:
  statement
```

Giá trị của `label` có thể là bất kỳ identifier JavaScript nào không phải là từ khóa dành riêng. `statement` mà bạn xác định bằng nhãn có thể là bất kỳ câu lệnh nào. Để xem ví dụ về sử dụng câu lệnh có nhãn, hãy xem các ví dụ về `break` và `continue` bên dưới.

## Câu lệnh break

Sử dụng câu lệnh {{jsxref("Statements/break", "break")}} để kết thúc một vòng lặp, `switch`, hoặc kết hợp với câu lệnh có nhãn.

- Khi bạn sử dụng `break` không có nhãn, nó kết thúc ngay lập tức `while`, `do-while`, `for`, hoặc `switch` bên trong nhất và chuyển quyền điều khiển sang câu lệnh tiếp theo.
- Khi bạn sử dụng `break` với nhãn, nó kết thúc câu lệnh có nhãn được chỉ định.

Cú pháp của câu lệnh `break` trông như sau:

```js-nolint
break;
break label;
```

1. Dạng cú pháp đầu tiên kết thúc vòng lặp bên trong nhất hoặc `switch`.
2. Dạng cú pháp thứ hai kết thúc câu lệnh có nhãn bao ngoài được chỉ định.

### Ví dụ 1

Ví dụ sau lặp qua các phần tử trong một mảng cho đến khi tìm thấy chỉ mục của phần tử có giá trị là `theValue`:

```js
for (let i = 0; i < a.length; i++) {
  if (a[i] === theValue) {
    break;
  }
}
```

### Ví dụ 2: Thoát đến nhãn

```js
let x = 0;
let z = 0;
labelCancelLoops: while (true) {
  console.log("Outer loops:", x);
  x += 1;
  z = 1;
  while (true) {
    console.log("Inner loops:", z);
    z += 1;
    if (z === 10 && x === 10) {
      break labelCancelLoops;
    } else if (z === 10) {
      break;
    }
  }
}
```

## Câu lệnh continue

Câu lệnh {{jsxref("Statements/continue", "continue")}} có thể được dùng để khởi động lại câu lệnh `while`, `do-while`, `for`, hoặc `label`.

- Khi bạn sử dụng `continue` không có nhãn, nó kết thúc lần lặp hiện tại của `while`, `do-while`, hoặc `for` bên trong nhất và tiếp tục thực thi vòng lặp với lần lặp tiếp theo. Trái ngược với câu lệnh `break`, `continue` không kết thúc hoàn toàn việc thực thi vòng lặp. Trong vòng lặp `while`, nó quay lại điều kiện. Trong vòng lặp `for`, nó nhảy đến biểu thức tăng.
- Khi bạn sử dụng `continue` với nhãn, nó áp dụng cho câu lệnh vòng lặp được xác định bằng nhãn đó.

Cú pháp của câu lệnh `continue` trông như sau:

```js-nolint
continue;
continue label;
```

### Ví dụ 1

Ví dụ sau cho thấy một vòng lặp `while` với câu lệnh `continue` thực thi khi giá trị của `i` là `3`. Do đó, `n` nhận các giá trị `1`, `3`, `7`, và `12`.

```js
let i = 0;
let n = 0;
while (i < 5) {
  i++;
  if (i === 3) {
    continue;
  }
  n += i;
  console.log(n);
}
// Logs:
// 1 3 7 12
```

Nếu bạn comment out `continue;`, vòng lặp sẽ chạy đến cuối và bạn sẽ thấy `1,3,6,10,15`.

### Ví dụ 2

Một câu lệnh có nhãn `checkIandJ` chứa một câu lệnh có nhãn `checkJ`. Nếu gặp `continue`, chương trình kết thúc lần lặp hiện tại của `checkJ` và bắt đầu lần lặp tiếp theo. Mỗi khi gặp `continue`, `checkJ` lặp lại cho đến khi điều kiện của nó trả về `false`. Khi trả về `false`, phần còn lại của câu lệnh `checkIandJ` được hoàn thành, và `checkIandJ` lặp lại cho đến khi điều kiện của nó trả về `false`. Khi trả về `false`, chương trình tiếp tục ở câu lệnh theo sau `checkIandJ`.

Nếu `continue` có nhãn là `checkIandJ`, chương trình sẽ tiếp tục ở đầu câu lệnh `checkIandJ`.

```js
let i = 0;
let j = 10;
checkIandJ: while (i < 4) {
  console.log(i);
  i += 1;
  checkJ: while (j > 4) {
    console.log(j);
    j -= 1;
    if (j % 2 === 0) {
      continue;
    }
    console.log(j, "is odd.");
  }
  console.log("i =", i);
  console.log("j =", j);
}
```

## Câu lệnh for...in

Câu lệnh {{jsxref("Statements/for...in", "for...in")}} lặp qua một biến được chỉ định trên tất cả các thuộc tính enumerable của một đối tượng. Với mỗi thuộc tính riêng biệt, JavaScript thực thi các câu lệnh được chỉ định. Một câu lệnh `for...in` trông như sau:

```js-nolint
for (variable in object)
  statement
```

### Ví dụ

Hàm sau nhận đối số là một đối tượng và tên của đối tượng. Nó sau đó lặp qua tất cả các thuộc tính của đối tượng và trả về một chuỗi liệt kê các tên thuộc tính và giá trị của chúng.

```js
function dumpProps(obj, objName) {
  let result = "";
  for (const i in obj) {
    result += `${objName}.${i} = ${obj[i]}<br>`;
  }
  result += "<hr>";
  return result;
}
```

Với đối tượng `car` có thuộc tính `make` và `model`, `result` sẽ là:

```plain
car.make = Ford
car.model = Mustang
```

### Mảng

Mặc dù có thể muốn sử dụng điều này để lặp qua các phần tử {{jsxref("Array")}}, câu lệnh `for...in` sẽ trả về tên các thuộc tính do người dùng định nghĩa ngoài các chỉ mục số.

Do đó, tốt hơn là sử dụng vòng lặp {{jsxref("Statements/for", "for")}} truyền thống với chỉ mục số khi lặp qua mảng, vì câu lệnh `for...in` lặp qua các thuộc tính do người dùng định nghĩa ngoài các phần tử mảng, nếu bạn sửa đổi đối tượng Array (chẳng hạn như thêm các thuộc tính hoặc phương thức tùy chỉnh).

## Câu lệnh for...of

Câu lệnh {{jsxref("Statements/for...of", "for...of")}} tạo ra một vòng lặp lặp qua các [đối tượng iterable](/en-US/docs/Web/JavaScript/Reference/Iteration_protocols) (bao gồm {{jsxref("Array")}}, {{jsxref("Map")}}, {{jsxref("Set")}}, đối tượng {{jsxref("Functions/arguments", "arguments")}} và nhiều hơn nữa), gọi một hook lặp tùy chỉnh với các câu lệnh sẽ được thực thi cho giá trị của mỗi thuộc tính riêng biệt.

```js-nolint
for (variable of iterable)
  statement
```

Ví dụ sau cho thấy sự khác biệt giữa vòng lặp `for...of` và vòng lặp {{jsxref("Statements/for...in", "for...in")}}. Trong khi `for...in` lặp qua tên thuộc tính, `for...of` lặp qua giá trị thuộc tính:

```js
const arr = [3, 5, 7];
arr.foo = "hello";

for (const i in arr) {
  console.log(i);
}
// "0" "1" "2" "foo"

for (const i of arr) {
  console.log(i);
}
// Logs: 3 5 7
```

Các câu lệnh `for...of` và `for...in` cũng có thể được dùng với [destructuring](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring). Ví dụ, bạn có thể đồng thời lặp qua các khóa và giá trị của một đối tượng bằng {{jsxref("Object.entries()")}}.

```js
const obj = { foo: 1, bar: 2 };

for (const [key, val] of Object.entries(obj)) {
  console.log(key, val);
}
// "foo" 1
// "bar" 2
```

{{PreviousNext("Web/JavaScript/Guide/Control_flow_and_error_handling", "Web/JavaScript/Guide/Functions")}}

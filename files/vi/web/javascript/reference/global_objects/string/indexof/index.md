---
title: String.prototype.indexOf()
short-title: indexOf()
slug: Web/JavaScript/Reference/Global_Objects/String/indexOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.indexOf
sidebar: jsref
---

Phương thức **`indexOf()`** của các giá trị {{jsxref("String")}} tìm kiếm string này và trả về chỉ mục của lần xuất hiện đầu tiên của substring được chỉ định. Nó nhận một vị trí bắt đầu tùy chọn và trả về lần xuất hiện đầu tiên của substring được chỉ định tại một chỉ mục lớn hơn hoặc bằng số được chỉ định.

{{InteractiveExample("JavaScript Demo: String.prototype.indexOf()", "taller")}}

```js interactive-example
const paragraph = "I think Ruth's dog is cuter than your dog!";

const searchTerm = "dog";
const indexOfFirst = paragraph.indexOf(searchTerm);

console.log(`The index of the first "${searchTerm}" is ${indexOfFirst}`);
// Expected output: "The index of the first "dog" is 15"

console.log(
  `The index of the second "${searchTerm}" is ${paragraph.indexOf(
    searchTerm,
    indexOfFirst + 1,
  )}`,
);
// Expected output: "The index of the second "dog" is 38"
```

## Cú pháp

```js-nolint
indexOf(searchString)
indexOf(searchString, position)
```

### Tham số

- `searchString`
  - : Substring cần tìm. Tất cả các giá trị đều được [ép kiểu thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua hoặc truyền `undefined` khiến `indexOf()` tìm kiếm string `"undefined"`, điều này hiếm khi bạn muốn.

- `position` {{optional_inline}}
  - : Phương thức trả về chỉ mục của lần xuất hiện đầu tiên của substring được chỉ định tại vị trí lớn hơn hoặc bằng `position`, mặc định là `0`. Nếu `position` lớn hơn độ dài của string gọi, phương thức không tìm kiếm string gọi chút nào. Nếu `position` nhỏ hơn 0, phương thức hoạt động như thể `position` là `0`.
    - `'hello world hello'.indexOf('o', -5)` trả về `4` — vì nó khiến phương thức hoạt động như thể đối số thứ hai là `0`, và lần xuất hiện đầu tiên của `o` tại vị trí lớn hơn hoặc bằng `0` là tại vị trí `4`.

    - `'hello world hello'.indexOf('world', 12)` trả về `-1` — vì, trong khi đúng là substring `world` xuất hiện tại chỉ mục `6`, vị trí đó không lớn hơn hoặc bằng `12`.

    - `'hello world hello'.indexOf('o', 99)` trả về `-1` — vì `99` lớn hơn độ dài của `hello world hello`, khiến phương thức không tìm kiếm string chút nào.

### Giá trị trả về

Chỉ mục của lần xuất hiện đầu tiên của `searchString` được tìm thấy, hoặc `-1` nếu không tìm thấy.

#### Giá trị trả về khi sử dụng search string rỗng

Tìm kiếm một search string rỗng tạo ra kết quả kỳ lạ. Không có đối số thứ hai, hoặc với đối số thứ hai có giá trị nhỏ hơn độ dài string gọi, giá trị trả về bằng với giá trị của đối số thứ hai:

```js
"hello world".indexOf(""); // returns 0
"hello world".indexOf("", 0); // returns 0
"hello world".indexOf("", 3); // returns 3
"hello world".indexOf("", 8); // returns 8
```

Tuy nhiên, với đối số thứ hai có giá trị lớn hơn hoặc bằng độ dài string, giá trị trả về là độ dài string:

```js
"hello world".indexOf("", 11); // returns 11
"hello world".indexOf("", 13); // returns 11
"hello world".indexOf("", 22); // returns 11
```

Trong trường hợp trước, phương thức hoạt động như thể nó tìm thấy một string rỗng ngay sau vị trí được chỉ định trong đối số thứ hai. Trong trường hợp sau, phương thức hoạt động như thể nó tìm thấy một string rỗng ở cuối string gọi.

## Mô tả

Các string được đánh chỉ mục từ 0: Chỉ mục của ký tự đầu tiên của string là `0`, và chỉ mục của ký tự cuối cùng là độ dài string trừ 1.

```js
"Blue Whale".indexOf("Blue"); // returns  0
"Blue Whale".indexOf("Wale"); // returns -1
"Blue Whale".indexOf("Whale", 0); // returns  5
"Blue Whale".indexOf("Whale", 5); // returns  5
"Blue Whale".indexOf("Whale", 7); // returns -1
"Blue Whale".indexOf(""); // returns  0
"Blue Whale".indexOf("", 9); // returns  9
"Blue Whale".indexOf("", 10); // returns 10
"Blue Whale".indexOf("", 11); // returns 10
```

Phương thức `indexOf()` phân biệt chữ hoa chữ thường. Ví dụ, biểu thức sau trả về `-1`:

```js
"Blue Whale".indexOf("blue"); // returns -1
```

### Kiểm tra sự xuất hiện

Khi kiểm tra xem một substring cụ thể có xuất hiện trong string hay không, cách đúng để kiểm tra là xem giá trị trả về có phải là `-1` không:

```js
"Blue Whale".indexOf("Blue") !== -1; // true; found 'Blue' in 'Blue Whale'
"Blue Whale".indexOf("Wale") !== -1; // false; no 'Wale' in 'Blue Whale'
```

## Ví dụ

### Sử dụng indexOf()

Ví dụ sau sử dụng `indexOf()` để định vị các substring trong string `"Brave new world"`.

```js
const str = "Brave new world";

console.log(str.indexOf("w")); // 8
console.log(str.indexOf("new")); // 6
```

### indexOf() và phân biệt chữ hoa chữ thường

Ví dụ sau định nghĩa hai biến string.

Các biến chứa cùng một string, ngoại trừ string thứ hai chứa chữ hoa. Phương thức {{domxref("console/log_static", "console.log()")}} đầu tiên hiển thị `19`. Nhưng vì phương thức `indexOf()` phân biệt chữ hoa chữ thường, string `"cheddar"` không được tìm thấy trong `myCapString`, vì vậy phương thức `console.log()` thứ hai hiển thị `-1`.

```js
const myString = "brie, pepper jack, cheddar";
const myCapString = "Brie, Pepper Jack, Cheddar";

console.log(myString.indexOf("cheddar")); // 19
console.log(myCapString.indexOf("cheddar")); // -1
```

### Sử dụng indexOf() để đếm số lần xuất hiện của một chữ cái trong string

Ví dụ sau đặt `count` là số lần xuất hiện của chữ cái `e` trong string `str`:

```js
const str = "To be, or not to be, that is the question.";
let count = 0;
let position = str.indexOf("e");

while (position !== -1) {
  count++;
  position = str.indexOf("e", position + 1);
}

console.log(count); // 4
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.charAt()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
- {{jsxref("String.prototype.includes()")}}
- {{jsxref("String.prototype.split()")}}
- {{jsxref("Array.prototype.indexOf()")}}

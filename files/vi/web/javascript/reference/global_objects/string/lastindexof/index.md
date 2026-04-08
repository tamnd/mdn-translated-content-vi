---
title: String.prototype.lastIndexOf()
short-title: lastIndexOf()
slug: Web/JavaScript/Reference/Global_Objects/String/lastIndexOf
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.lastIndexOf
sidebar: jsref
---

Phương thức **`lastIndexOf()`** của các giá trị {{jsxref("String")}} tìm kiếm string này và trả về chỉ mục của lần xuất hiện cuối cùng của substring được chỉ định. Nó nhận một vị trí bắt đầu tùy chọn và trả về lần xuất hiện cuối cùng của substring được chỉ định tại một chỉ mục nhỏ hơn hoặc bằng số được chỉ định.

{{InteractiveExample("JavaScript Demo: String.prototype.lastIndexOf()")}}

```js interactive-example
const paragraph = "I think Ruth's dog is cuter than your dog!";

const searchTerm = "dog";

console.log(
  `Index of the last "${searchTerm}" is ${paragraph.lastIndexOf(searchTerm)}`,
);
// Expected output: "Index of the last "dog" is 38"
```

## Cú pháp

```js-nolint
lastIndexOf(searchString)
lastIndexOf(searchString, position)
```

### Tham số

- `searchString`
  - : Substring cần tìm. Tất cả các giá trị đều được [ép kiểu thành string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua hoặc truyền `undefined` khiến `lastIndexOf()` tìm kiếm string `"undefined"`, điều này hiếm khi bạn muốn.

- `position` {{optional_inline}}
  - : Phương thức trả về chỉ mục của lần xuất hiện cuối cùng của substring được chỉ định tại vị trí nhỏ hơn hoặc bằng `position`, mặc định là `Infinity`. Nếu `position` lớn hơn độ dài string gọi, phương thức tìm kiếm toàn bộ string. Nếu `position` nhỏ hơn `0`, hành vi giống như `0` — nghĩa là, phương thức chỉ tìm kiếm substring được chỉ định tại chỉ mục `0`.
    - `'hello world hello'.lastIndexOf('world', 4)` trả về `-1` — vì, trong khi substring `world` xuất hiện tại chỉ mục `6`, vị trí đó không nhỏ hơn hoặc bằng `4`.

    - `'hello world hello'.lastIndexOf('hello', 99)` trả về `12` — vì lần xuất hiện cuối cùng của `hello` tại vị trí nhỏ hơn hoặc bằng `99` là tại vị trí `12`.

    - `'hello world hello'.lastIndexOf('hello', 0)` và `'hello world hello'.lastIndexOf('hello', -5)` đều trả về `0` — vì cả hai đều khiến phương thức chỉ tìm kiếm `hello` tại chỉ mục `0`.

### Giá trị trả về

Chỉ mục của lần xuất hiện cuối cùng của `searchString` được tìm thấy, hoặc `-1` nếu không tìm thấy.

## Mô tả

Các string được đánh chỉ mục từ 0: Chỉ mục của ký tự đầu tiên của string là `0`, và chỉ mục của ký tự cuối cùng là độ dài string trừ 1.

```js
"canal".lastIndexOf("a"); // returns 3
"canal".lastIndexOf("a", 2); // returns 1
"canal".lastIndexOf("a", 0); // returns -1
"canal".lastIndexOf("x"); // returns -1
"canal".lastIndexOf("c", -5); // returns 0
"canal".lastIndexOf("c", 0); // returns 0
"canal".lastIndexOf(""); // returns 5
"canal".lastIndexOf("", 2); // returns 2
```

### Phân biệt chữ hoa chữ thường

Phương thức `lastIndexOf()` phân biệt chữ hoa chữ thường. Ví dụ, biểu thức sau trả về `-1`:

```js
"Blue Whale, Killer Whale".lastIndexOf("blue"); // returns -1
```

## Ví dụ

### Sử dụng indexOf() và lastIndexOf()

Ví dụ sau sử dụng {{jsxref("String/indexOf", "indexOf()")}} và `lastIndexOf()` để định vị các giá trị trong string `"Brave, Brave New World"`.

```js
const anyString = "Brave, Brave New World";

console.log(anyString.indexOf("Brave")); // 0
console.log(anyString.lastIndexOf("Brave")); // 7
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.charAt()")}}
- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.split()")}}
- {{jsxref("Array.prototype.indexOf()")}}
- {{jsxref("Array.prototype.lastIndexOf()")}}

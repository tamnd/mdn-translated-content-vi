---
title: String.prototype.charAt()
short-title: charAt()
slug: Web/JavaScript/Reference/Global_Objects/String/charAt
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.charAt
sidebar: jsref
---

Phương thức **`charAt()`** của các giá trị {{jsxref("String")}} trả về một string mới bao gồm đơn vị code UTF-16 duy nhất tại chỉ mục đã cho.

`charAt()` luôn indexing string như một chuỗi [đơn vị code UTF-16](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters), vì vậy nó có thể trả về các surrogate đơn lẻ. Để lấy toàn bộ code point Unicode tại chỉ mục đã cho, hãy sử dụng {{jsxref("String.prototype.codePointAt()")}} và {{jsxref("String.fromCodePoint()")}}.

{{InteractiveExample("JavaScript Demo: String.prototype.charAt()", "shorter")}}

```js interactive-example
const sentence = "The quick brown fox jumps over the lazy dog.";

const index = 4;

console.log(`The character at index ${index} is ${sentence.charAt(index)}`);
// Expected output: "The character at index 4 is q"
```

## Cú pháp

```js-nolint
charAt(index)
```

### Tham số

- `index`
  - : Chỉ mục bắt đầu từ 0 của ký tự cần trả về. [Được chuyển đổi thành số nguyên](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#integer_conversion) — `undefined` được chuyển đổi thành 0.

### Giá trị trả về

Một string đại diện cho ký tự (đúng một đơn vị code UTF-16) tại `index` được chỉ định. Nếu `index` nằm ngoài phạm vi `0` – `str.length - 1`, `charAt()` trả về một string rỗng.

## Mô tả

Các ký tự trong một string được đánh chỉ mục từ trái sang phải. Chỉ mục của ký tự đầu tiên là `0`, và chỉ mục của ký tự cuối cùng trong một string có tên `str` là `str.length - 1`.

Các code point Unicode có phạm vi từ `0` đến `1114111` (`0x10FFFF`). `charAt()` luôn trả về một ký tự có giá trị nhỏ hơn `65536`, bởi vì các code point cao hơn được biểu diễn bởi _một cặp_ pseudo-character surrogate 16-bit. Do đó, để lấy một ký tự đầy đủ có giá trị lớn hơn `65535`, cần lấy không chỉ `charAt(i)`, mà còn `charAt(i + 1)` (như thể đang xử lý một string có hai ký tự), hoặc sử dụng {{jsxref("String/codePointAt", "codePointAt(i)")}} và {{jsxref("String.fromCodePoint()")}} thay thế. Để biết thông tin về Unicode, xem [UTF-16 characters, Unicode code points, and grapheme clusters](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#utf-16_characters_unicode_code_points_and_grapheme_clusters).

`charAt()` rất giống với việc sử dụng [ký hiệu ngoặc vuông](/en-US/docs/Web/JavaScript/Reference/Operators/Property_accessors#bracket_notation) để truy cập một ký tự tại chỉ mục được chỉ định. Sự khác biệt chính là:

- `charAt()` cố gắng chuyển đổi `index` thành số nguyên, trong khi ký hiệu ngoặc vuông thì không và sử dụng trực tiếp `index` như một tên thuộc tính.
- `charAt()` trả về string rỗng nếu `index` ngoài phạm vi, trong khi ký hiệu ngoặc vuông trả về `undefined`.

## Ví dụ

### Sử dụng charAt()

Ví dụ sau hiển thị các ký tự ở các vị trí khác nhau trong string `"Brave new world"`:

```js
const anyString = "Brave new world";
console.log(`The character at index 0   is '${anyString.charAt()}'`);
// No index was provided, used 0 as default

console.log(`The character at index 0   is '${anyString.charAt(0)}'`);
console.log(`The character at index 1   is '${anyString.charAt(1)}'`);
console.log(`The character at index 2   is '${anyString.charAt(2)}'`);
console.log(`The character at index 3   is '${anyString.charAt(3)}'`);
console.log(`The character at index 4   is '${anyString.charAt(4)}'`);
console.log(`The character at index 999 is '${anyString.charAt(999)}'`);
```

Các dòng này hiển thị như sau:

```plain
The character at index 0   is 'B'

The character at index 0   is 'B'
The character at index 1   is 'r'
The character at index 2   is 'a'
The character at index 3   is 'v'
The character at index 4   is 'e'
The character at index 999 is ''
```

`charAt()` có thể trả về các surrogate đơn lẻ, không phải là các ký tự Unicode hợp lệ.

```js
const str = "𠮷𠮾";
console.log(str.charAt(0)); // "\ud842", which is not a valid Unicode character
console.log(str.charAt(1)); // "\udfb7", which is not a valid Unicode character
```

Để lấy toàn bộ code point Unicode tại chỉ mục đã cho, hãy sử dụng phương thức indexing phân tách theo code point Unicode, chẳng hạn như {{jsxref("String.prototype.codePointAt()")}} và [trải rộng string](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/Symbol.iterator) thành một mảng các code point Unicode.

```js
const str = "𠮷𠮾";
console.log(String.fromCodePoint(str.codePointAt(0))); // "𠮷"
console.log([...str][0]); // "𠮷"
```

> [!NOTE]
> Tránh tái triển khai các giải pháp trên bằng cách sử dụng `charAt()`. Việc phát hiện các surrogate đơn lẻ và ghép đôi chúng rất phức tạp, và các API tích hợp có thể hiệu quả hơn vì chúng trực tiếp sử dụng biểu diễn nội bộ của string. Cài đặt polyfill cho các API được đề cập ở trên nếu cần thiết.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
- {{jsxref("String.prototype.charCodeAt()")}}
- {{jsxref("String.prototype.codePointAt()")}}
- {{jsxref("String.prototype.split()")}}
- {{jsxref("String.fromCodePoint()")}}
- [JavaScript has a Unicode problem](https://mathiasbynens.be/notes/javascript-unicode) by Mathias Bynens (2013)

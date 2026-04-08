---
title: String.prototype.at()
short-title: at()
slug: Web/JavaScript/Reference/Global_Objects/String/at
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.at
sidebar: jsref
---

Phương thức **`at()`** của các giá trị {{jsxref("String")}} nhận một giá trị số nguyên và trả về một {{jsxref("String")}} mới bao gồm đơn vị code UTF-16 duy nhất nằm tại offset được chỉ định. Phương thức này cho phép cả số nguyên dương và âm. Số nguyên âm đếm ngược từ ký tự cuối của string.

{{InteractiveExample("JavaScript Demo: String.prototype.at()")}}

```js interactive-example
const sentence = "The quick brown fox jumps over the lazy dog.";

let index = 5;

console.log(`An index of ${index} returns the character ${sentence.at(index)}`);
// Expected output: "An index of 5 returns the character u"

index = -4;

console.log(`An index of ${index} returns the character ${sentence.at(index)}`);
// Expected output: "An index of -4 returns the character d"
```

## Cú pháp

```js-nolint
at(index)
```

### Tham số

- `index`
  - : Chỉ mục (vị trí) của ký tự trong string cần trả về. Hỗ trợ indexing tương đối từ cuối string khi truyền vào chỉ mục âm; tức là, nếu sử dụng số âm, ký tự được trả về sẽ được tìm bằng cách đếm ngược từ cuối string.

### Giá trị trả về

Một {{jsxref("String")}} bao gồm đơn vị code UTF-16 duy nhất nằm tại vị trí được chỉ định. Trả về {{jsxref("undefined")}} nếu không tìm thấy chỉ mục đã cho.

## Ví dụ

### Trả về ký tự cuối của một string

Ví dụ sau cung cấp một hàm trả về ký tự cuối tìm thấy trong một string đã cho.

```js
// A function which returns the last character of a given string
function returnLast(str) {
  return str.at(-1);
}

let invoiceRef = "my-invoice01";

console.log(returnLast(invoiceRef)); // '1'

invoiceRef = "my-invoice02";

console.log(returnLast(invoiceRef)); // '2'
```

### So sánh các phương pháp

Ở đây chúng ta so sánh các cách khác nhau để chọn ký tự áp chót (cuối nhưng trừ một) của một {{jsxref("String")}}. Mặc dù tất cả các phương pháp bên dưới đều hợp lệ, nhưng nó làm nổi bật sự ngắn gọn và dễ đọc của phương thức `at()`.

```js
const myString = "Every green bus drives fast.";

// Using length property and charAt() method
const lengthWay = myString.charAt(myString.length - 2);
console.log(lengthWay); // 't'

// Using slice() method
const sliceWay = myString.slice(-2, -1);
console.log(sliceWay); // 't'

// Using at() method
const atWay = myString.at(-2);
console.log(atWay); // 't'
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill of `String.prototype.at` in `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [es-shims polyfill of `String.prototype.at`](https://www.npmjs.com/package/string.prototype.at)
- {{jsxref("String.prototype.indexOf()")}}
- {{jsxref("String.prototype.lastIndexOf()")}}
- {{jsxref("String.prototype.charCodeAt()")}}
- {{jsxref("String.prototype.codePointAt()")}}
- {{jsxref("String.prototype.split()")}}

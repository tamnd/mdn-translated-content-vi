---
title: String.prototype.search()
short-title: search()
slug: Web/JavaScript/Reference/Global_Objects/String/search
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.search
sidebar: jsref
---

Phương thức **`search()`** của các giá trị {{jsxref("String")}} thực hiện tìm kiếm kết quả khớp giữa một biểu thức chính quy và chuỗi này, trả về chỉ số của kết quả khớp đầu tiên trong chuỗi.

{{InteractiveExample("JavaScript Demo: String.prototype.search()")}}

```js interactive-example
const paragraph = "I think Ruth's dog is cuter than your dog!";

// Anything not a word character, whitespace or apostrophe
const regex = /[^\w\s']/g;

console.log(paragraph.search(regex));
// Expected output: 41

console.log(paragraph[paragraph.search(regex)]);
// Expected output: "!"
```

## Cú pháp

```js-nolint
search(regexp)
```

### Tham số

- `regexp`
  - : Một đối tượng biểu thức chính quy, hoặc bất kỳ đối tượng nào có phương thức [`Symbol.search`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/search).

    Nếu `regexp` không phải là đối tượng `RegExp` và không có phương thức `Symbol.search`, nó được ngầm chuyển đổi thành {{jsxref("RegExp")}} bằng cách dùng `new RegExp(regexp)`.

### Giá trị trả về

Chỉ số của kết quả khớp đầu tiên giữa biểu thức chính quy và chuỗi đã cho, hoặc `-1` nếu không tìm thấy kết quả khớp nào.

## Mô tả

Triển khai của `String.prototype.search()` không làm gì nhiều ngoài việc gọi phương thức `Symbol.search` của đối số với chuỗi làm tham số đầu tiên. Triển khai thực tế đến từ [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search).

Cờ `g` của `regexp` không có hiệu lực trên kết quả `search()`, và việc tìm kiếm luôn diễn ra như thể `lastIndex` của regex là 0. Để biết thêm thông tin về hành vi của `search()`, xem [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search).

Khi bạn muốn biết liệu một mẫu có được tìm thấy không, và _cũng_ muốn biết chỉ số của nó trong chuỗi, hãy dùng `search()`.

- Nếu bạn chỉ muốn biết nó có tồn tại hay không, hãy dùng phương thức {{jsxref("RegExp.prototype.test()")}}, trả về boolean.
- Nếu bạn cần nội dung của văn bản đã khớp, hãy dùng {{jsxref("String.prototype.match()")}} hoặc {{jsxref("RegExp.prototype.exec()")}}.

## Ví dụ

### Sử dụng search()

Ví dụ sau tìm kiếm một chuỗi với hai đối tượng regex khác nhau để cho thấy tìm kiếm thành công (giá trị dương) so với tìm kiếm không thành công (`-1`).

```js
const str = "hey JudE";
const re = /[A-Z]/;
const reDot = /[.]/;
console.log(str.search(re)); // trả về 4, là chỉ số của chữ hoa đầu tiên "J"
console.log(str.search(reDot)); // trả về -1 không tìm thấy dấu chấm '.'
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `String.prototype.search` trong `core-js` với các bản sửa lỗi và triển khai hành vi hiện đại như hỗ trợ `Symbol.search`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("String.prototype.match()")}}
- {{jsxref("RegExp.prototype.exec()")}}
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)

---
title: RegExp.prototype.sticky
short-title: sticky
slug: Web/JavaScript/Reference/Global_Objects/RegExp/sticky
page-type: javascript-instance-accessor-property
browser-compat: javascript.builtins.RegExp.sticky
sidebar: jsref
---

Thuộc tính accessor **`sticky`** của các instance {{jsxref("RegExp")}} trả về liệu cờ `y` có được sử dụng với biểu thức chính quy này hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype.sticky", "taller")}}

```js interactive-example
const str = "table football";
const regex = /foo/y;

regex.lastIndex = 6;

console.log(regex.sticky);
// Expected output: true

console.log(regex.test(str));
// Expected output: true

console.log(regex.test(str));
// Expected output: false
```

## Mô tả

`RegExp.prototype.sticky` có giá trị `true` nếu cờ `y` được sử dụng; ngược lại là `false`. Cờ `y` chỉ ra rằng regex cố gắng khớp chuỗi đích chỉ từ chỉ mục được chỉ định bởi thuộc tính {{jsxref("RegExp/lastIndex", "lastIndex")}} (và không giống như regex global, không cố gắng khớp từ bất kỳ chỉ mục nào sau đó).

Accessor set của `sticky` là `undefined`. Bạn không thể thay đổi thuộc tính này trực tiếp.

Đối với cả regex sticky và [global](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global):

- Chúng bắt đầu khớp tại `lastIndex`.
- Khi khớp thành công, `lastIndex` được tăng đến cuối kết quả khớp.
- Khi `lastIndex` vượt ra ngoài phạm vi của chuỗi hiện đang được khớp, `lastIndex` được đặt lại về 0.

Tuy nhiên, đối với phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec), hành vi khi khớp thất bại là khác nhau:

- Khi phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) được gọi trên một regex sticky, nếu regex thất bại khi khớp tại `lastIndex`, regex ngay lập tức trả về `null` và đặt lại `lastIndex` về 0.
- Khi phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) được gọi trên một regex global, nếu regex thất bại khi khớp tại `lastIndex`, nó thử khớp từ ký tự tiếp theo, và cứ thế tiếp tục cho đến khi tìm thấy kết quả khớp hoặc đến cuối chuỗi.

Đối với phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec), một regex vừa sticky vừa global hoạt động giống như một regex sticky và không global. Vì [`test()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test) là một wrapper đơn giản xung quanh `exec()`, `test()` sẽ bỏ qua cờ global và thực hiện khớp sticky. Tuy nhiên, do nhiều phương thức khác xử lý đặc biệt hành vi của regex global, cờ global thường là trực giao với cờ sticky.

- [`String.prototype.matchAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll) (gọi [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)): `y`, `g` và `gy` đều khác nhau.
  - Đối với regex `y`: `matchAll()` ném; `[Symbol.matchAll]()` tạo ra kết quả `exec()` đúng một lần, mà không cập nhật `lastIndex` của regex.
  - Đối với regex `g` hoặc `gy`: trả về một iterator tạo ra một chuỗi kết quả `exec()`.
- [`String.prototype.match()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) (gọi [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)): `y`, `g` và `gy` đều khác nhau.
  - Đối với regex `y`: trả về kết quả `exec()` và cập nhật `lastIndex` của regex.
  - Đối với regex `g` hoặc `gy`: trả về một mảng tất cả các kết quả `exec()`.
- [`String.prototype.search()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search) (gọi [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)): cờ `g` luôn không liên quan.
  - Đối với regex `y` hoặc `gy`: luôn trả về `0` (nếu đầu chuỗi khớp) hoặc `-1` (nếu đầu chuỗi không khớp), mà không cập nhật `lastIndex` của regex khi thoát.
  - Đối với regex `g`: trả về chỉ mục của kết quả khớp đầu tiên trong chuỗi, hoặc `-1` nếu không tìm thấy kết quả khớp.
- [`String.prototype.split()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) (gọi [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)): `y`, `g`, và `gy` đều có cùng hành vi.
- [`String.prototype.replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) (gọi [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)): `y`, `g` và `gy` đều khác nhau.
  - Đối với regex `y`: thay thế một lần tại `lastIndex` hiện tại và cập nhật `lastIndex`.
  - Đối với regex `g` và `gy`: thay thế tất cả các lần xuất hiện được khớp bởi `exec()`.
- [`String.prototype.replaceAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) (gọi [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)): `y`, `g` và `gy` đều khác nhau.
  - Đối với regex `y`: `replaceAll()` ném.
  - Đối với regex `g` và `gy`: thay thế tất cả các lần xuất hiện được khớp bởi `exec()`.

## Ví dụ

### Sử dụng biểu thức chính quy với cờ sticky

```js
const str = "#foo#";
const regex = /foo/y;

regex.lastIndex = 1;
regex.test(str); // true
regex.lastIndex = 5;
regex.test(str); // false (lastIndex is taken into account with sticky flag)
regex.lastIndex; // 0 (reset after match failure)
```

### Cờ sticky được neo

Trong nhiều phiên bản, engine SpiderMonkey của Firefox đã có [một lỗi](https://bugzil.la/773687) liên quan đến xác nhận `^` và cờ sticky cho phép các biểu thức bắt đầu bằng xác nhận `^` và sử dụng cờ sticky khớp khi chúng không nên. Lỗi được giới thiệu vào một thời điểm nào đó sau Firefox 3.6 (có cờ sticky nhưng không có lỗi) và được sửa vào năm 2015. Có thể vì lỗi, đặc tả [cụ thể đề cập](https://tc39.es/ecma262/multipage/text-processing.html#sec-compileassertion) rằng:

> Ngay cả khi cờ `y` được sử dụng với một mẫu, `^` luôn chỉ khớp ở đầu _Input_, hoặc (nếu _rer_.[[Multiline]] là `true`) ở đầu một dòng.

Ví dụ về hành vi đúng:

```js
const regex1 = /^foo/y;
regex1.lastIndex = 2;
regex1.test("..foo"); // false - index 2 is not the beginning of the string

const regex2 = /^foo/my;
regex2.lastIndex = 2;
regex2.test("..foo"); // false - index 2 is not the beginning of the string or line
regex2.lastIndex = 2;
regex2.test(".\nfoo"); // true - index 2 is the beginning of a line
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của cờ `sticky` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("RegExp.prototype.lastIndex")}}
- {{jsxref("RegExp.prototype.dotAll")}}
- {{jsxref("RegExp.prototype.global")}}
- {{jsxref("RegExp.prototype.hasIndices")}}
- {{jsxref("RegExp.prototype.ignoreCase")}}
- {{jsxref("RegExp.prototype.multiline")}}
- {{jsxref("RegExp.prototype.source")}}
- {{jsxref("RegExp.prototype.unicode")}}

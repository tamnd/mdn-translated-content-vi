---
title: RegExp.prototype.test()
short-title: test()
slug: Web/JavaScript/Reference/Global_Objects/RegExp/test
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.test
sidebar: jsref
---

Phương thức **`test()`** của các instance {{jsxref("RegExp")}} thực hiện tìm kiếm với biểu thức chính quy này để tìm kết quả khớp giữa biểu thức chính quy và một chuỗi được chỉ định. Trả về `true` nếu có kết quả khớp; `false` nếu không.

Các đối tượng {{jsxref("RegExp")}} trong JavaScript là **stateful** khi chúng có
cờ {{jsxref("RegExp/global", "global")}} hoặc {{jsxref("RegExp/sticky", "sticky")}}
được đặt (ví dụ: `/foo/g` hoặc `/foo/y`). Chúng lưu trữ
{{jsxref("RegExp/lastIndex", "lastIndex")}} từ kết quả khớp trước. Sử dụng điều này
nội bộ, `test()` có thể được dùng để lặp qua nhiều kết quả khớp trong một chuỗi
văn bản (với các nhóm bắt).

{{InteractiveExample("JavaScript Demo: RegExp.prototype.test()", "taller")}}

```js interactive-example
const str = "table football";

const regex = /fo+/;
const globalRegex = /fo+/g;

console.log(regex.test(str));
// Expected output: true

console.log(globalRegex.lastIndex);
// Expected output: 0

console.log(globalRegex.test(str));
// Expected output: true

console.log(globalRegex.lastIndex);
// Expected output: 9

console.log(globalRegex.test(str));
// Expected output: false
```

## Cú pháp

```js-nolint
test(str)
```

### Tham số

- `str`
  - : Chuỗi để khớp với biểu thức chính quy. Tất cả các giá trị được [ép thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion), vì vậy bỏ qua nó hoặc truyền `undefined` sẽ khiến `test()` tìm kiếm chuỗi `"undefined"`, đây hiếm khi là điều bạn muốn.

### Giá trị trả về

`true` nếu có kết quả khớp giữa biểu thức chính quy và chuỗi `str`. Ngược lại, `false`.

## Mô tả

Sử dụng `test()` bất cứ khi nào bạn muốn biết liệu một mẫu có được tìm thấy trong một chuỗi hay không. `test()` trả về một boolean, không giống như phương thức {{jsxref("String.prototype.search()")}} (trả về chỉ mục của kết quả khớp, hoặc `-1` nếu không tìm thấy).

Để lấy thêm thông tin (nhưng thực thi chậm hơn), hãy sử dụng phương thức {{jsxref("RegExp/exec", "exec()")}}. (Tương tự như phương thức {{jsxref("String.prototype.match()")}}.)

Như với `exec()` (hoặc kết hợp với nó), `test()` được gọi nhiều lần trên cùng một instance biểu thức chính quy global sẽ tiến qua kết quả khớp trước đó.

## Ví dụ

### Sử dụng test()

Ví dụ này kiểm tra liệu `"hello"` có xuất hiện ở đầu chuỗi hay không, trả về kết quả boolean.

```js
const str = "hello world!";
const result = /^hello/.test(str);

console.log(result); // true
```

Ví dụ sau ghi thông báo phụ thuộc vào sự thành công của kiểm tra:

```js
function testInput(re, str) {
  const midString = re.test(str) ? "contains" : "does not contain";
  console.log(`${str} ${midString} ${re.source}`);
}
```

### Sử dụng test() trên regex có cờ "global"

Khi regex có cờ [global](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/global) được đặt,
`test()` sẽ tăng {{jsxref("RegExp/lastIndex", "lastIndex")}} của regex.
({{jsxref("RegExp.prototype.exec()")}} cũng tăng thuộc tính `lastIndex`.)

Các lần gọi tiếp theo đến `test(str)` sẽ tiếp tục tìm kiếm `str` bắt đầu từ `lastIndex`. Thuộc tính `lastIndex` sẽ tiếp tục tăng mỗi lần `test()` trả về `true`.

> [!NOTE]
> Miễn là `test()` trả về `true`, `lastIndex` sẽ _không_ đặt lại — ngay cả khi kiểm tra một chuỗi khác!

Khi `test()` trả về `false`, `lastIndex` của regex được gọi sẽ đặt lại về `0`.

Ví dụ sau minh họa hành vi này:

```js
const regex = /foo/g; // the "global" flag is set

// regex.lastIndex is at 0
regex.test("foo"); // true

// regex.lastIndex is now at 3
regex.test("foo"); // false

// regex.lastIndex is at 0
regex.test("barfoo"); // true

// regex.lastIndex is at 6
regex.test("foobar"); // false

// regex.lastIndex is at 0
regex.test("foobarfoo"); // true

// regex.lastIndex is at 3
regex.test("foobarfoo"); // true

// regex.lastIndex is at 9
regex.test("foobarfoo"); // false

// regex.lastIndex is at 0
// (...and so on)
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Hướng dẫn [Biểu thức chính quy](/en-US/docs/Web/JavaScript/Guide/Regular_expressions)
- {{jsxref("RegExp")}}

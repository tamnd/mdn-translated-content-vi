---
title: RegExp.prototype[Symbol.replace]()
short-title: "[Symbol.replace]()"
slug: Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.@@replace
sidebar: jsref
---

Phương thức **`[Symbol.replace]()`** của các instance {{jsxref("RegExp")}} xác định cách [`String.prototype.replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace) và [`String.prototype.replaceAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replaceAll) nên hoạt động khi biểu thức chính quy được truyền vào làm pattern.

{{InteractiveExample("JavaScript Demo: RegExp.prototype[Symbol.replace]()")}}

<!-- cSpell:ignore tball -->

```js interactive-example
class RegExp1 extends RegExp {
  [Symbol.replace](str) {
    return RegExp.prototype[Symbol.replace].call(this, str, "#!@?");
  }
}

console.log("football".replace(new RegExp1("foo")));
// Expected output: "#!@?tball"
```

## Cú pháp

```js-nolint
regexp[Symbol.replace](str, replacement)
```

### Tham số

- `str`
  - : Một {{jsxref("String")}} là đích của việc thay thế.
- `replacement`
  - : Có thể là chuỗi hoặc hàm.
    - Nếu là chuỗi, nó sẽ thay thế chuỗi con được khớp bởi regex hiện tại. Một số mẫu thay thế đặc biệt được hỗ trợ; xem phần [Chỉ định chuỗi làm thay thế](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#specifying_a_string_as_the_replacement) của `String.prototype.replace`.
    - Nếu là hàm, nó sẽ được gọi cho mỗi kết quả khớp và giá trị trả về được dùng làm văn bản thay thế. Các đối số được cung cấp cho hàm này được mô tả trong phần [Chỉ định hàm làm thay thế](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#specifying_a_function_as_the_replacement) của `String.prototype.replace`.

### Giá trị trả về

Một chuỗi mới, với một, một số hoặc tất cả các kết quả khớp của pattern được thay thế bởi replacement được chỉ định.

## Mô tả

Phương thức này được gọi nội bộ trong {{jsxref("String.prototype.replace()")}} và {{jsxref("String.prototype.replaceAll()")}} nếu đối số `pattern` là đối tượng {{jsxref("RegExp")}}. Ví dụ, hai ví dụ sau trả về cùng kết quả.

```js
"abc".replace(/a/, "A");

/a/[Symbol.replace]("abc", "A");
```

Nếu regex là global (với cờ `g`), phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) của regex sẽ được gọi lặp đi lặp lại cho đến khi `exec()` trả về `null`. Ngược lại, `exec()` chỉ được gọi một lần. Đối với mỗi kết quả `exec()`, việc thay thế sẽ được chuẩn bị dựa trên mô tả trong [`String.prototype.replace()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace#description).

Vì `[Symbol.replace]()` sẽ tiếp tục gọi `exec()` cho đến khi nó trả về `null`, và `exec()` sẽ tự động đặt lại `lastIndex` của regex về 0 khi kết quả khớp cuối cùng thất bại, `[Symbol.replace]()` thường không có tác dụng phụ khi thoát. Tuy nhiên, khi regex là [sticky](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) nhưng không global, `lastIndex` sẽ không được đặt lại. Trong trường hợp này, mỗi lần gọi `replace()` có thể trả về kết quả khác nhau.

```js
const re = /a/y;

for (let i = 0; i < 5; i++) {
  console.log("aaa".replace(re, "b"), re.lastIndex);
}

// baa 1
// aba 2
// aab 3
// aaa 0
// baa 1
```

Khi regex vừa sticky vừa global, nó vẫn sẽ thực hiện khớp sticky — tức là nó sẽ thất bại khi khớp bất kỳ lần xuất hiện nào vượt quá `lastIndex`.

```js
console.log("aa-a".replace(/a/gy, "b")); // "bb-a"
```

Nếu kết quả khớp hiện tại là một chuỗi rỗng, `lastIndex` vẫn sẽ được tăng — nếu regex [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), nó sẽ tăng thêm một điểm mã Unicode; ngược lại, nó tăng thêm một đơn vị mã UTF-16.

```js
console.log("😄".replace(/(?:)/g, " ")); // " \ud83d \ude04 "
console.log("😄".replace(/(?:)/gu, " ")); // " 😄 "
```

Phương thức này tồn tại để tùy chỉnh hành vi thay thế trong các lớp con `RegExp`.

## Ví dụ

### Gọi trực tiếp

Phương thức này có thể được sử dụng gần như giống như {{jsxref("String.prototype.replace()")}}, ngoại trừ `this` khác và thứ tự đối số khác.

```js
const re = /-/g;
const str = "2016-01-01";
const newStr = re[Symbol.replace](str, ".");
console.log(newStr); // 2016.01.01
```

### Sử dụng `[Symbol.replace]()` trong các lớp con

Các lớp con của {{jsxref("RegExp")}} có thể ghi đè phương thức `[Symbol.replace]()` để sửa đổi hành vi mặc định.

```js
class MyRegExp extends RegExp {
  constructor(pattern, flags, count) {
    super(pattern, flags);
    this.count = count;
  }
  [Symbol.replace](str, replacement) {
    // Perform [Symbol.replace]() `count` times.
    let result = str;
    for (let i = 0; i < this.count; i++) {
      result = RegExp.prototype[Symbol.replace].call(this, result, replacement);
    }
    return result;
  }
}

const re = new MyRegExp("\\d", "", 3);
const str = "01234567";
const newStr = str.replace(re, "#"); // String.prototype.replace calls re[Symbol.replace]().
console.log(newStr); // ###34567
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.prototype[Symbol.replace]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("String.prototype.replace()")}}
- {{jsxref("String.prototype.replaceAll()")}}
- [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)
- [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
- {{jsxref("Symbol.replace")}}

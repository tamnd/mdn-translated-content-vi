---
title: RegExp.prototype[Symbol.search]()
short-title: "[Symbol.search]()"
slug: Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.@@search
sidebar: jsref
---

Phương thức **`[Symbol.search]()`** của các instance {{jsxref("RegExp")}} xác định cách [`String.prototype.search`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search) nên hoạt động.

{{InteractiveExample("JavaScript Demo: RegExp.prototype[Symbol.search]()")}}

```js interactive-example
class RegExp1 extends RegExp {
  constructor(str) {
    super(str);
    this.pattern = str;
  }
  [Symbol.search](str) {
    return str.indexOf(this.pattern);
  }
}

console.log("table football".search(new RegExp1("foo")));
// Expected output: 6
```

## Cú pháp

```js-nolint
regexp[Symbol.search](str)
```

### Tham số

- `str`
  - : Một {{jsxref("String")}} là đích của tìm kiếm.

### Giá trị trả về

Chỉ mục của kết quả khớp đầu tiên giữa biểu thức chính quy và chuỗi đã cho, hoặc `-1` nếu không tìm thấy kết quả khớp.

## Mô tả

Phương thức này được gọi nội bộ trong {{jsxref("String.prototype.search()")}}. Ví dụ, hai ví dụ sau trả về cùng kết quả.

```js
"abc".search(/a/);

/a/[Symbol.search]("abc");
```

Phương thức này không sao chép biểu thức chính quy, không giống như [`[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split) hoặc [`[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll). Tuy nhiên, không giống như [`[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match) hoặc [`[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace), nó sẽ đặt [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) về 0 khi bắt đầu thực thi và khôi phục về giá trị trước đó khi thoát, do đó thường tránh các tác dụng phụ. Điều này có nghĩa là cờ `g` không có hiệu lực với phương thức này, và nó luôn trả về kết quả khớp đầu tiên trong chuỗi ngay cả khi `lastIndex` khác không. Điều này cũng có nghĩa là regex sticky sẽ luôn tìm kiếm nghiêm ngặt ở đầu chuỗi.

```js
const re = /[abc]/g;
re.lastIndex = 2;
console.log("abc".search(re)); // 0

const re2 = /[bc]/y;
re2.lastIndex = 1;
console.log("abc".search(re2)); // -1
console.log("abc".match(re2)); // [ 'b' ]
```

`[Symbol.search]()` luôn gọi phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) của regex đúng một lần, và trả về thuộc tính `index` của kết quả, hoặc `-1` nếu kết quả là `null`.

Phương thức này tồn tại để tùy chỉnh hành vi tìm kiếm trong các lớp con `RegExp`.

## Ví dụ

### Gọi trực tiếp

Phương thức này có thể được sử dụng gần như giống như {{jsxref("String.prototype.search()")}}, ngoại trừ giá trị khác nhau của `this` và thứ tự đối số khác nhau.

```js
const re = /-/g;
const str = "2016-01-02";
const result = re[Symbol.search](str);
console.log(result); // 4
```

### Sử dụng `[Symbol.search]()` trong các lớp con

Các lớp con của {{jsxref("RegExp")}} có thể ghi đè phương thức `[Symbol.search]()` để sửa đổi hành vi.

```js
class MyRegExp extends RegExp {
  constructor(str) {
    super(str);
    this.pattern = str;
  }
  [Symbol.search](str) {
    return str.indexOf(this.pattern);
  }
}

const re = new MyRegExp("a+b");
const str = "ab a+b";
const result = str.search(re); // String.prototype.search calls re[Symbol.search]().
console.log(result); // 3
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.prototype[Symbol.search]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("String.prototype.search()")}}
- [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
- [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
- {{jsxref("Symbol.search")}}

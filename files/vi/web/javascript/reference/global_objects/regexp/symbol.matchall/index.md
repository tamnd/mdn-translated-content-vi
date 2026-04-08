---
title: RegExp.prototype[Symbol.matchAll]()
short-title: "[Symbol.matchAll]()"
slug: Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.@@matchAll
sidebar: jsref
---

Phương thức **`[Symbol.matchAll]()`** của các instance {{jsxref("RegExp")}} xác định cách [`String.prototype.matchAll`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll) nên hoạt động.

{{InteractiveExample("JavaScript Demo: RegExp.prototype[Symbol.matchAll]()", "taller")}}

```js interactive-example
class MyRegExp extends RegExp {
  [Symbol.matchAll](str) {
    const result = RegExp.prototype[Symbol.matchAll].call(this, str);
    if (!result) {
      return null;
    }
    return Array.from(result);
  }
}

const re = new MyRegExp("-\\d+", "g");
console.log("2016-01-02|2019-03-07".matchAll(re));
// Expected output: Array [Array ["-01"], Array ["-02"], Array ["-03"], Array ["-07"]]
```

## Cú pháp

```js-nolint
regexp[Symbol.matchAll](str)
```

### Tham số

- `str`
  - : Một {{jsxref("String")}} là đích của kết quả khớp.

### Giá trị trả về

Một [đối tượng iterator iterable](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Iterator) (không thể khởi động lại) của các kết quả khớp. Mỗi kết quả khớp là một mảng có cùng hình dạng như giá trị trả về của {{jsxref("RegExp.prototype.exec()")}}.

## Mô tả

Phương thức này được gọi nội bộ trong {{jsxref("String.prototype.matchAll()")}}. Ví dụ, hai ví dụ sau trả về cùng kết quả.

```js
"abc".matchAll(/a/g);

/a/g[Symbol.matchAll]("abc");
```

Giống như [`[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split), `[Symbol.matchAll]()` bắt đầu bằng cách sử dụng [`[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.species) để xây dựng một regex mới, tránh làm biến đổi regex gốc theo bất kỳ cách nào. [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) bắt đầu là giá trị của regex gốc.

```js
const regexp = /[a-c]/g;
regexp.lastIndex = 1;
const str = "abc";
Array.from(str.matchAll(regexp), (m) => `${regexp.lastIndex} ${m[0]}`);
// [ "1 b", "1 c" ]
```

Việc xác nhận rằng đầu vào là regex global xảy ra trong [`String.prototype.matchAll()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/matchAll). `[Symbol.matchAll]()` không xác nhận đầu vào. Nếu regex không global, iterator trả về tạo ra kết quả [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) một lần rồi trả về `undefined`. Nếu regex là global, mỗi lần phương thức `next()` của iterator trả về được gọi, [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) của regex được gọi và kết quả được tạo ra.

Khi regex vừa sticky vừa global, nó vẫn sẽ thực hiện khớp sticky — tức là nó sẽ không khớp bất kỳ lần xuất hiện nào vượt quá `lastIndex`.

```js
console.log(Array.from("ab-c".matchAll(/[abc]/gy)));
// [ [ "a" ], [ "b" ] ]
```

Nếu kết quả khớp hiện tại là một chuỗi rỗng, [`lastIndex`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/lastIndex) vẫn sẽ được tăng. Nếu regex có cờ [`u`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode), nó tăng thêm một điểm mã Unicode; ngược lại, nó tăng thêm một điểm mã UTF-16.

```js
console.log(Array.from("😄".matchAll(/(?:)/g)));
// [ [ "" ], [ "" ], [ "" ] ]

console.log(Array.from("😄".matchAll(/(?:)/gu)));
// [ [ "" ], [ "" ] ]
```

Phương thức này tồn tại để tùy chỉnh hành vi của `matchAll()` trong các lớp con {{jsxref("RegExp")}}.

## Ví dụ

### Gọi trực tiếp

Phương thức này có thể được sử dụng gần như giống như {{jsxref("String.prototype.matchAll()")}}, ngoại trừ giá trị khác nhau của `this` và thứ tự đối số khác nhau.

```js
const re = /\d+/g;
const str = "2016-01-02";
const result = re[Symbol.matchAll](str);

console.log(Array.from(result, (x) => x[0]));
// [ "2016", "01", "02" ]
```

### Sử dụng `[Symbol.matchAll]()` trong các lớp con

Các lớp con của {{jsxref("RegExp")}} có thể ghi đè phương thức `[Symbol.matchAll]()` để sửa đổi hành vi mặc định.

Ví dụ, để trả về một {{jsxref("Array")}} thay vì một [iterator](/en-US/docs/Web/JavaScript/Guide/Iterators_and_generators):

```js
class MyRegExp extends RegExp {
  [Symbol.matchAll](str) {
    const result = RegExp.prototype[Symbol.matchAll].call(this, str);
    return result ? Array.from(result) : null;
  }
}

const re = new MyRegExp("(\\d+)-(\\d+)-(\\d+)", "g");
const str = "2016-01-02|2019-03-07";
const result = str.matchAll(re);

console.log(result[0]);
// [ "2016-01-02", "2016", "01", "02" ]

console.log(result[1]);
// [ "2019-03-07", "2019", "03", "07" ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.prototype[Symbol.matchAll]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- [Polyfill es-shims của `RegExp.prototype[Symbol.matchAll]`](https://www.npmjs.com/package/string.prototype.matchall)
- {{jsxref("String.prototype.matchAll()")}}
- [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)
- [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)
- {{jsxref("Symbol.matchAll")}}

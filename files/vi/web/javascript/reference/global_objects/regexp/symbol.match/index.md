---
title: RegExp.prototype[Symbol.match]()
short-title: "[Symbol.match]()"
slug: Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.@@match
sidebar: jsref
---

Phương thức **`[Symbol.match]()`** của các instance {{jsxref("RegExp")}} xác định cách [`String.prototype.match()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match) nên hoạt động. Ngoài ra, sự hiện diện (hoặc vắng mặt) của nó có thể ảnh hưởng đến việc liệu một đối tượng có được coi là biểu thức chính quy hay không.

{{InteractiveExample("JavaScript Demo: RegExp.prototype[Symbol.match]()")}}

```js interactive-example
class RegExp1 extends RegExp {
  [Symbol.match](str) {
    const result = RegExp.prototype[Symbol.match].call(this, str);
    if (result) {
      return "VALID";
    }
    return "INVALID";
  }
}

console.log("2012-07-02".match(new RegExp1("(\\d+)-(\\d+)-(\\d+)")));
// Expected output: "VALID"
```

## Cú pháp

```js-nolint
regexp[Symbol.match](str)
```

### Tham số

- `str`
  - : Một {{jsxref("String")}} là đích của kết quả khớp.

### Giá trị trả về

Một {{jsxref("Array")}} có nội dung phụ thuộc vào sự hiện diện hoặc vắng mặt của cờ global (`g`), hoặc [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu không tìm thấy kết quả khớp.

- Nếu cờ `g` được sử dụng, tất cả kết quả khớp với biểu thức chính quy đầy đủ sẽ được trả về, nhưng các nhóm bắt không được bao gồm.
- Nếu cờ `g` không được sử dụng, chỉ kết quả khớp đầy đủ đầu tiên và các nhóm bắt liên quan của nó được trả về. Trong trường hợp này, `match()` sẽ trả về cùng kết quả như {{jsxref("RegExp.prototype.exec()")}} (một mảng với một số thuộc tính bổ sung).

## Mô tả

Phương thức này được gọi nội bộ trong {{jsxref("String.prototype.match()")}}.

Ví dụ, hai ví dụ sau trả về cùng kết quả.

```js
"abc".match(/a/);

/a/[Symbol.match]("abc");
```

Nếu regex là global (với cờ `g`), phương thức [`exec()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/exec) của regex sẽ được gọi lặp đi lặp lại cho đến khi `exec()` trả về `null`. Ngược lại, `exec()` chỉ được gọi một lần và kết quả của nó trở thành giá trị trả về của `[Symbol.match]()`.

Vì `[Symbol.match]()` sẽ tiếp tục gọi `exec()` cho đến khi nó trả về `null`, và `exec()` sẽ tự động đặt lại `lastIndex` của regex về 0 khi kết quả khớp cuối cùng thất bại, `[Symbol.match]()` thường không có tác dụng phụ khi thoát. Tuy nhiên, khi regex là [sticky](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/sticky) nhưng không global, `lastIndex` sẽ không được đặt lại. Trong trường hợp này, mỗi lần gọi `match()` có thể trả về kết quả khác nhau.

```js
const re = /[abc]/y;
for (let i = 0; i < 5; i++) {
  console.log("abc".match(re), re.lastIndex);
}
// [ 'a' ] 1
// [ 'b' ] 2
// [ 'c' ] 3
// null 0
// [ 'a' ] 1
```

Khi regex vừa sticky vừa global, nó vẫn sẽ thực hiện khớp sticky — tức là nó sẽ thất bại khi khớp bất kỳ lần xuất hiện nào vượt quá `lastIndex`.

```js
console.log("ab-c".match(/[abc]/gy)); // [ 'a', 'b' ]
```

Nếu kết quả khớp hiện tại là một chuỗi rỗng, `lastIndex` vẫn sẽ được tăng — nếu regex [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), nó sẽ tăng thêm một điểm mã Unicode; ngược lại, nó tăng thêm một đơn vị mã UTF-16.

```js
console.log("😄".match(/(?:)/g)); // [ '', '', '' ]
console.log("😄".match(/(?:)/gu)); // [ '', '' ]
```

Phương thức này tồn tại để tùy chỉnh hành vi khớp trong các lớp con `RegExp`.

Ngoài ra, thuộc tính `[Symbol.match]` được dùng để kiểm tra [liệu một đối tượng có phải là biểu thức chính quy hay không](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp#special_handling_for_regexes).

## Ví dụ

### Gọi trực tiếp

Phương thức này có thể được sử dụng theo cách _gần như_ giống như {{jsxref("String.prototype.match()")}}, ngoại trừ `this` khác và thứ tự đối số khác.

```js
const re = /\d+/g;
const str = "2016-01-02";
const result = re[Symbol.match](str);
console.log(result); // ["2016", "01", "02"]
```

### Sử dụng `[Symbol.match]()` trong các lớp con

Các lớp con của {{jsxref("RegExp")}} có thể ghi đè phương thức `[Symbol.match]()` để sửa đổi hành vi mặc định.

```js
class MyRegExp extends RegExp {
  [Symbol.match](str) {
    const result = RegExp.prototype[Symbol.match].call(this, str);
    if (!result) return null;
    return {
      group(n) {
        return result[n];
      },
    };
  }
}

const re = new MyRegExp("(\\d+)-(\\d+)-(\\d+)");
const str = "2016-01-02";
const result = str.match(re); // String.prototype.match calls re[Symbol.match]().
console.log(result.group(1)); // 2016
console.log(result.group(2)); // 01
console.log(result.group(3)); // 02
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.prototype[Symbol.match]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("String.prototype.match()")}}
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)
- [`RegExp.prototype[Symbol.split]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split)
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
- {{jsxref("Symbol.match")}}

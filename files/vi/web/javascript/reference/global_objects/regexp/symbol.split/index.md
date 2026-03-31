---
title: RegExp.prototype[Symbol.split]()
short-title: "[Symbol.split]()"
slug: Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.split
page-type: javascript-instance-method
browser-compat: javascript.builtins.RegExp.@@split
sidebar: jsref
---

Phương thức **`[Symbol.split]()`** của các instance {{jsxref("RegExp")}} xác định cách [`String.prototype.split`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split) nên hoạt động khi biểu thức chính quy được truyền vào làm dấu phân cách.

{{InteractiveExample("JavaScript Demo: RegExp.prototype[Symbol.split]()")}}

```js interactive-example
class RegExp1 extends RegExp {
  [Symbol.split](str, limit) {
    const result = RegExp.prototype[Symbol.split].call(this, str, limit);
    return result.map((x) => `(${x})`);
  }
}

console.log("2016-01-02".split(new RegExp1("-")));
// Expected output: Array ["(2016)", "(01)", "(02)"]

console.log("2016-01-02".split(/-/));
// Expected output: Array ["2016", "01", "02"]
```

## Cú pháp

```js-nolint
regexp[Symbol.split](str)
regexp[Symbol.split](str, limit)
```

### Tham số

- `str`
  - : Đích của thao tác phân tách.
- `limit` {{optional_inline}}
  - : Số nguyên chỉ định giới hạn số lần phân tách cần tìm. Phương thức `[Symbol.split]()` vẫn phân tách ở mỗi kết quả khớp của pattern `this` RegExp (hoặc trong cú pháp trên, `regexp`), cho đến khi số mục phân tách khớp với `limit` hoặc chuỗi không đủ để khớp với pattern `this`.

### Giá trị trả về

Một {{jsxref("Array")}} chứa các chuỗi con làm phần tử của nó. Các nhóm bắt được bao gồm.

## Mô tả

Phương thức này được gọi nội bộ trong {{jsxref("String.prototype.split()")}} khi một `RegExp` được truyền vào làm dấu phân cách. Ví dụ, hai ví dụ sau trả về cùng kết quả.

```js
"a-b-c".split(/-/);

/-/[Symbol.split]("a-b-c");
```

Phương thức này tồn tại để tùy chỉnh hành vi của `split()` trong các lớp con `RegExp`.

Phương thức cơ sở `RegExp.prototype[Symbol.split]()` thể hiện các hành vi sau:

- Nó bắt đầu bằng cách sử dụng [`[Symbol.species]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.species) để xây dựng một regex mới, tránh làm biến đổi regex gốc theo bất kỳ cách nào.
- Cờ `g` ("global") của regex bị bỏ qua, và cờ `y` ("sticky") luôn được áp dụng ngay cả khi nó ban đầu không có.
- Nếu chuỗi đích là rỗng, và regex có thể khớp với các chuỗi rỗng (ví dụ: `/a?/`), một mảng rỗng được trả về. Ngược lại, nếu regex không thể khớp với chuỗi rỗng, `[""]` được trả về.
- Việc khớp tiến hành bằng cách liên tục gọi `this.exec()`. Vì regex luôn sticky, điều này sẽ di chuyển dọc theo chuỗi, mỗi lần tạo ra một chuỗi khớp, chỉ mục, và bất kỳ nhóm bắt nào.
- Đối với mỗi kết quả khớp, chuỗi con giữa cuối của chuỗi khớp cuối cùng và đầu của chuỗi khớp hiện tại được thêm vào mảng kết quả trước. Sau đó, các giá trị của nhóm bắt được thêm vào lần lượt.
- Nếu kết quả khớp hiện tại là một chuỗi rỗng, hoặc nếu regex không khớp ở vị trí hiện tại (vì nó sticky), `lastIndex` vẫn sẽ được tăng — nếu regex [nhận biết Unicode](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/unicode#unicode-aware_mode), nó sẽ tăng thêm một điểm mã Unicode; ngược lại, nó tăng thêm một đơn vị mã UTF-16.
- Nếu regex không khớp với chuỗi đích, chuỗi đích được trả về nguyên vẹn, được bao gói trong một mảng.
- Độ dài mảng trả về sẽ không bao giờ vượt quá tham số `limit`, nếu được cung cấp, trong khi cố gắng càng gần càng tốt. Do đó, kết quả khớp cuối cùng và các nhóm bắt của nó có thể không đều có trong mảng trả về nếu mảng đã đầy.

## Ví dụ

### Gọi trực tiếp

Phương thức này có thể được sử dụng gần như giống như {{jsxref("String.prototype.split()")}}, ngoại trừ `this` khác và thứ tự đối số khác.

```js
const re = /-/g;
const str = "2016-01-02";
const result = re[Symbol.split](str);
console.log(result); // ["2016", "01", "02"]
```

### Sử dụng `[Symbol.split]()` trong các lớp con

Các lớp con của {{jsxref("RegExp")}} có thể ghi đè phương thức `[Symbol.split]()` để sửa đổi hành vi mặc định.

```js
class MyRegExp extends RegExp {
  [Symbol.split](str, limit) {
    const result = RegExp.prototype[Symbol.split].call(this, str, limit);
    return result.map((x) => `(${x})`);
  }
}

const re = new MyRegExp("-");
const str = "2016-01-02";
const result = str.split(re); // String.prototype.split calls re[Symbol.split]().
console.log(result); // ["(2016)", "(01)", "(02)"]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `RegExp.prototype[Symbol.split]` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-string-and-regexp)
- {{jsxref("String.prototype.split()")}}
- [`RegExp.prototype[Symbol.match]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.match)
- [`RegExp.prototype[Symbol.matchAll]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.matchAll)
- [`RegExp.prototype[Symbol.replace]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.replace)
- [`RegExp.prototype[Symbol.search]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/Symbol.search)
- {{jsxref("RegExp.prototype.exec()")}}
- {{jsxref("RegExp.prototype.test()")}}
- {{jsxref("Symbol.split")}}

---
title: "SyntaxError: setter functions must have one argument"
slug: Web/JavaScript/Reference/Errors/Setter_one_argument
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "setter functions must have one argument" xảy ra khi một [setter](/en-US/docs/Web/JavaScript/Reference/Functions/get) được khai báo và danh sách tham số không bao gồm chính xác một tham số hình thức.

## Thông báo

```plain
SyntaxError: Setter must have exactly one formal parameter. (V8-based)
SyntaxError: Setter function argument must not be a rest parameter (V8-based)
SyntaxError: setter functions must have one argument (Firefox)
SyntaxError: Unexpected token ','. setter functions must have one parameter. (Safari)
SyntaxError: Unexpected token '...'. Expected a parameter pattern or a ')' in parameter list. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Điều gì đã xảy ra?

Cú pháp thuộc tính [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set) trông giống như một hàm, nhưng nó nghiêm ngặt hơn và không phải tất cả cú pháp hàm đều được phép. Một setter luôn được gọi với chính xác một đối số, vì vậy việc định nghĩa nó với bất kỳ số lượng tham số nào khác rất có thể là một lỗi. Tham số này có thể được [destructure](/en-US/docs/Web/JavaScript/Reference/Operators/Destructuring) hoặc có [giá trị mặc định](/en-US/docs/Web/JavaScript/Reference/Functions/Default_parameters), nhưng không thể là [tham số rest](/en-US/docs/Web/JavaScript/Reference/Functions/rest_parameters).

Lưu ý rằng lỗi này chỉ áp dụng cho các setter thuộc tính sử dụng cú pháp `set`. Nếu bạn định nghĩa setter bằng cách sử dụng {{jsxref("Object.defineProperty()")}}, v.v., setter được định nghĩa như một hàm thông thường, mặc dù rất có thể vẫn là lỗi nếu setter mong đợi số lượng đối số khác, vì nó sẽ được gọi với chính xác một đối số.

## Ví dụ

### Các trường hợp không hợp lệ

```js-nolint example-bad
const obj = {
  set value() {
    this._value = Math.random();
  },
};
```

### Các trường hợp hợp lệ

```js example-good
// Bạn phải khai báo một tham số, ngay cả khi không sử dụng nó
const obj = {
  set value(_ignored) {
    this._value = Math.random();
  },
};

// Bạn cũng có thể khai báo một phương thức thông thường thay thế
const obj = {
  setValue() {
    this._value = Math.random();
  },
};
```

## Xem thêm

- [Hàm](/en-US/docs/Web/JavaScript/Reference/Functions)
- [`set`](/en-US/docs/Web/JavaScript/Reference/Functions/set)

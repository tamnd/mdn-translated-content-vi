---
title: "SyntaxError: getter functions must have no arguments"
slug: Web/JavaScript/Reference/Errors/Getter_no_arguments
page-type: javascript-error
sidebar: jssidebar
---

Ngoại lệ JavaScript "getter functions must have no arguments" xảy ra khi một
[getter](/en-US/docs/Web/JavaScript/Reference/Functions/get) được khai báo với
danh sách tham số không rỗng.

## Thông báo

```plain
SyntaxError: Getter must not have any formal parameters. (V8-based)
SyntaxError: getter functions must have no arguments (Firefox)
SyntaxError: Unexpected identifier 'x'. getter functions must have no parameters. (Safari)
```

## Loại lỗi

{{jsxref("SyntaxError")}}

## Nguyên nhân?

Cú pháp thuộc tính [`get`](/en-US/docs/Web/JavaScript/Reference/Functions/get)
trông giống một hàm, nhưng nó có quy tắc chặt chẽ hơn và không phải mọi cú pháp
hàm đều được phép. Getter luôn được gọi mà không có đối số, vì vậy việc định nghĩa
nó với bất kỳ tham số nào hầu như đều là lỗi.

Lưu ý rằng lỗi này chỉ áp dụng cho các getter thuộc tính sử dụng cú pháp `get`.
Nếu bạn định nghĩa getter bằng {{jsxref("Object.defineProperty()")}} hoặc tương
tự, getter được định nghĩa như một hàm thông thường — dù như vậy, việc getter
mong đợi đối số nào vẫn có khả năng là lỗi, vì nó sẽ được gọi mà không có đối
số nào.

## Ví dụ

### Trường hợp không hợp lệ

```js-nolint example-bad
const obj = {
  get value(type) {
    return type === "string" ? String(Math.random()) : Math.random();
  },
};
```

### Trường hợp hợp lệ

```js example-good
// Xóa tham số
const obj = {
  get value() {
    return Math.random();
  },
};

// Dùng phương thức thông thường nếu bạn cần tham số
const obj = {
  getValue(type) {
    return type === "string" ? String(Math.random()) : Math.random();
  },
};
```

## Xem thêm

- [Functions](/en-US/docs/Web/JavaScript/Reference/Functions)
- [`get`](/en-US/docs/Web/JavaScript/Reference/Functions/get)

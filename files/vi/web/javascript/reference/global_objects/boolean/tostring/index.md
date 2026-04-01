---
title: Boolean.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/Boolean/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.Boolean.toString
sidebar: jsref
---

Phương thức **`toString()`** của các giá trị {{jsxref("Boolean")}} trả về một chuỗi biểu diễn giá trị boolean được chỉ định.

{{InteractiveExample("JavaScript Demo: Boolean.prototype.toString()")}}

```js interactive-example
const flag1 = new Boolean(true);

console.log(flag1.toString());
// Expected output: "true"

const flag2 = new Boolean(1);

console.log(flag2.toString());
// Expected output: "true"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn giá trị boolean được chỉ định.

## Mô tả

Đối tượng {{jsxref("Boolean")}} ghi đè phương thức `toString` của {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString()")}}. Đối với các giá trị `Boolean`, phương thức `toString` trả về biểu diễn chuỗi của giá trị boolean, có thể là `"true"` hoặc `"false"`.

Phương thức `toString()` yêu cầu giá trị `this` của nó là một nguyên thủy `Boolean` hoặc đối tượng bao bọc. Nó ném {{jsxref("TypeError")}} cho các giá trị `this` khác mà không cố gắng ép buộc chúng sang giá trị boolean.

Vì `Boolean` không có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), JavaScript gọi phương thức `toString()` tự động khi một _đối tượng_ `Boolean` được sử dụng trong ngữ cảnh cần chuỗi, chẳng hạn trong [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Tuy nhiên, các giá trị _nguyên thủy_ boolean không tham khảo phương thức `toString()` để được [ép buộc thành chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) — thay vào đó, chúng được chuyển đổi trực tiếp bằng cùng thuật toán như triển khai ban đầu của `toString()`.

```js
Boolean.prototype.toString = () => "Overridden";
console.log(`${true}`); // "true"
console.log(`${new Boolean(true)}`); // "Overridden"
```

## Ví dụ

### Sử dụng toString()

```js
const flag = new Boolean(true);
console.log(flag.toString()); // "true"
console.log(false.toString()); // "false"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Object.prototype.toString()")}}

---
title: String.prototype.toString()
short-title: toString()
slug: Web/JavaScript/Reference/Global_Objects/String/toString
page-type: javascript-instance-method
browser-compat: javascript.builtins.String.toString
sidebar: jsref
---

Phương thức **`toString()`** của các giá trị {{jsxref("String")}} trả về giá trị chuỗi này.

{{InteractiveExample("JavaScript Demo: String.prototype.toString()")}}

```js interactive-example
const stringObj = new String("foo");

console.log(stringObj);
// Expected output: String { "foo" }

console.log(stringObj.toString());
// Expected output: "foo"
```

## Cú pháp

```js-nolint
toString()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn giá trị chuỗi được chỉ định.

## Mô tả

Đối tượng {{jsxref("String")}} ghi đè phương thức `toString` của {{jsxref("Object")}}; nó không kế thừa {{jsxref("Object.prototype.toString()")}}. Đối với các giá trị `String`, phương thức `toString` trả về chính chuỗi đó (nếu là kiểu nguyên thủy) hoặc chuỗi mà đối tượng `String` bao bọc. Nó có cách triển khai hoàn toàn giống với {{jsxref("String.prototype.valueOf()")}}.

Phương thức `toString()` yêu cầu giá trị `this` của nó phải là một kiểu nguyên thủy `String` hoặc đối tượng bao bọc `String`. Nó ném ra {{jsxref("TypeError")}} cho các giá trị `this` khác mà không cố gắng ép kiểu chúng thành chuỗi.

Vì `String` không có phương thức [`[Symbol.toPrimitive]()`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toPrimitive), JavaScript tự động gọi phương thức `toString()` khi một _đối tượng_ `String` được sử dụng trong ngữ cảnh yêu cầu chuỗi, chẳng hạn như trong [template literal](/en-US/docs/Web/JavaScript/Reference/Template_literals). Tuy nhiên, các giá trị _nguyên thủy_ chuỗi không tham chiếu đến phương thức `toString()` để [ép kiểu sang chuỗi](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion) — vì chúng đã là chuỗi, không cần thực hiện chuyển đổi.

```js
String.prototype.toString = () => "Overridden";
console.log(`${"foo"}`); // "foo"
console.log(`${new String("foo")}`); // "Overridden"
```

## Ví dụ

### Sử dụng toString()

Ví dụ sau hiển thị giá trị chuỗi của một đối tượng {{jsxref("String")}}:

```js
const x = new String("Hello world");

console.log(x.toString()); // "Hello world"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("String.prototype.valueOf()")}}

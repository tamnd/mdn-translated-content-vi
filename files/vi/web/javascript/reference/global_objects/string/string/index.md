---
title: String() constructor
short-title: String()
slug: Web/JavaScript/Reference/Global_Objects/String/String
page-type: javascript-constructor
browser-compat: javascript.builtins.String.String
sidebar: jsref
---

Constructor **`String()`** tạo các đối tượng {{jsxref("String")}}. Khi được gọi như một hàm, nó trả về các giá trị kiểu primitive String.

## Cú pháp

```js-nolint
new String(thing)
String(thing)
```

> [!NOTE]
> `String()` có thể được gọi có hoặc không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new), nhưng với các hiệu ứng khác nhau. Xem [Giá trị trả về](#return_value).

### Tham số

- `thing`
  - : Bất kỳ thứ gì cần chuyển đổi thành string.

### Giá trị trả về

Khi `String()` được gọi như một hàm (không có [`new`](/en-US/docs/Web/JavaScript/Reference/Operators/new)), nó trả về `value` [được ép kiểu thành string primitive](/en-US/docs/Web/JavaScript/Reference/Global_Objects/String#string_coercion). Đặc biệt, các giá trị [Symbol](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol) được chuyển đổi thành `"Symbol(description)"`, trong đó `description` là [mô tả](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/description) của Symbol, thay vì ném lỗi.

Khi `String()` được gọi như một constructor (với `new`), nó ép kiểu `value` thành string primitive (không có xử lý symbol đặc biệt) và trả về một đối tượng {{jsxref("String")}} bao bọc, **không** phải là một primitive.

> [!WARNING]
> Bạn hiếm khi cần sử dụng `String` như một constructor.

## Ví dụ

### Constructor String và hàm String

Hàm String và constructor String tạo ra các kết quả khác nhau:

```js
const a = new String("Hello world"); // a === "Hello world" is false
const b = String("Hello world"); // b === "Hello world" is true
a instanceof String; // is true
b instanceof String; // is false
typeof a; // "object"
typeof b; // "string"
```

Ở đây, hàm tạo ra một string (kiểu {{Glossary("primitive")}}) như đã hứa. Tuy nhiên, constructor tạo ra một thực thể của kiểu String (một object wrapper) và đó là lý do tại sao bạn hiếm khi muốn sử dụng constructor String.

### Sử dụng String() để stringify một symbol

`String()` là trường hợp duy nhất mà một symbol có thể được chuyển đổi thành string mà không ném lỗi, vì nó rất rõ ràng.

```js example-bad
const sym = Symbol("example");
`${sym}`; // TypeError: Cannot convert a Symbol value to a string
"" + sym; // TypeError: Cannot convert a Symbol value to a string
"".concat(sym); // TypeError: Cannot convert a Symbol value to a string
```

```js example-good
const sym = Symbol("example");
String(sym); // "Symbol(example)"
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Numbers and strings](/en-US/docs/Web/JavaScript/Guide/Numbers_and_strings) guide

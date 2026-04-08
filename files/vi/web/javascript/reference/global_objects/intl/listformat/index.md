---
title: Intl.ListFormat
slug: Web/JavaScript/Reference/Global_Objects/Intl/ListFormat
page-type: javascript-class
browser-compat: javascript.builtins.Intl.ListFormat
sidebar: jsref
---

Đối tượng **`Intl.ListFormat`** cho phép định dạng danh sách nhạy cảm ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.ListFormat", "taller")}}

```js interactive-example
const vehicles = ["Motorcycle", "Bus", "Car"];

const formatter = new Intl.ListFormat("en", {
  style: "long",
  type: "conjunction",
});
console.log(formatter.format(vehicles));
// Expected output: "Motorcycle, Bus, and Car"

const formatter2 = new Intl.ListFormat("de", {
  style: "short",
  type: "disjunction",
});
console.log(formatter2.format(vehicles));
// Expected output: "Motorcycle, Bus oder Car"

const formatter3 = new Intl.ListFormat("en", { style: "narrow", type: "unit" });
console.log(formatter3.format(vehicles));
// Expected output: "Motorcycle Bus Car"
```

## Constructor

- {{jsxref("Intl/ListFormat/ListFormat", "Intl.ListFormat()")}}
  - : Tạo một đối tượng `Intl.ListFormat` mới.

## Phương thức tĩnh

- {{jsxref("Intl/ListFormat/supportedLocalesOf", "Intl.ListFormat.supportedLocalesOf()")}}
  - : Trả về một mảng chứa các ngôn ngữ được hỗ trợ trong số các ngôn ngữ đã cung cấp mà không cần phải quay lại ngôn ngữ mặc định của runtime.

## Thuộc tính instance

Các thuộc tính này được định nghĩa trên `Intl.ListFormat.prototype` và được chia sẻ bởi tất cả các instance `Intl.ListFormat`.

- {{jsxref("Object/constructor", "Intl.ListFormat.prototype.constructor")}}
  - : Hàm constructor đã tạo ra đối tượng instance. Đối với các instance `Intl.ListFormat`, giá trị khởi tạo là constructor {{jsxref("Intl/ListFormat/ListFormat", "Intl.ListFormat")}}.
- `Intl.ListFormat.prototype[Symbol.toStringTag]`
  - : Giá trị khởi tạo của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Intl.ListFormat"`. Thuộc tính này được dùng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức instance

- {{jsxref("Intl/ListFormat/format", "Intl.ListFormat.prototype.format()")}}
  - : Trả về một chuỗi biểu diễn đặc thù theo ngôn ngữ các phần tử của danh sách.
- {{jsxref("Intl/ListFormat/formatToParts", "Intl.ListFormat.prototype.formatToParts()")}}
  - : Trả về một mảng các đối tượng biểu diễn các thành phần khác nhau có thể dùng để định dạng danh sách các giá trị theo cách nhạy cảm ngôn ngữ.
- {{jsxref("Intl/ListFormat/resolvedOptions", "Intl.ListFormat.prototype.resolvedOptions()")}}
  - : Trả về một đối tượng mới với các thuộc tính phản ánh các tùy chọn ngôn ngữ và kiểu định dạng được tính toán trong quá trình xây dựng đối tượng `Intl.ListFormat` hiện tại.

## Ví dụ

### Sử dụng format

Ví dụ sau cho thấy cách tạo một bộ định dạng danh sách sử dụng ngôn ngữ tiếng Anh.

```js
const list = ["Motorcycle", "Bus", "Car"];

console.log(
  new Intl.ListFormat("en-GB", { style: "long", type: "conjunction" }).format(
    list,
  ),
);
// Motorcycle, Bus and Car

console.log(
  new Intl.ListFormat("en-GB", { style: "short", type: "disjunction" }).format(
    list,
  ),
);
// Motorcycle, Bus or Car

console.log(
  new Intl.ListFormat("en-GB", { style: "narrow", type: "unit" }).format(list),
);
// Motorcycle Bus Car
```

### Sử dụng formatToParts

Ví dụ sau cho thấy cách tạo một bộ định dạng danh sách trả về các phần được định dạng

```js
const list = ["Motorcycle", "Bus", "Car"];
console.log(
  new Intl.ListFormat("en-GB", {
    style: "long",
    type: "conjunction",
  }).formatToParts(list),
);

// [ { "type": "element", "value": "Motorcycle" },
//   { "type": "literal", "value": ", " },
//   { "type": "element", "value": "Bus" },
//   { "type": "literal", "value": ", and " },
//   { "type": "element", "value": "Car" } ];
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Intl.ListFormat` trong FormatJS](https://formatjs.github.io/docs/polyfills/intl-listformat/)
- {{jsxref("Intl")}}

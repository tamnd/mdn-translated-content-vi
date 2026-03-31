---
title: Intl.ListFormat.prototype.formatToParts()
short-title: formatToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/formatToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.ListFormat.formatToParts
sidebar: jsref
---

Phương thức **`formatToParts()`** của các instance {{jsxref("Intl.ListFormat")}} trả về một mảng các đối tượng biểu diễn từng phần của chuỗi được định dạng mà {{jsxref("Intl/ListFormat/format", "format()")}} sẽ trả về. Nó hữu ích để xây dựng các chuỗi tùy chỉnh từ các token đặc thù theo ngôn ngữ.

{{InteractiveExample("JavaScript Demo: Intl.listformat.prototype.formatToParts()", "taller")}}

```js interactive-example
const vehicles = ["Motorcycle", "Bus", "Car"];

const formatterEn = new Intl.ListFormat("en", {
  style: "long",
  type: "conjunction",
});

const formatterFr = new Intl.ListFormat("fr", {
  style: "long",
  type: "conjunction",
});

const partValuesEn = formatterEn.formatToParts(vehicles).map((p) => p.value);
const partValuesFr = formatterFr.formatToParts(vehicles).map((p) => p.value);

console.log(partValuesEn);
// Expected output: "["Motorcycle", ", ", "Bus", ", and ", "Car"]"
console.log(partValuesFr);
// Expected output: "["Motorcycle", ", ", "Bus", " et ", "Car"]"
```

## Cú pháp

```js-nolint
formatToParts(list)
```

### Tham số

- `list`
  - : Một đối tượng có thể lặp, chẳng hạn như Array, chứa các chuỗi. Bỏ qua tham số này dẫn đến việc định dạng mảng rỗng, điều này có thể gây nhầm lẫn, vì vậy nên luôn luôn truyền một danh sách một cách rõ ràng.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa danh sách được định dạng theo từng phần. Mỗi đối tượng có hai thuộc tính, `type` và `value`, mỗi thuộc tính chứa một chuỗi. Việc nối chuỗi của `value`, theo thứ tự được cung cấp, sẽ cho ra cùng một chuỗi như {{jsxref("Intl/ListFormat/format", "format()")}}. `type` có thể là một trong các giá trị sau:

- `literal`
  - : Bất kỳ chuỗi nào là một phần của mẫu định dạng; ví dụ `", "`, `", and"`, v.v.
- `element`
  - : Một phần tử của danh sách, chính xác như được cung cấp.

## Ví dụ

### Sử dụng formatToParts()

```js
const fruits = ["Apple", "Orange", "Pineapple"];
const myListFormat = new Intl.ListFormat("en-GB", {
  style: "long",
  type: "conjunction",
});

console.table(myListFormat.formatToParts(fruits));
// [
//  { "type": "element", "value": "Apple" },
//  { "type": "literal", "value": ", " },
//  { "type": "element", "value": "Orange" },
//  { "type": "literal", "value": " and " },
//  { "type": "element", "value": "Pineapple" }
// ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.ListFormat")}}
- {{jsxref("Intl/ListFormat/format", "Intl.ListFormat.prototype.format()")}}

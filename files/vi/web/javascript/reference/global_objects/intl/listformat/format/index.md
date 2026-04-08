---
title: Intl.ListFormat.prototype.format()
short-title: format()
slug: Web/JavaScript/Reference/Global_Objects/Intl/ListFormat/format
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.ListFormat.format
sidebar: jsref
---

Phương thức **`format()`** của các instance {{jsxref("Intl.ListFormat")}} trả về một chuỗi với biểu diễn đặc thù theo ngôn ngữ của danh sách.

{{InteractiveExample("JavaScript Demo: Intl.ListFormat.prototype.format()", "taller")}}

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

## Cú pháp

```js-nolint
format(list)
```

### Tham số

- `list`
  - : Một đối tượng có thể lặp, chẳng hạn như Array, chứa các chuỗi. Bỏ qua tham số này dẫn đến việc định dạng mảng rỗng, điều này có thể gây nhầm lẫn, vì vậy nên luôn luôn truyền một danh sách một cách rõ ràng.

### Giá trị trả về

Một chuỗi biểu diễn đặc thù theo ngôn ngữ các phần tử của danh sách.

> [!NOTE]
> Trong hầu hết trường hợp, định dạng được trả về bởi `format()` là nhất quán. Tuy nhiên, đầu ra có thể thay đổi giữa các triển khai, ngay cả trong cùng một ngôn ngữ — các biến thể đầu ra là theo thiết kế và được cho phép bởi đặc tả. Nó cũng có thể không phải là những gì bạn mong đợi. Ví dụ, chuỗi có thể sử dụng khoảng trắng không ngắt hoặc được bao quanh bởi các ký tự kiểm soát hai chiều. Bạn không nên so sánh kết quả của `format()` với các hằng số được mã cứng.

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

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.ListFormat")}}

---
title: Intl.NumberFormat.prototype.formatRangeToParts()
short-title: formatRangeToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/NumberFormat/formatRangeToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.NumberFormat.formatRangeToParts
sidebar: jsref
---

Phương thức **`formatRangeToParts()`** của các instance {{jsxref("Intl.NumberFormat")}} trả về một {{jsxref("Array")}} các đối tượng chứa các token theo locale từ đó có thể xây dựng chuỗi tùy chỉnh trong khi vẫn giữ nguyên các phần theo locale. Điều này giúp cung cấp định dạng tùy chỉnh theo locale cho khoảng chuỗi số.

## Cú pháp

```js-nolint
formatRangeToParts(startRange, endRange)
```

### Tham số

- `startRange`
  - : Một {{jsxref("Number")}}, {{jsxref("BigInt")}}, hoặc chuỗi để định dạng. Chuỗi được phân tích cú pháp theo cách tương tự như trong [chuyển đổi số](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number#number_coercion), ngoại trừ `formatRangeToParts()` sẽ dùng giá trị chính xác mà chuỗi đại diện, tránh mất độ chính xác trong quá trình chuyển đổi ngầm định thành số.
- `endRange`
  - : Một {{jsxref("Number")}}, {{jsxref("BigInt")}}, hoặc chuỗi để định dạng.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa khoảng được định dạng theo từng phần. Mỗi đối tượng có ba thuộc tính, `type`, `value` và `source`, mỗi thuộc tính chứa một chuỗi. Việc nối chuỗi các `value`, theo thứ tự được cung cấp, sẽ tạo ra cùng chuỗi như {{jsxref("Intl/NumberFormat/formatRange", "formatRange()")}}. `type` có thể có các giá trị giống như {{jsxref("Intl/NumberFormat/formatToParts", "formatToParts()")}}, hoặc giá trị bổ sung `"approximatelySign"` (xem bên dưới). `source` có thể là một trong các giá trị sau:

- `startRange`
  - : Token là một phần của số đầu.
- `endRange`
  - : Token là một phần của số cuối.
- `shared`
  - : Token được chia sẻ giữa đầu và cuối; ví dụ, ký hiệu tiền tệ. Tất cả các ký tự literal là một phần của mẫu khoảng, chẳng hạn như dấu phân cách `"–"`, cũng được đánh dấu là `shared`.

Nếu số đầu và số cuối được định dạng thành cùng một chuỗi, đầu ra có cùng danh sách token như khi gọi {{jsxref("Intl/NumberFormat/formatToParts", "formatToParts()")}} trên số đầu, với tất cả token được đánh dấu là `source: "shared"`. Ngoài ra, token đầu tiên có thể là ký hiệu "xấp xỉ bằng" (ví dụ: "~") với `type: "approximatelySign"`. Việc chèn ký hiệu này chỉ phụ thuộc vào cài đặt locale và được chèn ngay cả khi `startRange === endRange`.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu `startRange` hoặc `endRange` là `NaN` hoặc chuỗi không thể chuyển đổi.
- {{jsxref("TypeError")}}
  - : Được ném ra nếu `startRange` hoặc `endRange` là undefined.

## Ví dụ

### Sử dụng formatRangeToParts()

Phương thức `formatRange()` xuất ra các chuỗi được bản địa hóa, không thể thao tác trực tiếp:

```js
const startRange = 3500;
const endRange = 9500;

const formatter = new Intl.NumberFormat("de-DE", {
  style: "currency",
  currency: "EUR",
});

console.log(formatter.formatRange(startRange, endRange));
// "3.500,00–9.500,00 €"
```

Tuy nhiên, trong nhiều giao diện người dùng, bạn có thể muốn tùy chỉnh định dạng của chuỗi này hoặc xen kẽ nó với các văn bản khác. Phương thức `formatRangeToParts()` cung cấp cùng thông tin đó theo từng phần:

```js
console.log(formatter.formatRangeToParts(startRange, endRange));

// return value:
[
  { type: "integer", value: "3", source: "startRange" },
  { type: "group", value: ".", source: "startRange" },
  { type: "integer", value: "500", source: "startRange" },
  { type: "decimal", value: ",", source: "startRange" },
  { type: "fraction", value: "00", source: "startRange" },
  { type: "literal", value: "–", source: "shared" },
  { type: "integer", value: "9", source: "endRange" },
  { type: "group", value: ".", source: "endRange" },
  { type: "integer", value: "500", source: "endRange" },
  { type: "decimal", value: ",", source: "endRange" },
  { type: "fraction", value: "00", source: "endRange" },
  { type: "literal", value: " ", source: "shared" },
  { type: "currency", value: "€", source: "shared" },
];
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.NumberFormat")}}
- {{jsxref("Intl/NumberFormat/format", "Intl.NumberFormat.prototype.format()")}}

---
title: Intl.RelativeTimeFormat.prototype.formatToParts()
short-title: formatToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/RelativeTimeFormat/formatToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.RelativeTimeFormat.formatToParts
sidebar: jsref
---

Phương thức **`formatToParts()`** của các instance {{jsxref("Intl.RelativeTimeFormat")}} trả về một mảng các đối tượng đại diện cho từng phần của chuỗi được định dạng mà {{jsxref("Intl/RelativeTimeFormat/format", "format()")}} sẽ trả về. Phương thức này hữu ích để xây dựng chuỗi tùy chỉnh từ các token theo locale.

{{InteractiveExample("JavaScript Demo: Intl.RelativeTimeFormat.prototype.formatToParts()")}}

```js interactive-example
const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });
const parts = rtf.formatToParts(10, "seconds");

console.log(parts[0].value);
// Expected output: "in "

console.log(parts[1].value);
// Expected output: "10"

console.log(parts[2].value);
// Expected output: " seconds"
```

## Cú pháp

```js-nolint
formatToParts(value, unit)
```

### Tham số

- `value`
  - : Giá trị số để dùng trong thông báo thời gian tương đối được quốc tế hóa.
- `unit`
  - : Đơn vị để dùng trong thông báo thời gian tương đối được quốc tế hóa. Các giá trị có thể là: `"year"`, `"quarter"`, `"month"`, `"week"`, `"day"`, `"hour"`, `"minute"`, `"second"`. Dạng số nhiều cũng được phép.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa thời gian tương đối được định dạng theo từng phần. Mỗi đối tượng có hai hoặc ba thuộc tính: `type`, `value`, và tùy chọn `unit`, mỗi thuộc tính chứa một chuỗi. Ghép nối chuỗi của `value` theo thứ tự được cung cấp sẽ cho kết quả giống như {{jsxref("Intl/RelativeTimeFormat/format", "format()")}}. Các phần có thể được coi là lấy trực tiếp từ việc gọi {{jsxref("Intl/NumberFormat/formatToParts", "Intl.NumberFormat.prototype.formatToParts()")}} với giá trị số, chỉ truyền tùy chọn `numberingSystem`, sau đó thêm các token `type: "literal"` bổ sung, chẳng hạn như `"in "`, `" days ago"`, v.v. Tất cả token được tạo ra bởi `NumberFormat` có thêm thuộc tính `unit`, là dạng số ít của `unit` đầu vào; thuộc tính này dùng cho mục đích lập trình và không được bản địa hóa. Đơn vị được bản địa hóa được xuất ra như một phần của token literal.

Khi `options.numeric` là `"auto"` và có chuỗi đặc biệt cho giá trị đó, mảng được trả về là một token literal duy nhất.

## Ví dụ

### Sử dụng formatToParts()

```js
const rtf = new Intl.RelativeTimeFormat("en", { numeric: "auto" });

// Định dạng thời gian tương đối sử dụng đơn vị day
rtf.formatToParts(-1, "day");
// [{ type: "literal", value: "yesterday"}]

rtf.formatToParts(100, "day");
// [
//   { type: "literal", value: "in " },
//   { type: "integer", value: "100", unit: "day" },
//   { type: "literal", value: " days" }
// ]
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.RelativeTimeFormat")}}
- {{jsxref("Intl/RelativeTimeFormat/format", "Intl.RelativeTimeFormat.prototype.format()")}}

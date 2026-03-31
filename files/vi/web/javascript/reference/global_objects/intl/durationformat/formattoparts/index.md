---
title: Intl.DurationFormat.prototype.formatToParts()
short-title: formatToParts()
slug: Web/JavaScript/Reference/Global_Objects/Intl/DurationFormat/formatToParts
page-type: javascript-instance-method
browser-compat: javascript.builtins.Intl.DurationFormat.formatToParts
sidebar: jsref
---

Phương thức **`formatToParts()`** của các instance {{jsxref("Intl.DurationFormat")}} trả về một mảng các đối tượng biểu diễn từng phần của chuỗi được định dạng mà {{jsxref("Intl/DurationFormat/format", "format()")}} sẽ trả về. Nó hữu ích để xây dựng các chuỗi tùy chỉnh từ các token đặc thù theo ngôn ngữ.

## Cú pháp

```js-nolint
formatToParts(duration)
```

### Tham số

- `duration` {{optional_inline}}
  - : Đối tượng thời lượng cần được định dạng. Nó nên bao gồm một số hoặc tất cả các thuộc tính sau: `years`, `months`, `weeks`, `days`, `hours`, `minutes`, `seconds`, `milliseconds`, `microseconds`, `nanoseconds`. Giá trị của mỗi thuộc tính phải là số nguyên, và dấu của chúng phải nhất quán. Đây có thể là đối tượng {{jsxref("Temporal.Duration")}}; xem tài liệu {{jsxref("Temporal.Duration")}} để biết thêm thông tin về các thuộc tính này.

### Giá trị trả về

Một {{jsxref("Array")}} các đối tượng chứa thời lượng được định dạng theo từng phần. Mỗi đối tượng có hai hoặc ba thuộc tính, `type`, `value`, và tùy chọn `unit`, mỗi thuộc tính chứa một chuỗi. Việc nối chuỗi của `value`, theo thứ tự được cung cấp, sẽ cho ra cùng một chuỗi như {{jsxref("Intl/DurationFormat/format", "format()")}}. Các phần có thể được coi là trực tiếp thu được từ việc gọi {{jsxref("Intl/NumberFormat/formatToParts", "Intl.NumberFormat.prototype.formatToParts()")}} với giá trị số và các đơn vị tương ứng của chúng. Tất cả token được tạo ra bởi `NumberFormat` đều có thêm thuộc tính `unit`, là dạng số ít của `unit` đầu vào; điều này dành cho sử dụng lập trình và không được bản địa hóa. Đơn vị được bản địa hóa được xuất ra như một token `unit` riêng biệt là một phần của kết quả `NumberFormat`. Các phần từ mỗi đơn vị thời lượng được nối lại theo cùng cách như gọi {{jsxref("Intl/ListFormat/formatToParts", "Intl.ListFormat.prototype.formatToParts()")}} với `{ type: "unit" }`, vì vậy các token literal bổ sung được chèn vào.

## Ví dụ

Phương thức `formatToParts` cho phép định dạng chuỗi nhạy cảm theo ngôn ngữ do bộ định dạng `DurationFormat` tạo ra bằng cách cung cấp chuỗi theo từng phần:

```js
const duration = {
  hours: 7,
  minutes: 8,
  seconds: 9,
  milliseconds: 123,
  microseconds: 456,
  nanoseconds: 789,
};

new Intl.DurationFormat("en", { style: "long" }).formatToParts(duration);

// Returned value:
[
  { type: "integer", value: "7", unit: "hour" },
  { type: "literal", value: " ", unit: "hour" },
  { type: "unit", value: "hours", unit: "hour" },
  { type: "literal", value: ", " },
  { type: "integer", value: "8", unit: "minute" },
  { type: "literal", value: " ", unit: "minute" },
  { type: "unit", value: "minutes", unit: "minute" },
  { type: "literal", value: ", " },
  { type: "integer", value: "9", unit: "second" },
  { type: "literal", value: " ", unit: "second" },
  { type: "unit", value: "seconds", unit: "second" },
  { type: "literal", value: ", " },
  { type: "integer", value: "123", unit: "millisecond" },
  { type: "literal", value: " ", unit: "millisecond" },
  { type: "unit", value: "milliseconds", unit: "millisecond" },
  { type: "literal", value: ", " },
  { type: "integer", value: "456", unit: "microsecond" },
  { type: "literal", value: " ", unit: "microsecond" },
  { type: "unit", value: "microseconds", unit: "microsecond" },
  { type: "literal", value: ", " },
  { type: "integer", value: "789", unit: "nanosecond" },
  { type: "literal", value: " ", unit: "nanosecond" },
  { type: "unit", value: "nanoseconds", unit: "nanosecond" },
];
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Intl.DurationFormat")}}
- {{jsxref("Intl/DurationFormat/format", "Intl.DurationFormat.prototype.format()")}}
- {{jsxref("Temporal.Duration")}}

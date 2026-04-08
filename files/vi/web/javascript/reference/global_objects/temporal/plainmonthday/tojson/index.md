---
title: Temporal.PlainMonthDay.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một chuỗi đại diện cho tháng-ngày này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainMonthDay/toString", "toString()")}}. Nó được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho tháng-ngày đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay#rfc_9557_format), với năm và chú thích lịch được bao gồm nếu nó không phải `"iso8601"`.

## Mô tả

Phương thức `toJSON()` được tự động gọi bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Temporal.PlainMonthDay` được chuyển thành chuỗi. Phương thức này thường được thiết kế để, theo mặc định, tuần tự hóa hữu ích các đối tượng `Temporal.PlainMonthDay` trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), sau đó có thể được giải tuần tự hóa bằng hàm {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}} là reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const md = Temporal.PlainMonthDay.from({ month: 8, day: 1 });
const mdStr = md.toJSON(); // '08-01'
const md2 = Temporal.PlainMonthDay.from(mdStr);
```

### Tuần tự hóa và phân tích cú pháp JSON

Ví dụ này cho thấy cách `Temporal.PlainMonthDay` có thể được tuần tự hóa dưới dạng JSON mà không cần thêm nỗ lực, và cách phân tích cú pháp lại.

```js
const md = Temporal.PlainMonthDay.from({ month: 8, day: 1 });
const jsonStr = JSON.stringify({ birthday: md }); // '{"birthday":"08-01"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "birthday") {
    return Temporal.PlainMonthDay.from(value);
  }
  return value;
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}
- {{jsxref("Temporal/PlainMonthDay/toString", "Temporal.PlainMonthDay.prototype.toString()")}}
- {{jsxref("Temporal/PlainMonthDay/toLocaleString", "Temporal.PlainMonthDay.prototype.toLocaleString()")}}

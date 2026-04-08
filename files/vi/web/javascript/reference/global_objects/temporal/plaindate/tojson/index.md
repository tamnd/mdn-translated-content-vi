---
title: Temporal.PlainDate.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một chuỗi biểu diễn ngày này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainDate/toString", "toString()")}}. Phương thức này được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn ngày đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#rfc_9557_format), có bao gồm annotation lịch nếu lịch không phải là `"iso8601"`.

## Mô tả

Phương thức `toJSON()` được tự động gọi bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Temporal.PlainDate` được chuyển thành chuỗi. Phương thức này được thiết kế để, theo mặc định, tuần tự hóa các đối tượng `Temporal.PlainDate` một cách hữu ích trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), sau đó có thể được giải tuần tự hóa bằng hàm {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}} làm reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const date = Temporal.PlainDate.from({ year: 2021, month: 8, day: 1 });
const dateStr = date.toJSON(); // '2021-08-01'
const d2 = Temporal.PlainDate.from(dateStr);
```

### Tuần tự hóa và phân tích cú pháp JSON

Ví dụ này cho thấy cách `Temporal.PlainDate` có thể được tuần tự hóa dưới dạng JSON mà không cần nỗ lực thêm, và cách phân tích cú pháp lại.

```js
const date = Temporal.PlainDate.from({ year: 2021, month: 8, day: 1 });
const jsonStr = JSON.stringify({ date }); // '{"date":"2021-08-01"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "date") {
    return Temporal.PlainDate.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}
- {{jsxref("Temporal/PlainDate/toString", "Temporal.PlainDate.prototype.toString()")}}
- {{jsxref("Temporal/PlainDate/toLocaleString", "Temporal.PlainDate.prototype.toLocaleString()")}}

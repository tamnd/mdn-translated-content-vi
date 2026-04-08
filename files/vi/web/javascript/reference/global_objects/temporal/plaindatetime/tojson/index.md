---
title: Temporal.PlainDateTime.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một chuỗi đại diện cho ngày-giờ này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainDateTime/toString", "toString()")}}. Phương thức này được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho ngày-giờ đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format), với annotation lịch được bao gồm nếu nó không phải là `"iso8601"`.

## Mô tả

Phương thức `toJSON()` được tự động gọi bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Temporal.PlainDateTime` được chuyển thành chuỗi. Phương thức này nhìn chung được thiết kế để, theo mặc định, serialize các đối tượng `Temporal.PlainDateTime` một cách hữu ích trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), sau đó có thể được deserialized bằng hàm {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}} làm reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const dt = Temporal.PlainDateTime.from({ year: 2021, month: 8, day: 1 });
const dtStr = dt.toJSON(); // '2021-08-01T00:00:00'
const dt2 = Temporal.PlainDateTime.from(dtStr);
```

### Tuần tự hóa và phân tích JSON

Ví dụ này cho thấy cách `Temporal.PlainDateTime` có thể được serialize dưới dạng JSON mà không cần thêm công sức, và cách phân tích lại nó.

```js
const dt = Temporal.PlainDateTime.from({ year: 2021, month: 8, day: 1 });
const jsonStr = JSON.stringify({ nextBilling: dt }); // '{"nextBilling":"2021-08-01T00:00:00"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "nextBilling") {
    return Temporal.PlainDateTime.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
- {{jsxref("Temporal/PlainDateTime/toString", "Temporal.PlainDateTime.prototype.toString()")}}
- {{jsxref("Temporal/PlainDateTime/toLocaleString", "Temporal.PlainDateTime.prototype.toLocaleString()")}}

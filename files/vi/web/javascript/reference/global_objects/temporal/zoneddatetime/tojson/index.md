---
title: Temporal.ZonedDateTime.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một chuỗi biểu thị ngày-giờ này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format) như khi gọi {{jsxref("Temporal/ZonedDateTime/toString", "toString()")}}. Nó được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu thị ngày-giờ đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#rfc_9557_format), với annotation lịch được bao gồm nếu nó không phải là `"iso8601"`, và offset cùng annotation múi giờ luôn được bao gồm.

## Mô tả

Phương thức `toJSON()` được gọi tự động bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Temporal.ZonedDateTime` được chuyển thành chuỗi. Phương thức này thường được thiết kế để, theo mặc định, tuần tự hóa hữu ích các đối tượng `Temporal.ZonedDateTime` trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), sau đó có thể được giải tuần tự hóa bằng hàm {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}} làm reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const zdt = Temporal.ZonedDateTime.from({
  year: 2021,
  month: 8,
  day: 1,
  timeZone: "America/New_York",
});
const zdtStr = zdt.toJSON(); // '2021-08-01T00:00:00-04:00[America/New_York]'
const zdt2 = Temporal.ZonedDateTime.from(zdtStr);
```

### Tuần tự hóa và phân tích JSON

Ví dụ này cho thấy cách `Temporal.ZonedDateTime` có thể được tuần tự hóa dưới dạng JSON mà không cần nỗ lực thêm, và cách phân tích lại nó.

```js
const zdt = Temporal.ZonedDateTime.from({
  year: 2021,
  month: 8,
  day: 1,
  timeZone: "America/New_York",
});
const jsonStr = JSON.stringify({ meeting: zdt }); // '{"meeting":"2021-08-01T00:00:00-04:00[America/New_York]"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "meeting") {
    return Temporal.ZonedDateTime.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/from", "Temporal.ZonedDateTime.from()")}}
- {{jsxref("Temporal/ZonedDateTime/toString", "Temporal.ZonedDateTime.prototype.toString()")}}
- {{jsxref("Temporal/ZonedDateTime/toLocaleString", "Temporal.ZonedDateTime.prototype.toLocaleString()")}}

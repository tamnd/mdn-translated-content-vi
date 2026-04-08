---
title: Temporal.Duration.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Duration/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Duration.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các instance {{jsxref("Temporal.Duration")}} trả về một chuỗi đại diện cho duration này theo cùng [định dạng ISO 8601](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#iso_8601_duration_format) như khi gọi {{jsxref("Temporal/Duration/toString", "toString()")}}. Nó được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho duration đã cho theo [định dạng ISO 8601](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#iso_8601_duration_format), với độ chính xác dưới giây đủ để biểu diễn duration một cách chính xác.

## Mô tả

Phương thức `toJSON()` được tự động gọi bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Temporal.Duration` được chuyển thành chuỗi. Phương thức này thường có mục đích, theo mặc định, tuần tự hóa các đối tượng `Temporal.Duration` một cách hữu ích trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), và sau đó có thể được giải tuần tự hóa bằng cách sử dụng hàm {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}} làm reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const duration = Temporal.Duration.from({ hours: 1, minutes: 30, seconds: 15 });
const durationStr = duration.toJSON(); // 'PT1H30M15S'
const d2 = Temporal.Duration.from(durationStr);
```

### Tuần tự hóa và phân tích cú pháp JSON

Ví dụ này cho thấy cách `Temporal.Duration` có thể được tuần tự hóa dưới dạng JSON mà không cần nỗ lực bổ sung, và cách phân tích cú pháp trở lại.

```js
const duration = Temporal.Duration.from({ hours: 1, minutes: 30, seconds: 15 });
const jsonStr = JSON.stringify({ data: duration }); // '{"data":"PT1H30M15S"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "data") {
    return Temporal.Duration.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}
- {{jsxref("Temporal/Duration/toString", "Temporal.Duration.prototype.toString()")}}
- {{jsxref("Temporal/Duration/toLocaleString", "Temporal.Duration.prototype.toLocaleString()")}}

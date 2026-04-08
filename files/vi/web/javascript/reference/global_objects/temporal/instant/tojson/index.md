---
title: Temporal.Instant.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các instance {{jsxref("Temporal.Instant")}} trả về một chuỗi biểu diễn instant này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant#rfc_9557_format) như khi gọi {{jsxref("Temporal/Instant/toString", "toString()")}}. Nó được thiết kế để được gọi ngầm định bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi biểu diễn instant đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant#rfc_9557_format), với độ chính xác dưới giây cần thiết để biểu diễn duration một cách chính xác, và với chỉ định múi giờ UTC `Z`.

## Mô tả

Phương thức `toJSON()` được tự động gọi bởi {{jsxref("JSON.stringify()")}} khi một đối tượng `Temporal.Instant` được chuyển thành chuỗi. Phương thức này nhìn chung được thiết kế để, theo mặc định, tuần tự hóa các đối tượng `Temporal.Instant` một cách hữu ích trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), sau đó có thể được giải tuần tự hóa bằng hàm {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}} như reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1627821296000);
const instantStr = instant.toJSON(); // '2021-08-01T12:34:56Z'
const i2 = Temporal.Instant.from(instantStr);
```

### Tuần tự hóa và phân tích cú pháp JSON

Ví dụ này cho thấy cách `Temporal.Instant` có thể được tuần tự hóa dưới dạng JSON mà không cần thêm công sức, và cách phân tích cú pháp lại.

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1627821296000);
const jsonStr = JSON.stringify({ time: instant }); // '{"time":"2021-08-01T12:34:56Z"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "time") {
    return Temporal.Instant.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal/Instant/from", "Temporal.Instant.from()")}}
- {{jsxref("Temporal/Instant/toString", "Temporal.Instant.prototype.toString()")}}
- {{jsxref("Temporal/Instant/toLocaleString", "Temporal.Instant.prototype.toLocaleString()")}}

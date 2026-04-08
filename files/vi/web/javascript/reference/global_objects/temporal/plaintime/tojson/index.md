---
title: Temporal.PlainTime.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một chuỗi đại diện cho thời gian này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainTime/toString", "toString()")}}. Phương thức này được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho thời gian đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime#rfc_9557_format).

## Mô tả

Phương thức `toJSON()` được {{jsxref("JSON.stringify()")}} tự động gọi khi một đối tượng `Temporal.PlainTime` được chuyển thành chuỗi. Phương thức này thường được thiết kế để tuần tự hóa các đối tượng `Temporal.PlainTime` một cách hữu ích theo mặc định trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), và sau đó có thể được giải tuần tự hóa bằng hàm {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}} làm reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const time = Temporal.PlainTime.from({ hour: 12, minute: 34, second: 56 });
const timeStr = time.toJSON(); // '12:34:56'
const t2 = Temporal.PlainTime.from(timeStr);
```

### Tuần tự hóa và phân tích JSON

Ví dụ này cho thấy cách `Temporal.PlainTime` có thể được tuần tự hóa thành JSON mà không cần thêm nỗ lực, và cách phân tích ngược lại.

```js
const time = Temporal.PlainTime.from({ hour: 12, minute: 34, second: 56 });
const jsonStr = JSON.stringify({ time }); // '{"time":"12:34:56"}'
const obj = JSON.parse(jsonStr, (key, value) => {
  if (key === "time") {
    return Temporal.PlainTime.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}
- {{jsxref("Temporal/PlainTime/toString", "Temporal.PlainTime.prototype.toString()")}}
- {{jsxref("Temporal/PlainTime/toLocaleString", "Temporal.PlainTime.prototype.toLocaleString()")}}

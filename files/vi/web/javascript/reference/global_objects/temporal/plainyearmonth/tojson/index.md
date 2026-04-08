---
title: Temporal.PlainYearMonth.prototype.toJSON()
short-title: toJSON()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/toJSON
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.toJSON
sidebar: jsref
---

Phương thức **`toJSON()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một chuỗi đại diện cho năm-tháng này theo cùng [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth#rfc_9557_format) như khi gọi {{jsxref("Temporal/PlainYearMonth/toString", "toString()")}}. Phương thức này được thiết kế để được gọi ngầm bởi {{jsxref("JSON.stringify()")}}.

## Cú pháp

```js-nolint
toJSON()
```

### Tham số

Không có.

### Giá trị trả về

Một chuỗi đại diện cho ngày đã cho theo [định dạng RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth#rfc_9557_format), bao gồm chú thích lịch nếu lịch không phải là `"iso8601"`.

## Mô tả

Phương thức `toJSON()` được {{jsxref("JSON.stringify()")}} tự động gọi khi một đối tượng `Temporal.PlainYearMonth` được chuyển thành chuỗi. Phương thức này thường được thiết kế để tuần tự hóa các đối tượng `Temporal.PlainYearMonth` một cách hữu ích theo mặc định trong quá trình tuần tự hóa [JSON](/en-US/docs/Glossary/JSON), và sau đó có thể được giải tuần tự hóa bằng hàm {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}} làm reviver của {{jsxref("JSON.parse()")}}.

## Ví dụ

### Sử dụng toJSON()

```js
const ym = Temporal.PlainYearMonth.from({ year: 2021, month: 8 });
const ymStr = ym.toJSON(); // '2021-08'
const ym2 = Temporal.PlainYearMonth.from(ymStr);
```

### Tuần tự hóa và phân tích JSON

Ví dụ này cho thấy cách `Temporal.PlainYearMonth` có thể được tuần tự hóa thành JSON mà không cần thêm nỗ lực, và cách phân tích ngược lại.

```js
const ym = Temporal.PlainYearMonth.from({ year: 2021, month: 8 });
const ymStr = JSON.stringify({ event: ym }); // '{"event":"2021-08"}'
const obj = JSON.parse(ymStr, (key, value) => {
  if (key === "event") {
    return Temporal.PlainYearMonth.from(value);
  }
  return value;
});
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}
- {{jsxref("Temporal/PlainYearMonth/toString", "Temporal.PlainYearMonth.prototype.toString()")}}
- {{jsxref("Temporal/PlainYearMonth/toLocaleString", "Temporal.PlainYearMonth.prototype.toLocaleString()")}}

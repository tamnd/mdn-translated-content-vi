---
title: Temporal.ZonedDateTime.prototype.toPlainDateTime()
short-title: toPlainDateTime()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/toPlainDateTime
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.toPlainDateTime
sidebar: jsref
---

Phương thức **`toPlainDateTime()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng {{jsxref("Temporal.PlainDateTime")}} mới biểu thị phần ngày và giờ của ngày-giờ này. Chỉ thông tin múi giờ bị xóa.

> [!WARNING]
> Sau khi `Temporal.ZonedDateTime` được chuyển đổi sang `Temporal.PlainDateTime`, nó không còn nhận biết múi giờ nữa. Các hoạt động tiếp theo như số học hoặc các hoạt động `with()` sẽ không điều chỉnh theo DST và có thể không cho ra kết quả tương tự như các hoạt động tương đương với `Temporal.ZonedDateTime` ban đầu. Tuy nhiên, trừ khi bạn thực hiện các hoạt động đó qua quá trình chuyển đổi offset múi giờ, bạn không thể nhận ra sự khác biệt. Do đó, hãy rất cẩn thận khi thực hiện chuyển đổi này vì các kết quả tiếp theo có thể đúng hầu hết thời gian, nhưng chỉ hóa ra không đúng khi di chuyển qua các chuyển đổi offset như khi DST bắt đầu hoặc kết thúc.

## Cú pháp

```js-nolint
toPlainDateTime()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.PlainDateTime")}} mới biểu thị phần ngày và giờ của ngày-giờ này.

## Ví dụ

### Sử dụng toPlainDateTime()

```js
const zdt = Temporal.ZonedDateTime.from(
  "2021-07-01T12:34:56.987654321-04:00[America/New_York]",
);
const plainDateTime = zdt.toPlainDateTime();
console.log(plainDateTime.toString()); // 2021-07-01T12:34:56.987654321
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainDate", "Temporal.ZonedDateTime.prototype.toPlainDate()")}}
- {{jsxref("Temporal/ZonedDateTime/toPlainTime", "Temporal.ZonedDateTime.prototype.toPlainTime()")}}
- {{jsxref("Temporal/ZonedDateTime/toInstant", "Temporal.ZonedDateTime.prototype.toInstant()")}}
- {{jsxref("Temporal/PlainDateTime/toZonedDateTime", "Temporal.PlainDateTime.prototype.toZonedDateTime()")}}

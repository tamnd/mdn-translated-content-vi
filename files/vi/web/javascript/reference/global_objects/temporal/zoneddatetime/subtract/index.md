---
title: Temporal.ZonedDateTime.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.ZonedDateTime.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các thực thể {{jsxref("Temporal.ZonedDateTime")}} trả về một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ này được dịch lùi theo một khoảng thời gian đã cho (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

Nếu bạn muốn trừ hai ngày-giờ và lấy một khoảng thời gian, hãy sử dụng {{jsxref("Temporal/ZonedDateTime/since", "since()")}} hoặc {{jsxref("Temporal/ZonedDateTime/until", "until()")}} thay thế.

## Cú pháp

```js-nolint
subtract(duration)
subtract(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.Duration")}} biểu thị khoảng thời gian cần trừ khỏi ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày bị [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.ZonedDateTime` mới biểu thị ngày-giờ được chỉ định bởi `ZonedDateTime` ban đầu, trừ đi khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu kết quả không nằm trong [phạm vi có thể biểu thị](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hoặc khoảng ±273,972.6 năm, từ Unix epoch.

## Mô tả

Trừ một khoảng thời gian tương đương với [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime/add) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó, vì vậy tất cả các cân nhắc tương tự đều áp dụng.

## Ví dụ

### Trừ một khoảng thời gian

```js
const start = Temporal.ZonedDateTime.from(
  "2021-01-01T12:34:56-05:00[America/New_York]",
);
const end = start.subtract({
  years: 1,
  months: 2,
  weeks: 3,
  days: 4,
  hours: 5,
  minutes: 6,
  seconds: 7,
  milliseconds: 8,
});
console.log(end.toString()); // 2019-10-07T07:28:48.992-04:00[America/New_York]
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.ZonedDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/ZonedDateTime/add", "Temporal.ZonedDateTime.prototype.add()")}}
- {{jsxref("Temporal/ZonedDateTime/since", "Temporal.ZonedDateTime.prototype.since()")}}
- {{jsxref("Temporal/ZonedDateTime/until", "Temporal.ZonedDateTime.prototype.until()")}}

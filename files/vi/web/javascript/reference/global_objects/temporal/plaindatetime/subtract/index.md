---
title: Temporal.PlainDateTime.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này dịch chuyển về phía trước theo một khoảng thời gian cho trước (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

Nếu bạn muốn trừ hai ngày-giờ và nhận về một duration, hãy sử dụng {{jsxref("Temporal/PlainDateTime/since", "since()")}} hoặc {{jsxref("Temporal/PlainDateTime/until", "until()")}} thay thế.

## Cú pháp

```js-nolint
subtract(duration)
subtract(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.Duration")}} đại diện cho một khoảng thời gian cần trừ khỏi ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng thuật toán tương tự như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày vượt ra ngoài phạm vi hợp lệ. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày vượt ra ngoài phạm vi hợp lệ.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ được chỉ định bởi `PlainDateTime` gốc, trừ đi khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), tức là ±(10<sup>8</sup> + 1) ngày, hay khoảng ±273.972,6 năm, tính từ Unix epoch.

## Mô tả

Trừ một duration tương đương với việc [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/add) [số âm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó, vì vậy tất cả các lưu ý tương tự đều áp dụng.

## Ví dụ

### Trừ một duration

```js
const start = Temporal.PlainDateTime.from("2022-01-01T12:34:56");
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
console.log(end.toString()); // 2020-10-07T07:28:48.992
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/since", "Temporal.PlainDateTime.prototype.since()")}}
- {{jsxref("Temporal/PlainDateTime/until", "Temporal.PlainDateTime.prototype.until()")}}

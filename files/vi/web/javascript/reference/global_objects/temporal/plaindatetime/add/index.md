---
title: Temporal.PlainDateTime.prototype.add()
short-title: add()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/add
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.add
sidebar: jsref
---

Phương thức **`add()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này tiến về phía trước một khoảng thời gian cho trước (theo dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

## Cú pháp

```js-nolint
add(duration)
add(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một instance {{jsxref("Temporal.Duration")}} đại diện cho khoảng thời gian cần thêm vào ngày-giờ này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` sử dụng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ được chỉ định bởi `PlainDateTime` gốc, cộng với khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, khoảng ±273.972,6 năm, tính từ Unix epoch.

## Mô tả

Để biết cách [khoảng thời gian theo lịch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) được cộng, xem {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}.

Cộng một khoảng thời gian tương đương với việc [trừ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/subtract) [phần âm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó.

## Ví dụ

### Cộng một khoảng thời gian

```js
const start = Temporal.PlainDateTime.from("2021-01-01T12:34:56");
const end = start.add({
  years: 1,
  months: 2,
  weeks: 3,
  days: 4,
  hours: 5,
  minutes: 6,
  seconds: 7,
  milliseconds: 8,
});
console.log(end.toString()); // 2022-03-26T17:41:03.008
```

Để xem thêm ví dụ, đặc biệt về cách các lịch khác nhau và tùy chọn `overflow` tương tác với khoảng thời gian theo lịch, xem {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}

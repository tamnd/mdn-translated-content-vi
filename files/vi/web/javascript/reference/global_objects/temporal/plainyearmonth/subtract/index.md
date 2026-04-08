---
title: Temporal.PlainYearMonth.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các thực thể {{jsxref("Temporal.PlainYearMonth")}} trả về một đối tượng `Temporal.PlainYearMonth` mới đại diện cho năm-tháng này dịch chuyển về phía trước một khoảng thời gian nhất định (dưới dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

Nếu bạn muốn trừ hai năm-tháng và nhận được một khoảng thời gian, hãy dùng {{jsxref("Temporal/PlainYearMonth/since", "since()")}} hoặc {{jsxref("Temporal/PlainYearMonth/until", "until()")}} thay thế.

## Cú pháp

```js-nolint
subtract(duration)
subtract(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc một thực thể {{jsxref("Temporal.Duration")}} đại diện cho khoảng thời gian cần trừ khỏi năm-tháng này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainYearMonth` mới đại diện cho năm-tháng được chỉ định bởi `PlainYearMonth` gốc, trừ đi khoảng thời gian.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), tức là ±(10<sup>8</sup> + 1) ngày, khoảng ±273.972,6 năm, so với Unix epoch.

## Mô tả

Trừ một khoảng thời gian tương đương với [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/add) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó, do đó tất cả các cân nhắc tương tự đều áp dụng. Trừ một khoảng thời gian dương bắt đầu từ cuối năm-tháng và dịch chuyển về phía trước, vì vậy bất kỳ đơn vị nào nhỏ hơn độ dài của tháng đều bị bỏ qua.

## Ví dụ

### Trừ một khoảng thời gian

```js
const start = Temporal.PlainYearMonth.from("2022-01");
const end = start.subtract({ years: 1, months: 2, weeks: 3, days: 4 });
console.log(end.toString()); // 2020-11
```

Để xem thêm ví dụ, hãy xem {{jsxref("Temporal/PlainYearMonth/add", "add()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainYearMonth/add", "Temporal.PlainYearMonth.prototype.add()")}}
- {{jsxref("Temporal/PlainYearMonth/since", "Temporal.PlainYearMonth.prototype.since()")}}
- {{jsxref("Temporal/PlainYearMonth/until", "Temporal.PlainYearMonth.prototype.until()")}}

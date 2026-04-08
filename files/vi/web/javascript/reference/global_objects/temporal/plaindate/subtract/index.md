---
title: Temporal.PlainDate.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng `Temporal.PlainDate` mới biểu diễn ngày này được lùi lại theo một khoảng thời gian nhất định (ở dạng có thể chuyển đổi bởi {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

Nếu bạn muốn trừ hai ngày và lấy khoảng thời gian, hãy sử dụng {{jsxref("Temporal/PlainDate/since", "since()")}} hoặc {{jsxref("Temporal/PlainDate/until", "until()")}} thay thế.

## Cú pháp

```js-nolint
subtract(duration)
subtract(duration, options)
```

### Tham số

- `duration`
  - : Một chuỗi, đối tượng, hoặc instance {{jsxref("Temporal.Duration")}} biểu diễn khoảng thời gian cần trừ từ ngày này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới biểu diễn ngày được xác định bởi `PlainDate` gốc, trừ đi khoảng thời gian.

## Mô tả

Trừ một khoảng thời gian tương đương với việc [thêm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/add) [phủ định](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó, vì vậy tất cả các lưu ý tương tự đều áp dụng.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra nếu kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, tức khoảng ±273.972,6 năm, từ Unix epoch.

## Ví dụ

### Trừ một khoảng thời gian

```js
const start = Temporal.PlainDate.from("2022-01-01");
const end = start.subtract({ years: 1, months: 2, weeks: 3, days: 4 });
console.log(end.toString()); // 2020-10-07
```

Xem thêm các ví dụ trong {{jsxref("Temporal/PlainDate/add", "add()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/since", "Temporal.PlainDate.prototype.since()")}}
- {{jsxref("Temporal/PlainDate/until", "Temporal.PlainDate.prototype.until()")}}

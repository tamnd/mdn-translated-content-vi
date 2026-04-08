---
title: Temporal.PlainYearMonth.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainYearMonth/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainYearMonth.with
sidebar: jsref
---

Phương thức **`with()`** của các instance {{jsxref("Temporal.PlainYearMonth")}} trả về một đối tượng `Temporal.PlainYearMonth` mới biểu diễn năm-tháng này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về bản chất hoạt động như setter cho các trường của năm-tháng.

Không có cách hiển nhiên nào để tạo một đối tượng `Temporal.PlainYearMonth` mới biểu diễn cùng năm-tháng trong một calendar khác, vì vậy để thay thế thuộc tính `calendarId` của nó, bạn cần chuyển đổi nó thành đối tượng {{jsxref("Temporal.PlainDate")}} trước bằng {{jsxref("Temporal/PlainYearMonth/toPlainDate", "toPlainDate()")}}, thay đổi calendar, rồi chuyển đổi lại.

## Cú pháp

```js-nolint
with(info)
with(info, options)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận dạng bởi {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}} (ngoại trừ `calendar`): `era` và `eraYear`, `month`, `monthCode`, `year`. Các thuộc tính không được chỉ định sẽ sử dụng các giá trị từ năm-tháng gốc. Bạn chỉ cần cung cấp một trong `month` hoặc `monthCode`, và một trong `era` và `eraYear` hoặc `year`, và giá trị kia sẽ được cập nhật tương ứng.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [cắt bớt](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) về phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainYearMonth` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại của các trường được sao chép từ ngày gốc.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là một đối tượng.
    - `options` không phải là một đối tượng hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng một thành phần nhưng mâu thuẫn nhau.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là một mã tháng hợp lệ trong calendar này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.
    - Kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), tức là ±(10<sup>8</sup> + 1) ngày, hoặc khoảng ±273.972,6 năm, tính từ Unix epoch.

## Ví dụ

### Sử dụng with()

```js
const ym = Temporal.PlainYearMonth.from("2021-07");
const newYM = ym.with({ year: 2024 });
console.log(newYM.toString()); // "2024-07"
```

Để xem thêm ví dụ, hãy xem tài liệu về các thuộc tính riêng lẻ có thể được đặt bằng `with()`.

## Đặc tả kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainYearMonth")}}
- {{jsxref("Temporal/PlainYearMonth/from", "Temporal.PlainYearMonth.from()")}}

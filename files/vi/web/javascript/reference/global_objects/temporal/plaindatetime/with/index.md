---
title: Temporal.PlainDateTime.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.with
sidebar: jsref
---

Phương thức **`with()`** của các instance {{jsxref("Temporal.PlainDateTime")}} trả về một đối tượng `Temporal.PlainDateTime` mới đại diện cho ngày-giờ này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế là bất biến (immutable), phương thức này về cơ bản hoạt động như setter cho các trường của ngày-giờ.

Để thay thế thuộc tính {{jsxref("Temporal/PlainDateTime/calendarId", "calendarId")}}, hãy dùng phương thức {{jsxref("Temporal/PlainDateTime/withCalendar", "withCalendar()")}} thay thế.

## Cú pháp

```js-nolint
with(info)
with(info, options)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận dạng bởi {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}} (ngoại trừ `calendar`): `day`, `era` và `eraYear`, `hour`, `microsecond`, `millisecond`, `minute`, `month`, `monthCode`, `nanosecond`, `second`, `year`. Các thuộc tính không được chỉ định sẽ sử dụng giá trị từ ngày-giờ gốc. Bạn chỉ cần cung cấp một trong `month` hoặc `monthCode`, và một trong `era` và `eraYear` hoặc `year`, và giá trị còn lại sẽ được cập nhật tương ứng.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại được sao chép từ ngày-giờ gốc.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là một đối tượng.
    - `options` không phải là một đối tượng hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Các thuộc tính cung cấp chỉ định cùng một thành phần nhưng không nhất quán.
    - Các thuộc tính phi số cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số cung cấp nằm ngoài phạm vi và `options.overflow` được đặt thành `"reject"`.
    - Kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, khoảng ±273.972,6 năm, tính từ Unix epoch.

## Ví dụ

### Sử dụng with()

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56");
const newDT = dt.with({ hour: 13 });
console.log(newDT.toString()); // "2021-07-01T13:34:56"
const newDT2 = dt.with({ month: 2, day: 22, millisecond: 222 });
console.log(newDT2.toString()); // "2021-02-22T13:34:56.222"
const nextDecade = dt.with({ year: dt.year + 10 });
console.log(nextDecade.toString()); // "2031-07-01T13:34:56"
```

Để xem thêm ví dụ, xem tài liệu cho từng thuộc tính có thể được đặt bằng `with()`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/withCalendar", "Temporal.PlainDateTime.prototype.withCalendar()")}}
- {{jsxref("Temporal/PlainDateTime/withPlainTime", "Temporal.PlainDateTime.prototype.withPlainTime()")}}
- {{jsxref("Temporal/PlainDateTime/from", "Temporal.PlainDateTime.from()")}}
- {{jsxref("Temporal/PlainDateTime/add", "Temporal.PlainDateTime.prototype.add()")}}
- {{jsxref("Temporal/PlainDateTime/subtract", "Temporal.PlainDateTime.prototype.subtract()")}}

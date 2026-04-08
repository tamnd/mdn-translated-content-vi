---
title: Temporal.PlainDate.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainDate.with
sidebar: jsref
---

Phương thức **`with()`** của các instance {{jsxref("Temporal.PlainDate")}} trả về một đối tượng `Temporal.PlainDate` mới đại diện cho ngày này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho các trường của ngày.

Để thay thế thuộc tính {{jsxref("Temporal/PlainDate/calendarId", "calendarId")}}, hãy sử dụng phương thức {{jsxref("Temporal/PlainDate/withCalendar", "withCalendar()")}} thay thế.

## Cú pháp

```js-nolint
with(info)
with(info, options)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận diện bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}} (ngoại trừ `calendar`): `day`, `era` và `eraYear`, `month`, `monthCode`, `year`. Các thuộc tính không được chỉ định sử dụng giá trị từ ngày gốc. Bạn chỉ cần cung cấp một trong `month` hoặc `monthCode`, và một trong `era` và `eraYear` hoặc `year`, và giá trị còn lại sẽ được cập nhật tương ứng.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDate` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại của các trường được sao chép từ ngày gốc.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng.
    - `options` không phải là đối tượng hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng một thành phần nhưng không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.
    - Kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, tức khoảng ±273.972,6 năm, từ Unix epoch.

## Ví dụ

### Sử dụng with()

```js
const date = Temporal.PlainDate.from("2021-07-06");
const newDate = date.with({ day: date.daysInMonth });
console.log(newDate.toString()); // 2021-07-31
const nextDecade = date.with({ year: date.year + 10 });
console.log(nextDecade.toString()); // 2031-07-06
```

Xem thêm ví dụ trong tài liệu của từng thuộc tính có thể được đặt bằng `with()`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal/PlainDate/withCalendar", "Temporal.PlainDate.prototype.withCalendar()")}}
- {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}}
- {{jsxref("Temporal/PlainDate/add", "Temporal.PlainDate.prototype.add()")}}
- {{jsxref("Temporal/PlainDate/subtract", "Temporal.PlainDate.prototype.subtract()")}}

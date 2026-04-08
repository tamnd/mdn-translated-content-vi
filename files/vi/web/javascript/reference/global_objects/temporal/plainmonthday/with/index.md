---
title: Temporal.PlainMonthDay.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainMonthDay/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainMonthDay.with
sidebar: jsref
---

Phương thức **`with()`** của các instance {{jsxref("Temporal.PlainMonthDay")}} trả về một đối tượng `Temporal.PlainMonthDay` mới đại diện cho tháng-ngày này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho các trường của tháng-ngày.

Không có cách rõ ràng để tạo một đối tượng `Temporal.PlainMonthDay` mới đại diện cho cùng tháng-ngày trong một lịch khác, vì vậy để thay thế thuộc tính `calendarId` của nó, bạn cần chuyển đổi nó sang đối tượng {{jsxref("Temporal.PlainDate")}} bằng {{jsxref("Temporal/PlainMonthDay/toPlainDate", "toPlainDate()")}}, thay đổi lịch, rồi chuyển đổi ngược lại.

## Cú pháp

```js-nolint
with(info)
with(info, options)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận dạng bởi {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}} (ngoại trừ `calendar`): `day`, `era` và `eraYear`, `month`, `monthCode`, `year`. Các thuộc tính không được chỉ định sử dụng các giá trị từ tháng-ngày gốc. Bạn cần cung cấp năm nếu và chỉ nếu bạn cung cấp `month` và lịch không phải `iso8601`. Bạn chỉ cần cung cấp một trong `month` hoặc `monthCode`, và một trong `era` và `eraYear` hoặc `year`, và giá trị kia sẽ được cập nhật tương ứng.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainMonthDay` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại của các trường được sao chép từ ngày gốc.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - `info` không phải là đối tượng.
    - `options` không phải là đối tượng hay `undefined`.
- {{jsxref("RangeError")}}
  - : Được ném trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng một thành phần nhưng không nhất quán.
    - Các thuộc tính không phải số được cung cấp không hợp lệ; ví dụ, nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.
    - Nếu năm được cung cấp, lịch không phải `iso8601`, và năm không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates) hoặc năm, từ `-271821` đến `275760`.

## Ví dụ

### Sử dụng with()

```js
const md = Temporal.PlainMonthDay.from("07-01");
const newMd = md.with({ day: 2 });
console.log(newMd.toString()); // "07-02"
```

Để biết thêm ví dụ, xem tài liệu cho các thuộc tính riêng lẻ có thể được đặt bằng `with()`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tính tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainMonthDay")}}
- {{jsxref("Temporal/PlainMonthDay/from", "Temporal.PlainMonthDay.from()")}}

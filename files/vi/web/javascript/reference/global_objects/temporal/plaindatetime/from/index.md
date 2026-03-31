---
title: Temporal.PlainDateTime.from()
short-title: from()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime/from
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.PlainDateTime.from
sidebar: jsref
---

Phương thức tĩnh **`Temporal.PlainDateTime.from()`** tạo một đối tượng `Temporal.PlainDateTime` mới từ một đối tượng `Temporal.PlainDateTime` khác, một đối tượng có thuộc tính ngày và thời gian, hoặc một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format).

## Cú pháp

```js-nolint
Temporal.PlainDateTime.from(info)
Temporal.PlainDateTime.from(info, options)
```

### Tham số

- `info`
  - : Một trong các giá trị sau:
    - Một instance {{jsxref("Temporal.PlainDateTime")}}, tạo ra một bản sao của instance đó.
    - Một chuỗi [RFC 9557](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDateTime#rfc_9557_format) chứa một ngày, tùy chọn một thời gian, và tùy chọn một lịch.
    - Một đối tượng chứa các thuộc tính được nhận dạng bởi {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}} (`calendar`, `era`, `eraYear`, `year`, `month`, `monthCode`, `day`) hoặc {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}} (`hour`, `minute`, `second`, `millisecond`, `microsecond`, `nanosecond`). `info` phải chỉ định rõ ràng một năm (là `year` hoặc `era` và `eraYear`), một tháng (là `month` hoặc `monthCode`), và một ngày; các thuộc tính còn lại là tùy chọn và sẽ được đặt về giá trị mặc định.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần ngày nằm ngoài phạm vi (khi sử dụng đối tượng `info`). Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần ngày được [kẹp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/PlainDate#invalid_date_clamping) vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần ngày nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainDateTime` mới, đại diện cho ngày và thời gian được chỉ định bởi `info` trong `calendar` được chỉ định.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng hoặc chuỗi.
    - `options` không phải là đối tượng hoặc `undefined`.
    - Các thuộc tính được cung cấp không đủ để xác định rõ ràng một ngày. Bạn thường cần cung cấp `year` (hoặc `era` và `eraYear`), `month` (hoặc `monthCode`), và `day`.
- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - Các thuộc tính được cung cấp chỉ định cùng thành phần nhưng không nhất quán.
    - Các thuộc tính không phải là số được cung cấp không hợp lệ; ví dụ: nếu `monthCode` không bao giờ là mã tháng hợp lệ trong lịch này.
    - Các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt là `"reject"`.
    - Thông tin không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±(10<sup>8</sup> + 1) ngày, khoảng ±273.972,6 năm, tính từ Unix epoch.

## Ví dụ

### Tạo PlainDateTime từ một đối tượng

```js
// Year + month + day + hour + minute + second
const dt = Temporal.PlainDateTime.from({
  year: 2021,
  month: 7,
  day: 1,
  hour: 12,
  minute: 34,
  second: 56,
});
console.log(dt.toString()); // "2021-07-01T12:34:56"
```

### Tạo PlainDateTime từ một chuỗi

```js
const dt = Temporal.PlainDateTime.from("2021-07-01T12:34:56");
console.log(dt.toLocaleString()); // "7/1/2021, 12:34:56 PM" (assuming en-US locale)
```

Để xem thêm ví dụ, đặc biệt về các lịch khác nhau và cài đặt overflow, xem {{jsxref("Temporal/PlainDate/from", "Temporal.PlainDate.from()")}} và {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal/PlainDateTime/PlainDateTime", "Temporal.PlainDateTime()")}}
- {{jsxref("Temporal/PlainDateTime/with", "Temporal.PlainDateTime.prototype.with()")}}

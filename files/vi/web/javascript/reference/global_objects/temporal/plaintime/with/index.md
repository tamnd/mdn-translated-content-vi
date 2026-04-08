---
title: Temporal.PlainTime.prototype.with()
short-title: with()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/PlainTime/with
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.PlainTime.with
sidebar: jsref
---

Phương thức **`with()`** của các thực thể {{jsxref("Temporal.PlainTime")}} trả về một đối tượng `Temporal.PlainTime` mới đại diện cho thời gian này với một số trường được thay thế bằng các giá trị mới. Vì tất cả các đối tượng `Temporal` được thiết kế để bất biến, phương thức này về cơ bản hoạt động như setter cho các trường của thời gian.

## Cú pháp

```js-nolint
with(info)
with(info, options)
```

### Tham số

- `info`
  - : Một đối tượng chứa ít nhất một trong các thuộc tính được nhận bởi {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}: `hour`, `microsecond`, `millisecond`, `minute`, `nanosecond`, `second`. Các thuộc tính không được chỉ định sẽ sử dụng giá trị từ thời gian gốc.
- `options` {{optional_inline}}
  - : Một đối tượng chứa thuộc tính sau:
    - `overflow` {{optional_inline}}
      - : Một chuỗi chỉ định hành vi khi một thành phần thời gian nằm ngoài phạm vi. Các giá trị có thể là:
        - `"constrain"` (mặc định)
          - : Thành phần thời gian được kẹp vào phạm vi hợp lệ.
        - `"reject"`
          - : Một {{jsxref("RangeError")}} được ném ra nếu thành phần thời gian nằm ngoài phạm vi.

### Giá trị trả về

Một đối tượng `Temporal.PlainTime` mới, trong đó các trường được chỉ định trong `info` mà không phải `undefined` được thay thế bằng các giá trị tương ứng, và phần còn lại của các trường được sao chép từ thời gian gốc.

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Ném ra trong một trong các trường hợp sau:
    - `info` không phải là đối tượng có ít nhất một thuộc tính được nhận hoặc một chuỗi.
    - `options` không phải là đối tượng hoặc `undefined`.
- {{jsxref("RangeError")}}
  - : Ném ra nếu các thuộc tính số được cung cấp nằm ngoài phạm vi, và `options.overflow` được đặt thành `"reject"`.

## Ví dụ

### Sử dụng with()

```js
const time = Temporal.PlainTime.from("12:34:56.123456789");
const newTime = time.with({ hour: 23 });
console.log(newTime.toString()); // '23:34:56.123456789'
```

Để xem thêm ví dụ, hãy xem tài liệu cho từng thuộc tính có thể được đặt bằng `with()`.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal/PlainTime/from", "Temporal.PlainTime.from()")}}
- {{jsxref("Temporal/PlainTime/add", "Temporal.PlainTime.prototype.add()")}}
- {{jsxref("Temporal/PlainTime/subtract", "Temporal.PlainTime.prototype.subtract()")}}

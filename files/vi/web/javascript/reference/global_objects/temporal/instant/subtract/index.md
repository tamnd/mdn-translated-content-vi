---
title: Temporal.Instant.prototype.subtract()
short-title: subtract()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Instant/subtract
page-type: javascript-instance-method
browser-compat: javascript.builtins.Temporal.Instant.subtract
sidebar: jsref
---

Phương thức **`subtract()`** của các instance {{jsxref("Temporal.Instant")}} trả về một đối tượng `Temporal.Instant` mới biểu diễn instant này được dịch chuyển về quá khứ một khoảng thời gian đã cho (ở dạng có thể chuyển đổi bằng {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}).

Nếu bạn muốn trừ hai instant và nhận một duration, hãy sử dụng {{jsxref("Temporal/Instant/since", "since()")}} hoặc {{jsxref("Temporal/Instant/until", "until()")}} thay thế.

## Cú pháp

```js-nolint
subtract(duration)
```

### Tham số

- `duration`
  - : Một chuỗi, một đối tượng, hoặc instance {{jsxref("Temporal.Duration")}} biểu diễn một duration để trừ khỏi instant này. Nó được chuyển đổi thành đối tượng `Temporal.Duration` bằng cùng thuật toán như {{jsxref("Temporal/Duration/from", "Temporal.Duration.from()")}}.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Instant")}} mới biểu diễn việc trừ `duration` từ instant này. Nếu `duration` là dương, thì instant được trả về nằm trước instant này; nếu `duration` là âm, thì instant được trả về nằm sau instant này.

### Ngoại lệ

- {{jsxref("RangeError")}}
  - : Được ném ra trong một trong các trường hợp sau:
    - `duration` là [calendar duration](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration#calendar_durations) (có giá trị `years`, `months`, hoặc `weeks` khác không), hoặc có `days` khác không, vì calendar duration không rõ ràng khi không có lịch và tham chiếu thời gian.
    - Kết quả không nằm trong [phạm vi có thể biểu diễn](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal#representable_dates), là ±10<sup>8</sup> ngày, hay khoảng ±273.972,6 năm, tính từ Unix epoch.

## Mô tả

Trừ một duration tương đương với [cộng](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Instant/add) [phần bù âm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration/negated) của nó, do đó tất cả các cân nhắc tương tự đều áp dụng.

## Ví dụ

### Trừ một Temporal.Duration

```js
const instant = Temporal.Instant.fromEpochMilliseconds(1000);
const duration = Temporal.Duration.from("PT1S"); // Duration một giây
const newInstant = instant.subtract(duration);
console.log(newInstant.epochMilliseconds); // 0
```

Để xem thêm ví dụ, xem {{jsxref("Temporal/Instant/add", "add()")}}.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.Duration")}}
- {{jsxref("Temporal/Instant/add", "Temporal.Instant.prototype.add()")}}
- {{jsxref("Temporal/Instant/since", "Temporal.Instant.prototype.since()")}}
- {{jsxref("Temporal/Instant/until", "Temporal.Instant.prototype.until()")}}

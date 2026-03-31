---
title: Temporal.Now.instant()
short-title: instant()
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Now/instant
page-type: javascript-static-method
browser-compat: javascript.builtins.Temporal.Now.instant
sidebar: jsref
---

Phương thức tĩnh **`Temporal.Now.instant()`** trả về thời gian hiện tại như là đối tượng {{jsxref("Temporal.Instant")}}.

## Cú pháp

```js-nolint
Temporal.Now.instant()
```

### Tham số

Không có.

### Giá trị trả về

Một đối tượng {{jsxref("Temporal.Instant")}} biểu diễn thời gian hiện tại, với [độ chính xác có thể bị giảm](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Now#reduced_time_precision).

## Ví dụ

### Đo thời gian đã trôi qua

Ví dụ sau đo hai thời điểm và tính toán [khoảng thời gian](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/Duration) giữa chúng, và lấy tổng khoảng thời gian tính bằng mili giây:

```js
const start = Temporal.Now.instant();
// Do something that takes time
const end = Temporal.Now.instant();
const duration = end.since(start);
console.log(duration.total("milliseconds"));
```

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal.Now")}}
- {{jsxref("Temporal.Instant")}}

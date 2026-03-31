---
title: Date.now()
short-title: now()
slug: Web/JavaScript/Reference/Global_Objects/Date/now
page-type: javascript-static-method
browser-compat: javascript.builtins.Date.now
sidebar: jsref
---

Phương thức tĩnh **`Date.now()`** trả về số mili giây đã trôi qua kể từ [epoch](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), được định nghĩa là nửa đêm đầu ngày 1 tháng 1 năm 1970, UTC.

{{InteractiveExample("JavaScript Demo: Date.now()")}}

```js interactive-example
// This example takes 2 seconds to run
const start = Date.now();

console.log("starting timer...");
// Expected output: "starting timer..."

setTimeout(() => {
  const ms = Date.now() - start;

  console.log(`seconds elapsed = ${Math.floor(ms / 1000)}`);
  // Expected output: "seconds elapsed = 2"
}, 2000);
```

## Cú pháp

```js-nolint
Date.now()
```

### Tham số

Không có.

### Giá trị trả về

Một số đại diện cho [timestamp](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#the_epoch_timestamps_and_invalid_date), tính bằng mili giây, của thời gian hiện tại.

## Mô tả

### Độ chính xác thời gian giảm

Để bảo vệ chống lại các cuộc tấn công định thời và [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `Date.now()` có thể bị làm tròn tùy thuộc vào cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, trong trường hợp đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy thuộc vào giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian giảm, kết quả của `Date.now()` sẽ luôn là bội số của 2, hoặc bội số của 100 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi `privacy.resistFingerprinting` được bật.

```js
// độ chính xác thời gian giảm (2ms) trong Firefox 60
Date.now();
// Có thể là:
// 1519211809934
// 1519211810362
// 1519211811670
// …

// độ chính xác thời gian giảm với `privacy.resistFingerprinting` được bật
Date.now();
// Có thể là:
// 1519129853500
// 1519129858900
// 1519129864400
// …
```

## Ví dụ

### Đo thời gian đã trôi qua

Bạn có thể sử dụng `Date.now()` để lấy thời gian hiện tại tính bằng mili giây, sau đó trừ một thời gian trước đó để tìm hiểu bao nhiêu thời gian đã trôi qua giữa hai lần gọi.

```js
const start = Date.now();
doSomeLongRunningProcess();
console.log(`Time elapsed: ${Date.now() - start} ms`);
```

Đối với các tình huống phức tạp hơn, bạn có thể muốn sử dụng [performance API](/en-US/docs/Web/API/Performance_API/High_precision_timing) thay thế.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- [Polyfill của `Date.now` trong `core-js`](https://github.com/zloirock/core-js#ecmascript-date)
- {{domxref("Performance.now()")}}
- {{domxref("console/time_static", "console.time()")}}
- {{domxref("console/timeEnd_static", "console.timeEnd()")}}

---
title: Temporal.Now
slug: Web/JavaScript/Reference/Global_Objects/Temporal/Now
page-type: javascript-namespace
browser-compat: javascript.builtins.Temporal.Now
sidebar: jsref
---

Đối tượng namespace **`Temporal.Now`** chứa các phương thức tĩnh để lấy thời gian hiện tại ở nhiều định dạng khác nhau.

## Mô tả

Không giống như hầu hết các đối tượng toàn cục, `Temporal.Now` không phải là một constructor. Bạn không thể sử dụng nó với [toán tử `new`](/en-US/docs/Web/JavaScript/Reference/Operators/new) hay gọi đối tượng `Temporal.Now` như một hàm. Tất cả các thuộc tính và phương thức của `Temporal.Now` đều là static (giống như đối tượng {{jsxref("Math")}}).

Về cơ bản nhất, thời gian hệ thống được trả về bởi hệ điều hành như là thời gian kể từ epoch Unix (thường là độ chính xác mili giây, nhưng cũng có thể là nano giây). {{jsxref("Temporal/Now/instant", "Temporal.Now.instant()")}} trả về thời gian này như là một đối tượng {{jsxref("Temporal.Instant")}}.

Một instant có thể được diễn giải trong một múi giờ (là múi giờ hệ thống {{jsxref("Temporal/Now/timeZoneId", "Temporal.Now.timeZoneId()")}} theo mặc định) theo cùng cách như {{jsxref("Temporal/Instant/toZonedDateTimeISO", "Temporal.Instant.prototype.toZonedDateTimeISO()")}}. Để lấy đối tượng {{jsxref("Temporal.ZonedDateTime")}}, bạn có thể sử dụng {{jsxref("Temporal/Now/zonedDateTimeISO", "Temporal.Now.zonedDateTimeISO()")}}. Bạn cũng có thể lấy các phần khác nhau của ngày và giờ, sử dụng {{jsxref("Temporal/Now/plainDateISO", "Temporal.Now.plainDateISO()")}}, {{jsxref("Temporal/Now/plainTimeISO", "Temporal.Now.plainTimeISO()")}}, và {{jsxref("Temporal/Now/plainDateTimeISO", "Temporal.Now.plainDateTimeISO()")}}.

Ví dụ, nếu máy tính được đặt múi giờ "America/New_York", `Temporal.Now.zonedDateTimeISO()` trả về một ngày-giờ có múi giờ như: `2021-08-01T10:40:12.345-04:00[America/New_York]`. Trong trường hợp này, `Temporal.Now.plainTimeISO()` sẽ trả về phần giờ của ngày-giờ có múi giờ này: `10:40:12.345`. Tuy nhiên, nếu bạn gọi `Temporal.Now.plainTimeISO("UTC")`, nó trả về phần giờ của ngày-giờ có múi giờ trong múi giờ UTC: `14:40:12.345`. Điều này đặc biệt hữu ích cho giao tiếp giữa các hệ thống nơi phía kia có thể đang mong đợi thời gian theo múi giờ khác.

### Độ chính xác thời gian giảm

Để cung cấp bảo vệ chống lại các cuộc tấn công theo thời gian và [lấy dấu vân tay](/en-US/docs/Glossary/Fingerprinting), độ chính xác của các hàm `Temporal.Now` có thể bị làm tròn tùy thuộc vào cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, trong trường hợp đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian giảm, kết quả của `Temporal.Now.instant().epochMilliseconds` sẽ luôn là bội số của 2, hoặc bội số của 100 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi `privacy.resistFingerprinting` được bật.

```js
// reduced time precision (2ms) in Firefox 60
Temporal.Now.instant().epochMilliseconds;
// Might be:
// 1519211809934
// 1519211810362
// 1519211811670
// …

// reduced time precision with `privacy.resistFingerprinting` enabled
Temporal.Now.instant().epochMilliseconds;
// Might be:
// 1519129853500
// 1519129858900
// 1519129864400
// …
```

## Thuộc tính tĩnh

- `Temporal.Now[Symbol.toStringTag]`
  - : Giá trị ban đầu của thuộc tính [`[Symbol.toStringTag]`](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Symbol/toStringTag) là chuỗi `"Temporal.Now"`. Thuộc tính này được sử dụng trong {{jsxref("Object.prototype.toString()")}}.

## Phương thức tĩnh

- {{jsxref("Temporal/Now/instant", "Temporal.Now.instant()")}}
  - : Trả về thời gian hiện tại như là đối tượng {{jsxref("Temporal.Instant")}}.
- {{jsxref("Temporal/Now/plainDateISO", "Temporal.Now.plainDateISO()")}}
  - : Trả về ngày hiện tại như là đối tượng {{jsxref("Temporal.PlainDate")}}, theo lịch ISO 8601 và múi giờ được chỉ định.
- {{jsxref("Temporal/Now/plainDateTimeISO", "Temporal.Now.plainDateTimeISO()")}}
  - : Trả về ngày và giờ hiện tại như là đối tượng {{jsxref("Temporal.PlainDateTime")}}, theo lịch ISO 8601 và múi giờ được chỉ định.
- {{jsxref("Temporal/Now/plainTimeISO", "Temporal.Now.plainTimeISO()")}}
  - : Trả về giờ hiện tại như là đối tượng {{jsxref("Temporal.PlainTime")}}, theo múi giờ được chỉ định.
- {{jsxref("Temporal/Now/timeZoneId", "Temporal.Now.timeZoneId()")}}
  - : Trả về một [định danh múi giờ](/en-US/docs/Web/JavaScript/Reference/Global_Objects/Temporal/ZonedDateTime#time_zones_and_offsets) đại diện cho múi giờ hiện tại của hệ thống.
- {{jsxref("Temporal/Now/zonedDateTimeISO", "Temporal.Now.zonedDateTimeISO()")}}
  - : Trả về ngày và giờ hiện tại như là đối tượng {{jsxref("Temporal.ZonedDateTime")}}, theo lịch ISO 8601 và múi giờ được chỉ định.

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{jsxref("Temporal")}}
- {{jsxref("Temporal.Instant")}}
- {{jsxref("Temporal.PlainDate")}}
- {{jsxref("Temporal.PlainDateTime")}}
- {{jsxref("Temporal.PlainTime")}}
- {{jsxref("Temporal.ZonedDateTime")}}

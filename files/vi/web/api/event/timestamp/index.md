---
title: "Event: thuộc tính timeStamp"
short-title: timeStamp
slug: Web/API/Event/timeStamp
page-type: web-api-instance-property
browser-compat: api.Event.timeStamp
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`timeStamp`** của giao diện {{domxref("Event")}} trả về thời điểm (tính bằng mili giây) mà sự kiện được tạo.

## Giá trị

Giá trị này là số mili giây trôi qua kể từ đầu time origin cho đến khi sự kiện được tạo.
Nếu đối tượng toàn cục là {{domxref("Window")}}, time origin là khoảnh khắc người dùng nhấp vào liên kết, hoặc script khởi động quá trình tải tài liệu.
Trong worker, time origin là khoảnh khắc worker được tạo.

Giá trị là một {{domxref("DOMHighResTimeStamp")}} chính xác đến 5 micro giây (0.005 ms), nhưng [độ chính xác có thể bị giảm](#reduced_time_precision) để ngăn [fingerprinting](/en-US/docs/Glossary/Fingerprinting).

## Ví dụ

### HTML

```html
<p>
  Hãy focus vào iframe này rồi nhấn bất kỳ phím nào để lấy timestamp hiện tại
  cho sự kiện nhấn phím.
</p>
<p>timeStamp: <span id="time">-</span></p>
```

### JavaScript

```js
function getTime(event) {
  const time = document.getElementById("time");
  time.firstChild.nodeValue = event.timeStamp;
}
document.body.addEventListener("keypress", getTime);
```

### Kết quả

{{EmbedLiveSample("Example", "100%", 100)}}

## Độ chính xác thời gian giảm

Để bảo vệ khỏi các cuộc tấn công dựa trên timing và [fingerprinting](/en-US/docs/Glossary/Fingerprinting), độ chính xác của `event.timeStamp` có thể bị làm tròn tùy theo cài đặt trình duyệt. Trong Firefox, tùy chọn `privacy.reduceTimerPrecision` được bật theo mặc định và mặc định là 2ms. Bạn cũng có thể bật `privacy.resistFingerprinting`, khi đó độ chính xác sẽ là 100ms hoặc giá trị của `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`, tùy giá trị nào lớn hơn.

Ví dụ, với độ chính xác thời gian bị giảm, kết quả của `event.timeStamp` sẽ luôn là bội số của 2, hoặc là bội số của 100 (hoặc `privacy.resistFingerprinting.reduceTimerPrecision.microseconds`) khi `privacy.resistFingerprinting` được bật.

```js
// giảm độ chính xác thời gian (2ms) trong Firefox 60
event.timeStamp;
// Có thể là:
// 9934
// 10362
// 11670
// …

// giảm độ chính xác thời gian khi bật `privacy.resistFingerprinting`
event.timeStamp;
// Có thể là:
// 53500
// 58900
// 64400
// …
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

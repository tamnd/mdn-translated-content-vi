---
title: "PerformanceResourceTiming: connectStart property"
short-title: connectStart
slug: Web/API/PerformanceResourceTiming/connectStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.connectStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`connectStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay trước khi user agent bắt đầu thiết lập kết nối tới máy chủ để lấy tài nguyên.

## Giá trị

Thuộc tính `connectStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} ngay trước khi trình duyệt bắt đầu thiết lập kết nối tới máy chủ để lấy tài nguyên.
- `0` nếu tài nguyên được lấy tức thời từ cache.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Đo thời gian bắt tay TCP

Các thuộc tính `connectStart` và {{domxref("PerformanceResourceTiming.connectEnd", "connectEnd")}} có thể dùng để đo xem quá trình bắt tay TCP mất bao lâu.

```js
const tcp = entry.connectEnd - entry.connectStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const tcp = entry.connectEnd - entry.connectStart;
    if (tcp > 0) {
      console.log(`${entry.name}: TCP handshake duration: ${tcp}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const tcp = entry.connectEnd - entry.connectStart;
  if (tcp > 0) {
    console.log(`${entry.name}: TCP handshake duration: ${tcp}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `connectStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem timing tài nguyên, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Timing-Allow-Origin")}}

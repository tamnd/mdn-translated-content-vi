---
title: "PerformanceResourceTiming: secureConnectionStart property"
short-title: secureConnectionStart
slug: Web/API/PerformanceResourceTiming/secureConnectionStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.secureConnectionStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`secureConnectionStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay trước khi trình duyệt bắt đầu quá trình bắt tay để bảo mật kết nối hiện tại. Nếu không dùng kết nối an toàn, thuộc tính này trả về 0.

## Giá trị

Thuộc tính `secureConnectionStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình duyệt bắt đầu quá trình bắt tay để bảo mật kết nối hiện tại nếu tài nguyên được tìm nạp qua một kết nối an toàn.
- `0` nếu không dùng kết nối an toàn.
- `0` nếu tài nguyên được lấy tức thời từ cache.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Đo thời gian thương lượng TLS

Các thuộc tính `secureConnectionStart` và {{domxref("PerformanceResourceTiming.requestStart", "requestStart")}} có thể dùng để đo xem quá trình thương lượng TLS mất bao lâu.

```js
const tls = entry.requestStart - entry.secureConnectionStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const tls = entry.requestStart - entry.secureConnectionStart;
    if (tls > 0) {
      console.log(`${entry.name}: TLS negotiation duration: ${tls}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const tls = entry.requestStart - entry.secureConnectionStart;
  if (tls > 0) {
    console.log(`${entry.name}: TLS negotiation duration: ${tls}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `secureConnectionStart` là `0`, tài nguyên hoặc không dùng kết nối an toàn hoặc là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

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

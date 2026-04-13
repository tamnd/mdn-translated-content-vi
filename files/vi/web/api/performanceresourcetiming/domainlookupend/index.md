---
title: "PerformanceResourceTiming: domainLookupEnd property"
short-title: domainLookupEnd
slug: Web/API/PerformanceResourceTiming/domainLookupEnd
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.domainLookupEnd
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`domainLookupEnd`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} ngay sau khi trình duyệt hoàn tất tra cứu tên miền cho tài nguyên.

Nếu user agent đã có thông tin tên miền trong cache, {{domxref("PerformanceResourceTiming.domainLookupStart","domainLookupStart")}} và `domainLookupEnd` biểu thị thời điểm user agent bắt đầu và kết thúc việc lấy dữ liệu tên miền từ cache.

## Giá trị

Thuộc tính `domainLookupEnd` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay sau khi trình duyệt hoàn tất tra cứu tên miền cho tài nguyên.
- `0` nếu tài nguyên được lấy tức thời từ cache.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Đo thời gian tra cứu DNS

Các thuộc tính `domainLookupEnd` và {{domxref("PerformanceResourceTiming.domainLookupStart", "domainLookupStart")}} có thể dùng để đo xem quá trình tra cứu DNS mất bao lâu.

```js
const dns = entry.domainLookupEnd - entry.domainLookupStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const dns = entry.domainLookupEnd - entry.domainLookupStart;
    if (dns > 0) {
      console.log(`${entry.name}: DNS lookup duration: ${dns}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const dns = entry.domainLookupEnd - entry.domainLookupStart;
  if (dns > 0) {
    console.log(`${entry.name}: DNS lookup duration: ${dns}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `domainLookupEnd` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

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

---
title: "PerformanceResourceTiming: requestStart property"
short-title: requestStart
slug: Web/API/PerformanceResourceTiming/requestStart
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.requestStart
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`requestStart`** trả về {{domxref("DOMHighResTimeStamp","timestamp")}} của thời điểm ngay trước khi trình duyệt bắt đầu yêu cầu tài nguyên từ máy chủ, cache hoặc tài nguyên cục bộ. Nếu kết nối vận chuyển thất bại và trình duyệt thử lại yêu cầu, giá trị trả về sẽ là thời điểm bắt đầu của yêu cầu thử lại.

Không có thuộc tính _end_ cho `requestStart`. Để đo thời gian request, hãy tính {{domxref("PerformanceResourceTiming.responseStart", "responseStart")}} - `requestStart` (xem ví dụ bên dưới).

## Giá trị

Thuộc tính `requestStart` có thể có các giá trị sau:

- Một {{domxref("DOMHighResTimeStamp")}} biểu thị thời điểm ngay trước khi trình duyệt bắt đầu yêu cầu tài nguyên từ máy chủ.
- `0` nếu tài nguyên được lấy tức thời từ cache.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.
- `0` nếu tài nguyên là một yêu cầu bị hủy.

Khi {{domxref("PerformanceResourceTiming.firstInterimResponseStart", "firstInterimResponseStart")}} khác 0, điều đó cho thấy nó phải có cùng giá trị với `requestStart` đối với [các trình duyệt hỗ trợ](#browser_compatibility).

Khi không có phản hồi tạm thời nào, `requestStart` bằng `finalResponseHeadersStart` và `firstInterimResponseStart` là 0.

## Ví dụ

### Đo thời gian yêu cầu

Các thuộc tính `requestStart` và {{domxref("PerformanceResourceTiming.responseStart", "responseStart")}} có thể dùng để đo xem yêu cầu mất bao lâu.

```js
const request = entry.responseStart - entry.requestStart;
```

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const request = entry.responseStart - entry.requestStart;
    if (request > 0) {
      console.log(`${entry.name}: Request time: ${request}ms`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const request = entry.responseStart - entry.requestStart;
  if (request > 0) {
    console.log(`${entry.name}: Request time: ${request}ms`);
  }
});
```

### Thông tin timing liên miền

Nếu giá trị của thuộc tính `requestStart` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để cho phép xem thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

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

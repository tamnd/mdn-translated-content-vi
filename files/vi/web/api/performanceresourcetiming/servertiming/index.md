---
title: "PerformanceResourceTiming: serverTiming property"
short-title: serverTiming
slug: Web/API/PerformanceResourceTiming/serverTiming
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.serverTiming
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}{{securecontext_header}}

Thuộc tính chỉ đọc **`serverTiming`** trả về một mảng các entry {{domxref("PerformanceServerTiming")}} chứa các chỉ số server timing.

Các chỉ số server timing yêu cầu máy chủ gửi tiêu đề {{HTTPHeader("Server-Timing")}}. Ví dụ:

```http
Server-Timing: cache;desc="Cache Read";dur=23.2
```

Các entry `serverTiming` có thể nằm trên các entry `navigation` và `resource`.

## Giá trị

Một mảng các entry {{domxref("PerformanceServerTiming")}}.

## Ví dụ

### Ghi nhật ký các server timing entry

Bạn có thể dùng {{domxref("PerformanceObserver")}} để theo dõi các entry {{domxref("PerformanceServerTiming")}}. Duration của từng server entry sẽ được ghi vào console.

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    entry.serverTiming.forEach((serverEntry) => {
      console.log(`${serverEntry.name} duration: ${serverEntry.duration}`);
    });
  });
});

["navigation", "resource"].forEach((type) =>
  observer.observe({ type, buffered: true }),
);
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
for (const entryType of ["navigation", "resource"]) {
  for (const { name: url, serverTiming } of performance.getEntriesByType(
    entryType,
  )) {
    if (serverTiming) {
      for (const { name, duration } of serverTiming) {
        console.log(`${url}: ${name} duration: ${duration}`);
      }
    }
  }
}
```

### Thông tin server timing cross-origin

Quyền truy cập thông tin server timing bị giới hạn trong cùng origin. Để hiển thị thông tin timing cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem thông tin server timing, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceServerTiming")}}
- {{HTTPHeader("Server-Timing")}}

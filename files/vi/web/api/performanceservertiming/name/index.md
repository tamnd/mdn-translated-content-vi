---
title: "PerformanceServerTiming: thuộc tính name"
short-title: name
slug: Web/API/PerformanceServerTiming/name
page-type: web-api-instance-property
browser-compat: api.PerformanceServerTiming.name
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`name`** trả về giá trị chuỗi của tên số liệu do máy chủ chỉ định.

## Giá trị

Một chuỗi.

## Ví dụ

### Ghi lại các mục nhập thời gian máy chủ

Các số liệu thời gian máy chủ yêu cầu máy chủ gửi tiêu đề {{HTTPHeader("Server-Timing")}}. Ví dụ:

```http
Server-Timing: cache;desc="Cache Read";dur=23.2
```

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    entry.serverTiming.forEach((serverEntry) => {
      console.log(
        `${serverEntry.name} (${serverEntry.description}) duration: ${serverEntry.duration}`,
      );
      // Logs "cache (Cache Read) duration: 23.2"
    });
  });
});

["navigation", "resource"].forEach((type) =>
  observer.observe({ type, buffered: true }),
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PerformanceServerTiming")}}
- {{HTTPHeader("Server-Timing")}}

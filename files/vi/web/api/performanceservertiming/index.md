---
title: PerformanceServerTiming
slug: Web/API/PerformanceServerTiming
page-type: web-api-interface
browser-compat: api.PerformanceServerTiming
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}{{securecontext_header}}

Giao diện **`PerformanceServerTiming`** hiển thị các số liệu máy chủ được gửi cùng với phản hồi trong tiêu đề HTTP {{HTTPHeader("Server-Timing")}}.

Giao diện này bị hạn chế ở cùng một nguồn gốc, nhưng bạn có thể sử dụng tiêu đề {{HTTPHeader("Timing-Allow-Origin")}} để chỉ định các tên miền được phép truy cập các số liệu máy chủ. Lưu ý rằng giao diện này chỉ khả dụng trong các ngữ cảnh bảo mật (HTTPS) trong một số trình duyệt.

## Thuộc tính phiên bản

- {{domxref('PerformanceServerTiming.description')}} {{ReadOnlyInline}}
  - : Giá trị chuỗi của mô tả số liệu do máy chủ chỉ định, hoặc một chuỗi rỗng.
- {{domxref('PerformanceServerTiming.duration')}} {{ReadOnlyInline}}
  - : Một số double chứa thời lượng số liệu do máy chủ chỉ định, hoặc giá trị `0.0`.
- {{domxref('PerformanceServerTiming.name')}} {{ReadOnlyInline}}
  - : Giá trị chuỗi của tên số liệu do máy chủ chỉ định.

## Phương thức phiên bản

- {{domxref('PerformanceServerTiming.toJSON()')}}
  - : Trả về biểu diễn JSON của đối tượng `PerformanceServerTiming`.

## Ví dụ

Cho một máy chủ gửi tiêu đề {{HTTPHeader("Server-Timing")}}, ví dụ máy chủ Node.js như thế này:

```js
const http = require("http");

function requestHandler(request, response) {
  const headers = {
    "Server-Timing": `
      cache;desc="Cache Read";dur=23.2,
      db;dur=53,
      app;dur=47.2
    `.replace(/\n/g, ""),
  };
  response.writeHead(200, headers);
  response.write("");
  return setTimeout(() => {
    response.end();
  }, 1000);
}

http.createServer(requestHandler).listen(3000).on("error", console.error);
```

Các mục nhập `PerformanceServerTiming` hiện có thể quan sát được từ JavaScript thông qua thuộc tính {{domxref("PerformanceResourceTiming.serverTiming")}} và tồn tại trên các mục nhập `navigation` và `resource`.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    entry.serverTiming.forEach((serverEntry) => {
      console.log(
        `${serverEntry.name} (${serverEntry.description}) duration: ${serverEntry.duration}`,
      );
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

- {{HTTPHeader("Server-Timing")}}
- {{domxref("PerformanceResourceTiming.serverTiming")}}

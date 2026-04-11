---
title: "PerformanceResourceTiming: nextHopProtocol property"
short-title: nextHopProtocol
slug: Web/API/PerformanceResourceTiming/nextHopProtocol
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.nextHopProtocol
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`nextHopProtocol`** là một chuỗi biểu thị giao thức mạng được dùng để tìm nạp tài nguyên, được xác định bởi [ALPN Protocol ID (RFC7301)](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids).

Khi dùng proxy, nếu một kết nối tunnel được thiết lập, thuộc tính này trả về ALPN Protocol ID của giao thức được tunnel. Nếu không, thuộc tính này trả về ALPN Protocol ID của hop đầu tiên tới proxy.

## Giá trị

Thuộc tính `nextHopProtocol` có thể có các giá trị sau:

- Một chuỗi biểu thị giao thức mạng được dùng để tìm nạp tài nguyên, được xác định bởi [ALPN Protocol ID (RFC7301)](https://www.iana.org/assignments/tls-extensiontype-values/tls-extensiontype-values.xhtml#alpn-protocol-ids). Các giá trị điển hình là:
  - `"http/0.9"`
  - `"http/1.0"`
  - `"http/1.1"`
  - `"h2"`
  - `"h2c"`
  - `"h3"`
- Một chuỗi rỗng nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Ghi nhật ký tài nguyên không dùng HTTP/2 hoặc HTTP/3

Thuộc tính `nextHopProtocol` có thể dùng để xem các tài nguyên không dùng giao thức HTTP/2 hoặc HTTP/3.

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const protocol = entry.nextHopProtocol;
    if (protocol && !(protocol === "h2" || protocol === "h3")) {
      console.log(`${entry.name} uses ${protocol}.`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const protocol = entry.nextHopProtocol;
  if (protocol && !(protocol === "h2" || protocol === "h3")) {
    console.log(`${entry.name} uses ${protocol}.`);
  }
});
```

### Thông tin giao thức mạng cross-origin

Nếu giá trị của thuộc tính `nextHopProtocol` là một chuỗi rỗng, tài nguyên có thể là một yêu cầu cross-origin. Để hiển thị thông tin giao thức mạng cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem thông tin giao thức mạng, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Timing-Allow-Origin")}}
- {{Glossary("HTTP 2", "HTTP/2")}}
- {{Glossary("HTTP 3", "HTTP/3")}}

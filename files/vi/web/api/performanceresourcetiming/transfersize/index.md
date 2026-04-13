---
title: "PerformanceResourceTiming: transferSize property"
short-title: transferSize
slug: Web/API/PerformanceResourceTiming/transferSize
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.transferSize
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`transferSize`** biểu thị kích thước (tính bằng octet) của tài nguyên đã tìm nạp. Kích thước bao gồm các trường header phản hồi cộng với phần thân payload phản hồi (theo định nghĩa trong [RFC7230](https://httpwg.org/specs/rfc7230.html#message.body)).

Nếu tài nguyên được tìm nạp từ cache cục bộ, hoặc nếu đó là tài nguyên cross-origin, thuộc tính này trả về 0.

## Giá trị

Thuộc tính `transferSize` có thể có các giá trị sau:

- Một số biểu thị kích thước (tính bằng octet) của tài nguyên đã tìm nạp. Kích thước bao gồm các trường header phản hồi cộng với [phần thân payload phản hồi](https://httpwg.org/specs/rfc7230.html#message.body) (RFC7230).
- `0` nếu tài nguyên được lấy tức thời từ cache.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Kiểm tra xem có trúng cache hay không

Với các môi trường không hỗ trợ thuộc tính {{domxref("PerformanceResourceTiming.responseStatus", "responseStatus")}}, có thể dùng thuộc tính `transferSize` để xác định cache hit. Nếu `transferSize` bằng 0 và tài nguyên có `decodedBodySize` khác 0 (nghĩa là tài nguyên cùng origin hoặc có {{HTTPHeader("Timing-Allow-Origin")}}), tài nguyên đã được lấy từ cache cục bộ.

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    if (entry.transferSize === 0 && entry.decodedBodySize > 0) {
      console.log(`${entry.name} was loaded from cache`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  if (entry.transferSize === 0 && entry.decodedBodySize > 0) {
    console.log(`${entry.name} was loaded from cache`);
  }
});
```

### Thông tin kích thước nội dung cross-origin

Nếu giá trị của thuộc tính `transferSize` là `0` và không được tải từ cache cục bộ, tài nguyên có thể là một yêu cầu cross-origin. Để hiển thị thông tin kích thước nội dung cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

Ví dụ, để cho phép `https://developer.mozilla.org` xem kích thước nội dung, tài nguyên cross-origin nên gửi:

```http
Timing-Allow-Origin: https://developer.mozilla.org
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTTPHeader("Timing-Allow-Origin")}}

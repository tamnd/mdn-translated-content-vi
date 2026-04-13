---
title: "PerformanceResourceTiming: encodedBodySize property"
short-title: encodedBodySize
slug: Web/API/PerformanceResourceTiming/encodedBodySize
page-type: web-api-instance-property
browser-compat: api.PerformanceResourceTiming.encodedBodySize
---

{{APIRef("Performance API")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`encodedBodySize`** biểu thị kích thước (tính bằng octet) nhận được từ lần tìm nạp (HTTP hoặc cache) của phần thân payload trước khi loại bỏ mọi content encoding đã áp dụng (như gzip hoặc Brotli). Nếu tài nguyên được truy xuất từ application cache hoặc một tài nguyên cục bộ, nó phải trả về kích thước của phần thân payload trước khi loại bỏ bất kỳ content encoding nào đã áp dụng.

## Giá trị

Thuộc tính `encodedBodySize` có thể có các giá trị sau:

- Một số biểu thị kích thước (tính bằng octet) nhận được từ lần tìm nạp (HTTP hoặc cache) của phần thân payload, trước khi loại bỏ mọi content encoding đã áp dụng.
- `0` nếu tài nguyên là một yêu cầu cross-origin và không dùng tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

## Ví dụ

### Kiểm tra xem nội dung có được nén hay không

Nếu các thuộc tính `encodedBodySize` và {{domxref("PerformanceResourceTiming.decodedBodySize", "decodedBodySize")}} không phải null và khác nhau, nội dung đã được nén (ví dụ gzip hoặc Brotli).

Ví dụ dùng {{domxref("PerformanceObserver")}}, thông báo các performance entry `resource` mới khi chúng được ghi trong performance timeline của trình duyệt. Dùng tùy chọn `buffered` để truy cập các entry từ trước khi observer được tạo.

```js
const observer = new PerformanceObserver((list) => {
  list.getEntries().forEach((entry) => {
    const uncompressed =
      entry.decodedBodySize && entry.decodedBodySize === entry.encodedBodySize;
    if (uncompressed) {
      console.log(`${entry.name} was not compressed!`);
    }
  });
});

observer.observe({ type: "resource", buffered: true });
```

Ví dụ dùng {{domxref("Performance.getEntriesByType()")}}, chỉ hiển thị các performance entry `resource` đang có trong performance timeline tại thời điểm bạn gọi phương thức này:

```js
const resources = performance.getEntriesByType("resource");
resources.forEach((entry) => {
  const uncompressed =
    entry.decodedBodySize && entry.decodedBodySize === entry.encodedBodySize;
  if (uncompressed) {
    console.log(`${entry.name} was not compressed!`);
  }
});
```

### Thông tin kích thước nội dung cross-origin

Nếu giá trị của thuộc tính `encodedBodySize` là `0`, tài nguyên có thể là một yêu cầu cross-origin. Để hiển thị thông tin kích thước nội dung cross-origin, cần đặt tiêu đề phản hồi HTTP {{HTTPHeader("Timing-Allow-Origin")}}.

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

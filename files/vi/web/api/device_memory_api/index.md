---
title: Device Memory API
slug: Web/API/Device_Memory_API
page-type: web-api-overview
browser-compat:
  - api.Navigator.deviceMemory
  - api.WorkerNavigator.deviceMemory
  - http.headers.Sec-CH-Device-Memory
spec-urls: https://www.w3.org/TR/device-memory/
---

{{DefaultAPISidebar("Device Memory API")}}{{securecontext_header}}{{AvailableInWorkers}}

Khả năng của thiết bị khách hàng phụ thuộc nhiều vào lượng RAM có sẵn. Theo truyền thống, nhà phát triển phải sử dụng heuristics và hoặc đánh giá hiệu năng thiết bị hoặc suy luận khả năng thiết bị dựa trên các yếu tố khác như nhà sản xuất thiết bị hoặc chuỗi User Agent.

## Xác định bộ nhớ thiết bị

Có hai cách để xác định lượng RAM xấp xỉ mà thiết bị có: sử dụng Device Memory JavaScript API hoặc chấp nhận Client Hints.

### JavaScript API

Bạn có thể truy vấn lượng RAM xấp xỉ của thiết bị bằng cách lấy {{DOMxRef("Navigator.deviceMemory")}} hoặc {{DOMxRef("WorkerNavigator.deviceMemory")}}.

```js
const RAM = navigator.deviceMemory;
```

### Client Hints

Bạn cũng có thể sử dụng [Client Hints](/en-US/docs/Web/HTTP/Guides/Client_hints) HTTP Header với chỉ thị `Device-Memory` để lấy cùng dung lượng RAM xấp xỉ.

## Giao diện

### Mở rộng cho các giao diện khác

- {{domxref("Navigator.deviceMemory")}} {{ReadOnlyInline}}
  - : Trả về lượng bộ nhớ thiết bị xấp xỉ tính bằng gigabyte.
- {{domxref("WorkerNavigator.deviceMemory")}} {{ReadOnlyInline}}
  - : Trả về lượng bộ nhớ thiết bị xấp xỉ tính bằng gigabyte.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Header {{HTTPHeader("Sec-CH-Device-Memory")}}

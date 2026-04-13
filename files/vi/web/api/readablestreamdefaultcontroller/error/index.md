---
title: "ReadableStreamDefaultController: error() method"
short-title: error()
slug: Web/API/ReadableStreamDefaultController/error
page-type: web-api-instance-method
browser-compat: api.ReadableStreamDefaultController.error
---

{{APIRef("Streams")}}{{AvailableInWorkers}}

Phương thức **`error()`** của giao diện {{domxref("ReadableStreamDefaultController")}} gây ra lỗi cho mọi tương tác tương lai với luồng liên kết.

> [!NOTE]
> Phương thức `error()` có thể được gọi nhiều hơn một lần, và có thể được gọi khi luồng không thể đọc được.

## Cú pháp

```js-nolint
error(e)
```

### Tham số

- `e`
  - : Lỗi mà bạn muốn các tương tác tương lai thất bại cùng.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- {{jsxref("TypeError")}}
  - : Được ném ra nếu đối tượng nguồn không phải là `ReadableStreamDefaultController`.

## Ví dụ

Ví dụ [Luồng có thể đọc với nguồn đẩy cơ bản và hỗ trợ backpressure](https://streams.spec.whatwg.org/#example-rs-push-backpressure) trong đặc tả cung cấp một ví dụ tốt về cách sử dụng {{domxref("ReadableStreamDefaultController.desiredSize")}} để phát hiện thủ công khi luồng đầy và áp dụng backpressure, cũng như sử dụng `error()` để kích hoạt thủ công lỗi luồng nếu một phần khác của hệ thống mà nó phụ thuộc gặp sự cố.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng các luồng có thể đọc](/en-US/docs/Web/API/Streams_API/Using_readable_streams)
- {{domxref("ReadableStreamDefaultController")}}

---
title: "WebSocket: phương thức send()"
short-title: send()
slug: Web/API/WebSocket/send
page-type: web-api-instance-method
browser-compat: api.WebSocket.send
---

{{APIRef("WebSockets API")}}{{AvailableInWorkers}}

Phương thức **`WebSocket.send()`** xếp hàng dữ liệu đã chỉ định để truyền tới máy chủ qua kết nối WebSocket, làm tăng giá trị `bufferedAmount` theo số byte cần để chứa dữ liệu. Nếu dữ liệu không thể gửi đi (ví dụ, vì nó cần được đệm nhưng bộ đệm đã đầy), socket sẽ tự động đóng.
Trình duyệt sẽ ném ngoại lệ nếu bạn gọi `send()` khi kết nối đang ở trạng thái `CONNECTING`. Nếu bạn gọi `send()` khi kết nối đang ở trạng thái `CLOSING` hoặc `CLOSED`, trình duyệt sẽ âm thầm loại bỏ dữ liệu.

## Cú pháp

```js-nolint
send(data)
```

### Tham số

- `data`
  - : Dữ liệu cần gửi tới máy chủ. Nó có thể là một trong các kiểu sau:
    - `string`
      - : Một chuỗi văn bản. Chuỗi được thêm vào bộ đệm ở định dạng UTF-8, và giá trị của `bufferedAmount` tăng theo số byte cần để biểu diễn chuỗi UTF-8 đó.
    - {{jsxref("ArrayBuffer")}}
      - : Bạn có thể gửi dữ liệu nhị phân cơ bản được dùng bởi một đối tượng typed array; nội dung nhị phân của nó được xếp hàng trong bộ đệm, làm tăng giá trị `bufferedAmount` theo số byte cần thiết.
    - {{domxref("Blob")}}
      - : Chỉ định một `Blob` sẽ xếp hàng dữ liệu thô của blob để truyền trong một khung nhị phân ({{domxref("Blob.type")}} bị bỏ qua).
        Giá trị `bufferedAmount` tăng theo kích thước byte của dữ liệu thô đó.
    - {{jsxref("TypedArray")}} hoặc {{jsxref("DataView")}}
      - : Bạn có thể gửi bất kỳ đối tượng [typed array của JavaScript](/en-US/docs/Web/JavaScript/Guide/Typed_arrays) nào như một khung nhị phân;
        nội dung nhị phân của nó được xếp hàng trong bộ đệm,
        làm tăng giá trị `bufferedAmount` theo số byte cần thiết.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidStateError` {{domxref("DOMException")}}
  - : Được ném ra nếu {{domxref("WebSocket/readyState", "WebSocket.readyState")}} là `CONNECTING`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

---
title: SerialPort
slug: Web/API/SerialPort
page-type: web-api-interface
status:
  - experimental
browser-compat: api.SerialPort
---

{{securecontext_header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện `SerialPort` của [Web Serial API](/en-US/docs/Web/API/Web_Serial_API) cung cấp khả năng truy cập vào một cổng nối tiếp trên thiết bị chủ.

{{InheritanceDiagram}}

## Hàm khởi tạo

Các thực thể của giao diện này có thể được tạo ra bằng cách gọi các phương thức của giao diện {{domxref("Serial")}}, do đó nó không có hàm khởi tạo riêng.

## Thuộc tính phiên bản

- {{domxref("SerialPort.connected")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về giá trị boolean cho biết liệu cổng có được kết nối logic với thiết bị hay không.
- {{domxref("SerialPort.readable")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("ReadableStream")}} để nhận dữ liệu từ thiết bị kết nối với cổng.
- {{domxref("SerialPort.writable")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một {{domxref("WritableStream")}} để gửi dữ liệu tới thiết bị kết nối với cổng.

## Phương thức phiên bản

- {{domxref("SerialPort.forget()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải khi quyền truy cập vào cổng nối tiếp bị thu hồi. Gọi phương thức này sẽ "quên" thiết bị, đặt lại mọi quyền đã được thiết lập trước đó để trang gọi không còn có thể giao tiếp với cổng nữa.
- {{domxref("SerialPort.getInfo()")}} {{Experimental_Inline}}
  - : Trả về một đối tượng chứa thông tin định danh cho thiết bị có sẵn qua cổng.
- {{domxref("SerialPort.open()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải khi cổng được mở. Mặc định cổng được mở với 8 bit dữ liệu, 1 bit dừng và không kiểm tra chẵn lẻ.
- {{domxref("SerialPort.setSignals()")}} {{Experimental_Inline}}
  - : Đặt các tín hiệu điều khiển trên cổng và trả về một {{jsxref("Promise")}} phân giải khi chúng được đặt.
- {{domxref("SerialPort.getSignals()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải với một đối tượng chứa trạng thái hiện tại của các tín hiệu điều khiển của cổng.
- {{domxref("SerialPort.close()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải khi cổng đóng.

## Sự kiện

- {{domxref("SerialPort.connect_event", "connect")}} {{Experimental_Inline}}
  - : Kích hoạt khi cổng kết nối với thiết bị.
- {{domxref("SerialPort.disconnect_event", "disconnect")}} {{Experimental_Inline}}
  - : Kích hoạt khi cổng ngắt kết nối khỏi thiết bị.

## Ví dụ

### Mở một cổng

Trước khi giao tiếp trên một cổng nối tiếp, cổng đó phải được mở. Mở cổng cho phép trang web chỉ định các tham số cần thiết kiểm soát cách dữ liệu được truyền và nhận. Nhà phát triển nên kiểm tra tài liệu của thiết bị đang kết nối để biết các tham số phù hợp.

```js
await port.open({ baudRate: 9600 /* pick your baud rate */ });
```

Sau khi `Promise` được trả về bởi `open()` phân giải, các thuộc tính `readable` và `writable` có thể được truy cập để lấy các thực thể {{domxref("ReadableStream")}} và {{domxref("WritableStream")}} để nhận dữ liệu từ và gửi dữ liệu đến thiết bị được kết nối.

### Đọc dữ liệu từ một cổng

Ví dụ sau đây cho thấy cách đọc dữ liệu từ một cổng. Vòng lặp ngoài xử lý các lỗi không nghiêm trọng, tạo một trình đọc mới cho đến khi gặp lỗi nghiêm trọng và `readable` trở thành `null`.

```js
while (port.readable) {
  const reader = port.readable.getReader();
  try {
    while (true) {
      const { value, done } = await reader.read();
      if (done) {
        // |reader| has been canceled.
        break;
      }
      // Do something with |value|…
    }
  } catch (error) {
    // Handle |error|…
  } finally {
    reader.releaseLock();
  }
}
```

### Ghi dữ liệu vào một cổng

Ví dụ sau đây cho thấy cách ghi một chuỗi vào một cổng. Một {{domxref("TextEncoder")}} chuyển đổi chuỗi thành `Uint8Array` trước khi truyền.

```js
const encoder = new TextEncoder();
const writer = port.writable.getWriter();
await writer.write(encoder.encode("PING"));
writer.releaseLock();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

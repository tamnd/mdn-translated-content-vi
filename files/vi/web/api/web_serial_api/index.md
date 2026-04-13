---
title: Web Serial API
slug: Web/API/Web_Serial_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.Serial
---

{{DefaultAPISidebar("Web Serial API")}}{{SecureContext_Header}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

**Web Serial API** cung cấp cách cho các trang web đọc từ và ghi vào các thiết bị serial. Các thiết bị này có thể được kết nối qua cổng serial, hoặc là thiết bị USB hoặc Bluetooth giả lập cổng serial.

## Khái niệm và cách sử dụng

Web Serial API là một trong một tập API cho phép các trang web giao tiếp với các thiết bị ngoại vi được kết nối với máy tính của người dùng. Nó cung cấp khả năng kết nối với các thiết bị yêu cầu hệ điều hành giao tiếp qua serial API, thay vì USB có thể được truy cập qua [WebUSB API](/en-US/docs/Web/API/WebUSB_API), hoặc thiết bị đầu vào có thể được truy cập qua [WebHID API](/en-US/docs/Web/API/WebHID_API).

Ví dụ về thiết bị serial bao gồm máy in 3D và vi điều khiển như [BBC micro:bit board](https://microbit.org/).

## Giao diện

- {{domxref("Serial")}} {{Experimental_Inline}}
  - : Cung cấp các thuộc tính và phương thức để tìm và kết nối với các cổng serial từ trang web.
- {{domxref("SerialPort")}} {{Experimental_Inline}}
  - : Cung cấp quyền truy cập vào cổng serial trên thiết bị host.

## Mở rộng cho các giao diện khác

- {{domxref("Navigator.serial")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("Serial")}}, đại diện cho điểm vào Web Serial API để kiểm soát các cổng serial.
- {{domxref("WorkerNavigator.serial")}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về đối tượng {{domxref("Serial")}}, đại diện cho điểm vào Web Serial API để kiểm soát các cổng serial.

## HTTP headers

- {{httpheader("Permissions-Policy")}} chỉ thị {{httpheader('Permissions-Policy/serial','serial')}}
  - : Kiểm soát liệu tài liệu hiện tại có được phép dùng Web Serial API để giao tiếp với thiết bị serial hay không.

## Ví dụ

### Kiểm tra các cổng có sẵn

Ví dụ sau cho thấy cách kiểm tra các cổng có sẵn và cho phép người dùng cấp quyền truy cập vào các cổng bổ sung.

```js
navigator.serial.addEventListener("connect", (e) => {
  // Kết nối với `e.target` hoặc thêm nó vào danh sách cổng có sẵn.
});

navigator.serial.addEventListener("disconnect", (e) => {
  // Xóa `e.target` khỏi danh sách cổng có sẵn.
});

navigator.serial.getPorts().then((ports) => {
  // Khởi tạo danh sách cổng có sẵn với `ports` khi tải trang.
});

button.addEventListener("click", () => {
  const usbVendorId = 0xabcd;
  navigator.serial
    .requestPort({ filters: [{ usbVendorId }] })
    .then((port) => {
      // Kết nối với `port` hoặc thêm nó vào danh sách cổng có sẵn.
    })
    .catch((e) => {
      // Người dùng không chọn cổng.
    });
});
```

### Đọc dữ liệu từ cổng

Ví dụ sau cho thấy cách đọc dữ liệu từ cổng.

```js
while (port.readable) {
  const reader = port.readable.getReader();
  try {
    while (true) {
      const { value, done } = await reader.read();
      if (done) {
        // |reader| đã bị hủy.
        break;
      }
      // Làm gì đó với |value|...
    }
  } catch (error) {
    // Xử lý |error|...
  } finally {
    reader.releaseLock();
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Read from and write to a serial port](https://developer.chrome.com/docs/capabilities/serial)
- [Getting started with the Web Serial API](https://codelabs.developers.google.com/codelabs/web-serial#0)

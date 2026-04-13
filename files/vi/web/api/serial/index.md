---
title: Serial
slug: Web/API/Serial
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Serial
---

{{securecontext_header}}{{APIRef("Web Serial API")}}{{SeeCompatTable}}{{AvailableInWorkers("window_and_dedicated")}}

Giao diện `Serial` của [Web Serial API](/en-US/docs/Web/API/Web_Serial_API) cung cấp các thuộc tính và phương thức để tìm và kết nối với cổng nối tiếp từ một trang web.

{{InheritanceDiagram}}

## Phương thức thể hiện

- {{domxref("Serial.requestPort()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một thể hiện {{domxref("SerialPort")}} đại diện cho thiết bị do người dùng chọn. Phương thức này phải được gọi thông qua [kích hoạt tạm thời](/en-US/docs/Glossary/Transient_activation).

- {{domxref("Serial.getPorts()")}} {{Experimental_Inline}}
  - : Trả về một {{jsxref("Promise")}} phân giải thành một mảng các đối tượng {{domxref("SerialPort")}} đại diện cho các cổng nối tiếp đã kết nối với máy chủ mà origin có quyền truy cập.

## Sự kiện

Các sự kiện sau khả dụng với `Serial` thông qua việc lan truyền sự kiện từ {{domxref("SerialPort")}}:

- Sự kiện {{domxref("SerialPort.connect_event", "connect")}} của `SerialPort`
  - : Sự kiện được phát ra khi một cổng đã được kết nối với thiết bị.
- Sự kiện {{domxref("SerialPort.disconnect_event", "disconnect")}} của `SerialPort`
  - : Sự kiện được phát ra khi một cổng đã bị ngắt kết nối khỏi thiết bị.

## Ví dụ

Ví dụ sau cho thấy cách một trang web có thể kiểm tra các cổng khả dụng và cho phép người dùng cấp quyền truy cập vào các cổng bổ sung.

Khi tải trang, các trình nghe sự kiện được thêm cho các sự kiện {{domxref("SerialPort.connect_event", "connect")}} và {{domxref("SerialPort.disconnect_event", "disconnect")}} để trang web có thể phản ứng khi một thiết bị được kết nối hoặc ngắt kết nối khỏi hệ thống. Sau đó phương thức {{domxref("Serial.getPorts()","getPorts()")}} được gọi để xem những cổng nào đang được kết nối mà trang web đã có quyền truy cập.

Nếu trang web không có quyền truy cập vào bất kỳ cổng nào đang kết nối, nó phải đợi đến khi có kích hoạt từ người dùng mới tiếp tục được. Trong ví dụ này, chúng ta dùng một trình xử lý sự kiện {{domxref("Element.click_event", "click")}} trên một nút cho nhiệm vụ này. Một bộ lọc được truyền vào {{domxref("Serial.requestPort()","requestPort()")}} với một mã nhà cung cấp USB để giới hạn tập thiết bị hiển thị cho người dùng chỉ còn các thiết bị USB do một nhà sản xuất cụ thể tạo ra.

```js
navigator.serial.addEventListener("connect", (e) => {
  // Kết nối với `e.target` hoặc thêm nó vào danh sách các cổng khả dụng.
});

navigator.serial.addEventListener("disconnect", (e) => {
  // Xóa `e.target` khỏi danh sách các cổng khả dụng.
});

navigator.serial.getPorts().then((ports) => {
  // Khởi tạo danh sách các cổng khả dụng bằng `ports` khi trang tải.
});

button.addEventListener("click", () => {
  const usbVendorId = 0xabcd;
  navigator.serial
    .requestPort({ filters: [{ usbVendorId }] })
    .then((port) => {
      // Kết nối với `port` hoặc thêm nó vào danh sách các cổng khả dụng.
    })
    .catch((e) => {
      // Người dùng không chọn cổng nào.
    });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

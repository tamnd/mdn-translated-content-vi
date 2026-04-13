---
title: USBEndpoint
slug: Web/API/USBEndpoint
page-type: web-api-interface
status:
  - experimental
browser-compat: api.USBEndpoint
---

{{APIRef("WebUSB API")}}{{SeeCompatTable}}{{SecureContext_Header}}{{AvailableInWorkers}}

Giao diện `USBEndpoint` của [WebUSB API](/en-US/docs/Web/API/WebUSB_API) cung cấp thông tin về một endpoint được cung cấp bởi thiết bị USB. Một endpoint đại diện cho một luồng dữ liệu một chiều vào hoặc ra khỏi thiết bị.

## Hàm khởi tạo

- {{domxref("USBEndpoint.USBEndpoint", "USBEndpoint()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `USBEndpoint` mới sẽ được điền thông tin về endpoint trên {{domxref('USBAlternateInterface')}} đã cung cấp với số endpoint và hướng truyền đã cho.

## Thuộc tính phiên bản

- {{domxref("USBEndpoint.endpointNumber")}} {{Experimental_Inline}}
  - : Trả về "số endpoint" của endpoint này, là một giá trị từ 1 đến 15 được trích xuất từ trường `bEndpointAddress` của mô tả endpoint định nghĩa endpoint này. Giá trị này được dùng để xác định endpoint khi gọi các phương thức trên `USBDevice`.
- {{domxref("USBEndpoint.direction")}} {{Experimental_Inline}}
  - : Trả về hướng mà endpoint này truyền dữ liệu, một trong:
    - `"in"` - Dữ liệu được truyền từ thiết bị đến host.
    - `"out"` - Dữ liệu được truyền từ host đến thiết bị.

- {{domxref("USBEndpoint.type")}} {{Experimental_Inline}}
  - : Trả về loại endpoint này, một trong:
    - `"bulk"` - Cung cấp truyền dữ liệu tin cậy cho các payload lớn. Dữ liệu gửi qua endpoint bulk được đảm bảo được giao hoặc tạo ra lỗi nhưng có thể bị ưu tiên bởi lưu lượng dữ liệu khác.
    - `"interrupt"` - Cung cấp truyền dữ liệu tin cậy cho các payload nhỏ. Dữ liệu gửi qua endpoint interrupt được đảm bảo được giao hoặc tạo ra lỗi và cũng được dành thời gian bus riêng để truyền.
    - `"isochronous"` - Cung cấp truyền dữ liệu không tin cậy cho các payload phải được giao định kỳ. Chúng được dành thời gian bus riêng nhưng nếu bỏ lỡ deadline, dữ liệu sẽ bị bỏ.

- {{domxref("USBEndpoint.packetSize")}} {{Experimental_Inline}}
  - : Trả về kích thước của các gói tin mà dữ liệu gửi qua endpoint này sẽ được chia thành.

## Ví dụ

Đôi khi nhà phát triển biết trước bố cục chính xác của các endpoint của thiết bị, nhưng cũng có trường hợp điều này phải được khám phá trong thời gian chạy. Ví dụ, thiết bị serial USB phải cung cấp endpoint bulk đầu vào và đầu ra nhưng số endpoint của chúng sẽ phụ thuộc vào các giao diện khác mà thiết bị cung cấp.

Code này xác định các endpoint chính xác bằng cách tìm kiếm giao diện triển khai lớp giao diện USB CDC và sau đó xác định các endpoint ứng cử viên dựa trên loại và hướng của chúng.

```js
let inEndpoint = undefined;
let outEndpoint = undefined;

for (const { alternates } of device.configuration.interfaces) {
  // Chỉ hỗ trợ thiết bị có nhiều giao diện thay thế.
  const alternate = alternates[0];

  // Xác định giao diện triển khai lớp USB CDC.
  const USB_CDC_CLASS = 10;
  if (alternate.interfaceClass !== USB_CDC_CLASS) {
    continue;
  }

  for (const endpoint of alternate.endpoints) {
    // Xác định các endpoint truyền bulk.
    if (endpoint.type !== "bulk") {
      continue;
    }

    if (endpoint.direction === "in") {
      inEndpoint = endpoint.endpointNumber;
    } else if (endpoint.direction === "out") {
      outEndpoint = endpoint.endpointNumber;
    }
  }
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

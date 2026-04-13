---
title: WebUSB API
slug: Web/API/WebUSB_API
page-type: web-api-overview
status:
  - experimental
browser-compat: api.USB
spec-urls: https://wicg.github.io/webusb/
---

{{DefaultAPISidebar("WebUSB API")}}{{SeeCompatTable}}{{securecontext_header}}{{AvailableInWorkers}}

**WebUSB API** cung cấp một cách để hiển thị các dịch vụ thiết bị USB (Universal Serial Bus) không chuẩn tương thích lên web, giúp USB an toàn hơn và dễ sử dụng hơn.

## Khái niệm và cách sử dụng

USB là tiêu chuẩn thực tế cho các thiết bị ngoại vi có dây. Các thiết bị USB bạn kết nối với máy tính thường được nhóm thành một số lớp thiết bị như bàn phím, chuột, thiết bị video, v.v. Chúng được hỗ trợ bằng driver lớp của hệ điều hành. Nhiều thiết bị trong số này cũng có thể truy cập web thông qua [WebHID API](/en-US/docs/Web/API/WebHID_API).

Ngoài các thiết bị tiêu chuẩn này, còn có một số lượng lớn các thiết bị không phù hợp với bất kỳ lớp nào. Chúng cần driver tùy chỉnh và không thể truy cập từ web do mã gốc cần thiết để tận dụng chúng. Việc cài đặt một trong những thiết bị này thường liên quan đến việc tìm kiếm driver trên trang web của nhà sản xuất và lặp lại quá trình này nếu bạn muốn sử dụng thiết bị trên máy tính khác.

WebUSB cung cấp một cách để các dịch vụ thiết bị USB không được tiêu chuẩn hóa này được hiển thị lên web. Điều này có nghĩa là các nhà sản xuất phần cứng sẽ có thể cung cấp cách để thiết bị của họ được truy cập từ web mà không cần cung cấp API riêng.

Khi kết nối thiết bị tương thích WebUSB mới, trình duyệt hiển thị thông báo cung cấp liên kết đến trang web của nhà sản xuất. Khi đến trang web, trình duyệt nhắc yêu cầu quyền kết nối với thiết bị, sau đó thiết bị sẵn sàng sử dụng. Không cần tải xuống và cài đặt driver.

## Các giao diện

- {{domxref("USB")}}
  - : Cung cấp các thuộc tính và phương thức để tìm kiếm và kết nối với các thiết bị USB từ trang web.
- {{domxref("USBConnectionEvent")}}
  - : Loại sự kiện được truyền đến các sự kiện `USB` {{domxref("USB.connect_event", "connect")}} hoặc {{domxref("USB.disconnect_event", "disconnect")}} khi user agent phát hiện thiết bị USB mới đã được kết nối hoặc ngắt kết nối khỏi máy chủ.
- {{domxref("USBDevice")}}
  - : Cung cấp quyền truy cập vào siêu dữ liệu về thiết bị USB đã ghép nối và các phương thức để điều khiển nó.
- {{domxref("USBInTransferResult")}}
  - : Đại diện cho kết quả từ việc yêu cầu truyền dữ liệu từ thiết bị USB sang máy chủ USB.
- {{domxref("USBOutTransferResult")}}
  - : Đại diện cho kết quả từ việc yêu cầu truyền dữ liệu từ máy chủ USB sang thiết bị USB.
- {{domxref("USBIsochronousInTransferPacket")}}
  - : Đại diện cho trạng thái của một gói riêng lẻ từ yêu cầu truyền dữ liệu từ thiết bị USB sang máy chủ USB qua điểm cuối đẳng thời.
- {{domxref("USBIsochronousInTransferResult")}}
  - : Đại diện cho kết quả từ việc yêu cầu truyền dữ liệu từ thiết bị USB sang máy chủ USB.
- {{domxref("USBIsochronousOutTransferPacket")}}
  - : Đại diện cho trạng thái của một gói riêng lẻ từ yêu cầu truyền dữ liệu từ máy chủ USB sang thiết bị USB qua điểm cuối đẳng thời.
- {{domxref("USBIsochronousOutTransferResult")}}
  - : Đại diện cho kết quả từ việc yêu cầu truyền dữ liệu từ máy chủ USB sang thiết bị USB.
- {{domxref("USBConfiguration")}}
  - : Cung cấp thông tin về cấu hình cụ thể của thiết bị USB và các giao diện mà nó hỗ trợ.
- {{domxref("USBInterface")}}
  - : Cung cấp thông tin về một giao diện được cung cấp bởi thiết bị USB.
- {{domxref("USBAlternateInterface")}}
  - : Cung cấp thông tin về cấu hình cụ thể của một giao diện được cung cấp bởi thiết bị USB.
- {{domxref("USBEndPoint")}}
  - : Cung cấp thông tin về một điểm cuối được cung cấp bởi thiết bị USB.

## Ví dụ

### Truy cập thiết bị đã kết nối

Ví dụ sau minh họa cách truy cập thiết bị Arduino đã kết nối bằng cách sử dụng {{domxref("USB.requestDevice()")}}, với vendorId là `0x2341`.

```js
navigator.usb
  .requestDevice({ filters: [{ vendorId: 0x2341 }] })
  .then((device) => {
    console.log(device.productName); // "Arduino Micro"
    console.log(device.manufacturerName); // "Arduino LLC"
  })
  .catch((error) => {
    console.error(error);
  });
```

### Tìm tất cả các thiết bị đã kết nối

Bạn có thể tìm tất cả các thiết bị đã kết nối với {{domxref("USB.getDevices()")}}. Trong ví dụ sau, với thiết bị Arduino đã kết nối, tên sản phẩm và nhà sản xuất được in ra console.

```js
navigator.usb.getDevices().then((devices) => {
  devices.forEach((device) => {
    console.log(device.productName); // "Arduino Micro"
    console.log(device.manufacturerName); // "Arduino LLC"
  });
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Truy cập thiết bị USB trên Web](https://developer.chrome.com/docs/capabilities/usb)

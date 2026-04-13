---
title: Permissions API
slug: Web/API/Permissions_API
page-type: web-api-overview
browser-compat:
  - api.Permissions
  - api.Navigator.permissions
  - api.WorkerNavigator.permissions
spec-urls: https://w3c.github.io/permissions/
---

{{DefaultAPISidebar("Permissions API")}}{{AvailableInWorkers}}

**Permissions API** cung cấp một cách lập trình nhất quán để truy vấn trạng thái của các quyền API được gán cho ngữ cảnh hiện tại, chẳng hạn như trang web hoặc worker.
Ví dụ, nó có thể được sử dụng để xác định xem quyền truy cập vào một tính năng hoặc API cụ thể đã được cấp, từ chối, hay yêu cầu quyền người dùng cụ thể.

## Khái niệm và cách sử dụng

Trong lịch sử, các API khác nhau xử lý quyền của riêng chúng một cách không nhất quán. Permissions API cung cấp các công cụ cho phép nhà phát triển triển khai trải nghiệm người dùng nhất quán khi làm việc với quyền.

Các quyền từ API này hiệu quả tổng hợp tất cả các hạn chế bảo mật cho ngữ cảnh, bao gồm bất kỳ yêu cầu nào để API được sử dụng trong ngữ cảnh bảo mật, các hạn chế [Permissions-Policy](/en-US/docs/Web/HTTP/Reference/Headers/Permissions-Policy) được áp dụng cho tài liệu, yêu cầu tương tác người dùng và các lời nhắc người dùng.
Ví dụ, nếu một API bị hạn chế bởi chính sách quyền, quyền được trả về sẽ là `denied` và người dùng sẽ không được nhắc để cấp quyền truy cập.

Thuộc tính `permissions` đã được cung cấp trên đối tượng {{domxref("Navigator")}}, cả trong ngữ cảnh duyệt web tiêu chuẩn và ngữ cảnh worker ({{domxref("WorkerNavigator")}}), và trả về một đối tượng {{domxref("Permissions")}} cung cấp quyền truy cập vào chức năng Permissions API.

### Yêu cầu quyền

Nếu trạng thái quyền là `prompt`, người dùng phải xác nhận lời nhắc để cấp quyền truy cập vào tính năng.

Cơ chế kích hoạt lời nhắc này sẽ phụ thuộc vào API cụ thể, nó không được xác định là một phần của Permissions API.

### Thu hồi quyền

Việc thu hồi quyền không được quản lý bởi API.
Người dùng có thể xóa quyền cho các trang web cụ thể theo cách thủ công bằng cách sử dụng cài đặt trình duyệt.

### Các API nhận biết quyền

Không phải tất cả trạng thái quyền của API đều có thể truy vấn bằng Permissions API. Danh sách không đầy đủ các API nhận biết quyền bao gồm:

- [Background Synchronization API](/en-US/docs/Web/API/Background_Synchronization_API): `background-sync`
- [Clipboard API](/en-US/docs/Web/API/Clipboard_API#security_considerations): `clipboard-read`, `clipboard-write`
- [Compute Pressure API](/en-US/docs/Web/API/Compute_Pressure_API): `compute-pressure`
- [Geolocation API](/en-US/docs/Web/API/Geolocation_API#security_considerations): `geolocation`
- [Local Font Access API](/en-US/docs/Web/API/Local_Font_Access_API): `local-fonts`
- [Media Capture and Streams API](/en-US/docs/Web/API/Media_Capture_and_Streams_API): `microphone`, `camera`
- [Notifications API](/en-US/docs/Web/API/Notifications_API): `notifications`
- [Web-based Payment Handler API](/en-US/docs/Web/API/Web-Based_Payment_Handler_API): `payment-handler`
- [Push API](/en-US/docs/Web/API/Push_API): `push`
- [Screen Capture API](/en-US/docs/Web/API/Screen_Capture_API): `captured-surface-control`, `display-capture`
- [Screen Wake Lock API](/en-US/docs/Web/API/Screen_Wake_Lock_API): `screen-wake-lock`
- [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs): `accelerometer`, `gyroscope`, `magnetometer`, `ambient-light-sensor`
- [Storage Access API](/en-US/docs/Web/API/Storage_Access_API): `storage-access`, `top-level-storage-access`
- [Storage API](/en-US/docs/Web/API/Storage_API): `persistent-storage`
- [Web Bluetooth API](/en-US/docs/Web/API/Web_Bluetooth_API): `bluetooth`
- [Web MIDI API](/en-US/docs/Web/API/Web_MIDI_API): `midi`
- [Window Management API](/en-US/docs/Web/API/Window_Management_API): `window-management`

## Giao diện

- {{domxref("Permissions")}}
  - : Cung cấp chức năng Permission API cốt lõi, chẳng hạn như các phương thức để truy vấn và thu hồi quyền.
- {{domxref("PermissionStatus")}}
  - : Cung cấp quyền truy cập vào trạng thái hiện tại của quyền và trình xử lý sự kiện để phản hồi các thay đổi về trạng thái quyền.

### Mở rộng các giao diện khác

- {{domxref("Navigator.permissions")}} và {{domxref("WorkerNavigator.permissions")}} {{ReadOnlyInline}}
  - : Cung cấp quyền truy cập vào đối tượng {{domxref("Permissions")}} từ ngữ cảnh chính và ngữ cảnh worker tương ứng.

## Ví dụ

Chúng ta đã tạo một ví dụ có tên Location Finder.
Bạn có thể [chạy ví dụ trực tiếp](https://chrisdavidmills.github.io/location-finder-permissions-api/), [xem mã nguồn trên GitHub](https://github.com/chrisdavidmills/location-finder-permissions-api/tree/gh-pages), hoặc đọc thêm về cách hoạt động của nó trong bài viết [Using the Permissions API](/en-US/docs/Web/API/Permissions_API/Using_the_Permissions_API).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Using the Permissions API](/en-US/docs/Web/API/Permissions_API/Using_the_Permissions_API)
- {{DOMxRef("Notification.permission_static", "Notification.permission")}}
- [Privacy, permissions, and information security](/en-US/docs/Web/Privacy)

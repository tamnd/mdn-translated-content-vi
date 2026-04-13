---
title: Sensor
slug: Web/API/Sensor
page-type: web-api-interface
browser-compat: api.Sensor
---

{{securecontext_header}}{{APIRef("Sensor API")}}

Giao diện **`Sensor`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) là lớp cơ sở cho tất cả các giao diện cảm biến khác. Giao diện này không thể được sử dụng trực tiếp mà cung cấp các thuộc tính, trình xử lý sự kiện và phương thức được truy cập bởi các giao diện kế thừa từ nó.

Tính năng này có thể bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được thiết lập trên máy chủ của bạn.

{{InheritanceDiagram}}

Khi được tạo lần đầu, đối tượng `Sensor` ở trạng thái _rảnh_, nghĩa là nó không thực hiện phép đo nào. Sau khi phương thức {{domxref("Sensor.start()", "start()")}} được gọi, nó chuẩn bị đọc dữ liệu và khi sẵn sàng, sự kiện {{domxref("Sensor/activate_event", "activate")}} được gửi đi và cảm biến trở thành _đã kích hoạt_. Sau đó, nó gửi sự kiện {{domxref("Sensor/reading_event", "reading")}} mỗi khi có dữ liệu mới.

Khi xảy ra lỗi, sự kiện {{domxref("Sensor/error_event", "error")}} được gửi đi, quá trình đọc dừng lại và đối tượng `Sensor` trở về trạng thái _rảnh_. Phương thức {{domxref("Sensor.start()", "start()")}} cần được gọi lại trước khi có thể đọc thêm dữ liệu.

## Các giao diện dựa trên `Sensor`

Dưới đây là danh sách các giao diện dựa trên giao diện `Sensor`.

- {{domxref('Accelerometer')}}
- {{domxref('AmbientLightSensor')}}
- {{domxref('GravitySensor')}}
- {{domxref('Gyroscope')}}
- {{domxref('LinearAccelerationSensor')}}
- {{domxref('Magnetometer')}}
- {{domxref('OrientationSensor')}}

## Thuộc tính phiên bản

- {{domxref('Sensor.activated')}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết liệu cảm biến có đang hoạt động hay không.
- {{domxref('Sensor.hasReading')}} {{ReadOnlyInline}}
  - : Trả về một giá trị boolean cho biết liệu cảm biến có dữ liệu đọc hay không.
- {{domxref('Sensor.timestamp')}} {{ReadOnlyInline}}
  - : Trả về dấu thời gian của lần đọc cảm biến gần nhất.

## Phương thức phiên bản

- {{domxref('Sensor.start()')}}
  - : Kích hoạt một trong các cảm biến dựa trên `Sensor`.
- {{domxref('Sensor.stop()')}}
  - : Hủy kích hoạt một trong các cảm biến dựa trên `Sensor`.

## Sự kiện

- {{domxref('Sensor.activate_event', 'activate')}}
  - : Được kích hoạt khi cảm biến được kích hoạt.
- {{domxref('Sensor.error_event', 'error')}}
  - : Được kích hoạt khi xảy ra ngoại lệ trên cảm biến.
- {{domxref('Sensor.reading_event', 'reading')}}
  - : Được kích hoạt khi có dữ liệu đọc mới trên cảm biến.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

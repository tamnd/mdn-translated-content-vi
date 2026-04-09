---
title: Accelerometer
slug: Web/API/Accelerometer
page-type: web-api-interface
status:
  - experimental
browser-compat: api.Accelerometer
---

{{securecontext_header}}{{APIRef("Sensor API")}}{{SeeCompatTable}}

Giao diện **`Accelerometer`** của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) cung cấp trong mỗi lần đọc giá trị gia tốc tác dụng lên thiết bị dọc theo cả ba trục.

Để dùng cảm biến này, người dùng phải cấp quyền cho thiết bị cảm biến `'accelerometer'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API).

Tính năng này có thể bị chặn bởi [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Bộ khởi tạo

- {{domxref("Accelerometer.Accelerometer()", "Accelerometer()")}} {{Experimental_Inline}}
  - : Tạo một đối tượng `Accelerometer` mới.

## Thuộc tính thể hiện

_Ngoài các thuộc tính liệt kê bên dưới, `Accelerometer` còn kế thừa thuộc tính từ các giao diện cha của nó là {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

- {{domxref('Accelerometer.x')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị `double` chứa gia tốc của thiết bị theo trục x.
- {{domxref('Accelerometer.y')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị `double` chứa gia tốc của thiết bị theo trục y.
- {{domxref('Accelerometer.z')}} {{ReadOnlyInline}} {{Experimental_Inline}}
  - : Trả về một giá trị `double` chứa gia tốc của thiết bị theo trục z.

## Phương thức thể hiện

_`Accelerometer` không có phương thức riêng. Tuy nhiên, nó kế thừa phương thức từ các giao diện cha của nó là {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Sự kiện

_`Accelerometer` không có sự kiện riêng. Tuy nhiên, nó kế thừa sự kiện từ giao diện cha của nó là {{domxref('Sensor')}}._

## Ví dụ

Gia tốc thường được đọc trong bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}. Trong ví dụ dưới đây, việc này xảy ra sáu mươi lần mỗi giây.

```js
const acl = new Accelerometer({ frequency: 60 });
acl.addEventListener("reading", () => {
  console.log(`Gia tốc theo trục X ${acl.x}`);
  console.log(`Gia tốc theo trục Y ${acl.y}`);
  console.log(`Gia tốc theo trục Z ${acl.z}`);
});

acl.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

---
title: Gyroscope
slug: Web/API/Gyroscope
page-type: web-api-interface
browser-compat: api.Gyroscope
---

{{securecontext_header}}{{APIRef("Sensor API")}}

**`Gyroscope`** là một giao diện của [Sensor APIs](/en-US/docs/Web/API/Sensor_APIs) cung cấp vận tốc góc của thiết bị theo cả ba trục ở mỗi lần đọc.

Để dùng cảm biến này, người dùng phải cấp quyền cho cảm biến thiết bị `'gyroscope'` thông qua [Permissions API](/en-US/docs/Web/API/Permissions_API). Ngoài ra, tính năng này có thể bị chặn bởi một [Permissions Policy](/en-US/docs/Web/HTTP/Guides/Permissions_Policy) được đặt trên máy chủ của bạn.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("Gyroscope.Gyroscope", "Gyroscope()")}}
  - : Tạo một đối tượng `Gyroscope` mới.

## Thuộc tính thể hiện

- {{domxref('Gyroscope.x')}} {{ReadOnlyInline}}
  - : Trả về một số thực `double`, chứa vận tốc góc của thiết bị theo trục x của thiết bị.
- {{domxref('Gyroscope.y')}} {{ReadOnlyInline}}
  - : Trả về một số thực `double`, chứa vận tốc góc của thiết bị theo trục y của thiết bị.
- {{domxref('Gyroscope.z')}} {{ReadOnlyInline}}
  - : Trả về một số thực `double`, chứa vận tốc góc của thiết bị theo trục z của thiết bị.

## Phương thức thể hiện

_`Gyroscope` không có phương thức riêng. Tuy nhiên, nó kế thừa các phương thức từ các giao diện cha của nó, {{domxref("Sensor")}} và {{domxref("EventTarget")}}._

## Sự kiện

_`Gyroscope` không có sự kiện riêng. Tuy nhiên, nó kế thừa các sự kiện từ giao diện cha của nó, {{domxref('Sensor')}}._

## Ví dụ

Gyroscope thường được đọc trong bộ gọi lại sự kiện {{domxref('Sensor.reading_event', 'reading')}}. Trong ví dụ dưới đây, điều này xảy ra sáu mươi lần mỗi giây.

```js
let gyroscope = new Gyroscope({ frequency: 60 });

gyroscope.addEventListener("reading", (e) => {
  console.log(`Angular velocity along the X-axis ${gyroscope.x}`);
  console.log(`Angular velocity along the Y-axis ${gyroscope.y}`);
  console.log(`Angular velocity along the Z-axis ${gyroscope.z}`);
});
gyroscope.start();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

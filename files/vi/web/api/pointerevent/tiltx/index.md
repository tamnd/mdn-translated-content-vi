---
title: "PointerEvent: tiltX property"
short-title: tiltX
slug: Web/API/PointerEvent/tiltX
page-type: web-api-instance-property
browser-compat: api.PointerEvent.tiltX
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`tiltX`** của giao diện {{domxref("PointerEvent")}} là góc (tính bằng độ) giữa _mặt phẳng Y-Z_ của con trỏ và màn hình.
Thuộc tính này thường chỉ hữu ích cho loại con trỏ bút/bút stylus.

Tùy thuộc vào phần cứng và nền tảng cụ thể, tác nhân người dùng thường chỉ nhận được một tập giá trị cho hướng của bộ chuyển đổi so với mặt phẳng màn hình - hoặc là `tiltX` và {{domxref("PointerEvent.tiltY", "tiltY")}}, hoặc là {{domxref("PointerEvent.altitudeAngle", "altitudeAngle")}} và {{domxref("PointerEvent.azimuthAngle", "azimuthAngle")}}.

![Góc tiltX của con trỏ so với góc tiltY](tilt_x_y_angles.svg)

Để xem thêm minh họa về thuộc tính này, hãy xem [Hình 2 trong đặc tả](https://w3c.github.io/pointerevents/#dom-pointerevent-tiltx).

## Giá trị

Góc tính bằng độ giữa mặt phẳng Y-Z của con trỏ (bút stylus) và màn hình. Khoảng giá trị là `-90` đến `90`, bao gồm cả hai đầu mút, trong đó giá trị dương là nghiêng về bên phải.
Đối với các thiết bị không hỗ trợ thuộc tính này, giá trị là `0`.

## Ví dụ

Ví dụ này minh họa cách truy cập đơn giản các thuộc tính `tiltX` và {{domxref("PointerEvent.tiltY","tiltY")}}.

```js
someElement.addEventListener("pointerdown", (event) => {
  processTilt(event.tiltX, event.tiltY);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("PointerEvent.tiltY")}}
- {{domxref("PointerEvent.altitudeAngle")}}
- {{domxref("PointerEvent.azimuthAngle")}}

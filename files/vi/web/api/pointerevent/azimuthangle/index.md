---
title: "PointerEvent: azimuthAngle property"
short-title: azimuthAngle
slug: Web/API/PointerEvent/azimuthAngle
page-type: web-api-instance-property
browser-compat: api.PointerEvent.azimuthAngle
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`azimuthAngle`** của giao diện {{domxref("PointerEvent")}} đại diện cho góc giữa mặt phẳng Y-Z và mặt phẳng chứa cả trục của bộ chuyển đổi (con trỏ hoặc bút stylus) và trục Y.

Tùy thuộc vào phần cứng và nền tảng cụ thể, tác nhân người dùng thường chỉ nhận được một tập giá trị cho hướng của bộ chuyển đổi so với mặt phẳng màn hình - hoặc là {{domxref("PointerEvent.tiltX", "tiltX")}} và {{domxref("PointerEvent.tiltY", "tiltY")}}, hoặc là {{domxref("PointerEvent.altitudeAngle", "altitudeAngle")}} và `azimuthAngle`.

![Góc phương vị của con trỏ so với góc độ cao](azimuth_altitude_angles.svg)

Để xem thêm minh họa về thuộc tính này, hãy xem [Hình 5 trong đặc tả](https://w3c.github.io/pointerevents/#figure_azimuthAngle).

## Giá trị

Một góc tính bằng radian trong khoảng `0` đến `2π`, trong đó `0` đại diện cho bộ chuyển đổi có đầu nhọn hướng về phía giá trị X tăng dần (chỉ về hướng "3 giờ" khi nhìn thẳng xuống) trên mặt phẳng X-Y, và các giá trị tăng dần theo chiều kim đồng hồ (`π/2` tại "6 giờ", `π` tại "9 giờ", `3π/2` tại "12 giờ").

Khi bộ chuyển đổi vuông góc với bề mặt ({{domxref("PointerEvent.altitudeAngle", "altitudeAngle")}} bằng `π/2`), giá trị là 0.
Đối với phần cứng và nền tảng không báo cáo góc nghiêng hoặc góc độ, giá trị là `0`.

## Ví dụ

```js
someElement.addEventListener("pointerdown", (event) => {
  process_angles(event.altitudeAngle, event.azimuthAngle);
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("PointerEvent.altitudeAngle") }}
- {{ domxref("PointerEvent.tiltX") }}
- {{ domxref("PointerEvent.tiltY") }}
- {{ domxref("Touch.azimuthAngle") }}

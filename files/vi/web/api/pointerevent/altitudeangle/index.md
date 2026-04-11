---
title: "PointerEvent: altitudeAngle property"
short-title: altitudeAngle
slug: Web/API/PointerEvent/altitudeAngle
page-type: web-api-instance-property
browser-compat: api.PointerEvent.altitudeAngle
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`altitudeAngle`** của giao diện {{domxref("PointerEvent")}} đại diện cho góc giữa trục của một bộ chuyển đổi (một con trỏ hoặc bút stylus) và mặt phẳng X-Y của màn hình thiết bị.
Góc độ cao mô tả liệu bộ chuyển đổi có vuông góc với màn hình, song song với màn hình, hay ở góc độ nào đó ở giữa.

Tùy thuộc vào phần cứng và nền tảng cụ thể, tác nhân người dùng thường chỉ nhận được một tập giá trị cho hướng của bộ chuyển đổi so với mặt phẳng màn hình - hoặc là {{domxref("PointerEvent.tiltX", "tiltX")}} và {{domxref("PointerEvent.tiltY", "tiltY")}}, hoặc là `altitudeAngle` và {{domxref("PointerEvent.azimuthAngle", "azimuthAngle")}}.

![Góc phương vị của con trỏ so với góc độ cao](./azimuth_altitude_angles.svg)

Để xem thêm minh họa về thuộc tính này, hãy xem [Hình 4 trong đặc tả](https://w3c.github.io/pointerevents/#figure_altitudeAngle).

## Giá trị

Một góc tính bằng radian trong khoảng `0` đến `π/2`, trong đó `0` là song song với bề mặt thiết bị (mặt phẳng X-Y), và `π/2` là vuông góc với bề mặt.
Mặc định là `π/2` (vuông góc với bề mặt), khác với [`altitudeAngle` trong touch events](https://w3c.github.io/touch-events/#dom-touch-altitudeangle) mặc định là `0` (song song với bề mặt).
Đối với phần cứng và nền tảng không báo cáo góc nghiêng hoặc góc độ, giá trị là `π/2`.

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

- {{ domxref("PointerEvent.azimuthAngle") }}
- {{ domxref("PointerEvent.tiltX") }}
- {{ domxref("PointerEvent.tiltY") }}
- {{ domxref("Touch.altitudeAngle") }}

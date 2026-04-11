---
title: "Touch: thuộc tính azimuthAngle"
short-title: azimuthAngle
slug: Web/API/Touch/azimuthAngle
page-type: web-api-instance-property
browser-compat: api.Touch.azimuthAngle
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`azimuthAngle`** của giao diện {{domxref("Touch")}} trả về góc giữa mặt phẳng Y-Z và mặt phẳng chứa cả trục bộ chuyển đổi (con trỏ hoặc stylus) và trục Y. Đây là hướng la bàn mà bộ chuyển đổi đang chỉ so với bề mặt thiết bị.

Với phần cứng và nền tảng không báo cáo độ nghiêng hay góc, giá trị là `0`. Khi bộ chuyển đổi vuông góc với bề mặt ({{domxref("Touch.altitudeAngle", "altitudeAngle")}} bằng `π/2`), giá trị là `0`.

## Giá trị

Góc tính bằng radian trong khoảng `0` đến `2π`, trong đó `0` là bộ chuyển đổi chỉ theo hướng tăng X (chỉ về "3 giờ" nếu nhìn từ trên xuống) trên mặt phẳng X-Y, và các giá trị tăng dần theo chiều kim đồng hồ (`π/2` ở "6 giờ", `π` ở "9 giờ", `3π/2` ở "12 giờ").

## Ví dụ

### Sử dụng cơ bản

```js
someElement.addEventListener(
  "touchstart",
  (event) => {
    for (const touch of event.changedTouches) {
      // Ghi lại góc độ cao và phương vị cho mỗi điểm chạm bằng stylus.
      if (touch.touchType === "stylus") {
        console.log(`altitudeAngle: ${touch.altitudeAngle}`);
        console.log(`azimuthAngle: ${touch.azimuthAngle}`);
      }
    }
  },
  false,
);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Touch.altitudeAngle")}}
- {{domxref("Touch.touchType")}}
- {{domxref("PointerEvent.azimuthAngle")}}
- [Sự kiện touch](/en-US/docs/Web/API/Touch_events)

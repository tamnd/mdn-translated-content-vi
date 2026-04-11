---
title: "Touch: thuộc tính altitudeAngle"
short-title: altitudeAngle
slug: Web/API/Touch/altitudeAngle
page-type: web-api-instance-property
browser-compat: api.Touch.altitudeAngle
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`altitudeAngle`** của giao diện {{domxref("Touch")}} trả về góc giữa trục của bộ chuyển đổi (con trỏ hoặc bút stylus) và mặt phẳng X-Y của màn hình thiết bị. Góc độ cao mô tả bộ chuyển đổi đang vuông góc, song song hay ở một góc nào đó so với màn hình.

> [!NOTE]
> Giá trị mặc định của `altitudeAngle` là `0` (song song với bề mặt thiết bị), khác với thuộc tính {{domxref("PointerEvent.altitudeAngle")}} có giá trị mặc định là `π/2` (vuông góc với bề mặt).

Với phần cứng và nền tảng không báo cáo độ nghiêng hay góc, giá trị là `0`.

## Giá trị

Góc tính bằng radian trong khoảng `0` đến `π/2`, trong đó `0` là song song với bề mặt thiết bị (mặt phẳng X-Y), và `π/2` là vuông góc với bề mặt.

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

- {{domxref("Touch.azimuthAngle")}}
- {{domxref("Touch.touchType")}}
- {{domxref("PointerEvent.altitudeAngle")}}
- [Sự kiện touch](/en-US/docs/Web/API/Touch_events)

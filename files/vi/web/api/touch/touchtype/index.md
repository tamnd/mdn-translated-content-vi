---
title: "Touch: thuộc tính touchType"
short-title: touchType
slug: Web/API/Touch/touchType
page-type: web-api-instance-property
browser-compat: api.Touch.touchType
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`touchType`** của giao diện {{domxref("Touch")}} trả về loại thiết bị tạo ra cử chỉ chạm, chẳng hạn stylus hay ngón tay chạm trực tiếp.

## Giá trị

Một chuỗi từ bảng liệt kê `TouchType`. Các giá trị có thể là:

- `"direct"`
  - : Cử chỉ chạm được thực hiện bằng tiếp xúc trực tiếp, chẳng hạn ngón tay trên màn hình.
- `"stylus"`
  - : Cử chỉ chạm được thực hiện bằng stylus hoặc bút.

## Ví dụ

### Sử dụng cơ bản

```js
someElement.addEventListener(
  "touchstart",
  (event) => {
    for (const touch of event.changedTouches) {
      console.log(`Touch type: ${touch.touchType}`);

      if (touch.touchType === "stylus") {
        // Xử lý input từ stylus, chẳng hạn góc độ cao và phương vị.
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
- {{domxref("Touch.azimuthAngle")}}
- [Sự kiện touch](/en-US/docs/Web/API/Touch_events)

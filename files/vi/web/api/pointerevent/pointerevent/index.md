---
title: "PointerEvent: PointerEvent() constructor"
short-title: PointerEvent()
slug: Web/API/PointerEvent/PointerEvent
page-type: web-api-constructor
browser-compat: api.PointerEvent.PointerEvent
---

{{APIRef("Pointer Events")}}

Hàm khởi tạo **`PointerEvent()`** tạo một đối tượng {{domxref("PointerEvent")}} tổng hợp và không đáng tin cậy.

## Cú pháp

```js-nolint
new PointerEvent(type)
new PointerEvent(type, options)
```

### Tham số

- `type`
  - : Một chuỗi đại diện cho tên của sự kiện
    (xem [các loại sự kiện PointerEvent](/en-US/docs/Web/API/PointerEvent#pointer_event_types)).
- `options` {{optional_inline}}
  - : Một đối tượng, _ngoài các thuộc tính được định nghĩa trong {{domxref("MouseEvent/MouseEvent", "MouseEvent()")}}_, có thể có các thuộc tính sau:
    - `pointerId`
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("PointerEvent.pointerId")}} cho thực thể.
    - `width`
      - : Một số, mặc định là `1`, đặt giá trị của {{domxref("PointerEvent.width")}} cho thực thể.
    - `height`
      - : Một số, mặc định là `1`, đặt giá trị của {{domxref("PointerEvent.height")}} cho thực thể.
    - `pressure`
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("PointerEvent.pressure")}} cho thực thể.
    - `tangentialPressure`
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("PointerEvent.tangentialPressure")}} cho thực thể.
    - `altitudeAngle`
      - : Một số đặt giá trị của {{domxref("PointerEvent.altitudeAngle")}} cho thực thể.
    - `azimuthAngle`
      - : Một số đặt giá trị của {{domxref("PointerEvent.azimuthAngle")}} cho thực thể.
    - `tiltX`
      - : Một số đặt giá trị của {{domxref("PointerEvent.tiltX")}} cho thực thể.
    - `tiltY`
      - : Một số đặt giá trị của {{domxref("PointerEvent.tiltY")}} cho thực thể.
    - `twist`
      - : Một số, mặc định là `0`, đặt giá trị của {{domxref("PointerEvent.twist")}} cho thực thể.
    - `pointerType`
      - : Một chuỗi, mặc định là `""`, đặt giá trị của {{domxref("PointerEvent.pointerType")}} cho thực thể.
    - `isPrimary`
      - : Một giá trị boolean, mặc định là `false`, đặt giá trị của {{domxref("PointerEvent.isPrimary")}} cho thực thể.

### Giá trị trả về

Một đối tượng {{domxref("PointerEvent")}} mới.

## Ví dụ

```js
const moveEvent = new PointerEvent("pointermove");

const downEvent = new PointerEvent("pointerdown", {
  pointerId: 1,
  bubbles: true,
  cancelable: true,
  pointerType: "touch",
  width: 100,
  height: 100,
  isPrimary: true,
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

---
title: "PointerEvent: tangentialPressure property"
short-title: tangentialPressure
slug: Web/API/PointerEvent/tangentialPressure
page-type: web-api-instance-property
browser-compat: api.PointerEvent.tangentialPressure
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`tangentialPressure`** của giao diện {{domxref("PointerEvent")}} đại diện cho lực nhấn tiếp tuyến chuẩn hóa của đầu vào con trỏ (còn được gọi là barrel pressure hoặc [cylinder stress](https://en.wikipedia.org/wiki/Cylinder_stress)).

## Giá trị

Một số thực (`float`) đại diện cho lực nhấn tiếp tuyến chuẩn hóa của đầu vào con trỏ trong khoảng `-1` đến `1`, bao gồm cả hai đầu mút, trong đó `0` là vị trí trung tính của điều khiển.

Lưu ý rằng một số phần cứng chỉ có thể hỗ trợ các giá trị dương trong khoảng `0` đến `1`. Đối với phần cứng không hỗ trợ lực nhấn tiếp tuyến, giá trị sẽ là `0`.

## Ví dụ

Trong đoạn code này, khi sự kiện {{domxref("Element/pointerdown_event", "pointerdown")}} được kích hoạt, các hàm khác nhau sẽ được gọi tùy thuộc vào giá trị của thuộc tính `tangentialPressure` của sự kiện.

```js
someElement.addEventListener("pointerdown", (event) => {
  if (event.tangentialPressure === 0) {
    // No pressure
    process_no_tanPressure(event);
  } else if (event.tangentialPressure === 1) {
    // Maximum pressure
    process_max_tanPressure(event);
  } else {
    // Default
    process_tanPressure(event);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Touch.force") }}

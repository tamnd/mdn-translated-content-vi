---
title: "PointerEvent: pressure property"
short-title: pressure
slug: Web/API/PointerEvent/pressure
page-type: web-api-instance-property
browser-compat: api.PointerEvent.pressure
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`pressure`** của giao diện {{domxref("PointerEvent")}} cho biết lực nhấn chuẩn hóa của đầu vào con trỏ.

## Giá trị

Lực nhấn chuẩn hóa của đầu vào con trỏ trong khoảng `0` đến `1`, bao gồm cả hai đầu mút, trong đó `0` và `1` lần lượt biểu thị lực nhấn tối thiểu và tối đa mà phần cứng có thể phát hiện. Đối với phần cứng không hỗ trợ lực nhấn, chẳng hạn như chuột, giá trị là `0.5` khi con trỏ ở trạng thái nút được nhấn và `0` trong trường hợp còn lại.

## Ví dụ

Trong đoạn code này, khi sự kiện {{domxref("Element/pointerdown_event", "pointerdown")}} được kích hoạt, các hàm khác nhau sẽ được gọi tùy thuộc vào giá trị của thuộc tính `pressure` của sự kiện.

```js
someElement.addEventListener("pointerdown", (event) => {
  if (event.pressure === 0) {
    // No pressure
    process_no_pressure(event);
  } else if (event.pressure === 1) {
    // Maximum pressure
    process_max_pressure(event);
  } else {
    // Default
    processPressure(event);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Touch.force") }}

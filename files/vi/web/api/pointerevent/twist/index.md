---
title: "PointerEvent: twist property"
short-title: twist
slug: Web/API/PointerEvent/twist
page-type: web-api-instance-property
browser-compat: api.PointerEvent.twist
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`twist`** của giao diện {{domxref("PointerEvent")}} đại diện cho độ xoay theo chiều kim đồng hồ của con trỏ (ví dụ: bút stylus) quanh trục chính của nó, tính bằng độ.

## Giá trị

Một giá trị `long` đại diện cho lượng xoay, tính bằng độ, áp dụng cho bộ chuyển đổi (con trỏ). Giá trị trong khoảng `0` đến `359`, bao gồm cả hai đầu mút. Đối với các thiết bị không báo cáo `twist`, giá trị là `0`.

## Ví dụ

Khi sự kiện {{domxref("Element/pointerdown_event", "pointerdown")}} được kích hoạt, các hàm khác nhau được gọi tùy thuộc vào giá trị của thuộc tính `twist` của sự kiện.

```js
someElement.addEventListener("pointerdown", (event) => {
  if (event.twist === 0) {
    // No twist
    process_no_twist(event);
  } else {
    // Default
    process_twist(event);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{ domxref("Touch.force") }}

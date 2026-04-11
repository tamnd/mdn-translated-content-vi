---
title: "PointerEvent: width property"
short-title: width
slug: Web/API/PointerEvent/width
page-type: web-api-instance-property
browser-compat: api.PointerEvent.width
---

{{ APIRef("Pointer Events") }}

Thuộc tính chỉ đọc **`width`** của giao diện {{domxref("PointerEvent")}} đại diện cho chiều rộng của hình học tiếp xúc của con trỏ theo trục x, tính bằng pixel CSS. Tùy thuộc vào nguồn của thiết bị con trỏ (ví dụ: ngón tay), với một con trỏ nhất định, mỗi sự kiện có thể tạo ra giá trị khác nhau.

Nếu phần cứng đầu vào không thể báo cáo hình học tiếp xúc cho trình duyệt, chiều rộng mặc định là `1`.

## Giá trị

Chiều rộng của vùng tiếp xúc của sự kiện (tính bằng pixel CSS).

## Ví dụ

Ví dụ này minh họa cách sử dụng các thuộc tính `width` và {{domxref("PointerEvent.height","height")}} của giao diện {{domxref("PointerEvent")}} để tính diện tích tiếp xúc.

```js
target.addEventListener("pointerdown", (ev) => {
  // Calculate the contact area
  const area = ev.width * ev.height;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

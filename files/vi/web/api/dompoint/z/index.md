---
title: "DOMPoint: z property"
short-title: z
slug: Web/API/DOMPoint/z
page-type: web-api-instance-property
browser-compat: api.DOMPoint.z
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`z`** của giao diện **`DOMPoint`** xác định tọa độ độ sâu của điểm trong không gian.

Trừ khi có các phép biến đổi thay đổi hướng của hệ trục, giá trị `z` bằng 0 là mặt phẳng màn hình, với giá trị dương kéo dài ra phía trước về phía người dùng và giá trị âm lui về phía sau màn hình.

## Giá trị

Giá trị dấu phẩy động độ chính xác kép biểu thị giá trị tọa độ _z_ của điểm. Giá trị này là **không giới hạn**, nghĩa là nó được phép là vô hạn hoặc không hợp lệ (tức là giá trị của nó có thể là {{jsxref("NaN")}} hoặc {{jsxref("Infinity", "±Infinity")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính tọa độ khác: {{domxref("DOMPoint.x", "x")}}, {{domxref("DOMPoint.y", "y")}} và giá trị phối cảnh {{domxref("DOMPoint.w", "w")}}.

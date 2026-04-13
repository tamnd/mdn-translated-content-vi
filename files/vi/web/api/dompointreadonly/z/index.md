---
title: "DOMPointReadOnly: z property"
short-title: z
slug: Web/API/DOMPointReadOnly/z
page-type: web-api-instance-property
browser-compat: api.DOMPointReadOnly.z
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`z`** của giao diện **`DOMPointReadOnly`** lưu tọa độ độ sâu z của điểm chỉ đọc trong không gian.

Nếu script của bạn cần thay đổi giá trị của thuộc tính này, bạn nên sử dụng đối tượng {{domxref("DOMPoint")}} thay thế.

Nói chung, các giá trị `z` dương nghĩa là hướng về phía người dùng (ra khỏi màn hình), còn các giá trị `z` âm nghĩa là hướng ra xa người dùng (vào màn hình), giả sử không có biến đổi nào đảo chiều.

## Giá trị

Một giá trị số thực dấu phẩy động độ chính xác kép cho biết giá trị tọa độ z của điểm. Giá trị này **không bị giới hạn**, nghĩa là nó được phép là vô hạn hoặc không hợp lệ (tức là giá trị của nó có thể là {{jsxref("NaN")}} hoặc {{jsxref("Infinity", "±Infinity")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính tọa độ khác: {{domxref("DOMPointReadOnly.x", "x")}}, {{domxref("DOMPointReadOnly.y", "y")}} và giá trị phối cảnh {{domxref("DOMPointReadOnly.w", "w")}}.

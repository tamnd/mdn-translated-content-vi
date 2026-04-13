---
title: "DOMPointReadOnly: y property"
short-title: y
slug: Web/API/DOMPointReadOnly/y
page-type: web-api-instance-property
browser-compat: api.DOMPointReadOnly.y
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`y`** của giao diện **`DOMPointReadOnly`** lưu tọa độ dọc y của điểm chỉ đọc trong không gian.

Nếu script của bạn cần thay đổi giá trị của thuộc tính này, bạn nên sử dụng đối tượng {{domxref("DOMPoint")}} thay thế.

Nói chung, các giá trị `y` dương nghĩa là hướng xuống, còn các giá trị `y` âm nghĩa là hướng lên, giả sử không có biến đổi nào đảo chiều.

## Giá trị

Một giá trị số thực dấu phẩy động độ chính xác kép cho biết giá trị tọa độ y của điểm. Giá trị này **không bị giới hạn**, nghĩa là nó được phép là vô hạn hoặc không hợp lệ (tức là giá trị của nó có thể là {{jsxref("NaN")}} hoặc {{jsxref("Infinity", "±Infinity")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính tọa độ khác: {{domxref("DOMPointReadOnly.x", "x")}}, {{domxref("DOMPointReadOnly.z", "z")}} và giá trị phối cảnh {{domxref("DOMPointReadOnly.w", "w")}}.

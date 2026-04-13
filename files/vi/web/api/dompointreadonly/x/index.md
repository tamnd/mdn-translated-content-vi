---
title: "DOMPointReadOnly: x property"
short-title: x
slug: Web/API/DOMPointReadOnly/x
page-type: web-api-instance-property
browser-compat: api.DOMPointReadOnly.x
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`x`** của giao diện **`DOMPointReadOnly`** lưu tọa độ ngang x của điểm chỉ đọc trong không gian. Thuộc tính này không thể thay đổi bằng mã JavaScript trong phiên bản chỉ đọc của đối tượng `DOMPoint`.

Nói chung, các giá trị `x` dương nghĩa là bên phải, còn các giá trị `x` âm nghĩa là bên trái, giả sử không có biến đổi nào đảo chiều.

## Giá trị

Một giá trị số thực dấu phẩy động độ chính xác kép cho biết giá trị tọa độ x của điểm. Giá trị này **không bị giới hạn**, nghĩa là nó được phép là vô hạn hoặc không hợp lệ (tức là giá trị của nó có thể là {{jsxref("NaN")}} hoặc {{jsxref("Infinity", "±Infinity")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính tọa độ khác: {{domxref("DOMPointReadOnly.y", "y")}}, {{domxref("DOMPointReadOnly.z", "z")}} và giá trị phối cảnh {{domxref("DOMPointReadOnly.w", "w")}}.

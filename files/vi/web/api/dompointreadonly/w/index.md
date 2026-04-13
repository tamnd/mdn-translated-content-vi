---
title: "DOMPointReadOnly: w property"
short-title: w
slug: Web/API/DOMPointReadOnly/w
page-type: web-api-instance-property
browser-compat: api.DOMPointReadOnly.w
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`w`** của giao diện **`DOMPointReadOnly`** lưu giá trị phối cảnh `w` của điểm chỉ đọc trong không gian.

Nếu script của bạn cần thay đổi giá trị của thuộc tính này, bạn nên sử dụng đối tượng {{domxref("DOMPoint")}} thay thế.

## Giá trị

Một giá trị số thực dấu phẩy động độ chính xác kép cho biết giá trị phối cảnh `w` của điểm. Giá trị này **không bị giới hạn**, nghĩa là nó được phép là vô hạn hoặc không hợp lệ (tức là giá trị của nó có thể là {{jsxref("NaN")}} hoặc {{jsxref("Infinity", "±Infinity")}}). Giá trị mặc định là `1.0`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính tọa độ khác: {{domxref("DOMPointReadOnly.x", "x")}}, {{domxref("DOMPointReadOnly.y", "y")}} và {{domxref("DOMPointReadOnly.z", "z")}}.

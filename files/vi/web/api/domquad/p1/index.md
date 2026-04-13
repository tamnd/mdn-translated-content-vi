---
title: "DOMQuad: p1 property"
short-title: p1
slug: Web/API/DOMQuad/p1
page-type: web-api-instance-property
browser-compat: api.DOMQuad.p1
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`p1`** của giao diện **`DOMQuad`** giữ đối tượng {{domxref("DOMPoint")}} đại diện cho một trong bốn góc của `DOMQuad`. Khi được tạo từ {{domxref("DOMQuad.fromRect_static", "DOMQuad.fromRect()")}}, đây là điểm (x, y).

## Giá trị

Đối tượng {{domxref("DOMPoint")}} bao gồm các giá trị dấu phẩy động độ chính xác kép sau:

- {{domxref("DOMPoint.x")}}: Tọa độ ngang.
- {{domxref("DOMPoint.y")}}: Tọa độ dọc.
- {{domxref("DOMPoint.z")}}: Tọa độ chiều sâu.
- {{domxref("DOMPoint.w")}}: Giá trị phối cảnh. Giá trị mặc định là 1.0.

Mỗi giá trị này là **không bị hạn chế**, có nghĩa là nó được phép là vô cực hoặc không hợp lệ (tức là giá trị của nó có thể là {{jsxref("NaN")}} hoặc {{jsxref("Infinity", "±Infinity")}}).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính `DOMPoint` khác: {{domxref("DOMQuad.p2", "p2")}},
  {{domxref("DOMQuad.p3", "p3")}}, và {{domxref("DOMQuad.p4", "p4")}}.

---
title: "DOMQuad: p4 property"
short-title: p4
slug: Web/API/DOMQuad/p4
page-type: web-api-instance-property
browser-compat: api.DOMQuad.p4
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Thuộc tính **`p4`** của giao diện **`DOMQuad`** giữ đối tượng {{domxref("DOMPoint")}} đại diện cho một trong bốn góc của `DOMQuad`. Khi được tạo từ {{domxref("DOMQuad.fromRect_static", "DOMQuad.fromRect()")}}, đây là điểm (x, y + height).

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

- Các thuộc tính `DOMPoint` khác: {{domxref("DOMQuad.p1", "p1")}},
  {{domxref("DOMQuad.p2", "p2")}}, và {{domxref("DOMQuad.p3", "p3")}}.

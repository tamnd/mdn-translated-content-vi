---
title: DOMRectReadOnly
slug: Web/API/DOMRectReadOnly
page-type: web-api-interface
browser-compat: api.DOMRectReadOnly
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Giao diện **`DOMRectReadOnly`** xác định các thuộc tính tiêu chuẩn (cũng được sử dụng bởi {{domxref("DOMRect")}}) để định nghĩa một hình chữ nhật có các thuộc tính bất biến.

## Hàm khởi tạo

- {{domxref("DOMRectReadOnly.DOMRectReadOnly","DOMRectReadOnly()")}}
  - : Được định nghĩa để tạo một đối tượng `DOMRectReadOnly` mới.

## Thuộc tính phiên bản

- {{domxref("DOMRectReadOnly.x")}} {{ReadOnlyInline}}
  - : Trả về tọa độ x của gốc tọa độ `DOMRectReadOnly`.
- {{domxref("DOMRectReadOnly.y")}} {{ReadOnlyInline}}
  - : Trả về tọa độ y của gốc tọa độ `DOMRectReadOnly`.
- {{domxref("DOMRectReadOnly.width")}} {{ReadOnlyInline}}
  - : Trả về chiều rộng của `DOMRectReadOnly`.
- {{domxref("DOMRectReadOnly.height")}} {{ReadOnlyInline}}
  - : Trả về chiều cao của `DOMRectReadOnly`.
- {{domxref("DOMRectReadOnly.top")}} {{ReadOnlyInline}}
  - : Trả về giá trị tọa độ trên cùng của `DOMRectReadOnly` (thường giống với `y`).
- {{domxref("DOMRectReadOnly.right")}} {{ReadOnlyInline}}
  - : Trả về giá trị tọa độ bên phải của `DOMRectReadOnly` (thường giống với `x + width`).
- {{domxref("DOMRectReadOnly.bottom")}} {{ReadOnlyInline}}
  - : Trả về giá trị tọa độ dưới cùng của `DOMRectReadOnly` (thường giống với `y + height`).
- {{domxref("DOMRectReadOnly.left")}} {{ReadOnlyInline}}
  - : Trả về giá trị tọa độ bên trái của `DOMRectReadOnly` (thường giống với `x`).

## Phương thức tĩnh

- {{domxref("DOMRectReadOnly/fromRect_static", "DOMRectReadOnly.fromRect()")}}
  - : Tạo một đối tượng `DOMRectReadOnly` mới với vị trí và kích thước cho trước.

## Phương thức phiên bản

- {{domxref("DOMRectReadOnly.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `DOMRectReadOnly`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}

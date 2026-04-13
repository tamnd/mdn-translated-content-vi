---
title: DOMRect
slug: Web/API/DOMRect
page-type: web-api-interface
browser-compat: api.DOMRect
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

**`DOMRect`** mô tả kích thước và vị trí của một hình chữ nhật.

Loại hộp được đại diện bởi `DOMRect` được chỉ định bởi phương thức hoặc thuộc tính trả về nó. Ví dụ, {{domxref("Range.getBoundingClientRect()")}} chỉ định hình chữ nhật bao quanh nội dung của phạm vi bằng các đối tượng đó.

Nó kế thừa từ lớp cha, {{domxref("DOMRectReadOnly")}}.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DOMRect.DOMRect","DOMRect()")}}
  - : Tạo một đối tượng `DOMRect` mới.

## Thuộc tính phiên bản

_`DOMRect` kế thừa các thuộc tính từ lớp cha, {{domxref("DOMRectReadOnly")}}. Sự khác biệt là chúng không còn là chỉ đọc nữa._

- {{domxref("DOMRect.x")}}
  - : Tọa độ x của gốc `DOMRect` (thường là góc trên bên trái của hình chữ nhật).
- {{domxref("DOMRect.y")}}
  - : Tọa độ y của gốc `DOMRect` (thường là góc trên bên trái của hình chữ nhật).
- {{domxref("DOMRect.width")}}
  - : Chiều rộng của `DOMRect`.
- {{domxref("DOMRect.height")}}
  - : Chiều cao của `DOMRect`.
- {{domxref("DOMRectReadOnly.top")}}
  - : Trả về giá trị tọa độ trên của `DOMRect` (cùng giá trị với `y`, hoặc `y + height` nếu `height` là âm).
- {{domxref("DOMRectReadOnly.right")}}
  - : Trả về giá trị tọa độ phải của `DOMRect` (cùng giá trị với `x + width`, hoặc `x` nếu `width` là âm).
- {{domxref("DOMRectReadOnly.bottom")}}
  - : Trả về giá trị tọa độ dưới của `DOMRect` (cùng giá trị với `y + height`, hoặc `y` nếu `height` là âm).
- {{domxref("DOMRectReadOnly.left")}}
  - : Trả về giá trị tọa độ trái của `DOMRect` (cùng giá trị với `x`, hoặc `x + width` nếu `width` là âm).

## Phương thức tĩnh

_`DOMRect` cũng có thể kế thừa các phương thức tĩnh từ lớp cha, {{domxref("DOMRectReadOnly")}}._

- {{domxref("DOMRect/fromRect_static", "DOMRect.fromRect()")}}
  - : Tạo một đối tượng `DOMRect` mới với vị trí và kích thước đã cho.

## Phương thức phiên bản

_`DOMRect` có thể kế thừa các phương thức từ lớp cha, {{domxref("DOMRectReadOnly")}}._

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMPoint")}}

---
title: DOMQuad
slug: Web/API/DOMQuad
page-type: web-api-interface
browser-compat: api.DOMQuad
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

`DOMQuad` là một tập hợp gồm bốn đối tượng `DOMPoint` xác định các góc của một tứ giác tùy ý. Việc trả về `DOMQuad` cho phép `getBoxQuads()` trả về thông tin chính xác ngay cả khi có các phép biến đổi 2D hoặc 3D tùy ý. Nó có thuộc tính `bounds` tiện lợi trả về `DOMRectReadOnly` cho những trường hợp bạn chỉ cần hình chữ nhật bao quanh căn chỉnh theo trục.

## Hàm khởi tạo

- {{domxref("DOMQuad.DOMQuad", "DOMQuad()")}}
  - : Tạo một đối tượng `DOMQuad` mới.

## Thuộc tính phiên bản

- {{domxref("DOMQuad.p1")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMPoint")}} đại diện cho một góc của `DOMQuad`.
- {{domxref("DOMQuad.p2")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMPoint")}} đại diện cho một góc của `DOMQuad`.
- {{domxref("DOMQuad.p3")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMPoint")}} đại diện cho một góc của `DOMQuad`.
- {{domxref("DOMQuad.p4")}} {{ReadOnlyInline}}
  - : Một {{domxref("DOMPoint")}} đại diện cho một góc của `DOMQuad`.

## Phương thức phiên bản

- {{domxref("DOMQuad.getBounds()")}}
  - : Trả về một đối tượng {{domxref("DOMRect")}} với tọa độ và kích thước của đối tượng `DOMQuad`.
- {{domxref("DOMQuad.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `DOMQuad`.

## Phương thức tĩnh

- {{domxref("DOMQuad.fromQuad_static", "DOMQuad.fromQuad()")}}
  - : Trả về một đối tượng `DOMQuad` mới dựa trên tập tọa độ được cung cấp có dạng của một đối tượng `DOMQuad` khác.
- {{domxref("DOMQuad.fromRect_static", "DOMQuad.fromRect()")}}
  - : Trả về một đối tượng `DOMQuad` mới dựa trên tập tọa độ được cung cấp có dạng của một đối tượng {{domxref("DOMRect")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

---
title: NamedNodeMap
slug: Web/API/NamedNodeMap
page-type: web-api-interface
browser-compat: api.NamedNodeMap
---

{{APIRef("DOM")}}

Giao diện **`NamedNodeMap`** đại diện cho một tập hợp các đối tượng {{domxref("Attr")}}. Các đối tượng bên trong `NamedNodeMap` không theo thứ tự cụ thể nào, khác với {{domxref("NodeList")}}, mặc dù chúng có thể được truy cập bằng chỉ số như trong mảng.

Đối tượng `NamedNodeMap` là _live_ và do đó sẽ được tự động cập nhật nếu có thay đổi đối với nội dung của nó từ bên trong hoặc bên ngoài.

> [!NOTE]
> Mặc dù được gọi là `NamedNodeMap`, giao diện này không xử lý các đối tượng {{domxref("Node")}} mà là các đối tượng {{domxref("Attr")}}, vốn là lớp chuyên biệt của {{domxref("Node")}}.

## Thuộc tính phiên bản

_Giao diện này không kế thừa bất kỳ thuộc tính nào._

- {{domxref("NamedNodeMap.length")}} {{ReadOnlyInline}}
  - : Trả về số lượng đối tượng trong map.

## Phương thức phiên bản

_Giao diện này không kế thừa bất kỳ phương thức nào._

- {{domxref("NamedNodeMap.getNamedItem()")}}
  - : Trả về một {{domxref("Attr")}}, tương ứng với tên đã cho.
- {{domxref("NamedNodeMap.setNamedItem()")}}
  - : Thay thế, hoặc thêm, {{domxref("Attr")}} được xác định trong map bởi tên đã cho.
- {{domxref("NamedNodeMap.removeNamedItem()")}}
  - : Xóa {{domxref("Attr")}} được xác định bởi map đã cho.
- {{domxref("NamedNodeMap.item()")}}
  - : Trả về {{domxref("Attr")}} tại chỉ số đã cho, hoặc `null` nếu chỉ số lớn hơn hoặc bằng số lượng node.
- {{domxref("NamedNodeMap.getNamedItemNS()")}}
  - : Trả về một {{domxref("Attr")}} được xác định bởi không gian tên và tên cục bộ liên quan.
- {{domxref("NamedNodeMap.setNamedItemNS()")}}
  - : Thay thế, hoặc thêm, {{domxref("Attr")}} được xác định trong map bởi không gian tên và tên cục bộ liên quan đã cho.
- {{domxref("NamedNodeMap.removeNamedItemNS()")}}
  - : Xóa {{domxref("Attr")}} được xác định bởi không gian tên và tên cục bộ liên quan đã cho.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Element.attributes")}}

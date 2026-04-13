---
title: DOMRectList
slug: Web/API/DOMRectList
page-type: web-api-interface
browser-compat: api.DOMRectList
---

{{APIRef("Geometry Interfaces")}}

Giao diện **`DOMRectList`** đại diện cho một tập hợp các đối tượng {{domxref("DOMRect")}}, thường được sử dụng để chứa các hình chữ nhật liên quan đến một phần tử cụ thể, chẳng hạn như các hộp giới hạn được trả về bởi các phương thức như {{domxref("Element.getClientRects", "getClientRects()")}}. Nó cung cấp quyền truy cập vào mỗi hình chữ nhật trong danh sách thông qua chỉ mục của nó, cùng với thuộc tính `length` chỉ ra tổng số hình chữ nhật trong danh sách.

> [!NOTE]
> `DOMRectList` tồn tại để tương thích với nội dung Web cũ và không được khuyến nghị sử dụng khi tạo các API mới.

## Thuộc tính phiên bản

- {{domxref("DOMRectList.length")}} {{ReadOnlyInline}}
  - : Thuộc tính chỉ đọc trả về tổng số đối tượng {{domxref("DOMRect")}} trong `DOMRectList`.

## Phương thức phiên bản

- {{domxref("DOMRectList.item")}}
  - : Trả về đối tượng {{domxref("DOMRect")}} tại chỉ mục được chỉ định. Nếu `index` nằm ngoài phạm vi, nó trả về `null`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMRect")}}
- {{domxref("DOMRectReadOnly")}}

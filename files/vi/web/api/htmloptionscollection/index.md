---
title: HTMLOptionsCollection
slug: Web/API/HTMLOptionsCollection
page-type: web-api-interface
browser-compat: api.HTMLOptionsCollection
---

{{ APIRef("HTML DOM") }}

Giao diện **`HTMLOptionsCollection`** đại diện cho một tập hợp các phần tử [`<option>`](/en-US/docs/Web/HTML/Reference/Elements/option) HTML (theo thứ tự tài liệu) và cung cấp các phương thức và thuộc tính để chọn từ danh sách cũng như tùy chọn thay đổi các mục của nó. Đối tượng này chỉ được trả về bởi thuộc tính `options` của [select](/en-US/docs/Web/API/HTMLSelectElement).

{{InheritanceDiagram}}

## Thuộc tính phiên bản

- {{domxref("HTMLOptionsCollection.length")}}
  - : Trả về hoặc đặt số lượng tùy chọn trong tập hợp.
- {{domxref("HTMLOptionsCollection.selectedIndex")}}
  - : Số chỉ số của phần tử {{HTMLElement("option")}} đầu tiên được chọn. Giá trị `-1` cho biết không có phần tử nào được chọn.

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ cha, [`HTMLCollection`](/en-US/docs/Web/API/HTMLCollection)._

- {{domxref("HTMLOptionsCollection.add()")}}
  - : Thêm phần tử {{domxref("HTMLOptionElement")}} hoặc {{domxref("HTMLOptGroupElement")}} vào tập hợp các phần tử `option` hoặc thêm nó trước một tùy chọn được chỉ định.
- {{domxref("HTMLOptionsCollection.remove()")}}
  - : Xóa phần tử tại chỉ số được chỉ định khỏi tập hợp tùy chọn.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{DOMxRef("HTMLOptionElement")}}
- {{DOMxRef("HTMLCollection")}}
- {{DOMxRef("HTMLOptGroupElement")}}
- {{DOMxRef("HTMLSelectElement")}}
- [Hướng dẫn tập hợp theo chỉ số](/en-US/docs/Web/JavaScript/Guide/Indexed_collections)

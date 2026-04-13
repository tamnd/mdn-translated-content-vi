---
title: RadioNodeList
slug: Web/API/RadioNodeList
page-type: web-api-interface
browser-compat: api.RadioNodeList
---

{{APIRef("HTML DOM")}}

Giao diện **`RadioNodeList`** đại diện cho một tập hợp các phần tử trong một {{HTMLElement("form")}} được trả về bởi lời gọi {{domxref("HTMLFormControlsCollection.namedItem()")}}.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện `RadioNodeList` kế thừa các thuộc tính của_ {{domxref("NodeList")}}.

- {{domxref("RadioNodeList.value")}}
  - : Nếu tập hợp phần tử bên dưới chứa các nút radio, thuộc tính `value` đại diện cho nút radio được chọn. Khi lấy thuộc tính `value`, giá trị `value` của nút radio hiện đang được `checked` được trả về dưới dạng chuỗi. Nếu tập hợp không chứa bất kỳ nút radio nào hoặc không có nút radio nào trong tập hợp ở trạng thái `checked`, chuỗi rỗng được trả về. Khi đặt thuộc tính `value`, nút radio input đầu tiên có thuộc tính `value` bằng giá trị mới sẽ được đặt thành `checked`.

## Phương thức phiên bản

_Giao diện `RadioNodeList` kế thừa các phương thức của_ {{domxref("NodeList")}}.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các phần tử {{HTMLElement("form")}}, {{HTMLElement("input")}}.

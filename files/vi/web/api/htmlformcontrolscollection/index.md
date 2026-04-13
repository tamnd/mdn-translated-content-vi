---
title: HTMLFormControlsCollection
slug: Web/API/HTMLFormControlsCollection
page-type: web-api-interface
browser-compat: api.HTMLFormControlsCollection
---

{{APIRef("HTML DOM")}}

Giao diện **`HTMLFormControlsCollection`** đại diện cho một _bộ sưu tập_ các _phần tử điều khiển form HTML_, được trả về bởi thuộc tính {{domxref("HTMLFormElement.elements", "elements")}} của giao diện {{domxref("HTMLFormElement")}}.

Bộ sưu tập được trả về bởi {{domxref("HTMLFormElement.elements")}} bao gồm các điều khiển form được liệt kê và liên kết với form. Xem {{domxref("HTMLFormElement.elements")}} để biết danh sách [các điều khiển form được liệt kê](/en-US/docs/Web/API/HTMLFormElement/elements#value).

Giao diện này thay thế một phương thức từ {{domxref("HTMLCollection")}}, mà nó dựa trên đó.

{{InheritanceDiagram}}

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ lớp cha, {{domxref("HTMLCollection")}}._

## Phương thức phiên bản

_Giao diện này kế thừa các phương thức từ lớp cha, {{domxref("HTMLCollection")}}._

- {{domxref("HTMLFormControlsCollection.namedItem()")}}
  - : Trả về {{domxref("RadioNodeList")}} hoặc {{domxref("Element")}} trong bộ sưu tập có `name` hoặc `id` khớp với tên được chỉ định, hoặc `null` nếu không có nút nào khớp. Lưu ý rằng phiên bản `namedItem()` này ẩn phiên bản kế thừa từ {{domxref("HTMLCollection")}}. Giống như phương thức đó, trong JavaScript, sử dụng cú pháp dấu ngoặc mảng với {{jsxref("String")}}, ví dụ `collection["value"]`, tương đương với `collection.namedItem("value")`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCollection")}}, {{domxref("RadioNodeList")}}, {{domxref("HTMLOptionsCollection")}}

---
title: InterestEvent
slug: Web/API/InterestEvent
page-type: web-api-interface
status:
  - experimental
  - non-standard
browser-compat: api.InterestEvent
---

{{APIRef("Popover API")}}{{SeeCompatTable}}{{non-standard_header}}

Giao diện **`InterestEvent`** đại diện cho một sự kiện kích hoạt khi có sự quan tâm hoặc mất quan tâm trên một [interest invoker](/en-US/docs/Web/API/Popover_API/Using_interest_invokers).

Đây là đối tượng sự kiện cho các sự kiện {{domxref("HTMLElement.interest_event", "interest")}} và {{domxref("HTMLElement.loseinterest_event", "loseinterest")}}, lần lượt kích hoạt trên phần tử đích khi có sự quan tâm hoặc mất quan tâm.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{DOMxRef("InterestEvent.InterestEvent", "InterestEvent()")}} {{experimental_inline}} {{non-standard_inline}}
  - : Tạo một đối tượng `InterestEvent`.

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ thực thể cha, {{DOMxRef("Event")}}._

- {{DOMxRef("InterestEvent.source")}} {{ReadOnlyInline}} {{experimental_inline}} {{non-standard_inline}}
  - : Một đối tượng {{domxref("Element")}} đại diện cho phần tử interest invoker mà sự quan tâm hoặc mất quan tâm đã kích hoạt sự kiện.

## Ví dụ

Xem hướng dẫn [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers) và trang tham chiếu sự kiện {{domxref("HTMLElement.interest_event", "interest")}} để xem ví dụ.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Popover API](/en-US/docs/Web/API/Popover_API)
- [Using interest invokers](/en-US/docs/Web/API/Popover_API/Using_interest_invokers)

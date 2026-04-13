---
title: EventTarget
slug: Web/API/EventTarget
page-type: web-api-interface
browser-compat: api.EventTarget
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Giao diện **`EventTarget`** được triển khai bởi các đối tượng có thể nhận sự kiện và có thể có các trình lắng nghe cho chúng.
Nói cách khác, mọi đích của sự kiện đều triển khai ba phương thức gắn với giao diện này.

{{domxref("Element")}}, cùng với các phần tử con của nó, cũng như {{domxref("Document")}} và {{domxref("Window")}}, là những đích sự kiện phổ biến nhất,
nhưng các đối tượng khác cũng có thể là đích sự kiện.
Ví dụ, {{domxref("IDBRequest")}}, {{domxref("AudioNode")}}, và {{domxref("AudioContext")}} cũng là các đích sự kiện.

Nhiều đích sự kiện, bao gồm các phần tử, tài liệu và cửa sổ, cũng hỗ trợ [đăng ký bộ xử lý sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#registering_event_handlers) thông qua các thuộc tính và thuộc tính HTML `onevent`.

{{InheritanceDiagram}}

## Hàm tạo

- {{domxref("EventTarget.EventTarget()", "EventTarget()")}}
  - : Tạo một thể hiện mới của đối tượng `EventTarget`.

## Phương thức thể hiện

- {{domxref("EventTarget.addEventListener()")}}
  - : Đăng ký một bộ xử lý cho một kiểu sự kiện cụ thể trên `EventTarget`.
- {{domxref("EventTarget.removeEventListener()")}}
  - : Xóa một bộ lắng nghe sự kiện khỏi `EventTarget`.
- {{domxref("EventTarget.dispatchEvent()")}}
  - : Phát một sự kiện tới `EventTarget` này.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Mục lục sự kiện](/en-US/docs/Web/API/Document_Object_Model/Events#event_index)
- [Giới thiệu về sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events)
- Giao diện {{domxref("Event")}}

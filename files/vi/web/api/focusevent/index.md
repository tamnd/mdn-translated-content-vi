---
title: FocusEvent
slug: Web/API/FocusEvent
page-type: web-api-interface
browser-compat: api.FocusEvent
---

{{APIRef("UI Events")}}

Giao diện **`FocusEvent`** đại diện cho các sự kiện liên quan đến focus, bao gồm {{domxref("Element/focus_event", "focus")}}, {{domxref("Element/blur_event", "blur")}}, {{domxref("Element/focusin_event", "focusin")}}, và {{domxref("Element/focusout_event", "focusout")}}.

{{InheritanceDiagram}}

## Constructor

- {{domxref("FocusEvent.FocusEvent", "FocusEvent()")}}
  - : Tạo một sự kiện `FocusEvent` với các tham số đã cho.

## Thuộc tính instance

_Giao diện này cũng kế thừa các thuộc tính từ {{domxref("UIEvent")}} cha, và gián tiếp từ {{domxref("Event")}}_.

- {{domxref("FocusEvent.relatedTarget")}}
  - : Một {{domxref("EventTarget")}} đại diện cho mục tiêu phụ của sự kiện này. Trong một số trường hợp (chẳng hạn như khi tab vào hoặc ra khỏi trang), thuộc tính này có thể được đặt thành `null` vì lý do bảo mật.

## Phương thức instance

_Giao diện này không có phương thức cụ thể nào. Nó kế thừa các phương thức từ {{domxref("UIEvent")}} cha, và gián tiếp từ {{domxref("Event")}}._

## Thứ tự sự kiện

Khi focus được chuyển từ phần tử A sang phần tử B, các sự kiện focus được gửi theo thứ tự sau:

1. `blur`: được gửi sau khi phần tử A mất focus.
2. `focusout`: được gửi sau sự kiện `blur`.
3. `focus`: được gửi sau khi phần tử B nhận focus.
4. `focusin`: được gửi sau sự kiện `focus`.

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Giao diện cơ sở {{domxref("Event")}}

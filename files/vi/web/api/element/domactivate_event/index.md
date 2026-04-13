---
title: "Element: DOMActivate event"
short-title: DOMActivate
slug: Web/API/Element/DOMActivate_event
page-type: web-api-event
status:
  - deprecated
browser-compat: api.Element.DOMActivate_event
---

{{APIRef}}{{Deprecated_Header}}

Thuộc tính **`DOMActivate`** is fired at an element when it becomes active, such as when it is clicked on using the mouse or a keypress is used to navigate to it.

## Cú pháp

Use the event name in methods like {{domxref("EventTarget.addEventListener", "addEventListener()")}}.

```js-nolint
addEventListener("DOMActivate", (event) => { })
```

> [!NOTE]
> There is no `onDOMActivate` event handler property for this event.

## Event type

Một {{domxref("UIEvent")}}. Inherits from {{domxref("Event")}}.

{{InheritanceDiagram("UIEvent")}}

## Ví dụ

Ví dụ này listens for `DOMActivate` on a {{HtmlElement("button")}} element and displays its {{domxref("UIEvent/detail", "detail")}}.

### HTML

```html
<button>Click</button>
```

### JavaScript

```js
const button = document.querySelector("button");

button.addEventListener("DOMActivate", (event) => {
  button.textContent = `Click count: ${event.detail}`;
});
```

### Result

Note that `detail` of the `DOMActivate` event may have browser-specific behavior. It may either always be `0`, or have similar behavior as the {{domxref("Element/click_event", "click")}} event's `detail` (i.e., indicating the number of consecutive clicks).

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("UIEvent")}}
- {{domxref("Element/click_event", "click")}}

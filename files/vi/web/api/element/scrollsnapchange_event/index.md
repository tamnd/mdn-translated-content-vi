---
title: "Element: scrollsnapchange event"
short-title: scrollsnapchange
slug: Web/API/Element/scrollsnapchange_event
page-type: web-api-event
status:
  - experimental
browser-compat: api.Element.scrollsnapchange_event
---

{{APIRef}}{{SeeCompatTable}}

Thuộc tính **`scrollsnapchange`** of the {{domxref("Element")}} interface is fired on the [scroll container](/en-US/docs/Glossary/Scroll_container) at the end of a scrolling operation when a new scroll snap target has been selected, just before the corresponding {{domxref("Element/scrollend_event", "scrollend")}} event fires.

A scrolling operation ends when the user finishes scrolling within a scroll container — for example using a touch gesture or by dragging the mouse pointer on a scroll bar — and releases the gesture.

## Cú pháp

Use the event name in methods like {{domxref("EventTarget.addEventListener", "addEventListener()")}}, or set an event handler property.

```js-nolint
addEventListener("scrollsnapchange", (event) => { })

onscrollsnapchange = (event) => { }
```

## Event type

Một {{domxref("SnapEvent")}}, which inherits from the generic {{domxref("Event")}} type.

## Ví dụ

### Basic usage

Let's say we have a {{htmlelement("main")}} element containing significant content that causes it to scroll:

```html
<main>
  <!-- Significant content -->
</main>
```

The `<main>` element can be turned into a scroll container that snaps to its children when scrolled using a combination of the CSS {{cssxref("scroll-snap-type")}} property and other properties. For example:

```css
main {
  width: 250px;
  height: 450px;
  overflow: scroll;
  scroll-snap-type: block mandatory;
}
```

Các giá trị sau JavaScript snippet would cause the `scrollsnapchange` event to fire on the `<main>` element when one of its children becomes a newly-selected snap target. In the handler function, we set a `selected` class on the child referenced by the {{domxref("SnapEvent.snapTargetBlock")}} property, which could be used to style it to look like it has been selected (for example, with an animation) when the event fires.

```js
const scrollingElem = document.querySelector("main");

scrollingElem.addEventListener("scrollsnapchange", (event) => {
  event.snapTargetBlock.classList.add("selected");
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element/scrollsnapchanging_event", "scrollsnapchanging")}} event
- {{DOMxRef("Document/scrollend_event", "scrollend")}} event
- {{domxref("SnapEvent")}}
- CSS {{cssxref("scroll-snap-type")}} property
- [CSS scroll snap module](/en-US/docs/Web/CSS/Guides/Scroll_snap)
- [Sử dụng scroll snap events](/en-US/docs/Web/CSS/Guides/Scroll_snap/Sử dụng_scroll_snap_events)
- [Scroll Snap Events](https://developer.chrome.com/blog/scroll-snap-events) on developer.chrome.com (2024)

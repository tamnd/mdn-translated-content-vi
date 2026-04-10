---
title: "Element: scroll event"
short-title: scroll
slug: Web/API/Element/scroll_event
page-type: web-api-event
browser-compat: api.Element.scroll_event
---

{{APIRef("CSSOM view API")}}

Thuộc tính **`scroll`** fires when an element has been scrolled.
To detect when scrolling has completed, see the {{domxref("Element/scrollend_event", "scrollend")}} event of `Element`.

## Cú pháp

Use the event name in methods like {{domxref("EventTarget.addEventListener", "addEventListener()")}}, or set an event handler property.

```js-nolint
addEventListener("scroll", (event) => { })

onscroll = (event) => { }
```

## Event type

A generic {{domxref("Event")}}.

## Ví dụ

Các giá trị sau examples show how to use the `scroll` event with an event listener and with the `onscroll` event handler property.
The {{DOMxRef("Window.setTimeout", "setTimeout()")}} method is used to {{glossary("throttle")}} the event handler because `scroll` events can fire at a high rate.
For additional examples that use {{DOMxRef("Window.requestAnimationFrame()", "requestAnimationFrame()")}}, see the `Document` {{domxref("Document/scroll_event", "scroll")}} event page.

### Sử dụng `scroll` with an event listener

Các giá trị sau example shows how to use the `scroll` event to detect when the user is scrolling inside an element:

```html
<div id="scroll-box">
  <p>Scroll me!</p>
</div>
<p id="output">Waiting on scroll events...</p>
```

```css
#scroll-box {
  overflow: scroll;
  height: 100px;
  width: 100px;
  float: left;
}

#scroll-box p {
  height: 200px;
  width: 200px;
}

#output {
  text-align: center;
}
```

```js
const element = document.querySelector("div#scroll-box");
const output = document.querySelector("p#output");

element.addEventListener("scroll", (event) => {
  output.textContent = "Scroll event fired!";
  setTimeout(() => {
    output.textContent = "Waiting on scroll events...";
  }, 1000);
});
```

{{EmbedLiveSample("Sử dụng_scroll_with_an_event_listener", "100%", 120)}}

### Sử dụng `onscroll` event handler property

Các giá trị sau example shows how to use the `onscroll` event handler property to detect when the user is scrolling:

```html
<div id="scroll-box">
  <p>Scroll me!</p>
</div>
<p id="output">Waiting on scroll events...</p>
```

```css
#scroll-box {
  overflow: scroll;
  height: 100px;
  width: 100px;
  float: left;
}

#scroll-box p {
  height: 200px;
  width: 200px;
}

#output {
  text-align: center;
}
```

```js
const element = document.querySelector("div#scroll-box");
const output = document.querySelector("p#output");

element.onscroll = (event) => {
  output.textContent = "Element scroll event fired!";
  setTimeout(() => {
    output.textContent = "Waiting on scroll events...";
  }, 1000);
};
```

{{EmbedLiveSample("Sử dụng_onscroll_event_handler_property", "100%", 120)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [Element `scrollend` event](/en-US/docs/Web/API/Element/scrollend_event)
- [Document `scroll` event](/en-US/docs/Web/API/Document/scroll_event)
- [Document `scrollend` event](/en-US/docs/Web/API/Document/scrollend_event)

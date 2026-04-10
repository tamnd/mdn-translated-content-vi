---
title: "Element: hasPointerCapture() method"
short-title: hasPointerCapture()
slug: Web/API/Element/hasPointerCapture
page-type: web-api-instance-method
browser-compat: api.Element.hasPointerCapture
---

{{APIRef("DOM")}}

Thuộc tính **`hasPointerCapture()`** method of the
{{domxref("Element")}} interface checks whether the element on which it is invoked has
[pointer capture](/en-US/docs/Web/API/Pointer_events#pointer_capture) for the pointer identified by the given pointer ID.

## Cú pháp

```js-nolint
hasPointerCapture(pointerId)
```

### Tham số

- `pointerId`
  - : The {{domxref("PointerEvent.pointerId", "pointerId")}} of a
    {{domxref("PointerEvent")}} object.

### Giá trị trả về

Một boolean value — `true` if the element does have pointer capture for the pointer identified by the given pointer ID, `false` if it doesn't.

## Ví dụ

```html
<div id="target">Touch this element with a pointer.</div>
```

```js
const el = document.getElementById("target");
el.addEventListener("pointerdown", (ev) => {
  // Element 'target' will receive/capture further events
  el.setPointerCapture(ev.pointerId);

  // …

  // Check whether element still has pointer capture
  const pointerCap = el.hasPointerCapture(ev.pointerId);
  if (pointerCap) {
    // We've still got pointer capture
  } else {
    // oops, we've lost pointer capture!
  }
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{ domxref("Element.setPointerCapture()")}}
- {{ domxref("Element.releasePointerCapture()")}}
- {{ domxref("Pointer_events","Pointer Events", "", 1) }}

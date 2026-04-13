---
title: "Element: setPointerCapture() method"
short-title: setPointerCapture()
slug: Web/API/Element/setPointerCapture
page-type: web-api-instance-method
browser-compat: api.Element.setPointerCapture
---

{{APIRef("DOM")}}

Thuộc tính **`setPointerCapture()`** method of the
{{domxref("Element")}} interface is used to designate a specific element as the
_capture target_ of future pointer events. Subsequent events for the pointer will
be targeted at the capture element until capture is released (via
{{domxref("Element.releasePointerCapture()")}} or the
{{domxref("Element/pointerup_event", "pointerup")}} event is fired).

See [pointer events](/en-US/docs/Web/API/Pointer_events#pointer_capture) for an overview and examples of how pointer capture works.

## Cú pháp

```js-nolint
setPointerCapture(pointerId)
```

### Tham số

- `pointerId`
  - : The {{domxref("PointerEvent.pointerId", "pointerId")}} of a
    {{domxref("PointerEvent")}} object.

### Giá trị trả về

None ({{jsxref("undefined")}}).

### Ngoại lệ

- `NotFoundError` {{domxref("DOMException")}}
  - : Thrown if `pointerId` does not match any active pointer.

## Ví dụ

Ví dụ này sets pointer capture on a {{HtmlElement("div")}} when you press down on
it. This lets you slide the element horizontally, even when your pointer moves outside of
its boundaries.

### HTML

```html
<div id="slider">SLIDE ME</div>
```

### CSS

```css
div {
  width: 140px;
  height: 50px;
  display: flex;
  align-items: center;
  justify-content: center;
  background: #ffbbee;
  touch-action: none;
}
```

### JavaScript

```js
const slider = document.getElementById("slider");

function beginSliding(e) {
  slider.onpointermove = slide;
  slider.setPointerCapture(e.pointerId);
}

function stopSliding(e) {
  slider.onpointermove = null;
  slider.releasePointerCapture(e.pointerId);
}

function slide(e) {
  slider.style.transform = `translate(${e.clientX - 70}px)`;
}

slider.onpointerdown = beginSliding;
slider.onpointerup = stopSliding;
```

### Result

{{EmbedLiveSample("Examples")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("Element.hasPointerCapture","Element.hasPointerCapture()")}}
- {{domxref("Element.releasePointerCapture","Element.releasePointerCapture()")}}
- [Pointer events](/en-US/docs/Web/API/Pointer_events)

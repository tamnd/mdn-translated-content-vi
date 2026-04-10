---
title: "Element: getAnimations() method"
short-title: getAnimations()
slug: Web/API/Element/getAnimations
page-type: web-api-instance-method
browser-compat: api.Element.getAnimations
---

{{APIRef("Web Animations")}}

The `getAnimations()` của giao diện {{domxref("Element")}}
(specified on the `Animatable` mixin) trả về an array of all
{{domxref("Animation")}} objects affecting this element or which are scheduled to do so
in future. It can optionally return {{domxref("Animation")}} objects for descendant
elements too.

> [!NOTE]
> This array includes [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations), [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions), and [Web Animations](/en-US/docs/Web/API/Web_Animations_API).

## Cú pháp

```js-nolint
getAnimations()
getAnimations(options)
```

### Tham số

- `options` {{optional_inline}}
  - : An options object containing the following property:
    - `subtree`
      - : Một boolean value which, if `true`, causes animations that target
        descendants of _Element_ to be returned as well. This includes animations
        that target any CSS [pseudo-elements](/en-US/docs/Web/CSS/Reference/Selectors/Pseudo-elements) attached to
        _Element_ or one of its descendants. Defaults to `false`.

### Giá trị trả về

An {{jsxref("Array")}} of {{domxref("Animation")}} objects, each representing an
animation currently targeting the {{domxref("Element")}} on which this method is called,
or one of its descendant elements if `{ subtree: true }` is specified.

## Ví dụ

Các giá trị sau code snippet will wait for all animations on `elem` and its
descendants to finish before removing the element from the document.

```js
Promise.all(
  elem.getAnimations({ subtree: true }).map((animation) => animation.finished),
).then(() => elem.remove());
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- [CSS Animations](/en-US/docs/Web/CSS/Guides/Animations)
- [CSS Transitions](/en-US/docs/Web/CSS/Guides/Transitions)
- {{domxref("Document.getAnimations()")}} - Fetch all animations in the document
- {{domxref("Animation")}}

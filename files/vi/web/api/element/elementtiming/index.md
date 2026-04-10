---
title: "Element: elementTiming property"
short-title: elementTiming
slug: Web/API/Element/elementTiming
page-type: web-api-instance-property
status:
  - experimental
browser-compat: api.Element.elementTiming
---

{{APIRef("DOM")}}{{SeeCompatTable}}

Thuộc tính **`elementTiming`** của giao diện {{domxref("Element")}} identifies elements for observation in the {{domxref("PerformanceElementTiming")}} API. The `elementTiming` property reflects the value of the [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) attribute.

## Giá trị

Một chuỗi.

## Ví dụ

### Logging the value of `elementTiming`

Trong ví dụ này, adding the [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) attribute to the {{HTMLElement("img")}} element sets the image to be observed.

```html
<img
  src="image.jpg"
  alt="a nice image"
  elementtiming="big-image"
  id="myImage" />
```

You can get the string value of the `elementtiming` HTML attribute by calling `el.elementTiming`.

```js
const el = document.getElementById("myImage");
console.log(el.elementTiming); // "big-image"
```

For a more complete example on how to use the Element Timing API, see {{domxref("PerformanceElementTiming")}}.

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("PerformanceElementTiming")}}
- [`elementtiming`](/en-US/docs/Web/HTML/Reference/Attributes/elementtiming) HTML attribute

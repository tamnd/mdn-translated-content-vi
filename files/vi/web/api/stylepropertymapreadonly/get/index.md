---
title: "StylePropertyMapReadOnly: phương thức get()"
short-title: get()
slug: Web/API/StylePropertyMapReadOnly/get
page-type: web-api-instance-method
browser-compat: api.StylePropertyMapReadOnly.get
---

{{APIRef("CSS Typed Object Model API")}}

Phương thức **`get()`** của giao diện {{domxref("StylePropertyMapReadOnly")}} trả về một đối tượng {{domxref("CSSStyleValue")}} cho giá trị đầu tiên của thuộc tính được chỉ định.

## Cú pháp

```js-nolint
get(property)
```

### Tham số

- `property`
  - : Tên của thuộc tính cần lấy giá trị.

### Giá trị trả về

Một đối tượng {{domxref("CSSStyleValue")}}.

## Ví dụ

Hãy lấy một vài thuộc tính và giá trị. Trước tiên, tạo một liên kết bên trong một đoạn văn trong HTML và thêm danh sách định nghĩa để điền bằng JavaScript:

```html
<p>
  <a href="https://example.com">Link</a>
</p>
<dl id="results"></dl>
```

Thêm một chút CSS, bao gồm thuộc tính tùy chỉnh và thuộc tính có thể kế thừa:

```css
p {
  font-weight: bold;
}
a {
  --color: red;
  color: var(--color);
}
```

Sử dụng [`computedStyleMap()`](/en-US/docs/Web/API/Element/computedStyleMap) của phần tử để trả về một đối tượng _StylePropertyMapReadOnly_. Tạo một mảng các thuộc tính quan tâm và dùng phương thức `get()` để chỉ lấy những giá trị đó.

```js
// get the element
const myElement = document.querySelector("a");

// Retrieve all computed styles with computedStyleMap()
const styleMap = myElement.computedStyleMap();

// get the <dl> we'll be populating
const stylesList = document.querySelector("#results");

// array of properties we're interested in
const ofInterest = ["font-weight", "border-left-color", "color", "--color"];

// iterate over our properties of interest
for (const property of ofInterest) {
  // properties
  const cssProperty = document.createElement("dt");
  cssProperty.innerText = property;
  stylesList.appendChild(cssProperty);

  // values
  const cssValue = document.createElement("dd");
  // use get() to find the value
  cssValue.innerText = styleMap.get(property);
  stylesList.appendChild(cssValue);
}
```

{{EmbedLiveSample("Examples", 120, 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [CSS Typed Object Model API](/en-US/docs/Web/API/CSS_Typed_OM_API)
- [Learning Houdini: the CSS Typed Object Model](/en-US/docs/Web/API/CSS_Typed_OM_API/Guide)

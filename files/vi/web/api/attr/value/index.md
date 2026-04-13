---
title: "Attr: thuộc tính value"
short-title: value
slug: Web/API/Attr/value
page-type: web-api-instance-property
browser-compat: api.Attr.value
---

{{APIRef("DOM")}}

Thuộc tính **`value`** của giao diện {{domxref("Attr")}} chứa giá trị của thuộc tính.

## Giá trị

Một chuỗi biểu diễn giá trị của thuộc tính.

## Ví dụ

Ví dụ sau hiển thị giá trị hiện tại của thuộc tính `test`. Khi nhấn vào nút, giá trị sẽ được đổi sang một giá trị khác và đọc lại để cập nhật giá trị hiển thị.

### HTML

```html
<label test="initial value"></label>

<button>Click me to set test to <code>"a new value"</code>…</button>

<p>
  Current value of the <code>test</code> attribute:
  <output id="result">None.</output>
</p>
```

### JavaScript

```js
const element = document.querySelector("label");
const button = document.querySelector("button");
const result = document.querySelector("#result");

const attribute = element.attributes[0];
result.value = attribute.value;

button.addEventListener("click", () => {
  attribute.value = "a new value";
  result.value = attribute.value;
});
```

{{ EmbedLiveSample('Example','100%',100) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

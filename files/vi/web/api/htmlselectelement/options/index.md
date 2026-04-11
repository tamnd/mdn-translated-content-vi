---
title: "HTMLSelectElement: thuộc tính options"
short-title: options
slug: Web/API/HTMLSelectElement/options
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.options
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`HTMLSelectElement.options`** trả về một {{domxref("HTMLOptionsCollection")}} gồm các phần tử {{HTMLElement("option")}} có trong phần tử {{HTMLElement("select")}}.

## Giá trị

Một {{domxref("HTMLOptionsCollection")}} chứa các phần tử `<option>` trong phần tử `<select>`.

## Ví dụ

### HTML

```html
<label for="test">Label</label>
<select id="test">
  <option value="1">Option 1</option>
  <option value="2">Option 2</option>
</select>
```

### JavaScript

```js
const select = document.getElementById("test");
for (const option of select.options) {
  console.log(option.label); // "Option 1" and "Option 2"
}
```

{{EmbedLiveSample("Examples", "100%", 30)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

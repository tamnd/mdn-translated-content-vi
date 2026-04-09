---
title: "Attr: thuộc tính ownerElement"
short-title: ownerElement
slug: Web/API/Attr/ownerElement
page-type: web-api-instance-property
browser-compat: api.Attr.ownerElement
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`ownerElement`** của giao diện {{domxref("Attr")}} trả về {{domxref("Element")}} mà thuộc tính thuộc về.

## Giá trị

{{domxref("Element")}} mà thuộc tính thuộc về, hoặc `null` nếu thuộc tính không được liên kết với một phần tử.

## Ví dụ

Ví dụ sau hiển thị tên đủ điều kiện của phần tử của hai phần tử đầu tiên, khi chúng ta nhấn vào nút tương ứng.

### HTML

```html
<svg xml:lang="en-US" class="struct" height="1" width="1">Click me</svg>
<label xml:lang="en-US" class="struct"></label>

<p>
  <button>Show value for &lt;svg&gt;</button>
  <button>Show value for &lt;label&gt;</button>
</p>

<p>
  Tên đủ điều kiện của phần tử sở hữu thuộc tính <code>xml:lang</code>:
  <output id="result">None.</output>
</p>
```

### JavaScript

```js
const elements = document.querySelectorAll(".struct");
const buttons = document.querySelectorAll("button");
const outputEl = document.querySelector("#result");

let i = 0;
for (const button of buttons) {
  const element = elements[i];
  button.addEventListener("click", () => {
    const attribute = element.attributes[0];
    outputEl.value = attribute.ownerElement.tagName.toLowerCase();
  });
  i++;
}
```

{{ EmbedLiveSample('Example','100%',100) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

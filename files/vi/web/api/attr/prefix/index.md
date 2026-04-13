---
title: "Attr: thuộc tính prefix"
short-title: prefix
slug: Web/API/Attr/prefix
page-type: web-api-instance-property
browser-compat: api.Attr.prefix
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`prefix`** của {{domxref("Attr")}} trả về tiền tố không gian tên của thuộc tính, hoặc `null` nếu không có tiền tố nào được chỉ định.

Tiền tố luôn ở dạng chữ thường, bất kể chữ hoa hay chữ thường khi tạo thuộc tính.

> [!NOTE]
> Chỉ XML mới hỗ trợ không gian tên. HTML thì không. Điều đó có nghĩa là tiền tố của một thuộc tính trên phần tử HTML sẽ luôn là `null`.

Ngoài ra, chỉ các không gian tên `xml` (cho thuộc tính `xml:lang`), `xlink` (cho các thuộc tính `xlink:href`, `xlink:show`, `xlink:target` và `xlink:title`) và `xpath` được hỗ trợ, và chỉ trên các phần tử SVG và MathML.

## Giá trị

Một chuỗi chứa tiền tố của không gian tên mà thuộc tính thuộc về. Nếu không có, nó trả về `null`.

## Ví dụ

### HTML

```html
<svg xml:lang="en-US" class="struct" height="1" width="1">Click me</svg>
<label xml:lang="en-US" class="struct"></label>

<p>
  <button>Show value for &lt;svg&gt;</button>
  <button>Show value for &lt;label&gt;</button>
</p>

<p>
  Prefix of the attribute <code>xml:lang</code>:
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
    outputEl.value = attribute.prefix;
  });
  i++;
}
```

{{ EmbedLiveSample('Example','100%',100) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các thuộc tính {{domxref("Attr.name")}}, trả về tên đủ điều kiện của thuộc tính, và {{domxref("Attr.localName")}}, tên cục bộ của nó.
- Thuộc tính {{domxref("Element.prefix()")}}, trả về tiền tố không gian tên của một {{domxref("Element")}}.

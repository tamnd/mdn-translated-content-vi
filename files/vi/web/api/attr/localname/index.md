---
title: "Attr: thuộc tính localName"
short-title: localName
slug: Web/API/Attr/localName
page-type: web-api-instance-property
browser-compat: api.Attr.localName
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`localName`** của giao diện {{domxref("Attr")}} trả về _phần cục bộ_ của _tên đủ điều kiện_ của một thuộc tính, tức là tên của thuộc tính sau khi bỏ đi mọi tiền tố không gian tên ở phía trước. Ví dụ, nếu tên đủ điều kiện là `xml:lang`, thì tên cục bộ được trả về là `lang`, nếu phần tử hỗ trợ không gian tên đó.

Tên cục bộ luôn ở dạng chữ thường, bất kể chữ hoa hay chữ thường khi tạo thuộc tính.

> [!NOTE]
> HTML chỉ hỗ trợ một tập cố định các không gian tên trên các phần tử SVG và MathML. Đó là `xml` (cho thuộc tính `xml:lang`), `xlink` (cho các thuộc tính `xlink:href`, `xlink:show`, `xlink:target` và `xlink:title`) và `xpath`.
>
> Điều đó có nghĩa là tên cục bộ của một thuộc tính của phần tử HTML luôn bằng với tên đủ điều kiện của nó: dấu hai chấm được xử lý như ký tự bình thường. Trong XML, như ở SVG hoặc MathML, dấu hai chấm biểu thị phần kết thúc của tiền tố và phần đứng trước nó là không gian tên; tên cục bộ có thể khác với tên đủ điều kiện.

## Giá trị

Một chuỗi biểu diễn phần cục bộ của tên đủ điều kiện của thuộc tính.

## Ví dụ

Ví dụ sau hiển thị tên cục bộ của thuộc tính đầu tiên trong hai phần tử đầu tiên, khi chúng ta nhấn vào nút tương ứng. Phần tử {{SVGElement("svg")}} là XML và hỗ trợ không gian tên, nên tên cục bộ (`lang`) khác với tên đủ điều kiện `xml:lang`. Phần tử {{HTMLElement("label")}} là HTML, không hỗ trợ không gian tên, nên tên cục bộ và tên đủ điều kiện đều là `xml:lang`.

### HTML

```html
<svg xml:lang="en-US" class="struct" height="1" width="1">Click me</svg>
<label xml:lang="en-US" class="struct"></label>

<p>
  <button>Show value for &lt;svg&gt;</button>
  <button>Show value for &lt;label&gt;</button>
</p>

<p>
  Phần cục bộ của thuộc tính <code>xml:lang</code>:
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
    outputEl.value = attribute.localName;
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

- Các thuộc tính {{domxref("Attr.name")}}, trả về tên đủ điều kiện của thuộc tính, và {{domxref("Attr.prefix")}}, tiền tố không gian tên.
- Thuộc tính {{domxref("Element.localName()")}}, trả về tên cục bộ của một {{domxref("Element")}}.

---
title: "Attr: thuộc tính name"
short-title: name
slug: Web/API/Attr/name
page-type: web-api-instance-property
browser-compat: api.Attr.name
---

{{APIRef("DOM")}}

Thuộc tính chỉ đọc **`name`** của giao diện {{domxref("Attr")}} trả về _tên đủ điều kiện_ của một thuộc tính, tức là tên của thuộc tính, với tiền tố không gian tên nếu có, nằm ở phía trước. Ví dụ, nếu tên cục bộ là `lang` và tiền tố không gian tên là `xml`, thì tên đủ điều kiện được trả về là `xml:lang`.

Tên đủ điều kiện luôn ở dạng chữ thường, bất kể chữ hoa hay chữ thường khi tạo thuộc tính.

## Giá trị

Một chuỗi biểu diễn tên đủ điều kiện của thuộc tính.

## Ví dụ

Ví dụ sau hiển thị tên đủ điều kiện của thuộc tính đầu tiên trong hai phần tử đầu tiên, khi chúng ta nhấn vào nút tương ứng.

### HTML

```html
<svg xml:lang="en-US" class="struct" height="1" width="1">Click me</svg>
<label xml:lang="en-US" class="struct"></label>

<p>
  <button>Show value for &lt;svg&gt;</button>
  <button>Show value for &lt;label&gt;</button>
</p>

<p>
  Tên đủ điều kiện của thuộc tính <code>xml:lang</code>:
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
    outputEl.value = attribute.name;
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

- Các thuộc tính {{domxref("Attr.localName")}}, trả về phần cục bộ của tên đủ điều kiện của thuộc tính, và {{domxref("Attr.prefix")}}, tiền tố không gian tên.
- Thuộc tính {{domxref("Element.tagName()")}}, trả về tên đủ điều kiện của một {{domxref("Element")}}.

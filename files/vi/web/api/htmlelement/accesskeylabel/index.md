---
title: "HTMLElement: thuộc tính accessKeyLabel"
short-title: accessKeyLabel
slug: Web/API/HTMLElement/accessKeyLabel
page-type: web-api-instance-property
browser-compat: api.HTMLElement.accessKeyLabel
---

{{ APIRef("HTML DOM") }}

Thuộc tính chỉ đọc **`HTMLElement.accessKeyLabel`** trả về một chuỗi chứa phím truy cập do trình duyệt gán cho phần tử (nếu có); nếu không thì trả về một chuỗi rỗng.

## Ví dụ

### JavaScript

```js
const btn = document.getElementById("btn1");
const shortcutLabel = btn.accessKeyLabel || btn.accessKey;
btn.title += ` [${shortcutLabel.toUpperCase()}]`;

btn.onclick = () => {
  const feedback = document.createElement("output");
  feedback.textContent = "Đã nhấn!";
  btn.insertAdjacentElement("afterend", feedback);
};
```

### HTML

```html
<button accesskey="h" title="Chú thích" id="btn1">Di chuột qua tôi</button>
```

### Kết quả

{{EmbedLiveSample('Example')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLElement.accessKey")}}
- Thuộc tính toàn cục [accesskey](/en-US/docs/Web/HTML/Reference/Global_attributes/accesskey).

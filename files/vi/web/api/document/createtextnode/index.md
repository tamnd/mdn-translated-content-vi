---
title: "Document: phương thức createTextNode()"
short-title: createTextNode()
slug: Web/API/Document/createTextNode
page-type: web-api-instance-method
browser-compat: api.Document.createTextNode
---

{{APIRef("DOM")}}

Tạo một nút {{domxref("Text")}} mới. Phương thức này có thể được sử dụng để escape các ký tự HTML.

## Cú pháp

```js-nolint
createTextNode(data)
```

### Tham số

- `data`
  - : Một chuỗi chứa dữ liệu cần được đặt vào nút văn bản.

### Giá trị trả về

Một nút {{domxref("Text")}}.

## Ví dụ

```html
<button>YES!</button>
<button>NO!</button>
<button>WE CAN!</button>

<hr />

<p id="p1">First line of paragraph.</p>
```

```js
function addTextNode(text) {
  const newText = document.createTextNode(text);
  const p1 = document.getElementById("p1");

  p1.appendChild(newText);
}

document.querySelectorAll("button").forEach((button) => {
  button.addEventListener("click", (event) => {
    addTextNode(`${event.target.textContent} `);
  });
});
```

{{EmbedLiveSample('Examples')}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

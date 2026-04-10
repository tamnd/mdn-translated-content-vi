---
title: "HTMLAnchorElement: thuộc tính text"
short-title: text
slug: Web/API/HTMLAnchorElement/text
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.text
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`text`** của giao diện {{domxref("HTMLAnchorElement")}} đại diện cho văn bản bên trong phần tử. Thuộc tính này đại diện cho cùng thông tin như {{domxref("Node.textContent")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<a id="exampleLink" href="https://example.com">Ví dụ liên kết</a>
<p class="text"></p>
```

```css
#exampleLink {
  font-size: 1.5rem;
}
```

```js
const anchorElement = document.getElementById("exampleLink");
const pTag = document.querySelector(".text");
pTag.textContent = `Thuộc tính text: ${anchorElement.text}`;
```

### Kết quả

{{EmbedLiveSample("Example",100,100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLScriptElement.text")}}
- Thuộc tính {{domxref("HTMLOptionElement.text")}}

---
title: "HTMLAnchorElement: thuộc tính type"
short-title: type
slug: Web/API/HTMLAnchorElement/type
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.type
---

{{ApiRef("HTML DOM")}}

Thuộc tính **`type`** của giao diện {{domxref("HTMLAnchorElement")}} là một chuỗi cho biết kiểu MIME của tài nguyên được liên kết.

Nó phản ánh thuộc tính `type` của phần tử {{HTMLElement("a")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<a id="exampleLink" href="https://example.com" type="text/html">Ví dụ liên kết</a>
<p class="type"></p>
```

```css
#exampleLink {
  font-size: 1.5rem;
}
```

```js
const anchorElement = document.getElementById("exampleLink");
const pTag = document.querySelector(".type");
console.log(anchorElement.type); // Xuất ra: "text/html"
pTag.textContent = anchorElement.type;
```

{{EmbedLiveSample("Example",100,100)}}

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLLinkElement.type")}}
- Thuộc tính {{domxref("HTMLSourceElement.type")}}
- Thuộc tính {{domxref("HTMLEmbedElement.type")}}

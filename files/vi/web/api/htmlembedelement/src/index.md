---
title: "HTMLEmbedElement: thuộc tính src"
short-title: src
slug: Web/API/HTMLEmbedElement/src
page-type: web-api-instance-property
browser-compat: api.HTMLEmbedElement.src
---

{{APIRef("HTML DOM")}}

Thuộc tính **`src`** của giao diện {{domxref("HTMLEmbedElement")}} trả về một chuỗi cho biết URL của tài nguyên đang được nhúng.

Nó phản ánh thuộc tính `src` của phần tử {{HTMLElement("embed")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<embed
  id="el"
  type="video/quicktime"
  src="movie.mov"
  width="640"
  height="480"
  title="Title of my video" />
```

```js
const el = document.getElementById("el");
console.log(el.src); // Kết quả: "movie.mov"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

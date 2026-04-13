---
title: "Document: thuộc tính anchors"
short-title: anchors
slug: Web/API/Document/anchors
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.anchors
---

{{APIRef("DOM")}} {{Deprecated_Header}}

Thuộc tính chỉ đọc **`anchors`** của giao diện {{domxref("Document")}} trả về danh sách tất cả các neo (anchor) trong tài liệu.

## Giá trị

Một {{domxref("HTMLCollection")}}.

## Ví dụ

### Sử dụng cơ bản

```js
if (document.anchors.length >= 5) {
  console.log("found too many anchors");
}
```

### Tạo mục lục

Sau đây là một ví dụ tự động tạo Mục lục với mọi neo trên trang:

```html
<h1>Title</h1>
<h2><a name="contents">Contents</a></h2>
<ul id="toc"></ul>

<h2><a name="plants">Plants</a></h2>
<ol>
  <li>Apples</li>
  <li>Oranges</li>
  <li>Pears</li>
</ol>

<h2><a name="veggies">Veggies</a></h2>
<ol>
  <li>Carrots</li>
  <li>Celery</li>
  <li>Beats</li>
</ol>
```

```js
const toc = document.getElementById("toc");
for (const anchor of document.anchors) {
  const li = document.createElement("li");
  const newAnchor = document.createElement("a");
  newAnchor.href = `#${anchor.name}`;
  newAnchor.textContent = anchor.text;
  li.appendChild(newAnchor);
  toc.appendChild(li);
}
```

{{EmbedLiveSample("Creating a table of contents", "", 500)}}

## Ghi chú

Vì lý do tương thích ngược, tập hợp các neo được trả về chỉ chứa những neo được tạo bằng thuộc tính `name`, không phải những neo được tạo bằng thuộc tính `id`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

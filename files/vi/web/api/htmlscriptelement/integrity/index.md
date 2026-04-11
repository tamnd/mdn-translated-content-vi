---
title: "HTMLScriptElement: thuộc tính integrity"
short-title: integrity
slug: Web/API/HTMLScriptElement/integrity
page-type: web-api-instance-property
browser-compat: api.HTMLScriptElement.integrity
---

{{APIRef("HTML DOM")}}

Thuộc tính **`integrity`** của giao diện {{domxref("HTMLScriptElement")}} là một chuỗi chứa siêu dữ liệu nội tuyến mà trình duyệt có thể dùng để xác minh rằng tài nguyên đã được tìm nạp và không bị can thiệp ngoài mong muốn.

Nó phản ánh thuộc tính `integrity` của phần tử {{HTMLElement("script")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<script
  id="el"
  src="https://example.com/example-framework.js"
  integrity="sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
  crossorigin="anonymous"></script>
```

```js
const el = document.getElementById("el");
console.log(el.integrity); // Kết quả: "sha384-oqVuAfXRKap7fdgcCY5uykM6+R9GqQ8K/uxy9rx7HNQlGYl1kPzQho1wx4JwY8wC"
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLLinkElement.integrity")}}
- [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity)

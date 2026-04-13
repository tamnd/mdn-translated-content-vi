---
title: "HTMLLinkElement: thuộc tính integrity"
short-title: integrity
slug: Web/API/HTMLLinkElement/integrity
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.integrity
---

{{APIRef("HTML DOM")}}

Thuộc tính **`integrity`** của giao diện {{domxref("HTMLLinkElement")}} là một chuỗi chứa siêu dữ liệu nội dòng mà trình duyệt có thể sử dụng để xác minh tài nguyên tải về đã được phân phối mà không bị thao tác ngoài ý muốn.

Nó phản ánh thuộc tính `integrity` của phần tử {{HTMLElement("link")}}.

## Giá trị

Một chuỗi.

## Ví dụ

```html
<link
  id="el"
  href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
  rel="stylesheet"
  integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
  crossorigin="anonymous" />
```

```js
const el = document.getElementById("el");
console.log(el.integrity); // Output: "sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- {{domxref("HTMLScriptElement.integrity")}}
- [Subresource Integrity](/en-US/docs/Web/Security/Defenses/Subresource_Integrity)

---
title: "Document: rootElement property"
short-title: rootElement
slug: Web/API/Document/rootElement
page-type: web-api-instance-property
status:
  - deprecated
browser-compat: api.Document.rootElement
---

{{ApiRef("DOM")}}{{Deprecated_header}}

**`Document.rootElement`** trả về {{domxref("Element")}}
là phần tử gốc của {{domxref("document")}} nếu nó là một phần tử {{SVGElement("svg")}}, ngược lại là `null`. Thuộc tính này không được dùng nữa mà thay thế bằng {{domxref("Document.documentElement")}}, trả về phần tử gốc cho tất cả tài liệu.

## Giá trị

Đối với các phần tử SVG, {{domxref("Element")}} là phần tử gốc của {{domxref("document")}}; ngược lại là `null`.

Nếu tài liệu là một tài liệu SVG không rỗng, thì `rootElement` sẽ là một {{domxref("SVGSVGElement")}}, giống hệt `documentElement`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

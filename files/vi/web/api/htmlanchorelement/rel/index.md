---
title: "HTMLAnchorElement: thuộc tính rel"
short-title: rel
slug: Web/API/HTMLAnchorElement/rel
page-type: web-api-instance-property
browser-compat: api.HTMLAnchorElement.rel
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLAnchorElement.rel`** phản ánh thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel). Nó là một chuỗi chứa danh sách các loại liên kết được phân tách bằng khoảng trắng, cho biết mối quan hệ giữa tài nguyên được đại diện bởi phần tử {{HTMLElement("a")}} và tài liệu hiện tại.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const anchors = document.getElementsByTagName("a");
for (const anchor of anchors) {
  alert(`Rel: ${anchor.rel}`);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính tương đương trên {{HTMLElement("area")}} và {{HTMLElement("link")}},
  {{domxref("HTMLAreaElement.rel")}} và {{domxref("HTMLLinkElement.rel")}}.
- Cùng danh sách đó nhưng dưới dạng token: {{domxref("HTMLAnchorElement.relList")}}

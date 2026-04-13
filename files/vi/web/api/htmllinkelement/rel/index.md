---
title: "HTMLLinkElement: thuộc tính rel"
short-title: rel
slug: Web/API/HTMLLinkElement/rel
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.rel
---

{{APIRef("HTML DOM")}}

Thuộc tính **`rel`** của giao diện {{domxref("HTMLLinkElement")}} phản ánh thuộc tính [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel). Nó là một chuỗi chứa danh sách các loại liên kết được phân tách bằng dấu cách cho biết mối quan hệ giữa tài nguyên được đại diện bởi phần tử {{HTMLElement("link")}} và tài liệu hiện tại.

Cách sử dụng phổ biến nhất của thuộc tính này là chỉ định liên kết đến bảng kiểu bên ngoài: thuộc tính được đặt thành `stylesheet`, và thuộc tính [`href`](/en-US/docs/Web/HTML/Reference/Elements/link#href) được đặt thành URL của bảng kiểu bên ngoài để định dạng trang.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const links = document.getElementsByTagName("link");
for (const link of links) {
  console.log(link);
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính tương đương trên {{HTMLElement("a")}} và {{HTMLElement("area")}},
  {{domxref("HTMLAnchorElement.rel")}} và {{domxref("HTMLAreaElement.rel")}}.
- Danh sách tương tự nhưng dưới dạng token: {{domxref("HTMLLinkElement.relList")}}

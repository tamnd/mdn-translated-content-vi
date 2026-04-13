---
title: "HTMLLinkElement: thuộc tính relList"
short-title: relList
slug: Web/API/HTMLLinkElement/relList
page-type: web-api-instance-property
browser-compat: api.HTMLLinkElement.relList
---

{{APIRef("HTML DOM")}}

Thuộc tính **`relList`** chỉ đọc của giao diện {{domxref("HTMLLinkElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp chứa tập hợp các loại liên kết cho biết mối quan hệ giữa tài nguyên được đại diện bởi phần tử {{HTMLElement("link")}} và tài liệu hiện tại. Nó phản ánh thuộc tính nội dung [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) của phần tử {{HTMLElement("link")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `relList` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `relList`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}}, và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```js
const links = document.getElementsByTagName("link");
for (const link of links) {
  console.log("New link found.");
  link.relList.forEach((relEntry) => {
    console.log(relEntry);
  });
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Trình duyệt hỗ trợ

{{Compat}}

## Xem thêm

- Thuộc tính tương đương trên {{HTMLElement("a")}} và {{HTMLElement("area")}},
  {{domxref("HTMLAnchorElement.relList")}} và {{domxref("HTMLAreaElement.relList")}}.
- Danh sách tương tự nhưng dưới dạng token được phân tách bằng dấu cách trong một chuỗi:
  {{domxref("HTMLLinkElement.rel")}}

---
title: "HTMLFormElement: thuộc tính relList"
short-title: relList
slug: Web/API/HTMLFormElement/relList
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.relList
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`relList`** của giao diện {{domxref("HTMLFormElement")}} trả về một đối tượng {{domxref("DOMTokenList")}} trực tiếp chứa tập hợp các loại liên kết cho biết mối quan hệ giữa tài nguyên được đại diện bởi phần tử {{HTMLElement("form")}} và tài liệu hiện tại. Nó phản ánh thuộc tính nội dung [`rel`](/en-US/docs/Web/HTML/Reference/Attributes/rel) của phần tử {{HTMLElement("form")}}.

## Giá trị

Một đối tượng {{domxref("DOMTokenList")}} trực tiếp.

Mặc dù bản thân thuộc tính `relList` là chỉ đọc theo nghĩa bạn không thể thay thế đối tượng `DOMTokenList`, bạn vẫn có thể gán trực tiếp cho thuộc tính `relList`, tương đương với việc gán cho thuộc tính {{domxref("DOMTokenList/value", "value")}} của nó. Bạn cũng có thể sửa đổi đối tượng `DOMTokenList` bằng các phương thức {{domxref("DOMTokenList/add", "add()")}}, {{domxref("DOMTokenList/remove", "remove()")}}, {{domxref("DOMTokenList/replace", "replace()")}}, và {{domxref("DOMTokenList/toggle", "toggle()")}}.

## Ví dụ

```js
const form = document.querySelector("form");
form.relList.forEach((relEntry) => {
  console.log(relEntry);
});
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLAnchorElement.relList")}}
- {{domxref("HTMLLinkElement.relList")}}
- {{domxref("HTMLFormElement.rel")}}

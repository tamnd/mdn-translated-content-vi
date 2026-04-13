---
title: "HTMLTextAreaElement: readOnly property"
short-title: readOnly
slug: Web/API/HTMLTextAreaElement/readOnly
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.readOnly
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`readOnly`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} cho biết người dùng không thể sửa đổi giá trị của điều khiển. Không giống thuộc tính {{domxref("HTMLTextAreaElement.disabled", "disabled")}}, thuộc tính `readonly` không ngăn người dùng nhấp hoặc chọn trong điều khiển. Nó phản ánh thuộc tính [`readonly`](/en-US/docs/Web/HTML/Reference/Elements/textarea#readonly) của phần tử {{htmlelement("textarea")}}.

## Giá trị

Một giá trị logic.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
console.log(textArea.readOnly);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.disabled")}}
- Pseudo-class {{cssxref(":read-only")}}

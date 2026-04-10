---
title: "HTMLFormElement: thuộc tính name"
short-title: name
slug: Web/API/HTMLFormElement/name
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.name
---

{{APIRef("HTML DOM")}}

Thuộc tính **`HTMLFormElement.name`** đại diện cho tên của phần tử {{HtmlElement("form")}} hiện tại dưới dạng một chuỗi.

Nếu phần tử {{HTMLElement("Form")}} của bạn chứa một phần tử có tên _name_ thì phần tử đó sẽ ghi đè thuộc tính `form.name`, do đó bạn không thể truy cập nó.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const form1name = document.getElementById("form1").name;

if (form1name !== document.form.form1) {
  // Trình duyệt không hỗ trợ dạng tham chiếu này
}
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

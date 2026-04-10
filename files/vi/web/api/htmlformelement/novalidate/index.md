---
title: "HTMLFormElement: thuộc tính noValidate"
short-title: noValidate
slug: Web/API/HTMLFormElement/noValidate
page-type: web-api-instance-property
browser-compat: api.HTMLFormElement.noValidate
---

{{APIRef("HTML DOM")}}

Thuộc tính **`noValidate`** của giao diện {{domxref("HTMLFormElement")}} là một giá trị boolean cho biết liệu {{htmlelement("form")}} có bỏ qua [xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) khi gửi hay không. Nó phản ánh thuộc tính [`novalidate`](/en-US/docs/Web/HTML/Reference/Elements/form#novalidate) của phần tử `<form>`; nếu thuộc tính hiện diện, giá trị là `true`.

Nếu thuộc tính này không được đặt hoặc giá trị được đặt thành `false`, biểu mẫu sẽ được xác thực. Điều này có thể bị ghi đè bằng cách đặt thuộc tính {{domxref("HTMLInputElement.formNoValidate")}} hoặc {{domxref("HTMLButtonElement.formNoValidate")}} thành `true`, thông qua JavaScript hoặc thuộc tính HTML `formnovalidate`, cho điều khiển được sử dụng để gửi biểu mẫu.

Thuộc tính này có thể được truy xuất hoặc đặt.

## Giá trị

Một boolean.

## Ví dụ

```js
const element = document.getElementById("myForm");
console.log(element.noValidate);
```

## Đặc điểm kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLFormElement.reportValidity()")}}
- {{domxref("HTMLFormElement.checkValidity()")}}
- {{domxref("HTMLFormElement.action")}}
- {{domxref("HTMLFormElement.enctype")}}
- {{domxref("HTMLFormElement.method")}}
- {{domxref("HTMLFormElement.target")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)

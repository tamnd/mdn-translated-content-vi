---
title: "HTMLInputElement: thuộc tính formNoValidate"
short-title: formNoValidate
slug: Web/API/HTMLInputElement/formNoValidate
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.formNoValidate
---

{{APIRef("HTML DOM")}}

Thuộc tính **`formNoValidate`** của giao diện {{domxref("HTMLInputElement")}} là một giá trị boolean cho biết liệu {{htmlelement("form")}} có bỏ qua [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) khi được gửi qua {{htmlelement("input")}} hay không. Nó phản ánh thuộc tính [`formnovalidate`](/en-US/docs/Web/HTML/Reference/Elements/input#formnovalidate) của phần tử `<input>`.

Thuộc tính này chỉ hợp lệ cho các phần tử `<input>` loại [`submit`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

Giá trị của nó ghi đè thuộc tính {{domxref("HTMLFormElement.noValidate", "noValidate")}} của giao diện {{domxref("HTMLFormElement")}} nếu biểu mẫu được gửi qua đầu vào. Thuộc tính này có thể được lấy ra hoặc thiết lập.

## Giá trị

Một boolean.

## Ví dụ

```js
const inputElement = document.getElementById("myInput");
console.log(inputElement.formNoValidate);
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.reportValidity()")}}
- {{domxref("HTMLInputElement.checkValidity()")}}
- {{domxref("HTMLInputElement.formAction")}}
- {{domxref("HTMLInputElement.formEnctype")}}
- {{domxref("HTMLInputElement.formMethod")}}
- {{domxref("HTMLInputElement.formTarget")}}
- [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit)
- [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image)
- {{HTMLElement("form")}}
- {{domxref("HTMLFormElement.noValidate")}}
- {{domxref("HTMLButtonElement.formNoValidate")}}
- [Learn: Kiểm tra biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)

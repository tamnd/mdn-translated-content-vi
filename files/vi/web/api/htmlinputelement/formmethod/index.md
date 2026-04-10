---
title: "HTMLInputElement: thuộc tính formMethod"
short-title: formMethod
slug: Web/API/HTMLInputElement/formMethod
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.formMethod
---

{{APIRef("HTML DOM")}}

Thuộc tính **`formMethod`** của giao diện {{domxref("HTMLInputElement")}} là phương thức {{Glossary("HTTP")}} được sử dụng để gửi {{HtmlElement("form")}} nếu phần tử {{HTMLElement("input")}} là điều khiển gửi biểu mẫu. Nó phản ánh giá trị của thuộc tính [`formmethod`](/en-US/docs/Web/HTML/Reference/Elements/input#formmethod) của `<input>`.

Thuộc tính này chỉ hợp lệ cho các phần tử `<input>` loại [`submit`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

Giá trị ghi đè thuộc tính {{domxref("HTMLFormElement.method", "method")}} của giao diện {{domxref("HTMLFormElement")}} nếu biểu mẫu được gửi qua đầu vào. Thuộc tính này có thể được lấy ra hoặc thiết lập. Nếu được đặt với giá trị rỗng hoặc không hợp lệ, giá trị mặc định không hợp lệ là `"get"`. Nếu hoàn toàn không được đặt, giá trị là chuỗi rỗng (`""`).

## Giá trị

Một chuỗi; `"post"`, `"get"`, `"dialog"`, hoặc `""`.

## Ví dụ

```js
inputElement.formMethod = "post";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.formAction")}}
- {{domxref("HTMLInputElement.formEnctype")}}
- {{domxref("HTMLInputElement.formNoValidate")}}
- {{domxref("HTMLInputElement.formTarget")}}
- {{domxref("HTMLFormElement.method")}}
- [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit)
- [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)

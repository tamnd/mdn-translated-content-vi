---
title: "HTMLInputElement: thuộc tính formEnctype"
short-title: formEnctype
slug: Web/API/HTMLInputElement/formEnctype
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.formEnctype
---

{{APIRef("HTML DOM")}}

Thuộc tính **`formEnctype`** của giao diện {{domxref("HTMLInputElement")}} là {{Glossary("MIME_type", "kiểu MIME")}} của nội dung được gửi đến máy chủ khi `<input>` có `formEnctype` là phương thức gửi biểu mẫu. Nó phản ánh giá trị của thuộc tính [`formenctype`](/en-US/docs/Web/HTML/Reference/Elements/input#formenctype) của `<input>`.

Thuộc tính này chỉ hợp lệ cho các phần tử `<input>` loại [`submit`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

Giá trị của nó ghi đè thuộc tính {{domxref("HTMLFormElement.enctype", "enctype")}} của giao diện {{domxref("HTMLFormElement")}} nếu biểu mẫu được gửi qua đầu vào. Thuộc tính này có thể được lấy ra hoặc thiết lập. Nếu không được đặt, giá trị là chuỗi rỗng (`""`).

## Giá trị

Một chuỗi.

## Ví dụ

```js
inputElement.formEnctype = "application/x-www-form-urlencoded";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.formAction")}}
- {{domxref("HTMLInputElement.formMethod")}}
- {{domxref("HTMLInputElement.formNoValidate")}}
- {{domxref("HTMLInputElement.formTarget")}}
- {{domxref("HTMLFormElement.enctype")}}
- [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit)
- [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)

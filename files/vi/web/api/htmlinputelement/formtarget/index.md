---
title: "HTMLInputElement: thuộc tính formTarget"
short-title: formTarget
slug: Web/API/HTMLInputElement/formTarget
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.formTarget
---

{{APIRef("HTML DOM")}}

Thuộc tính **`formTarget`** của giao diện {{domxref("HTMLInputElement")}} là tab, cửa sổ hoặc iframe nơi phản hồi của {{HtmlElement("form")}} đã gửi được hiển thị. Nó phản ánh giá trị của thuộc tính [`formtarget`](/en-US/docs/Web/HTML/Reference/Elements/input#formtarget) của phần tử {{HTMLElement("input")}}.

Thuộc tính này chỉ hợp lệ cho các phần tử `<input>` loại [`submit`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

Giá trị của nó ghi đè thuộc tính {{domxref("HTMLFormElement.target", "target")}} của giao diện {{domxref("HTMLFormElement")}} nếu biểu mẫu được gửi qua đầu vào. Thuộc tính này có thể được lấy ra hoặc thiết lập. Nếu không được đặt, giá trị là chuỗi rỗng (`""`).

## Giá trị

Một chuỗi.

## Ví dụ

```js
inputElement.formTarget = "_blank";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.formAction")}}
- {{domxref("HTMLInputElement.formEnctype")}}
- {{domxref("HTMLInputElement.formNoValidate")}}
- {{domxref("HTMLInputElement.formMethod")}}
- {{domxref("HTMLFormElement.target")}}
- [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit)
- [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)

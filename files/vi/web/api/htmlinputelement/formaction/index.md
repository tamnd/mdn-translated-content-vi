---
title: "HTMLInputElement: thuộc tính formAction"
short-title: formAction
slug: Web/API/HTMLInputElement/formAction
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.formAction
---

{{APIRef("HTML DOM")}}

Thuộc tính **`formAction`** của giao diện {{domxref("HTMLInputElement")}} là URL của chương trình được thực thi trên máy chủ khi biểu mẫu sở hữu điều khiển này được gửi. Nó phản ánh giá trị của thuộc tính [`formaction`](/en-US/docs/Web/HTML/Reference/Elements/input#formaction) của `<input>`.

Thuộc tính này chỉ hợp lệ cho các phần tử `<input>` loại [`submit`](/en-US/docs/Web/HTML/Reference/Elements/input/submit) và [`image`](/en-US/docs/Web/HTML/Reference/Elements/input/image).

Giá trị của nó ghi đè thuộc tính {{domxref("HTMLFormElement.action", "action")}} của giao diện {{domxref("HTMLFormElement")}} nếu biểu mẫu được gửi qua đầu vào. Thuộc tính này có thể được lấy ra hoặc thiết lập.

## Giá trị

Một chuỗi. URL để gửi biểu mẫu.

## Ví dụ

```js
inputElement.formAction = "/cgi-bin/publish";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.formEnctype")}}
- {{domxref("HTMLInputElement.formMethod")}}
- {{domxref("HTMLInputElement.formNoValidate")}}
- {{domxref("HTMLInputElement.formTarget")}}
- [`<input type="submit">`](/en-US/docs/Web/HTML/Reference/Elements/input/submit)
- [`<input type="image">`](/en-US/docs/Web/HTML/Reference/Elements/input/image)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)

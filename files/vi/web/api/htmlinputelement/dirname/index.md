---
title: "HTMLInputElement: thuộc tính dirName"
short-title: dirName
slug: Web/API/HTMLInputElement/dirName
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.dirName
---

{{APIRef("HTML DOM")}}

Thuộc tính **`dirName`** của giao diện {{domxref("HTMLInputElement")}} là hướng của phần tử và cho phép gửi giá trị đó. Nó phản ánh giá trị của thuộc tính [`dirName`](/en-US/docs/Web/HTML/Reference/Attributes/dirname) của phần tử {{htmlelement("input")}}. Thuộc tính này có thể được lấy ra hoặc thiết lập.

Chỉ hợp lệ cho các loại `<input>` [`hidden`](/en-US/docs/Web/HTML/Reference/Elements/input/hidden), [`text`](/en-US/docs/Web/HTML/Reference/Elements/input/text), [`search`](/en-US/docs/Web/HTML/Reference/Elements/input/search), [`url`](/en-US/docs/Web/HTML/Reference/Elements/input/url), [`tel`](/en-US/docs/Web/HTML/Reference/Elements/input/tel), và [`email`](/en-US/docs/Web/HTML/Reference/Elements/input/email), thuộc tính `dirname` kiểm soát cách hướng của phần tử được gửi. Khi được bao gồm, điều khiển biểu mẫu sẽ gửi hai cặp tên/giá trị: cặp đầu tiên là [`name`](/en-US/docs/Web/HTML/Reference/Elements/input#name) và [`value`](/en-US/docs/Web/HTML/Reference/Elements/input#value), và cặp thứ hai là giá trị của thuộc tính [`dirname`](/en-US/docs/Web/HTML/Reference/Elements/input#dirname) làm tên, với giá trị là `ltr` hoặc `rtl` do trình duyệt đặt.

## Giá trị

Một chuỗi. Hướng của phần tử.

## Ví dụ

```js
inputElement.dirName = "rtl";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.dirName")}}
- [Thuộc tính `dir`](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)

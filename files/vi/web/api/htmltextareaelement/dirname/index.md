---
title: "HTMLTextAreaElement: dirName property"
short-title: dirName
slug: Web/API/HTMLTextAreaElement/dirName
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.dirName
---

{{APIRef("HTML DOM")}}

Thuộc tính **`dirName`** của giao diện {{domxref("HTMLTextAreaElement")}} là hướng văn bản của phần tử. Nó phản ánh giá trị của thuộc tính [`dirName`](/en-US/docs/Web/HTML/Reference/Attributes/dirname) của phần tử {{htmlelement("textarea")}}. Thuộc tính này có thể được đọc hoặc gán.

Thuộc tính `dirname` kiểm soát cách hướng văn bản của phần tử được gửi đi. Khi được đưa vào, điều khiển biểu mẫu sẽ gửi hai cặp tên/giá trị: cặp đầu tiên là [`name`](/en-US/docs/Web/API/HTMLTextAreaElement/name) và [`value`](/en-US/docs/Web/API/HTMLTextAreaElement/value) của `<textarea>`, và cặp thứ hai là giá trị của thuộc tính [`dirname`](/en-US/docs/Web/HTML/Reference/Elements/textarea#dirname) làm tên, với giá trị `ltr` hoặc `rtl` do trình duyệt đặt.

## Giá trị

Một chuỗi. Hướng của phần tử.

## Ví dụ

```js
textareaElement.dirName = "rtl";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.dirName")}}
- [`dir` attribute](/en-US/docs/Web/HTML/Reference/Global_attributes/dir)
- [Gửi dữ liệu biểu mẫu](/en-US/docs/Learn_web_development/Extensions/Forms/Sending_and_retrieving_form_data)

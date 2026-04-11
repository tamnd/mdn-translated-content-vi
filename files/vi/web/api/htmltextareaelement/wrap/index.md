---
title: "HTMLTextAreaElement: wrap property"
short-title: wrap
slug: Web/API/HTMLTextAreaElement/wrap
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.wrap
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`wrap`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} cho biết điều khiển nên ngắt dòng giá trị như thế nào khi gửi biểu mẫu. Nó phản ánh thuộc tính [`wrap`](/en-US/docs/Web/HTML/Reference/Elements/textarea#wrap) của phần tử `<textarea>`. Lưu ý rằng giá trị `"hard"` chỉ có tác dụng khi thuộc tính {{domxref("HTMLTextAreaElement.cols", "cols")}} cũng được đặt.

## Giá trị

Xem [`wrap`](/en-US/docs/Web/HTML/Reference/Elements/textarea#wrap) để biết các giá trị có thể. Mặc định là `"soft"`.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
const oldWrap = textArea.wrap;
textArea.wrap = "hard"; // Add line breaks (CR+LF) during form submission
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.cols")}}

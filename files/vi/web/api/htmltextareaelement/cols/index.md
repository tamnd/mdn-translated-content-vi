---
title: "HTMLTextAreaElement: cols property"
short-title: cols
slug: Web/API/HTMLTextAreaElement/cols
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.cols
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`cols`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} là một số nguyên dương đại diện cho chiều rộng hiển thị của điều khiển văn bản nhiều dòng, tính theo độ rộng ký tự trung bình. Nó phản ánh thuộc tính [`cols`](/en-US/docs/Web/HTML/Reference/Elements/textarea#cols) của phần tử `<textarea>`.

## Giá trị

Một số nguyên dương. Mặc định là `20`.

## Ví dụ

```js
const textareaElement = document.getElementById("comment");
textArea.cols = 80;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.rows")}}
- {{DOMXref("HTMLTextAreaElement.wrap")}}
- Thuộc tính CSS {{cssxref("resize")}}

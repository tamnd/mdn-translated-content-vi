---
title: "HTMLTextAreaElement: defaultValue property"
short-title: defaultValue
slug: Web/API/HTMLTextAreaElement/defaultValue
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.defaultValue
---

{{ APIRef("HTML DOM") }}

Thuộc tính **`defaultValue`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} đại diện cho nội dung văn bản mặc định của vùng văn bản này. Việc lấy và đặt giá trị này tương đương với việc lấy và đặt {{domxref("Node.textContent", "textContent")}} trên {{htmlelement("textarea")}}.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ dưới đây, `defaultValue` vẫn trả về giá trị ban đầu được viết trong HTML. Nếu đã đặt giá trị mặc định, bằng HTML hoặc bằng thuộc tính `defaultValue`, dữ liệu do người dùng nhập sẽ cập nhật `value` nhưng sẽ không ghi đè `defaultValue`.

```js
const textareaElement = document.getElementById("comment");
console.log(textArea.defaultValue);
textArea.defaultValue = "This is the default text now!";
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{DOMXref("HTMLTextAreaElement.value")}}

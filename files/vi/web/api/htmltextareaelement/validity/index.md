---
title: "HTMLTextAreaElement: validity property"
short-title: validity
slug: Web/API/HTMLTextAreaElement/validity
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.validity
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validity`** của giao diện {{domxref("HTMLTextAreaElement")}} trả về một đối tượng {{domxref("ValidityState")}} đại diện cho các trạng thái hợp lệ mà phần tử này đang ở.

## Giá trị

Một đối tượng {{domxref("ValidityState")}}.

## Ví dụ

Ví dụ sau lấy trạng thái hợp lệ của một phần tử vùng văn bản và xử lý nếu nó không hợp lệ:

```js
const textArea = document.getElementById("myTextArea");
const validityState = textArea.validity;
if (!validityState.valid) {
  // Test each validity state
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLTextAreaElement.checkValidity()")}}
- {{HTMLElement("textarea")}}
- {{HTMLElement("form")}}
- [Học: Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)

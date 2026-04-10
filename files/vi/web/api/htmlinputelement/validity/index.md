---
title: "HTMLInputElement: thuộc tính validity"
short-title: validity
slug: Web/API/HTMLInputElement/validity
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.validity
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validity`** của giao diện {{domxref("HTMLInputElement")}} trả về một đối tượng {{domxref("ValidityState")}} đại diện cho các trạng thái hợp lệ mà phần tử này đang ở.

## Giá trị

Một đối tượng {{domxref("ValidityState")}}.

## Ví dụ

Ví dụ sau lấy trạng thái hợp lệ của phần tử đầu vào và xử lý nó nếu không hợp lệ:

```js
const input = document.getElementById("myInput");
const validityState = input.validity;
if (!validityState.valid) {
  // Kiểm tra từng trạng thái hợp lệ
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.checkValidity()")}}
- {{HTMLElement("input")}}
- {{HTMLElement("form")}}
- [Learn: Kiểm tra biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)

---
title: "HTMLTextAreaElement: validationMessage property"
short-title: validationMessage
slug: Web/API/HTMLTextAreaElement/validationMessage
page-type: web-api-instance-property
browser-compat: api.HTMLTextAreaElement.validationMessage
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validationMessage`** của giao diện {{domxref("HTMLTextAreaElement")}} trả về một chuỗi đại diện cho thông báo đã được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển {{htmlelement("textarea")}} không thỏa mãn, nếu có. Đây là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc ({{domxref("HTMLTextAreaElement.willValidate")}} là `false`), hoặc nếu nó thỏa mãn các ràng buộc của mình.

Nếu phần tử `<textarea>` là ứng viên cho xác thực ràng buộc (`willValidate` là `true`) và các ràng buộc không được đáp ứng (thuộc tính `valid` của đối tượng {{domxref("HTMLTextAreaElement.validity")}} là `false`), thì giá trị là thông báo lỗi sẽ được hiển thị cho người dùng trong quá trình xác thực.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const textarea = document.getElementById("myTextArea");
const errorMessage = textarea.validationMessage;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.willValidate")}}
- {{domxref("HTMLTextAreaElement.validity")}}
- {{domxref("HTMLTextAreaElement.checkValidity()")}}
- {{domxref("HTMLTextAreaElement.reportValidity()")}}
- {{domxref("HTMLTextAreaElement.setCustomValidity()")}}
- [Học: Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Pseudo-class CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}

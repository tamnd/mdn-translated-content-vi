---
title: "HTMLSelectElement: thuộc tính validationMessage"
short-title: validationMessage
slug: Web/API/HTMLSelectElement/validationMessage
page-type: web-api-instance-property
browser-compat: api.HTMLSelectElement.validationMessage
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validationMessage`** của giao diện {{domxref("HTMLSelectElement")}} trả về một chuỗi biểu thị thông báo đã được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển {{htmlelement("select")}} không thỏa mãn (nếu có). Đây là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc ({{domxref("HTMLSelectElement.willValidate")}} là `false`), hoặc nó thỏa mãn các ràng buộc của mình.

Nếu phần tử `<select>` là ứng viên cho xác thực ràng buộc (`willValidate` là `true`) và các ràng buộc không được đáp ứng (thuộc tính `valid` của đối tượng {{domxref("HTMLSelectElement.validity")}} là `false`), giá trị này là thông báo lỗi sẽ hiển thị cho người dùng trong quá trình xác thực.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const select = document.getElementById("mySelect");
const errorMessage = select.validationMessage;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLelement("select")}}
- {{domxref("HTMLSelectElement")}}
- {{domxref("HTMLSelectElement.willValidate")}}
- {{domxref("HTMLSelectElement.validity")}}
- {{domxref("HTMLSelectElement.checkValidity()")}}
- {{domxref("HTMLSelectElement.reportValidity()")}}
- {{domxref("HTMLSelectElement.setCustomValidity()")}}
- [Learn: Client-side form validation](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Constraint validation](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- CSS {{cssxref(":valid")}} and {{cssxref(":invalid")}} pseudo-classes

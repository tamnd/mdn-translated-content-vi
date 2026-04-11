---
title: "HTMLButtonElement: thuộc tính validationMessage"
short-title: validationMessage
slug: Web/API/HTMLButtonElement/validationMessage
page-type: web-api-instance-property
browser-compat: api.HTMLButtonElement.validationMessage
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validationMessage`** của giao diện {{domxref("HTMLButtonElement")}} trả về một chuỗi biểu thị thông báo đã được bản địa hóa mô tả các ràng buộc xác thực mà điều khiển {{htmlelement("button")}} không thỏa mãn (nếu có). Đây là chuỗi rỗng nếu điều khiển không phải là ứng viên cho xác thực ràng buộc (loại của `<button>` là `button` hoặc `reset`), hoặc nếu nó thỏa mãn các ràng buộc của mình.

Nếu `<button>` là ứng viên cho xác thực ràng buộc (loại được đặt hoặc mặc định là `submit` và {{domxref("HTMLButtonElement.willValidate")}} là `true`) và các ràng buộc không được đáp ứng (có một {{domxref("ValidityState.customError")}} không rỗng), giá trị này là thông báo lỗi sẽ hiển thị cho người dùng khi xác thực phần tử.

## Giá trị

Một chuỗi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLelement("button")}}
- {{domxref("HTMLButtonElement")}}
- {{domxref("HTMLButtonElement.willValidate")}}
- {{domxref("HTMLButtonElement.validity")}}
- {{domxref("HTMLButtonElement.checkValidity()")}}
- {{domxref("HTMLButtonElement.reportValidity()")}}
- {{domxref("HTMLButtonElement.setCustomValidity()")}}
- [Learn: Client-side form validation](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Constraint validation](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- CSS {{cssxref(":valid")}} and {{cssxref(":invalid")}} pseudo-classes

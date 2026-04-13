---
title: "HTMLFieldSetElement: thuộc tính validationMessage"
short-title: validationMessage
slug: Web/API/HTMLFieldSetElement/validationMessage
page-type: web-api-instance-property
browser-compat: api.HTMLFieldSetElement.validationMessage
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validationMessage`** của giao diện {{domxref("HTMLFieldSetElement")}} trả về một chuỗi đại diện cho thông báo đã bản địa hóa mô tả các ràng buộc xác thực mà điều khiển {{htmlelement("fieldset")}} không đáp ứng (nếu có). Đây là chuỗi rỗng vì các phần tử `<fieldset>` không phải là ứng viên cho xác thực ràng buộc ({{domxref("HTMLFieldSetElement.willValidate")}} là `false`).

## Giá trị

Chuỗi rỗng, `""`.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLelement("fieldset")}}
- {{domxref("HTMLFieldSetElement")}}
- {{domxref("HTMLFieldSetElement.willValidate")}}
- {{domxref("HTMLFieldSetElement.validity")}}
- {{domxref("HTMLFieldSetElement.checkValidity()")}}
- {{domxref("HTMLFieldSetElement.reportValidity()")}}
- {{domxref("HTMLFieldSetElement.setCustomValidity()")}}
- [Learn: Xác thực form phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Các lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}

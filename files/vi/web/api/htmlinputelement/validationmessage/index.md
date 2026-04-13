---
title: "HTMLInputElement: thuộc tính validationMessage"
short-title: validationMessage
slug: Web/API/HTMLInputElement/validationMessage
page-type: web-api-instance-property
browser-compat: api.HTMLInputElement.validationMessage
---

{{APIRef("HTML DOM")}}

Thuộc tính chỉ đọc **`validationMessage`** của giao diện {{domxref("HTMLInputElement")}} trả về một chuỗi đại diện cho thông báo đã bản địa hóa mô tả các ràng buộc xác thực mà điều khiển {{htmlelement("input")}} không thỏa mãn (nếu có).

Nếu phần tử `<input>` không phải là ứng viên cho kiểm tra ràng buộc ({{domxref("HTMLInputElement.willValidate")}} là `false`), hoặc nó thỏa mãn các ràng buộc của nó, giá trị là chuỗi rỗng (`""`).

Nếu phần tử là ứng viên cho kiểm tra ràng buộc (`willValidate` là `true`) và các ràng buộc không được đáp ứng (thuộc tính `valid` của đối tượng {{domxref("HTMLInputElement.validity")}} là `false`), giá trị là thông báo lỗi sẽ được hiển thị cho người dùng trong quá trình xác thực.

## Giá trị

Một chuỗi.

## Ví dụ

```js
const input = document.getElementById("myInput");
const errorMessage = input.validationMessage;
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLelement("input")}}
- {{domxref("HTMLInputElement")}}
- {{domxref("HTMLInputElement.willValidate")}}
- {{domxref("HTMLInputElement.validity")}}
- {{domxref("HTMLInputElement.checkValidity()")}}
- {{domxref("HTMLInputElement.reportValidity()")}}
- {{domxref("HTMLInputElement.setCustomValidity()")}}
- [Learn: Kiểm tra biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}

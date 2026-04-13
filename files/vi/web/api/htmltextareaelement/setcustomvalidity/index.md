---
title: "HTMLTextAreaElement: setCustomValidity() method"
short-title: setCustomValidity()
slug: Web/API/HTMLTextAreaElement/setCustomValidity
page-type: web-api-instance-method
browser-compat: api.HTMLTextAreaElement.setCustomValidity
---

{{ APIRef("HTML DOM") }}

Phương thức **`setCustomValidity()`** của giao diện {{DOMxRef("HTMLTextAreaElement")}} đặt thông báo hợp lệ tùy chỉnh cho phần tử {{htmlelement("textarea")}}. Dùng chuỗi rỗng để cho biết phần tử _không_ có lỗi hợp lệ tùy chỉnh.

## Cú pháp

```js-nolint
setCustomValidity(string)
```

### Tham số

- `string`
  - : Chuỗi chứa thông báo lỗi. Chuỗi rỗng sẽ loại bỏ mọi lỗi hợp lệ tùy chỉnh.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

Trong ví dụ này, nếu `<textarea>` không vượt qua xác thực ràng buộc, chúng ta cung cấp lỗi tùy chỉnh dựa trên ràng buộc nào đang thất bại. Nếu giá trị hợp lệ, chúng ta đặt lỗi tùy chỉnh thành chuỗi rỗng:

```js
const comment = document.getElementById("comment");
if (comment.validity.valueMissing) {
  comment.setCustomValidity("We can't submit a blank comment!");
} else if (comment.validity.tooShort) {
  comment.setCustomValidity("Tell us more! Your comment is too short.");
} else if (comment.validity.tooLong) {
  comment.setCustomValidity(
    "Loquacious much? Keep it to under 800 characters!",
  );
} else {
  comment.setCustomValidity("");
}
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{HTMLElement("textarea")}}
- {{domxref("HTMLTextAreaElement")}}
- {{domxref("HTMLTextAreaElement.validity")}}
- {{domxref("HTMLTextAreaElement.checkValidity()")}}
- {{domxref("HTMLTextAreaElement.reportValidity()")}}
- [Xác thực biểu mẫu](/en-US/docs/Web/HTML/Guides/Constraint_validation).
- [Học: Xác thực biểu mẫu phía máy khách](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Hướng dẫn: Xác thực ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Pseudo-class CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}

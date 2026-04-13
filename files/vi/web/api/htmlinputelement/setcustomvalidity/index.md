---
title: "HTMLInputElement: phương thức setCustomValidity()"
short-title: setCustomValidity()
slug: Web/API/HTMLInputElement/setCustomValidity
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.setCustomValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`HTMLInputElement.setCustomValidity()`** đặt một thông báo xác thực tùy chỉnh cho phần tử.

## Cú pháp

```js-nolint
setCustomValidity(message)
```

### Tham số

- `message`
  - : Thông báo sử dụng cho lỗi xác thực.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Không có.

## Ví dụ

Trong ví dụ này, chúng ta truyền ID của một phần tử đầu vào và đặt các thông báo lỗi khác nhau tùy thuộc vào việc giá trị bị thiếu, quá thấp hay quá cao. Lưu ý rằng thông báo sẽ không được hiển thị ngay lập tức. Việc cố gắng gửi biểu mẫu sẽ hiển thị thông báo, hoặc bạn có thể gọi phương thức [`reportValidity()`](/en-US/docs/Web/API/HTMLInputElement/reportValidity) trên phần tử.

```js
function validate(inputID) {
  const input = document.getElementById(inputID);
  const validityState = input.validity;

  if (validityState.valueMissing) {
    input.setCustomValidity("Bạn phải điền vào đây!");
  } else if (validityState.rangeUnderflow) {
    input.setCustomValidity("Chúng ta cần một số cao hơn!");
  } else if (validityState.rangeOverflow) {
    input.setCustomValidity("Quá cao rồi!");
  } else {
    input.setCustomValidity("");
  }

  input.reportValidity();
}
```

Điều quan trọng là phải đặt thông báo thành chuỗi rỗng nếu không có lỗi. Miễn là thông báo lỗi không rỗng, biểu mẫu sẽ không vượt qua xác thực và sẽ không được gửi.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Learn: Kiểm tra biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- {{domxref('ValidityState')}}

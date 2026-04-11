---
title: "HTMLObjectElement: setCustomValidity() method"
short-title: setCustomValidity()
slug: Web/API/HTMLObjectElement/setCustomValidity
page-type: web-api-instance-method
browser-compat: api.HTMLObjectElement.setCustomValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`setCustomValidity()`** của giao diện {{domxref("HTMLObjectElement")}} đặt thông báo hợp lệ tùy chỉnh cho phần tử.

## Cú pháp

```js-nolint
setCustomValidity(errorMessage)
```

### Tham số

- `errorMessage`
  - : Thông báo dùng cho các lỗi hợp lệ.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

Không có.

## Ví dụ

Trong ví dụ này, ta truyền ID của một phần tử input và đặt các thông báo lỗi khác nhau tùy thuộc vào việc giá trị bị thiếu, quá thấp, hay quá cao. Lưu ý rằng thông báo sẽ không được hiển thị ngay lập tức. Cố gắng gửi form sẽ hiển thị thông báo, hoặc bạn có thể gọi phương thức [`reportValidity()`](/en-US/docs/Web/API/HTMLInputElement/reportValidity) trên phần tử.

```js
function validate(inputID) {
  const input = document.getElementById(inputID);
  const validityState = input.validity;

  if (validityState.valueMissing) {
    input.setCustomValidity("You gotta fill this out, yo!");
  } else if (validityState.rangeUnderflow) {
    input.setCustomValidity("We need a higher number!");
  } else if (validityState.rangeOverflow) {
    input.setCustomValidity("Thats too high!");
  } else {
    input.setCustomValidity("");
  }

  input.reportValidity();
}
```

Điều quan trọng là phải đặt thông báo thành chuỗi rỗng nếu không có lỗi. Miễn là thông báo lỗi không rỗng, form sẽ không vượt qua xác thực và sẽ không được gửi.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref('validityState')}}
- {{domxref('validityState.valueMissing')}}
- {{domxref('validityState.typeMismatch')}}
- {{domxref('validityState.patternMismatch')}}
- {{domxref('validityState.tooLong')}}
- {{domxref('validityState.tooShort')}}
- {{domxref('validityState.rangeUnderflow')}}
- {{domxref('validityState.rangeOverflow')}}
- {{domxref('validityState.stepMismatch')}}
- {{domxref('validityState.valid')}}
- {{domxref('validityState.customError')}}

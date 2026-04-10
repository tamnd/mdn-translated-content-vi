---
title: "HTMLInputElement: phương thức checkValidity()"
short-title: checkValidity()
slug: Web/API/HTMLInputElement/checkValidity
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.checkValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`checkValidity()`** của giao diện {{domxref("HTMLInputElement")}} trả về một giá trị boolean cho biết phần tử có đáp ứng các quy tắc [kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation) áp dụng cho nó hay không. Nếu false, phương thức cũng kích hoạt sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} trên phần tử. Vì không có hành vi mặc định của trình duyệt cho `checkValidity()`, việc hủy sự kiện `invalid` này không có tác dụng.

> [!NOTE]
> Một phần tử {{htmlelement("input")}} HTML có {{domxref("HTMLInputElement.validationMessage", "validationMessage")}} khác null được coi là không hợp lệ, sẽ khớp với lớp giả CSS {{cssxref(":invalid")}}, và sẽ khiến `checkValidity()` trả về false. Sử dụng phương thức {{domxref("HTMLInputElement.setCustomValidity()")}} để đặt {{domxref("HTMLInputElement.validationMessage")}} thành chuỗi rỗng nhằm đặt trạng thái {{domxref("HTMLInputElement.validity", "validity")}} thành hợp lệ.

## Cú pháp

```js-nolint
checkValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của phần tử không có vấn đề về tính hợp lệ; ngược lại, trả về `false`.

## Ví dụ

### HTML

Chúng ta bao gồm một biểu mẫu chứa trường số bắt buộc và hai nút: một nút để kiểm tra biểu mẫu và nút kia để gửi nó.

```html
<form action="#" method="post">
  <p>
    <label for="age">Tuổi của bạn (21 đến 65) </label>
    <input type="number" name="age" required id="age" min="21" max="65" />
  </p>
  <p>
    <button type="submit">Gửi</button>
    <button type="button" id="check">checkValidity()</button>
  </p>
  <p id="log"></p>
</form>
```

### JavaScript

```js
const output = document.querySelector("#log");
const checkButton = document.querySelector("#check");
const ageInput = document.querySelector("#age");

ageInput.addEventListener("invalid", () => {
  console.log("Sự kiện Invalid đã kích hoạt.");
});

checkButton.addEventListener("click", () => {
  const checkVal = ageInput.checkValidity();
  output.innerHTML = `checkValidity trả về: ${checkVal}`;
});
```

### Kết quả

{{EmbedLiveSample("Examples", "100%", 220)}}

Khi `false`, nếu giá trị bị thiếu, dưới 21, trên 65 hoặc không hợp lệ theo cách khác, sự kiện invalid sẽ được ghi vào console. Để báo cáo lỗi cho người dùng, hãy sử dụng {{domxref("HTMLInputElement.reportValidity()")}} thay thế.

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLInputElement.reportValidity()")}}
- {{HTMLElement("input")}}
- {{HTMLElement("form")}}
- [Learn: Kiểm tra biểu mẫu phía client](/en-US/docs/Learn_web_development/Extensions/Forms/Form_validation)
- [Guide: Kiểm tra ràng buộc](/en-US/docs/Web/HTML/Guides/Constraint_validation)
- Lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}

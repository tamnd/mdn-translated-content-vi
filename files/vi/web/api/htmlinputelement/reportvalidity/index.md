---
title: "HTMLInputElement: phương thức reportValidity()"
short-title: reportValidity()
slug: Web/API/HTMLInputElement/reportValidity
page-type: web-api-instance-method
browser-compat: api.HTMLInputElement.reportValidity
---

{{APIRef("HTML DOM")}}

Phương thức **`reportValidity()`** của giao diện {{domxref("HTMLInputElement")}} thực hiện các bước kiểm tra tính hợp lệ giống như phương thức {{domxref("HTMLInputElement.checkValidity", "checkValidity()")}}. Ngoài ra, nếu sự kiện {{domxref("HTMLElement/invalid_event", "invalid")}} không bị hủy, trình duyệt sẽ hiển thị vấn đề cho người dùng.

## Cú pháp

```js-nolint
reportValidity()
```

### Tham số

Không có.

### Giá trị trả về

Trả về `true` nếu giá trị của phần tử không có vấn đề về tính hợp lệ; ngược lại, trả về `false`.

## Ví dụ

### Sử dụng cơ bản

#### HTML

Chúng ta bao gồm một biểu mẫu chứa trường số bắt buộc và hai nút: một nút để kiểm tra biểu mẫu và nút kia để gửi nó.

```html
<form action="#" method="post">
  <p>
    <label for="age">Tuổi của bạn (21 đến 65) </label>
    <input type="number" name="age" required id="age" min="21" max="65" />
  </p>
  <p>
    <button type="submit">Gửi</button>
    <button type="button" id="report">reportValidity()</button>
  </p>
  <p id="log"></p>
</form>
```

#### JavaScript

Khi nút "reportValidity()" được kích hoạt, chúng ta sử dụng phương thức `reportValidity()` để kiểm tra xem giá trị đầu vào có đáp ứng các ràng buộc của nó không. Chúng ta ghi lại giá trị trả về. Nếu `false`, chúng ta cũng hiển thị thông báo xác thực và bắt sự kiện `invalid`.

```js
const output = document.querySelector("#log");
const reportButton = document.querySelector("#report");
const ageInput = document.querySelector("#age");

ageInput.addEventListener("invalid", () => {
  console.log("Sự kiện Invalid đã kích hoạt.");
});

reportButton.addEventListener("click", () => {
  const reportVal = ageInput.reportValidity();
  output.innerHTML = `"reportValidity()" trả về: ${reportVal}`;
  if (!reportVal) {
    output.innerHTML += `<br />Thông báo xác thực: "${ageInput.validationMessage}"`;
  }
});
```

#### Kết quả

{{EmbedLiveSample("Basic usage", "100%", 120)}}

Khi `false`, nếu giá trị bị thiếu, dưới 21, trên 65, hoặc không hợp lệ theo cách khác, một thông báo lỗi xuất hiện, một sự kiện invalid được kích hoạt, và chúng ta ghi lại sự kiện invalid đó vào console.

### Thông báo lỗi tùy chỉnh

Ví dụ này minh họa cách một thông báo lỗi tùy chỉnh có thể gây ra giá trị trả về `false` khi giá trị hợp lệ theo cách khác.

#### HTML

Chúng ta thêm một nút "Sửa lỗi" vào HTML từ ví dụ trước.

```html hidden
<form action="#" method="post">
  <p>
    <label for="age">Tuổi của bạn (21 đến 65) </label>
    <input type="number" name="age" required id="age" min="21" max="65" />
  </p>
  <p>
    <button type="submit">Gửi</button>
    <button type="button" id="report">reportValidity()</button>
    <button type="button" id="fix">Sửa vấn đề</button>
  </p>
  <p id="log"></p>
</form>
```

#### JavaScript

Chúng ta mở rộng JavaScript từ ví dụ cơ bản ở trên, thêm một hàm sử dụng phương thức {{domxref("HTMLInputElement.setCustomValidity()")}} để cung cấp thông báo lỗi tùy chỉnh. Hàm `validateAge()` chỉ đặt thông báo lỗi thành chuỗi rỗng nếu đầu vào hợp lệ VÀ biến `enableValidation` là `true`, với `enableValidation` là `false` cho đến khi nút "sửa vấn đề" được kích hoạt.

```js
const output = document.querySelector("#log");
const reportButton = document.querySelector("#report");
const ageInput = document.querySelector("#age");
const fixButton = document.querySelector("#fix");
let enableValidation = false;

fixButton.addEventListener("click", (e) => {
  enableValidation = true;
  fixButton.innerHTML = "Đã sửa lỗi";
  fixButton.disabled = true;
});

reportButton.addEventListener("click", () => {
  validateAge();
  const reportVal = ageInput.reportValidity();
  output.innerHTML = `"reportValidity()" trả về: ${reportVal}`;
  if (!reportVal) {
    output.innerHTML += `<br />Thông báo xác thực: "${ageInput.validationMessage}"`;
  }
});

function validateAge() {
  const validityState = ageInput.validity;
  if (validityState.valueMissing) {
    ageInput.setCustomValidity("Vui lòng đặt tuổi (bắt buộc)");
  } else if (validityState.rangeUnderflow) {
    ageInput.setCustomValidity("Giá trị của bạn quá thấp");
  } else if (validityState.rangeOverflow) {
    ageInput.setCustomValidity("Giá trị của bạn quá cao");
  } else if (enableValidation) {
    // đặt thành chuỗi rỗng nếu hợp lệ VÀ enableValidation đã được đặt thành true
    ageInput.setCustomValidity("");
  }
}
```

#### Kết quả

{{EmbedLiveSample("Custom error message", "100%", 120)}}

Nếu bạn kích hoạt nút "reportValidity()" trước khi nhập tuổi, phương thức `reportValidity()` trả về `false` vì nó không đáp ứng ràng buộc xác thực `required`. Phương thức này kích hoạt sự kiện `invalid` trên đầu vào và báo cáo vấn đề cho người dùng, hiển thị thông báo lỗi tùy chỉnh "Vui lòng đặt tuổi (bắt buộc)". Miễn là thông báo lỗi tùy chỉnh được đặt, việc kích hoạt nút "reportValidity()" sẽ tiếp tục hiển thị lỗi ngay cả khi bạn chọn một tuổi hợp lệ. Để bật xác thực, chúng ta phải đặt thông báo lỗi tùy chỉnh thành chuỗi rỗng, điều này được thực hiện bằng cách nhấp vào nút "Sửa vấn đề".

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
- Lớp giả CSS {{cssxref(":valid")}} và {{cssxref(":invalid")}}

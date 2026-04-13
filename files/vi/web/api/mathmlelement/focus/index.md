---
title: "MathMLElement: phương thức focus()"
short-title: focus()
slug: Web/API/MathMLElement/focus
page-type: web-api-instance-method
browser-compat: api.MathMLElement.focus
---

{{APIRef("MathML")}}

Phương thức **`focus()`** của giao diện {{domxref("MathMLElement")}} đặt tiêu điểm vào phần tử MathML được chỉ định, nếu nó có thể được lấy tiêu điểm. Phần tử được lấy tiêu điểm là phần tử sẽ nhận các sự kiện bàn phím và tương tự theo mặc định.

Theo mặc định, trình duyệt sẽ cuộn phần tử vào tầm nhìn sau khi lấy tiêu điểm, và cũng có thể cung cấp biểu hiện nhìn thấy của phần tử được lấy tiêu điểm (thường bằng cách hiển thị "vòng tiêu điểm" xung quanh phần tử). Các tùy chọn tham số được cung cấp để vô hiệu hóa cuộn mặc định và buộc biểu hiện nhìn thấy trên các phần tử. Nếu bạn gọi `focus()` từ một trình xử lý sự kiện `mousedown`, bạn phải gọi `event.preventDefault()` để giữ tiêu điểm không rời khỏi `MathMLElement`.

## Cú pháp

```js-nolint
focus()
focus(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng điều khiển các khía cạnh của quá trình lấy tiêu điểm. Đối tượng này có thể chứa các thuộc tính sau:
    - `preventScroll` {{optional_inline}}
      - : Một giá trị boolean cho biết trình duyệt có nên cuộn tài liệu để đưa phần tử mới được lấy tiêu điểm vào tầm nhìn hay không. Giá trị `false` cho `preventScroll` (mặc định) có nghĩa là trình duyệt sẽ cuộn phần tử vào tầm nhìn sau khi lấy tiêu điểm. Nếu `preventScroll` được đặt thành `true`, không có cuộn nào xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Lấy tiêu điểm vào phần tử MathML

Ví dụ này sử dụng một nút để đặt tiêu điểm vào phần tử vòng tròn MathML.

#### HTML

```html
<div>
  <math>
    <msup id="myMath" tabindex="0">
      <mi>x</mi>
      <mn>2</mn>
    </msup>
  </math>
  <button id="focusButton">Focus the Math</button>
</div>
```

#### JavaScript

```js
const mathElement = document.getElementById("myMath");

document.getElementById("focusButton").addEventListener("click", () => {
  mathElement.focus();
});
```

### Kết quả

{{EmbedLiveSample("focus",100,100)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("MathMLElement.blur()")}}
- {{domxref("HTMLElement.focus()")}}

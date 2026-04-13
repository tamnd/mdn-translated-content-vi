---
title: "SVGElement: phương thức focus()"
short-title: focus()
slug: Web/API/SVGElement/focus
page-type: web-api-instance-method
browser-compat: api.SVGElement.focus
---

{{APIRef("SVG")}}

Phương thức **`SVGElement.focus()`** đặt tiêu điểm vào phần tử SVG được chỉ định nếu nó có thể lấy tiêu điểm. Phần tử có tiêu điểm sẽ nhận bàn phím và các sự kiện tương tự theo mặc định.

Theo mặc định, trình duyệt sẽ cuộn phần tử vào tầm nhìn sau khi lấy tiêu điểm, và cũng có thể hiển thị chỉ báo trực quan của phần tử đang có tiêu điểm (thường bằng cách hiển thị "vòng tiêu điểm" xung quanh phần tử). Các tùy chọn tham số được cung cấp để vô hiệu hóa cuộn mặc định và buộc hiển thị chỉ báo trực quan trên các phần tử.

## Cú pháp

```js-nolint
focus()
focus(options)
```

### Tham số

- `options` {{optional_inline}}
  - : Một đối tượng tùy chọn để kiểm soát các khía cạnh của quá trình lấy tiêu điểm. Đối tượng này có thể chứa các thuộc tính sau:
    - `preventScroll` {{optional_inline}}
      - : Một giá trị boolean cho biết liệu trình duyệt có nên cuộn tài liệu để đưa phần tử mới được lấy tiêu điểm vào tầm nhìn hay không. Giá trị `false` cho `preventScroll` (mặc định) có nghĩa là trình duyệt sẽ cuộn phần tử vào tầm nhìn sau khi lấy tiêu điểm. Nếu `preventScroll` được đặt thành `true`, sẽ không có cuộn nào xảy ra.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Lấy tiêu điểm vào phần tử SVG

Ví dụ này sử dụng một nút để đặt tiêu điểm vào phần tử hình tròn SVG.

#### HTML

```html
<svg xmlns="http://www.w3.org/2000/svg" width="200" height="200">
  <circle id="myCircle" cx="100" cy="100" r="50" tabindex="0" fill="blue" />
  <button id="focusButton">Focus the circle</button>
</svg>
```

#### JavaScript

```js
document.getElementById("focusButton").addEventListener("click", () => {
  const circle = document.getElementById("myCircle");
  circle.focus();
});
```

## Thông số kỹ thuật

{{Specifications}}

## Ghi chú

- Nếu bạn gọi `SVGElement.focus()` từ trình xử lý sự kiện mousedown, bạn phải gọi `event.preventDefault()` để giữ cho tiêu điểm không rời khỏi `SVGElement`.

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("SVGElement.blur")}} để xóa tiêu điểm khỏi phần tử.
- {{domxref("HTMLElement.focus")}} phương thức tương tự cho các phần tử HTML.

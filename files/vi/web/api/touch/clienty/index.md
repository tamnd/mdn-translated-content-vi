---
title: "Touch: thuộc tính clientY"
short-title: clientY
slug: Web/API/Touch/clientY
page-type: web-api-instance-property
browser-compat: api.Touch.clientY
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`Touch.clientY`** trả về tọa độ Y của điểm chạm so với viewport trình duyệt, không tính offset cuộn trang.

## Giá trị

Giá trị dấu phẩy động kiểu `double` đại diện cho tọa độ Y của điểm chạm so với viewport, không tính offset cuộn trang.

## Ví dụ

Ví dụ này minh họa cách sử dụng thuộc tính {{domxref("Touch.clientX")}} và `Touch.clientY` của đối tượng {{domxref("Touch")}}. `Touch.clientX` là tọa độ ngang của điểm chạm so với viewport trình duyệt, không tính offset cuộn. `Touch.clientY` là tọa độ dọc của điểm chạm so với viewport, không tính offset cuộn.

Trong ví dụ này, chúng ta giả sử người dùng bắt đầu chạm vào phần tử có id là `source`, di chuyển trong hoặc ra ngoài phần tử rồi nhấc tay lên. Khi trình xử lý sự kiện {{domxref("Element/touchend_event", "touchend")}} được gọi, ta tính sự thay đổi tọa độ {{domxref("Touch.clientX")}} và `Touch.clientY` từ điểm chạm đầu đến điểm cuối.

```js
// Đăng ký listener touchstart và touchend cho phần tử 'source'
const src = document.getElementById("source");
let clientX;
let clientY;

src.addEventListener("touchstart", (e) => {
  // Lưu tọa độ X/Y client
  clientX = e.touches[0].clientX;
  clientY = e.touches[0].clientY;
});

src.addEventListener("touchend", (e) => {
  let deltaX;
  let deltaY;

  // Tính sự thay đổi tọa độ X và Y.
  // Điểm chạm đầu tiên trong danh sách changedTouches
  // là điểm vừa được nhấc khỏi bề mặt.
  deltaX = e.changedTouches[0].clientX - clientX;
  deltaY = e.changedTouches[0].clientY - clientY;

  // Xử lý dữ liệu…
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

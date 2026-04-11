---
title: "Touch: thuộc tính screenX"
short-title: screenX
slug: Web/API/Touch/screenX
page-type: web-api-instance-property
browser-compat: api.Touch.screenX
---

{{ APIRef("Touch Events") }}

Trả về tọa độ X của điểm chạm so với màn hình, không tính offset cuộn trang.

## Giá trị

Một số.

## Ví dụ

Ví dụ này minh họa cách truy cập các thuộc tính `Touch.screenX` và {{domxref("Touch.screenY")}} của đối tượng {{domxref("Touch")}}. `Touch.screenX` là tọa độ ngang (x) của điểm chạm so với màn hình tính bằng pixel CSS. {{domxref("Touch.screenY")}} là tọa độ dọc của điểm chạm so với màn hình tính bằng pixel CSS.

Trong đoạn mã đơn giản sau, chúng ta giả sử người dùng khởi tạo nhiều điểm chạm trên phần tử có id là `source` rồi nhấc tay lên. Khi trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} được gọi, tọa độ `Touch.screenX` và {{domxref("Touch.screenY")}} của từng điểm chạm được truy cập.

```js
// Đăng ký listener touchstart cho phần tử 'source'
const src = document.getElementById("source");

src.addEventListener("touchstart", (e) => {
  // Duyệt qua các điểm chạm và ghi lại tọa độ screenX/Y.
  // Đơn vị mỗi tọa độ là pixel CSS.
  for (let i = 0; i < e.touches.length; i++) {
    console.log(`touchpoint[${i}].screenX = ${e.touches[i].screenX}`);
    console.log(`touchpoint[${i}].screenY = ${e.touches[i].screenY}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

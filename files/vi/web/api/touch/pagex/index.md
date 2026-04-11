---
title: "Touch: thuộc tính pageX"
short-title: pageX
slug: Web/API/Touch/pageX
page-type: web-api-instance-property
browser-compat: api.Touch.pageX
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`Touch.pageX`** trả về tọa độ X của điểm chạm so với viewport, bao gồm cả offset cuộn trang.

## Giá trị

Giá trị dấu phẩy động kiểu `double` đại diện cho tọa độ X của điểm chạm so với viewport, bao gồm cả offset cuộn trang.

## Ví dụ

Ví dụ này minh họa cách truy cập các thuộc tính `Touch.pageX` và {{domxref("Touch.pageY")}} của đối tượng {{domxref("Touch")}}. `Touch.pageX` là tọa độ ngang của điểm chạm so với viewport (tính bằng pixel CSS), bao gồm offset cuộn ngang. {{domxref("Touch.pageY")}} là tọa độ dọc của điểm chạm so với viewport (tính bằng pixel CSS), bao gồm offset cuộn dọc.

Trong đoạn mã đơn giản sau, chúng ta giả sử người dùng khởi tạo một hoặc nhiều điểm chạm trên phần tử `source`, di chuyển các điểm rồi nhấc tay lên. Khi trình xử lý sự kiện {{domxref("Element/touchmove_event", "touchmove")}} được gọi, tọa độ `Touch.pageX` và {{domxref("Touch.pageY")}} của từng điểm chạm được truy cập qua danh sách {{domxref("TouchEvent.changedTouches")}}.

```js
// Đăng ký listener touchmove cho phần tử 'source'
const src = document.getElementById("source");

src.addEventListener("touchmove", (e) => {
  // Duyệt qua các điểm chạm đã di chuyển và ghi lại
  // tọa độ pageX/Y. Đơn vị mỗi tọa độ là pixel CSS.
  for (let i = 0; i < e.changedTouches.length; i++) {
    console.log(`touchpoint[${i}].pageX = ${e.changedTouches[i].pageX}`);
    console.log(`touchpoint[${i}].pageY = ${e.changedTouches[i].pageY}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

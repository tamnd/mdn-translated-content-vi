---
title: "Touch: thuộc tính target"
short-title: target
slug: Web/API/Touch/target
page-type: web-api-instance-property
browser-compat: api.Touch.target
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`target`** của giao diện `Touch` trả về ({{domxref("EventTarget")}}) nơi điểm tiếp xúc bắt đầu khi lần đầu đặt lên bề mặt, ngay cả khi điểm chạm sau đó di chuyển ra ngoài vùng tương tác của phần tử đó hay thậm chí bị xóa khỏi tài liệu. Lưu ý rằng nếu phần tử đích bị xóa khỏi tài liệu, sự kiện vẫn được gửi đến nó và sẽ không nổi bong bóng lên window hay document. Nếu có nguy cơ phần tử bị xóa trong khi đang được chạm, tốt nhất nên gắn listener touch trực tiếp vào phần tử đó.

## Giá trị

{{domxref("EventTarget")}} mà đối tượng {{domxref("Touch")}} áp dụng vào.

## Ví dụ

Ví dụ này minh họa cách truy cập thuộc tính `Touch.target` của đối tượng {{domxref("Touch")}}. `Touch.target` là một {{domxref("Element")}} ({{domxref("EventTarget")}}) nơi điểm chạm bắt đầu khi tiếp xúc lần đầu với bề mặt.

Trong đoạn mã đơn giản sau, chúng ta giả sử người dùng khởi tạo một hoặc nhiều điểm chạm trên phần tử `source`. Khi trình xử lý sự kiện {{domxref("Element/touchstart_event", "touchstart")}} được gọi, thuộc tính `Touch.target` của từng điểm chạm được truy cập qua danh sách {{domxref("TouchEvent.targetTouches")}}.

```js
// Đăng ký listener touchmove cho phần tử 'source'
const src = document.getElementById("source");

src.addEventListener("touchstart", (e) => {
  // Duyệt qua các điểm chạm được kích hoạt trên phần tử này.
  for (let i = 0; i < e.targetTouches.length; i++) {
    console.log(`touchpoint[${i}].target = ${e.targetTouches[i].target}`);
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

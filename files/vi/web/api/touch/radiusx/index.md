---
title: "Touch: thuộc tính radiusX"
short-title: radiusX
slug: Web/API/Touch/radiusX
page-type: web-api-instance-property
browser-compat: api.Touch.radiusX
---

{{ APIRef("Touch Events") }}

Thuộc tính chỉ đọc **`radiusX`** của giao diện {{domxref("Touch")}} trả về bán kính X của hình elip gần nhất bao quanh vùng tiếp xúc với bề mặt cảm ứng. Giá trị tính bằng pixel CSS theo cùng tỷ lệ với {{ domxref("Touch.screenX") }}.

Kết hợp với {{ domxref("Touch.radiusY") }} và {{ domxref("Touch.rotationAngle") }}, giá trị này tạo thành hình elip xấp xỉ kích thước và hình dạng vùng tiếp xúc giữa người dùng và màn hình. Đây có thể là hình elip tương đối lớn thể hiện tiếp xúc từ đầu ngón tay, hoặc vùng nhỏ thể hiện đầu bút stylus.

## Giá trị

Một số.

## Ví dụ

Ví dụ này minh họa cách sử dụng các thuộc tính `Touch.radiusX`, `Touch.radiusY` và {{domxref("Touch.rotationAngle")}} của giao diện {{domxref("Touch")}}. `Touch.radiusX` là bán kính của hình elip gần nhất bao quanh vùng chạm (ngón tay, stylus) **theo** trục được chỉ định bởi {{domxref("Touch.rotationAngle")}}. {{domxref("Touch.radiusY")}} là bán kính của hình elip **vuông góc** với trục đó. {{domxref("Touch.rotationAngle")}} là góc (tính bằng độ) mà hình elip được xoay theo chiều kim đồng hồ.

Đoạn mã đơn giản sau đăng ký một trình xử lý duy nhất cho các sự kiện {{domxref("Element/touchstart_event", "touchstart")}}, {{domxref("Element/touchmove_event", "touchmove")}} và {{domxref("Element/touchend_event", "touchend")}}. Khi phần tử `src` được chạm, chiều rộng và chiều cao của phần tử được tính dựa trên `radiusX` và `radiusY`, sau đó phần tử được xoay theo `rotationAngle`.

```html
<div id="src">…</div>
```

```js
const src = document.getElementById("src");

src.addEventListener("touchstart", rotate);
src.addEventListener("touchmove", rotate);
src.addEventListener("touchend", rotate);

function rotate(e) {
  const touch = e.changedTouches.item(0);

  // Tắt xử lý sự kiện mặc định
  e.preventDefault();

  // Xoay phần tử 'src'.
  src.style.width = `${touch.radiusX * 2}px`;
  src.style.height = `${touch.radiusY * 2}px`;
  src.style.transform = `rotate(${touch.rotationAngle}deg)`;
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

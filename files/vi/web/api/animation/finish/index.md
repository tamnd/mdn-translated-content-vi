---
title: "Animation: phương thức finish()"
short-title: finish()
slug: Web/API/Animation/finish
page-type: web-api-instance-method
browser-compat: api.Animation.finish
---

{{APIRef("Web Animations")}}

Phương thức **`finish()`** của {{domxref("Animation")}} trong [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) đặt thời gian phát hiện tại về cuối của hoạt ảnh tương ứng với hướng phát lại hiện tại.

Nói cách khác, nếu hoạt ảnh đang phát xuôi, nó sẽ đặt thời gian phát bằng độ dài của chuỗi hoạt ảnh, còn nếu hoạt ảnh đang phát ngược (sau khi phương thức {{domxref("Animation.reverse", "reverse()")}} được gọi), nó sẽ đặt thời gian phát về 0.

## Cú pháp

```js-nolint
finish()
```

### Tham số

Không có.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

### Ngoại lệ

- `InvalidState`
  - : Tốc độ phát của trình phát là 0, hoặc tốc độ phát của hoạt ảnh lớn hơn 0 và thời điểm kết thúc của hoạt ảnh là vô cực.

## Ví dụ

Ví dụ sau cho thấy cách dùng phương thức `finish()` và bắt lỗi `InvalidState`.

```js
interfaceElement.addEventListener("mousedown", () => {
  try {
    player.finish();
  } catch (e) {
    if (e instanceof InvalidState) {
      console.log("finish() called on paused or finished animation.");
    } else {
      logMyErrors(e); // Chuyển đối tượng ngoại lệ cho trình xử lý lỗi
    }
  }
});
```

Ví dụ sau hoàn tất tất cả hoạt ảnh trên cùng một phần tử, bất kể hướng phát của chúng.

```js
elem.getAnimations().forEach((animation) => animation.finish());
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}} cho các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh của trang web.
- {{domxref("Animation.play()")}} để phát hoạt ảnh theo chiều xuôi.
- {{domxref("Animation.reverse()")}} để phát hoạt ảnh theo chiều ngược.

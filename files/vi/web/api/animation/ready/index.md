---
title: "Animation: thuộc tính ready"
short-title: ready
slug: Web/API/Animation/ready
page-type: web-api-instance-property
browser-compat: api.Animation.ready
---

{{ APIRef("Web Animations") }}

Thuộc tính chỉ đọc **`Animation.ready`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về một {{jsxref("Promise")}} được giải quyết khi hoạt ảnh đã sẵn sàng để phát. Một promise mới được tạo ra mỗi khi hoạt ảnh đi vào [trạng thái phát](/en-US/docs/Web/API/Animation/playState) `"pending"`, cũng như khi hoạt ảnh bị hủy, vì trong cả hai tình huống đó hoạt ảnh đều sẵn sàng để được khởi động lại.

> [!NOTE]
> Vì cùng một {{jsxref("Promise")}} được dùng cho cả yêu cầu `play` đang pending và yêu cầu `pause` đang pending, tác giả được khuyên nên kiểm tra trạng thái của hoạt ảnh khi promise được giải quyết.

## Giá trị

Một {{jsxref("Promise")}} được giải quyết khi hoạt ảnh đã sẵn sàng để được phát. Bạn thường sẽ dùng một cấu trúc tương tự như sau khi sử dụng promise `ready`:

```js
animation.ready.then(() => {
  // Do whatever needs to be done when
  // the animation is ready to run
});
```

## Ví dụ

Trong ví dụ sau, trạng thái của hoạt ảnh sẽ là `running` khi **Promise ready hiện tại** được giải quyết vì hoạt ảnh không rời khỏi trạng thái phát `pending` giữa các lệnh gọi `pause` và `play`, và do đó **Promise ready hiện tại** không thay đổi.

```js
animation.pause();
animation.ready.then(() => {
  // Displays 'running'
  alert(animation.playState);
});
animation.play();
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
- {{domxref("Animation.playState")}}

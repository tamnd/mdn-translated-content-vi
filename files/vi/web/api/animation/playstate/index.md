---
title: "Animation: thuộc tính playState"
short-title: playState
slug: Web/API/Animation/playState
page-type: web-api-instance-property
browser-compat: api.Animation.playState
---

{{APIRef("Web Animations")}}

Thuộc tính chỉ đọc **`Animation.playState`** của [Web Animations API](/en-US/docs/Web/API/Web_Animations_API) trả về một giá trị liệt kê mô tả trạng thái phát của hoạt ảnh.

## Giá trị

- `idle`
  - : Thời gian hiện tại của hoạt ảnh là unresolved và không có tác vụ đang chờ nào.
- `running`
  - : Hoạt ảnh đang chạy.
- `paused`
  - : Hoạt ảnh đã bị tạm dừng và thuộc tính {{domxref("Animation.currentTime")}} không còn cập nhật.
- `finished`
  - : Hoạt ảnh đã chạm tới một trong các ranh giới của nó và thuộc tính {{domxref("Animation.currentTime")}} không còn cập nhật.

Trước đây, Web Animations định nghĩa giá trị **`pending`** để biểu thị một thao tác bất đồng bộ nào đó như bắt đầu phát vẫn chưa hoàn tất. Điều này hiện được biểu thị bằng thuộc tính riêng {{domxref("Animation.pending")}}.

## Ví dụ

Trong ví dụ [Growing/Shrinking Alice Game](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010), người chơi có thể đạt tới một kết thúc với cảnh [Alice khóc thành một vũng nước mắt](https://codepen.io/rachelnabors/pen/EPJdJx?editors=0010). Trong trò chơi, vì lý do hiệu năng, nước mắt chỉ nên được tạo hoạt ảnh khi chúng hiển thị. Vì vậy chúng phải được tạm dừng ngay sau khi được tạo hoạt ảnh như sau:

```js
// Setting up the tear animations

tears.forEach((el) => {
  el.animate(tearsFalling, {
    delay: getRandomMsRange(-1000, 1000), // randomized for each tear
    duration: getRandomMsRange(2000, 6000), // randomized for each tear
    iterations: Infinity,
    easing: "cubic-bezier(0.6, 0.04, 0.98, 0.335)",
  });
  el.pause();
});

// Play the tears falling when the ending needs to be shown.

tears.forEach((el) => {
  el.play();
});

// Reset the crying tears animations and pause them.

tears.forEach((el) => {
  el.pause();
  el.currentTime = 0;
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}} để biết các phương thức và thuộc tính khác bạn có thể dùng để điều khiển hoạt ảnh trên trang web.

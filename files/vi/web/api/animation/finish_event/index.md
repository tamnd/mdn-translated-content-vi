---
title: "Animation: sự kiện finish"
short-title: finish
slug: Web/API/Animation/finish_event
page-type: web-api-event
browser-compat: api.Animation.finish_event
---

{{ APIRef("Web Animations") }}

Sự kiện **`finish`** của {{domxref("Animation")}} được kích hoạt khi hoạt ảnh phát xong, hoặc khi hoạt ảnh hoàn tất một cách tự nhiên, hoặc khi phương thức {{domxref("Animation.finish()")}} được gọi để làm cho hoạt ảnh kết thúc ngay lập tức.

> [!NOTE]
> Trạng thái phát `"paused"` có ưu tiên cao hơn trạng thái `"finished"`; nếu hoạt ảnh vừa tạm dừng vừa hoàn tất, trạng thái `"paused"` là trạng thái sẽ được báo cáo. Bạn có thể ép hoạt ảnh vào trạng thái `"finished"` bằng cách đặt {{domxref("Animation.startTime", "startTime")}} của nó thành `document.timeline.currentTime - (Animation.currentTime * Animation.playbackRate)`.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("finish", (event) => { })

onfinish = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("AnimationPlaybackEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("AnimationPlaybackEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính được liệt kê bên dưới, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref("AnimationPlaybackEvent.currentTime")}} {{ReadOnlyInline}}
  - : Thời gian hiện tại của hoạt ảnh đã tạo ra sự kiện.
- {{domxref("AnimationPlaybackEvent.timelineTime")}} {{ReadOnlyInline}}
  - : Giá trị thời gian của timeline của hoạt ảnh đã tạo ra sự kiện.

## Ví dụ

`Animation.onfinish` được dùng nhiều lần trong game [Growing/Shrinking Alice Game](https://codepen.io/rachelnabors/pen/PNYGZQ?editors=0010) trong Alice in Web Animations API Land. Đây là một ví dụ khi chúng ta thêm lại pointer events vào một phần tử sau khi hoạt ảnh độ mờ của nó làm nó hiện ra:

```js
// Thêm một hoạt ảnh vào phần credit kết thúc của trò chơi
const endingUI = document.getElementById("ending-ui");
const bringUI = endingUI.animate(keysFade, timingFade);

// Tạm dừng hoạt ảnh đó
bringUI.pause();

// Hàm này xóa pointer events khỏi phần credit.
hide(endingUI);

// Khi phần credit được làm hiện lại sau đó,
// chúng ta thêm lại pointer events khi chúng hoàn tất
bringUI.onfinish = (event) => {
  endingUI.style.pointerEvents = "auto";
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}
- {{domxref("Animation.finish()")}}

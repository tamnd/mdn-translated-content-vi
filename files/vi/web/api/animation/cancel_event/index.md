---
title: "Animation: sự kiện cancel"
short-title: cancel
slug: Web/API/Animation/cancel_event
page-type: web-api-event
browser-compat: api.Animation.cancel_event
---

{{ APIRef("Web Animations") }}

Sự kiện **`cancel`** của {{domxref("Animation")}} được kích hoạt khi phương thức {{domxref("Animation.cancel()")}} được gọi hoặc khi hoạt ảnh chuyển sang trạng thái phát `"idle"` từ một trạng thái khác, chẳng hạn khi hoạt ảnh bị xóa khỏi một phần tử trước khi phát xong.

> [!NOTE]
> Việc tạo một hoạt ảnh mới vốn ban đầu ở trạng thái idle không kích hoạt sự kiện `cancel` trên chính hoạt ảnh mới đó.

## Cú pháp

Dùng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("cancel", (event) => { })

oncancel = (event) => { }
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

Nếu hoạt ảnh này bị hủy, hãy xóa phần tử của nó.

```js
animation.oncancel = (event) => {
  animation.effect.target.remove();
};
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Web Animations API](/en-US/docs/Web/API/Web_Animations_API)
- {{domxref("Animation")}}

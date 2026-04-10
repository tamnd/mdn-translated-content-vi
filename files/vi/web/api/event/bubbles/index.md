---
title: "Event: thuộc tính bubbles"
short-title: bubbles
slug: Web/API/Event/bubbles
page-type: web-api-instance-property
browser-compat: api.Event.bubbles
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`bubbles`** của giao diện {{domxref("Event")}} cho biết sự kiện có lan truyền lên qua cây DOM hay không.

> [!NOTE]
> Xem [Sự lan truyền sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling) để biết thêm thông tin về bubbling.

## Giá trị

Một giá trị boolean, là `true` nếu sự kiện lan truyền lên qua cây DOM.

## Ví dụ

```js
function handleInput(e) {
  // Kiểm tra xem sự kiện có lan truyền hay không rồi chuyển sự kiện đi tiếp
  if (!e.bubbles) {
    passItOn(e);
  }

  // Đã lan truyền rồi
  doOutput(e);
}
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Event.stopPropagation", "stopPropagation()")}} để ngăn sự kiện hiện tại tiếp tục lan truyền trong pha capturing và bubbling
- {{domxref("Event.stopImmediatePropagation", "stopImmediatePropagation()")}} để không gọi thêm bộ lắng nghe nào khác cho cùng sự kiện ở cùng cấp trong DOM
- {{domxref("Event.preventDefault", "preventDefault()")}} để cho phép việc lan truyền tiếp tục nhưng ngăn trình duyệt thực hiện hành vi mặc định của nó nếu không có bộ lắng nghe nào xử lý sự kiện

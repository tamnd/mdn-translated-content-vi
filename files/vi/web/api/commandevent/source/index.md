---
title: "CommandEvent: thuộc tính source"
short-title: source
slug: Web/API/CommandEvent/source
page-type: web-api-instance-property
browser-compat: api.CommandEvent.source
---

{{APIRef("Invoker Commands API")}}

Thuộc tính chỉ đọc **`source`** của giao diện {{domxref("CommandEvent")}} trả về một {{domxref("EventTarget")}} biểu diễn điều khiển đã gọi lệnh đã cho.

## Giá trị

Một đối tượng {{domxref("EventTarget")}}. Thường là một {{domxref("HTMLButtonElement")}}.

## Ví dụ

Trong ví dụ đơn giản sau, chúng ta thiết lập một trình lắng nghe sự kiện để thêm một lớp tạm thời vào phần tử nút khi xảy ra `CommandEvent`:

```js
document.body.addEventListener(
  "command",
  (event) => {
    const theButton = event.source;

    theButton.classList.add("just-pressed");

    setTimeout(() => {
      theButton.classList.remove("just-pressed");
    }, 1000);
  },
  { capture: true },
);
```

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích với trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Invoker Commands API", "Invoker Commands API", "", "nocode")}}
- {{domxref("HTMLButtonElement.command")}}
- {{domxref("HTMLButtonElement.commandForElement")}}

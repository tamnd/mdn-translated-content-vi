---
title: "CommandEvent: thuộc tính command"
short-title: command
slug: Web/API/CommandEvent/command
page-type: web-api-instance-property
browser-compat: api.CommandEvent.command
---

{{APIRef("Invoker Commands API")}}

Thuộc tính chỉ đọc **`command`** của giao diện {{domxref("CommandEvent")}} trả về một chuỗi chứa giá trị của thuộc tính {{domxref("HTMLButtonElement.command", "command")}} tại thời điểm sự kiện được gửi đi.

## Giá trị

Một chuỗi.

## Ví dụ

Trong ví dụ đơn giản sau, chúng ta thiết lập một trình lắng nghe sự kiện để lắng nghe lệnh `"show-modal"`:

```js
document.body.addEventListener(
  "command",
  (event) => {
    const theAction = event.command;

    if (theAction === "show-modal") {
      console.log("Showing modal dialog");
    }
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

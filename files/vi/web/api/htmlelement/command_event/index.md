---
title: "HTMLElement: sự kiện command"
slug: Web/API/HTMLElement/command_event
page-type: web-api-event
browser-compat: api.HTMLElement.command_event
---

{{APIRef("Invoker Commands API")}}

Sự kiện **`command`** của giao diện {{domxref("HTMLElement")}} được kích hoạt trên một phần tử được điều khiển thông qua một {{domxref("HTMLButtonElement", "button")}} với các giá trị {{domxref("HTMLButtonElement.commandForElement", "commandForElement")}} và {{domxref("HTMLButtonElement.command", "command")}} hợp lệ, bất cứ khi nào nút được tương tác (ví dụ: khi nó được nhấp).

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc thiết lập một thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("command", (event) => { })

oncommand = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("CommandEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("CommandEvent")}}

## Ví dụ

### Ví dụ cơ bản

```js
const popover = document.getElementById("mypopover");

// …

popover.addEventListener("command", (event) => {
  if (event.command === "show-popover") {
    console.log("Popover sắp được hiển thị");
  }
});
```

### Phân phối và hủy sự kiện

Cần lưu ý rằng các sự kiện `command` được kích hoạt trên phần tử được gọi. Nếu nút được nhấp, trước tiên nó sẽ phân phối một sự kiện `click`, nếu bị hủy thì sự kiện `command` sẽ không được kích hoạt và hành vi mặc định sẽ không được chạy.
Ngoài việc hủy sự kiện `click` trên nút, cũng có thể hủy sự kiện `command`.

Ví dụ:

```js
button.addEventListener("click", (event) => {
  event.preventDefault(); // sự kiện `command` sẽ không bao giờ được kích hoạt
});
```

```js
element.addEventListener("command", (event) => {
  event.preventDefault(); // sự kiện `command` được kích hoạt nhưng hành vi mặc định bị hủy
});
```

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Invoker Commands API", "Invoker Commands API", "", "nocode")}}
- {{domxref("HTMLButtonElement.command")}}
- {{domxref("HTMLButtonElement.commandForElement")}}

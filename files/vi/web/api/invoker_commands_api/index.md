---
title: Invoker Commands API
slug: Web/API/Invoker_Commands_API
page-type: web-api-overview
browser-compat:
  - api.CommandEvent
  - api.HTMLButtonElement.commandForElement
  - api.HTMLButtonElement.command
---

{{DefaultAPISidebar("Invoker Commands API")}}

**Invoker Commands API** cung cấp một cách để khai báo hành vi cho các nút, cho phép kiểm soát các phần tử tương tác khi nút được kích hoạt (nhấp hoặc gọi qua phím, chẳng hạn như phím cách hoặc phím Enter).

## Khái niệm và cách dùng

Một mẫu phổ biến trên web là có các phần tử {{HTMLElement("button")}} kiểm soát các khía cạnh khác nhau của trang, như mở và đóng {{domxref("Popover API", "popovers", "", "nocode")}} hoặc các phần tử {{HTMLElement("dialog")}}, định dạng văn bản và nhiều hơn nữa.

Trước đây, việc tạo ra các điều khiển như vậy đòi hỏi phải thêm các trình lắng nghe sự kiện JavaScript vào nút, sau đó có thể gọi các API trên phần tử chúng kiểm soát. Các thuộc tính {{domxref("HTMLButtonElement.commandForElement", "commandForElement")}} và {{domxref("HTMLButtonElement.command", "command")}} cung cấp một cách để làm điều này theo hướng khai báo cho một tập hợp hành động giới hạn. Điều này có thể có lợi cho các lệnh tích hợp vì người dùng không cần chờ JavaScript tải xuống và thực thi để làm cho các nút này tương tác.

## Thuộc tính HTML

- [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor)
  - : Biến một phần tử {{htmlelement("button")}} thành bộ kích hoạt lệnh, kiểm soát phần tử tương tác đã cho; nhận ID của phần tử cần kiểm soát làm giá trị của nó.
- [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command)
  - : Chỉ định hành động được thực hiện trên phần tử được kiểm soát bởi `<button>` điều khiển, được chỉ định qua thuộc tính `commandfor`.

## Giao diện

- {{domxref("CommandEvent")}}
  - : Đại diện cho sự kiện thông báo cho người dùng rằng một lệnh đã được phát ra. Đây là đối tượng sự kiện cho sự kiện {{domxref("HTMLElement/command_event", "command")}}. Sự kiện kích hoạt trên phần tử được tham chiếu bởi {{domxref("HTMLButtonElement.commandForElement", "commandForElement")}}.

## Mở rộng cho các giao diện khác

### Thuộc tính phiên bản

- {{domxref("HTMLButtonElement.commandForElement")}}
  - : Lấy và đặt phần tử được kiểm soát bởi nút. Tương đương JavaScript của thuộc tính HTML [`commandfor`](/en-US/docs/Web/HTML/Reference/Elements/button#commandfor).
- {{domxref("HTMLButtonElement.command")}}
  - : Lấy và đặt hành động được thực hiện trên phần tử được kiểm soát bởi nút. Phản ánh giá trị của thuộc tính HTML [`command`](/en-US/docs/Web/HTML/Reference/Elements/button#command).

### Sự kiện

- Sự kiện {{domxref("HTMLElement.command_event", "command")}}
  - : Kích hoạt trên phần tử được tham chiếu bởi nút.

## Ví dụ

### Tạo popovers theo hướng khai báo

```html
<button commandfor="mypopover" command="toggle-popover">
  Toggle the popover
</button>
<div id="mypopover" popover>
  <button commandfor="mypopover" command="hide-popover">Close</button>
  Popover content
</div>
```

### Tạo dialogs theo hướng khai báo

```html
<button commandfor="mydialog" command="show-modal">Show modal dialog</button>
<dialog id="mydialog">
  <button commandfor="mydialog" command="close">Close</button>
  Dialog Content
</dialog>
```

### Tạo lệnh tùy chỉnh

```html
<button commandfor="my-img" command="--rotate-left">Rotate left</button>
<button commandfor="my-img" command="--rotate-right">Rotate right</button>
<img id="my-img" src="photo.jpg" alt="[add appropriate alt text here]" />
```

```js
const myImg = document.getElementById("my-img");

myImg.addEventListener("command", (event) => {
  if (event.command === "--rotate-left") {
    myImg.style.rotate = "-90deg";
  } else if (event.command === "--rotate-right") {
    myImg.style.rotate = "90deg";
  }
});
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Thuộc tính {{domxref("HTMLButtonElement.command", "command")}}
- Thuộc tính {{domxref("HTMLButtonElement.commandForElement", "commandForElement")}}
- Giao diện {{domxref("CommandEvent", "CommandEvent")}}

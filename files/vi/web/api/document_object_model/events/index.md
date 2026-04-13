---
title: Sự kiện và DOM
slug: Web/API/Document_Object_Model/Events
page-type: guide
---

{{DefaultAPISidebar("DOM")}}

Hướng dẫn này mô tả mô hình sự kiện DOM, bao gồm cách thêm trình lắng nghe sự kiện, cách lan truyền sự kiện, và các loại sự kiện thông thường.

## Giới thiệu về sự kiện DOM

Sự kiện là cách hệ thống thông báo cho mã của bạn rằng điều gì đó đã xảy ra. Mỗi sự kiện được đại diện bởi một đối tượng dựa trên giao diện {{domxref("Event")}} và có thể có các trường bổ sung hoặc phương thức để lấy thêm thông tin về những gì đã xảy ra.

Sự kiện được gửi đến một đối tượng _mục tiêu sự kiện_. Đây có thể là một đơn {{domxref("Element")}}, {{domxref("Document")}}, hay {{domxref("Window")}}, hoặc bất kỳ đối tượng nào khác hỗ trợ sự kiện (chẳng hạn như {{domxref("XMLHttpRequest")}}).

## Đăng ký trình lắng nghe sự kiện

Cách được khuyến nghị để thêm trình lắng nghe sự kiện là sử dụng phương thức {{domxref("EventTarget.addEventListener()")}}.

```js
const button = document.querySelector("button");

button.addEventListener("click", (event) => {
  console.log("Button was clicked");
});
```

Cách này cho phép thêm nhiều trình lắng nghe sự kiện cho một sự kiện trên cùng một đối tượng.

## Xóa trình lắng nghe sự kiện

Để xóa trình lắng nghe sự kiện, sử dụng {{domxref("EventTarget.removeEventListener()")}} với cùng trình lắng nghe:

```js
function handleClick(event) {
  console.log("Clicked");
}

button.addEventListener("click", handleClick);
// Sau đó để xóa:
button.removeEventListener("click", handleClick);
```

## Đối tượng sự kiện

Khi trình lắng nghe sự kiện được kích hoạt, một đối tượng sự kiện được truyền vào hàm xử lý. Đối tượng sự kiện chứa nhiều thuộc tính hữu ích:

- {{domxref("Event.type")}} - Chuỗi xác định loại sự kiện.
- {{domxref("Event.target")}} - Đối tượng mà sự kiện được gửi đến.
- {{domxref("Event.currentTarget")}} - Đối tượng mà trình lắng nghe sự kiện được gắn vào.
- {{domxref("Event.timeStamp")}} - Thời điểm sự kiện được tạo ra.

## Lan truyền sự kiện

Khi sự kiện được kích hoạt, nó truyền qua ba pha:

1. **Pha bắt giữ (Capture)**: Sự kiện di chuyển từ `Window` xuống đến phần tử mục tiêu.
2. **Pha mục tiêu (Target)**: Sự kiện đến phần tử mục tiêu.
3. **Pha nổi bong bóng (Bubble)**: Sự kiện nổi từ phần tử mục tiêu trở lên `Window`.

Theo mặc định, {{domxref("EventTarget.addEventListener()")}} đặt trình lắng nghe sự kiện vào pha nổi bong bóng. Để đặt vào pha bắt giữ, truyền `true` làm đối số thứ ba:

```js
button.addEventListener("click", handleClick, true); // Pha bắt giữ
```

## Ngăn chặn lan truyền và hành vi mặc định

### `stopPropagation()`

Để ngăn sự kiện tiếp tục lan truyền:

```js
element.addEventListener("click", (event) => {
  event.stopPropagation();
});
```

### `preventDefault()`

Để ngăn hành vi mặc định của trình duyệt:

```js
link.addEventListener("click", (event) => {
  event.preventDefault();
  // Làm gì đó khác
});
```

## Tạo và gửi sự kiện tùy chỉnh

Bạn có thể tạo và gửi sự kiện tùy chỉnh bằng {{domxref("CustomEvent")}} và {{domxref("EventTarget.dispatchEvent()")}}:

```js
const myEvent = new CustomEvent("myevent", {
  detail: { message: "Hello!" },
  bubbles: true,
  cancelable: true,
});

element.dispatchEvent(myEvent);

element.addEventListener("myevent", (event) => {
  console.log(event.detail.message); // "Hello!"
});
```

## Xem thêm

- {{domxref("EventTarget.addEventListener()")}}
- {{domxref("Event")}}
- [Hướng dẫn xử lý sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Events)

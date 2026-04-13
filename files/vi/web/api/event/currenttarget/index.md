---
title: "Event: thuộc tính currentTarget"
short-title: currentTarget
slug: Web/API/Event/currentTarget
page-type: web-api-instance-property
browser-compat: api.Event.currentTarget
---

{{APIRef("DOM")}}{{AvailableInWorkers}}

Thuộc tính chỉ đọc **`currentTarget`** của giao diện {{domxref("Event")}} xác định phần tử mà bộ xử lý sự kiện đã được gắn vào.

Thuộc tính này không phải lúc nào cũng giống với phần tử mà sự kiện được kích hoạt trên đó, vì sự kiện có thể đã được kích hoạt trên một phần tử con của phần tử có bộ xử lý, rồi sau đó [lan truyền](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling) lên đến phần tử có bộ xử lý. Phần tử mà sự kiện được kích hoạt trên đó được cung cấp bởi {{domxref("Event.target")}}.

Lưu ý rằng giá trị của `currentTarget` chỉ có trong bộ xử lý của sự kiện. Bên ngoài bộ xử lý sự kiện, nó sẽ là `null`. Điều này có nghĩa là, ví dụ, nếu bạn giữ một tham chiếu tới đối tượng `Event` bên trong bộ xử lý sự kiện rồi sau đó truy cập thuộc tính `currentTarget` của nó bên ngoài bộ xử lý, giá trị sẽ là `null`.

## Giá trị

Một {{domxref("EventTarget")}} đại diện cho đối tượng mà bộ xử lý sự kiện hiện tại đang được gắn vào.

## Ví dụ

### currentTarget so với target

Ví dụ này minh họa sự khác biệt giữa `currentTarget` và `target`.

#### HTML

Trang có một {{htmlelement("div")}} "cha" chứa một `<div>` "con".

```html
<div id="parent">
  Nhấp vào cha
  <div id="child">Nhấp vào con</div>
</div>

<button id="reset">Đặt lại</button>
<pre id="output"></pre>
```

```css hidden
button,
div,
pre {
  margin: 0.5rem;
}

div {
  padding: 1rem;
  border: 1px solid black;
}
```

#### JavaScript

Bộ xử lý sự kiện được gắn vào phần tử cha. Nó ghi lại giá trị của `event.currentTarget` và `event.target`.

Chúng ta cũng có một nút "Đặt lại" chỉ tải lại ví dụ.

```js
const output = document.querySelector("#output");
const parent = document.querySelector("#parent");
parent.addEventListener("click", (event) => {
  const currentTarget = event.currentTarget.getAttribute("id");
  const target = event.target.getAttribute("id");
  output.textContent = `Đích hiện tại: ${currentTarget}\n`;
  output.textContent += `Đích: ${target}`;
});

const reset = document.querySelector("#reset");
reset.addEventListener("click", () => document.location.reload());
```

#### Kết quả

Nếu bạn nhấp vào bên trong `<div>` con, thì `target` xác định phần tử con. Nếu bạn nhấp vào bên trong `<div>` cha, thì `target` xác định phần tử cha.

Trong cả hai trường hợp, `currentTarget` xác định phần tử cha, vì đó là phần tử mà bộ xử lý được gắn vào.

{{EmbedLiveSample("currentTarget versus target", 100, 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Học: Sự lan truyền sự kiện](/en-US/docs/Learn_web_development/Core/Scripting/Event_bubbling)

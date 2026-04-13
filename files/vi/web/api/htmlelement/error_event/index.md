---
title: "HTMLElement: sự kiện error"
short-title: error
slug: Web/API/HTMLElement/error_event
page-type: web-api-event
browser-compat: api.HTMLElement.error_event
---

{{APIRef("HTML DOM")}}

Sự kiện `error` được kích hoạt trên một phần tử khi tài nguyên không tải được hoặc không thể sử dụng. Ví dụ: khi một tập lệnh có lỗi thực thi hoặc một hình ảnh không tìm thấy hoặc không hợp lệ.

Sự kiện này không thể hủy và không nổi bọt.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("error", (event) => { })

onerror = (event) => { }
```

## Loại sự kiện

Đối tượng sự kiện là một đối tượng {{domxref("UIEvent")}} nếu được tạo từ phần tử giao diện người dùng, hoặc một đối tượng {{domxref("Event")}} trong trường hợp còn lại.

{{InheritanceDiagram("UIEvent")}}

## Ví dụ

### Ví dụ trực tiếp

#### HTML

```html
<div class="controls">
  <button id="img-error" type="button">Generate image error</button>
  <img src="bad-image.jpg" class="bad-img" alt="I don't exist" />
</div>

<div class="event-log">
  <label for="eventLog">Event log:</label>
  <textarea
    readonly
    class="event-log-contents"
    rows="8"
    cols="30"
    id="eventLog"></textarea>
</div>
```

```css hidden
body {
  display: grid;
  grid-template-areas: "control log";
}

.controls {
  grid-area: control;
  display: flex;
  align-items: center;
  justify-content: center;
}

.event-log {
  grid-area: log;
}

.event-log-contents {
  resize: none;
}

label,
button {
  display: block;
}

button {
  height: 2rem;
  margin: 0.5rem;
}

img {
  width: 0;
  height: 0;
}
```

#### JavaScript

```js
const log = document.querySelector(".event-log-contents");

const badImg = document.querySelector(".bad-img");
badImg.addEventListener("error", (event) => {
  log.textContent += `${event.type}: Loading image\n`;
  console.log(event);
});

const imgError = document.querySelector("#img-error");
imgError.addEventListener("click", () => {
  badImg.setAttribute("src", "i-dont-exist");
});
```

#### Kết quả

{{ EmbedLiveSample('Live_example', '100%', '150px') }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện liên quan
  - Window: sự kiện {{domxref("Window/error_event", "error")}}
  - HTMLElement: sự kiện {{domxref("HTMLElement/load_event", "load")}}

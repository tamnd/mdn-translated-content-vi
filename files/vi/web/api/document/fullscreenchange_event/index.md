---
title: "Document: sự kiện fullscreenchange"
short-title: fullscreenchange
slug: Web/API/Document/fullscreenchange_event
page-type: web-api-event
browser-compat: api.Document.fullscreenchange_event
---

{{APIRef("Fullscreen API")}}

Sự kiện **`fullscreenchange`** được kích hoạt ngay sau khi trình duyệt chuyển vào hoặc ra khỏi chế độ toàn màn hình.

Sự kiện được gửi đến `Element` đang chuyển đổi vào hoặc ra khỏi chế độ toàn màn hình, và sự kiện này sau đó nổi lên `Document`.

Để tìm hiểu xem `Element` đang vào hay thoát chế độ toàn màn hình, hãy kiểm tra giá trị của {{domxref("Document.fullscreenElement")}}: nếu giá trị này là `null` thì phần tử đang thoát khỏi chế độ toàn màn hình, ngược lại nó đang vào chế độ toàn màn hình.

Sự kiện này không thể hủy.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("fullscreenchange", (event) => { })

onfullscreenchange = (event) => { }
```

## Kiểu sự kiện

Một {{domxref("Event")}} chung.

## Ví dụ

### Ghi log sự kiện `fullscreenchange`

Trong ví dụ này, một trình xử lý cho sự kiện `fullscreenchange` được thêm vào {{domxref("Document")}}.

Nếu người dùng nhấp vào nút "Toggle Fullscreen Mode", trình xử lý `click` sẽ chuyển đổi chế độ toàn màn hình cho `div`. Nếu `document.fullscreenElement` có giá trị, nó sẽ thoát khỏi chế độ toàn màn hình. Nếu không, div sẽ được đưa vào chế độ toàn màn hình.

Hãy nhớ rằng tại thời điểm sự kiện `fullscreenchange` được xử lý, trạng thái của phần tử đã thay đổi. Vì vậy nếu chuyển đổi là vào chế độ toàn màn hình, `document.fullscreenElement` sẽ trỏ đến phần tử hiện đang ở chế độ toàn màn hình. Mặt khác, nếu `document.fullscreenElement` là `null`, chế độ toàn màn hình đã bị hủy.

Điều đó có nghĩa là đối với mã ví dụ, nếu một phần tử hiện đang ở chế độ toàn màn hình, trình xử lý `fullscreenchange` ghi log `id` của phần tử toàn màn hình vào console. Nếu `document.fullscreenElement` là `null`, mã ghi log một thông báo rằng đang thoát khỏi chế độ toàn màn hình.

#### HTML

```html
<h1>Ví dụ về sự kiện fullscreenchange</h1>
<div id="fullscreen-div">
  <button id="toggle-fullscreen">Bật/tắt chế độ toàn màn hình</button>
  <pre id="logger"></pre>
</div>
```

#### CSS

```css
* {
  box-sizing: border-box;
}

#fullscreen-div {
  height: 150px;
  padding: 1rem;
  background-color: pink;
}

#logger {
  height: 80px;
  padding: 0 0.5rem;
  background-color: white;
  overflow: scroll;
}
```

#### JavaScript

```js
const logger = document.querySelector("#logger");
const fullScreenElement = document.querySelector("#fullscreen-div");

function log(message) {
  logger.textContent = `${logger.textContent}\n${message}`;
}

function fullscreenchangeHandler(event) {
  // document.fullscreenElement sẽ trỏ đến phần tử
  // đang ở chế độ toàn màn hình nếu có. Nếu không có,
  // giá trị của thuộc tính là null.
  if (document.fullscreenElement) {
    log(`Phần tử: ${document.fullscreenElement.id} đã vào chế độ toàn màn hình.`);
  } else {
    log("Đang thoát khỏi chế độ toàn màn hình.");
  }
}

document.addEventListener("fullscreenchange", fullscreenchangeHandler);

// Khi nút toggle được nhấp, vào/thoát toàn màn hình
document.getElementById("toggle-fullscreen").addEventListener("click", () => {
  if (document.fullscreenElement) {
    // exitFullscreen chỉ khả dụng trên đối tượng Document.
    document.exitFullscreen();
  } else {
    fullScreenElement.requestFullscreen();
  }
});
```

{{EmbedLiveSample("Logging fullscreenchange events", 640, 250, "", "", "", "fullscreen")}}

## Đặc tả kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("Document/fullscreenerror_event", "fullscreenerror")}}
- {{domxref("Element")}}: sự kiện {{domxref("Element/fullscreenchange_event", "fullscreenchange")}}
- [Fullscreen API](/en-US/docs/Web/API/Fullscreen_API)
- [Hướng dẫn sử dụng Fullscreen API](/en-US/docs/Web/API/Fullscreen_API/Guide)

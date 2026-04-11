---
title: "HTMLElement: sự kiện dragover"
short-title: dragover
slug: Web/API/HTMLElement/dragover_event
page-type: web-api-event
browser-compat: api.HTMLElement.dragover_event
---

{{APIRef("HTML Drag and Drop API")}}

Sự kiện `dragover` được kích hoạt khi một phần tử hoặc vùng văn bản được chọn đang được kéo qua vùng thả hợp lệ (vài trăm mili giây một lần).

Sự kiện này có thể hủy và có thể nổi bọt lên đến các đối tượng {{domxref("Document")}} và {{domxref("Window")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dragover", (event) => { })

ondragover = (event) => { }
```

## Loại sự kiện

Một {{domxref("DragEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("DragEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('DragEvent.dataTransfer')}} {{ReadOnlyInline}}
  - : Dữ liệu được truyền trong quá trình kéo và thả.

## Ví dụ

### Ví dụ kéo và thả tối giản

Trong ví dụ này, có một phần tử có thể kéo bên trong một vùng chứa. Hãy thử nắm phần tử, kéo nó qua vùng chứa kia, rồi thả ra.

Chúng ta sử dụng ba trình xử lý sự kiện ở đây:

- Trong trình xử lý sự kiện `dragstart`, chúng ta lấy tham chiếu đến phần tử người dùng kéo
- Trong trình xử lý sự kiện `dragover` của vùng chứa đích, chúng ta gọi `event.preventDefault()`, cho phép nó nhận sự kiện `drop`.
- Trong trình xử lý sự kiện `drop` của vùng thả, chúng ta xử lý việc di chuyển phần tử có thể kéo từ vùng chứa gốc đến vùng thả.

Để xem ví dụ đầy đủ về kéo và thả, hãy xem trang dành cho sự kiện [`drag`](/en-US/docs/Web/API/HTMLElement/drag_event).

#### HTML

```html
<div class="dropzone">
  <div id="draggable" draggable="true">This div is draggable</div>
</div>
<div class="dropzone" id="drop-target"></div>
```

#### CSS

```css
body {
  /* Prevent the user from selecting text in the example */
  user-select: none;
}

#draggable {
  text-align: center;
  background: white;
}

.dropzone {
  width: 200px;
  height: 20px;
  background: blueviolet;
  margin: 10px;
  padding: 10px;
}
```

#### JavaScript

```js
let dragged = null;

const source = document.getElementById("draggable");
source.addEventListener("dragstart", (event) => {
  // store a ref. on the dragged elem
  dragged = event.target;
});

const target = document.getElementById("drop-target");
target.addEventListener("dragover", (event) => {
  // prevent default to allow drop
  event.preventDefault();
});

target.addEventListener("drop", (event) => {
  // prevent default action (open as link for some elements)
  event.preventDefault();
  // move dragged element to the selected drop target
  if (event.target.className === "dropzone") {
    dragged.parentNode.removeChild(dragged);
    event.target.appendChild(dragged);
  }
});
```

#### Kết quả

{{EmbedLiveSample('A minimal drag and drop example')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện kéo và thả khác:
  - {{domxref("HTMLElement/drag_event", "drag")}}
  - {{domxref("HTMLElement/dragstart_event", "dragstart")}}
  - {{domxref("HTMLElement/dragend_event", "dragend")}}
  - {{domxref("HTMLElement/dragenter_event", "dragenter")}}
  - {{domxref("HTMLElement/dragleave_event", "dragleave")}}
  - {{domxref("HTMLElement/drop_event", "drop")}}

---
title: "HTMLElement: sự kiện dragstart"
short-title: dragstart
slug: Web/API/HTMLElement/dragstart_event
page-type: web-api-event
browser-compat: api.HTMLElement.dragstart_event
---

{{APIRef("HTML Drag and Drop API")}}

Sự kiện `dragstart` được kích hoạt khi người dùng bắt đầu kéo một phần tử hoặc vùng văn bản được chọn.

Sự kiện này có thể hủy và có thể nổi bọt lên đến các đối tượng {{domxref("Document")}} và {{domxref("Window")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dragstart", (event) => { })

ondragstart = (event) => { }
```

## Loại sự kiện

Một {{domxref("DragEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("DragEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('DragEvent.dataTransfer')}} {{ReadOnlyInline}}
  - : Dữ liệu được truyền trong quá trình kéo và thả.

## Ví dụ

### Đặt độ mờ khi bắt đầu kéo

Trong ví dụ này, có một phần tử có thể kéo bên trong một vùng chứa. Hãy thử nắm phần tử, kéo nó, rồi thả ra.

Chúng ta lắng nghe sự kiện `dragstart` để làm cho phần tử bán trong suốt khi đang kéo.

Để xem ví dụ đầy đủ về kéo và thả, hãy xem trang dành cho sự kiện [`drag`](/en-US/docs/Web/API/HTMLElement/drag_event).

#### HTML

```html
<div id="container">
  <div id="draggable" draggable="true">This div is draggable</div>
</div>
<div class="dropzone"></div>
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

#container {
  width: 200px;
  height: 20px;
  background: blueviolet;
  padding: 10px;
}

.dragging {
  opacity: 0.5;
}
```

#### JavaScript

```js
const source = document.getElementById("draggable");
source.addEventListener("dragstart", (event) => {
  // make it half transparent
  event.target.classList.add("dragging");
});

source.addEventListener("dragend", (event) => {
  // reset the transparency
  event.target.classList.remove("dragging");
});
```

#### Kết quả

{{EmbedLiveSample('Setting opacity on drag start')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện kéo và thả khác:
  - {{domxref("HTMLElement/drag_event", "drag")}}
  - {{domxref("HTMLElement/dragend_event", "dragend")}}
  - {{domxref("HTMLElement/dragover_event", "dragover")}}
  - {{domxref("HTMLElement/dragenter_event", "dragenter")}}
  - {{domxref("HTMLElement/dragleave_event", "dragleave")}}
  - {{domxref("HTMLElement/drop_event", "drop")}}

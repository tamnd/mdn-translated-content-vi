---
title: "HTMLElement: sự kiện dragend"
short-title: dragend
slug: Web/API/HTMLElement/dragend_event
page-type: web-api-event
browser-compat: api.HTMLElement.dragend_event
---

{{APIRef("HTML Drag and Drop API")}}

Sự kiện `dragend` được kích hoạt khi thao tác kéo kết thúc (bằng cách thả nút chuột hoặc nhấn phím Escape).

Sự kiện này có thể hủy và có thể nổi bọt lên đến các đối tượng {{domxref("Document")}} và {{domxref("Window")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dragend", (event) => { })

ondragend = (event) => { }
```

## Loại sự kiện

Một {{domxref("DragEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("DragEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('DragEvent.dataTransfer')}} {{ReadOnlyInline}}
  - : Dữ liệu được truyền trong quá trình kéo và thả.

## Ví dụ

### Đặt lại độ mờ khi kết thúc kéo

Trong ví dụ này, có một phần tử có thể kéo bên trong một vùng chứa. Hãy thử nắm phần tử, kéo nó, rồi thả ra.

Chúng ta làm cho phần tử bán trong suốt khi đang kéo, và lắng nghe sự kiện `dragend` để đặt lại độ mờ của phần tử khi nó được thả.

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

{{EmbedLiveSample('Resetting opacity on drag end')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện kéo và thả khác:
  - {{domxref("HTMLElement/drag_event", "drag")}}
  - {{domxref("HTMLElement/dragstart_event", "dragstart")}}
  - {{domxref("HTMLElement/dragover_event", "dragover")}}
  - {{domxref("HTMLElement/dragenter_event", "dragenter")}}
  - {{domxref("HTMLElement/dragleave_event", "dragleave")}}
  - {{domxref("HTMLElement/drop_event", "drop")}}

---
title: "HTMLElement: sự kiện dragleave"
short-title: dragleave
slug: Web/API/HTMLElement/dragleave_event
page-type: web-api-event
browser-compat: api.HTMLElement.dragleave_event
---

{{APIRef("HTML Drag and Drop API")}}

Sự kiện `dragleave` được kích hoạt khi một phần tử đang kéo hoặc vùng văn bản được chọn rời khỏi vùng thả hợp lệ.

Sự kiện này không thể hủy và có thể nổi bọt lên đến các đối tượng {{domxref("Document")}} và {{domxref("Window")}}.

## Cú pháp

Sử dụng tên sự kiện trong các phương thức như {{domxref("EventTarget.addEventListener", "addEventListener()")}}, hoặc đặt thuộc tính trình xử lý sự kiện.

```js-nolint
addEventListener("dragleave", (event) => { })

ondragleave = (event) => { }
```

## Loại sự kiện

Một {{domxref("DragEvent")}}. Kế thừa từ {{domxref("Event")}}.

{{InheritanceDiagram("DragEvent")}}

## Thuộc tính sự kiện

_Ngoài các thuộc tính liệt kê dưới đây, các thuộc tính từ giao diện cha {{domxref("Event")}} cũng có sẵn._

- {{domxref('DragEvent.dataTransfer')}} {{ReadOnlyInline}}
  - : Dữ liệu được truyền trong quá trình kéo và thả.

## Ví dụ

### Đặt lại kiểu vùng thả khi dragleave

Trong ví dụ này, có một phần tử có thể kéo bên trong một vùng chứa. Hãy thử nắm phần tử, kéo nó qua vùng chứa kia, rồi thả ra.

Chúng ta tô màu tím nền vùng chứa kia khi phần tử đang kéo ở phía trên để báo hiệu rằng nó có thể được thả vào đó. Chúng ta lắng nghe sự kiện `dragleave` để đặt lại nền vùng chứa khi kéo phần tử ra khỏi đó.

Tuy nhiên, trong ví dụ một phần này, chúng ta chưa triển khai thả: để xem ví dụ đầy đủ về kéo và thả, hãy xem trang dành cho sự kiện [`drag`](/en-US/docs/Web/API/HTMLElement/drag_event).

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

.dropzone.dragover {
  background-color: purple;
}
```

#### JavaScript

```js
const target = document.getElementById("drop-target");
target.addEventListener("dragenter", (event) => {
  // highlight potential drop target when the draggable element enters it
  if (event.target.classList.contains("dropzone")) {
    event.target.classList.add("dragover");
  }
});

target.addEventListener("dragleave", (event) => {
  // reset background of potential drop target when the draggable element leaves it
  if (event.target.classList.contains("dropzone")) {
    event.target.classList.remove("dragover");
  }
});
```

#### Kết quả

{{EmbedLiveSample('Resetting drop zone styles on dragleave')}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Các sự kiện kéo và thả khác:
  - {{domxref("HTMLElement/drag_event", "drag")}}
  - {{domxref("HTMLElement/dragstart_event", "dragstart")}}
  - {{domxref("HTMLElement/dragend_event", "dragend")}}
  - {{domxref("HTMLElement/dragover_event", "dragover")}}
  - {{domxref("HTMLElement/dragenter_event", "dragenter")}}
  - {{domxref("HTMLElement/drop_event", "drop")}}

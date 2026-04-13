---
title: HTML Drag and Drop API
slug: Web/API/HTML_Drag_and_Drop_API
page-type: web-api-overview
spec-urls: https://html.spec.whatwg.org/multipage/dnd.html
---

{{DefaultAPISidebar("HTML Drag and Drop API")}}

Giao diện **HTML Drag and Drop** cho phép các ứng dụng sử dụng tính năng kéo và thả trong trình duyệt.

Người dùng có thể chọn các phần tử _có thể kéo_ bằng chuột, kéo các phần tử đó đến phần tử _có thể thả_, và thả chúng bằng cách nhả nút chuột. Biểu diễn mờ của các phần tử _có thể kéo_ theo con trỏ trong quá trình kéo.

Bạn có thể tùy chỉnh phần tử nào có thể trở thành _có thể kéo_, loại phản hồi mà các phần tử _có thể kéo_ tạo ra và các phần tử _có thể thả_.

## Khái niệm và cách sử dụng

Drag and Drop có ba trường hợp sử dụng riêng biệt: [kéo các phần tử trong một trang](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Kanban_board), kéo dữ liệu ra khỏi trang, và [kéo dữ liệu vào trang](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/File_drag_and_drop).

Cốt lõi của thao tác kéo liên quan đến ba thứ:

- [Mục đang được kéo](#các-phần-tử-có-thể-kéo)
- [Dữ liệu cơ bản được chuyển](#kho-dữ-liệu-kéo)
- [Mục tiêu thả](#mục-tiêu-thả)

### Sự kiện kéo

HTML drag-and-drop sử dụng [mô hình sự kiện DOM](/en-US/docs/Web/API/Event) và _[sự kiện kéo](/en-US/docs/Web/API/DragEvent)_ kế thừa từ [sự kiện chuột](/en-US/docs/Web/API/MouseEvent).

| Sự kiện                                                 | Kích hoạt khi...                                              |
| ------------------------------------------------------- | ------------------------------------------------------------- |
| {{domxref('HTMLElement/dragstart_event', 'dragstart')}} | ...mục có thể kéo bắt đầu được kéo.                           |
| {{domxref('HTMLElement/drag_event', 'drag')}}           | ...mục có thể kéo đang được kéo, mỗi vài trăm mili giây.      |
| {{domxref('HTMLElement/dragenter_event', 'dragenter')}} | ...phần tử có mục có thể kéo vào trong nó.                    |
| {{domxref('HTMLElement/dragleave_event', 'dragleave')}} | ...phần tử có mục có thể kéo rời khỏi nó.                     |
| {{domxref('HTMLElement/dragover_event', 'dragover')}}   | ...phần tử có mục có thể kéo đang được kéo qua nó.            |
| {{domxref('HTMLElement/drop_event', 'drop')}}           | ...phần tử là mục tiêu thả và mục có thể kéo được thả lên nó. |
| {{domxref('HTMLElement/dragend_event', 'dragend')}}     | ...mục có thể kéo ngừng được kéo.                             |

### Các phần tử có thể kéo

Trong HTML, ảnh, liên kết và vùng chọn có thể kéo theo mặc định. Để làm cho phần tử tùy ý có thể kéo, đặt thuộc tính [`draggable`](/en-US/docs/Web/HTML/Reference/Global_attributes/draggable) thành giá trị `"true"`.

```html live-sample___draggable_element live-sample___drop_target
<p id="p1" draggable="true">This element is draggable.</p>
```

{{EmbedLiveSample("draggable_element", "", 100)}}

### Kho dữ liệu kéo

Bạn không thể chuyển đối tượng JavaScript trực tiếp sang các trang web tùy ý, vì vậy để chuyển dữ liệu, dữ liệu phải được tuần tự hóa thành chuỗi. Trong drag and drop, chuỗi này được đóng gói trong đối tượng {{domxref("DataTransferItem")}}, cũng định nghĩa một `type` cụ thể (thường là MIME type).

Phương thức {{domxref("DataTransfer.setData", "setData()")}} có thể được sử dụng để thêm mục vào dữ liệu kéo:

```js live-sample___drop_target
function dragstartHandler(ev) {
  // Add different types of drag data
  ev.dataTransfer.setData("text/plain", ev.target.innerText);
  ev.dataTransfer.setData("text/html", ev.target.outerHTML);
  ev.dataTransfer.setData(
    "text/uri-list",
    ev.target.ownerDocument.location.href,
  );
}

const p1 = document.getElementById("p1");
p1.addEventListener("dragstart", dragstartHandler);
```

### Mục tiêu thả

Bất kỳ phần tử nào cũng có thể trở thành mục tiêu thả bằng cách hủy sự kiện {{domxref("HTMLElement.dragover_event","dragover")}} kích hoạt trên nó bằng `preventDefault()`.

```html live-sample___drop_target
<p id="target">Drop Zone</p>
```

```js live-sample___drop_target
const target = document.getElementById("target");

// Cancel dragover so that drop can fire
target.addEventListener("dragover", (ev) => {
  ev.preventDefault();
});
target.addEventListener("drop", (ev) => {
  ev.preventDefault();
  const data = ev.dataTransfer.getData("text/plain");
  ev.target.append(data);
});
```

{{EmbedLiveSample("drop_target", "", 300)}}

## Hướng dẫn

- [Các thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
  - : Mô tả các bước xảy ra trong quá trình kéo và thả.
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
  - : Mô tả cách đọc và ghi vào kho dữ liệu kéo.
- [Kéo và thả file](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/File_drag_and_drop)
  - : Hướng dẫn thực hành triển khai giao diện cơ bản chấp nhận file kéo thả.
- [Bảng Kanban với drag and drop](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Kanban_board)
  - : Hướng dẫn thực hành triển khai bảng Kanban với kéo và thả phần tử.

## Giao diện

- {{domxref("DragEvent")}}
  - : Đối tượng sự kiện được truyền vào các trình xử lý sự kiện kéo.
- {{domxref("DataTransfer")}}
  - : Giữ bất kỳ dữ liệu nào được chuyển giữa các ngữ cảnh, bao gồm các mục văn bản và mục file.
- {{domxref("DataTransferItem")}}
  - : Đại diện cho một mục trong kho dữ liệu kéo, có thể là mục văn bản hoặc mục file.
- {{domxref("DataTransferItemList")}}
  - : Đại diện cho danh sách các đối tượng {{domxref("DataTransferItem")}} trong kho dữ liệu kéo.

## Ví dụ

- [Sao chép và di chuyển phần tử với giao diện `DataTransfer`](https://mdn.github.io/dom-examples/drag-and-drop/copy-move-DataTransfer.html)
- [Sao chép và di chuyển phần tử với giao diện `DataTransferListItem`](https://mdn.github.io/dom-examples/drag-and-drop/copy-move-DataTransferItemList.html)

## Thông số kỹ thuật

{{Specifications}}

## Xem thêm

- [Drag Operations](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Working with the drag data store](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)
- [HTML Living Standard: Drag and Drop](https://html.spec.whatwg.org/multipage/interaction.html#dnd)

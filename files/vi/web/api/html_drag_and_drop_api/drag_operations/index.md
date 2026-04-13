---
title: Các thao tác kéo
slug: Web/API/HTML_Drag_and_Drop_API/Drag_operations
page-type: guide
---

{{DefaultAPISidebar("HTML Drag and Drop API")}}

Trang này mô tả các bước xảy ra trong quá trình kéo và thả.

## Thuộc tính draggable

Để làm cho phần tử có thể kéo, đặt thuộc tính `draggable` thành `"true"`:

```html
<p id="p1" draggable="true">This paragraph is draggable.</p>
```

Hầu hết các loại phần tử không thể kéo theo mặc định. Ảnh và liên kết có thể kéo theo mặc định.

## Bắt đầu thao tác kéo

Sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}} kích hoạt khi người dùng bắt đầu kéo phần tử. Bạn thường thiết lập dữ liệu kéo trong trình xử lý này.

```js
function dragstartHandler(ev) {
  ev.dataTransfer.setData("text/plain", ev.target.id);
}
```

### Thiết lập hình ảnh kéo

Trình duyệt tạo hình ảnh từ phần tử nguồn để hiển thị trong quá trình kéo. Bạn có thể sử dụng {{domxref("DataTransfer.setDragImage","setDragImage()")}} để thay thế.

```js
function dragstartHandler(ev) {
  const cust = document.createElement("img");
  cust.src = "custom.png";
  cust.width = 100;
  ev.dataTransfer.setDragImage(cust, 15, 15);
}
```

### Định nghĩa hiệu ứng kéo

Thuộc tính {{domxref("DataTransfer.effectAllowed","effectAllowed")}} chỉ định loại thao tác được phép. Nó nên được đặt trong trình xử lý `dragstart`.

```js
function dragstartHandler(ev) {
  ev.dataTransfer.effectAllowed = "copyMove";
}
```

## Kéo qua phần tử

Để biến phần tử thành mục tiêu thả hợp lệ, hãy hủy sự kiện {{domxref("HTMLElement/dragover_event", "dragover")}}. Điều này ngăn hành vi mặc định cho phép thả xảy ra.

```js
function dragoverHandler(ev) {
  ev.preventDefault();
  ev.dataTransfer.dropEffect = "copy";
}
```

## Bỏ thả vào mục tiêu

Khi người dùng thả mục, sự kiện {{domxref("HTMLElement/drop_event", "drop")}} kích hoạt trên mục tiêu thả.

```js
function dropHandler(ev) {
  ev.preventDefault();
  const data = ev.dataTransfer.getData("text/plain");
  ev.target.textContent = data;
}
```

## Kết thúc thao tác kéo

Khi thao tác kéo kết thúc (dù có thả thành công hay không), sự kiện {{domxref("HTMLElement/dragend_event", "dragend")}} kích hoạt trên phần tử nguồn.

```js
function dragendHandler(ev) {
  const dropEffect = ev.dataTransfer.dropEffect;
  if (dropEffect === "move") {
    // Xóa phần tử nguồn
    ev.target.style.display = "none";
  }
}
```

## Xem thêm

- [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)

---
title: "DataTransfer: phương thức setData()"
short-title: setData()
slug: Web/API/DataTransfer/setData
page-type: web-api-instance-method
browser-compat: api.DataTransfer.setData
---

{{APIRef("HTML Drag and Drop API")}}

Phương thức **`DataTransfer.setData()`** đặt [dữ liệu kéo](/en-US/docs/Web/API/DataTransfer) của thao tác kéo thành dữ liệu và kiểu được chỉ định. Nếu dữ liệu cho kiểu đã cho không tồn tại, nó sẽ được thêm vào cuối kho dữ liệu kéo, sao cho mục cuối cùng trong danh sách {{domxref("DataTransfer.types","types")}} sẽ là kiểu mới. Nếu dữ liệu cho kiểu đã cho đã tồn tại, dữ liệu hiện có sẽ được thay thế ở cùng vị trí. Tức là thứ tự của danh sách {{domxref("DataTransfer.types","types")}} không thay đổi khi thay thế dữ liệu cùng kiểu.

Ví dụ về kiểu dữ liệu là `text/plain` và `text/uri-list`.

## Cú pháp

```js-nolint
setData(format, data)
```

### Tham số

- `format`
  - : Một chuỗi đại diện cho kiểu dữ liệu kéo cần thêm vào {{domxref("DataTransfer")}}.
- `data`
  - : Một chuỗi đại diện cho dữ liệu cần thêm vào {{domxref("DataTransfer")}}.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Kéo một phần tử

Trong ví dụ này, chúng tôi có thể kéo một phần tử {{HTMLElement("p")}} vào phần tử {{HTMLElement("div")}} đích.

- Trong trình xử lý `dragstart`, chúng tôi sử dụng `setData()` để thêm `id` của phần tử `<p>` vào đối tượng {{domxref("DataTransfer")}}.

- Trong trình xử lý `drop`, chúng tôi lấy `id` và sử dụng nó để di chuyển phần tử `<p>` vào đích.

#### HTML

```html
<div>
  <p id="source" draggable="true">
    Select this element, drag it to the drop zone and then release the selection
    to move the element.
  </p>
</div>
<div id="target">Drop Zone</div>

<button id="reset">Reset example</button>
```

#### CSS

```css
div {
  margin: 0.5em 0;
  padding: 2em;
}

#target,
#source {
  border: 1px solid black;
  padding: 0.5rem;
}

.dragging {
  background-color: pink;
}
```

#### JavaScript

```js
const source = document.querySelector("#source");
source.addEventListener("dragstart", (ev) => {
  console.log("dragStart");
  // Change the source element's background color
  // to show that drag has started
  ev.currentTarget.classList.add("dragging");
  // Clear the drag data cache (for all formats/types)
  ev.dataTransfer.clearData();
  // Set the drag's format and data.
  // Use the event target's id for the data
  ev.dataTransfer.setData("text/plain", ev.target.id);
});
source.addEventListener("dragend", (ev) =>
  ev.target.classList.remove("dragging"),
);

const target = document.querySelector("#target");
target.addEventListener("dragover", (ev) => {
  console.log("dragOver");
  ev.preventDefault();
});
target.addEventListener("drop", (ev) => {
  console.log("Drop");
  ev.preventDefault();
  // Get the data, which is the id of the source element
  const data = ev.dataTransfer.getData("text");
  const source = document.getElementById(data);
  ev.target.appendChild(source);
});

const reset = document.querySelector("#reset");
reset.addEventListener("click", () => document.location.reload());
```

#### Kết quả

{{EmbedLiveSample("Dragging an element", "", 250)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)

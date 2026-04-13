---
title: "DataTransfer: phương thức setDragImage()"
short-title: setDragImage()
slug: Web/API/DataTransfer/setDragImage
page-type: web-api-instance-method
browser-compat: api.DataTransfer.setDragImage
---

{{APIRef("HTML Drag and Drop API")}}

Khi xảy ra thao tác kéo, một hình ảnh mờ được tạo từ đích kéo (phần tử mà sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}} được kích hoạt), và theo con trỏ chuột trong quá trình kéo. Hình ảnh này được tạo tự động, vì vậy bạn không cần tự tạo. Tuy nhiên, nếu muốn hình ảnh tùy chỉnh, phương thức **`DataTransfer.setDragImage()`** có thể được sử dụng để đặt hình ảnh tùy chỉnh. Hình ảnh thường là phần tử {{HTMLElement("img")}} nhưng cũng có thể là {{HTMLElement("canvas")}} hoặc bất kỳ phần tử hiển thị nào khác.

Các tọa độ `x` và `y` của phương thức xác định cách hình ảnh hiển thị so với con trỏ chuột. Các tọa độ này xác định độ lệch trong hình ảnh nơi con trỏ chuột nên đặt. Ví dụ, để hiển thị hình ảnh sao cho con trỏ nằm ở trung tâm, hãy sử dụng các giá trị bằng một nửa chiều rộng và chiều cao của hình ảnh.

Phương thức này phải được gọi trong trình xử lý sự kiện {{domxref("HTMLElement/dragstart_event", "dragstart")}}.

## Cú pháp

```js-nolint
setDragImage(imgElement, xOffset, yOffset)
```

### Tham số

- `imgElement`
  - : Một phần tử hình ảnh {{domxref("Element")}} để sử dụng cho hình ảnh phản hồi kéo.

    Nếu {{domxref("Element")}} là một phần tử img, hãy đặt bitmap kho dữ liệu kéo thành hình ảnh của phần tử (ở kích thước nội tại của nó); nếu không, hãy đặt bitmap kho dữ liệu kéo thành hình ảnh được tạo từ phần tử đã cho (cơ chế chính xác để làm điều này hiện chưa được chỉ định).

    Lưu ý: Nếu {{domxref("Element")}} là một {{domxref("HTMLElement")}} đang tồn tại, nó cần phải hiển thị trong khung nhìn để được hiển thị như một hình ảnh phản hồi kéo. Ngoài ra, bạn có thể tạo một phần tử DOM mới có thể nằm ngoài màn hình dành riêng cho mục đích này.

- `xOffset`
  - : Một `long` cho biết độ lệch ngang trong hình ảnh.
- `yOffset`
  - : Một `long` cho biết độ lệch dọc trong hình ảnh.

### Giá trị trả về

Không có ({{jsxref("undefined")}}).

## Ví dụ

### Sử dụng setDragImage()

```html
<div>
  <p id="source" draggable="true">
    Select this element, drag it to the Drop Zone and then release the selection
    to move the element.
  </p>
</div>
<div id="target">Drop Zone</div>
```

```css
div {
  margin: 0em;
  padding: 2em;
}
#source {
  color: blue;
  border: 1px solid black;
}
#target {
  border: 1px solid black;
}
```

```js
const source = document.getElementById("source");
const target = document.getElementById("target");

// Create an image and use it for the drag image
// Use the image URL that you desire
const img = new Image();
img.src = "/shared-assets/images/examples/favicon32.png";

source.addEventListener("dragstart", (ev) => {
  // Set the drag's format and data. Use the event target's id for the data
  ev.dataTransfer.setData("text/plain", ev.target.id);
  ev.dataTransfer.setDragImage(img, 10, 10);
});

target.addEventListener("dragover", (ev) => {
  ev.preventDefault();
});

target.addEventListener("drop", (ev) => {
  ev.preventDefault();
  // Get the data, which is the id of the drop target
  const data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
});
```

{{EmbedLiveSample("Using setDragImage", "", 300)}}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)

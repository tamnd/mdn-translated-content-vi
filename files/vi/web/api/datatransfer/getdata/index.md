---
title: "DataTransfer: phương thức getData()"
short-title: getData()
slug: Web/API/DataTransfer/getData
page-type: web-api-instance-method
browser-compat: api.DataTransfer.getData
---

{{APIRef("HTML DOM")}}

Phương thức **`DataTransfer.getData()`** lấy dữ liệu kéo (dưới dạng chuỗi) cho kiểu được chỉ định. Nếu thao tác kéo không bao gồm dữ liệu, phương thức này trả về một chuỗi rỗng.

Ví dụ về kiểu dữ liệu là `text/plain` và `text/uri-list`.

## Cú pháp

```js-nolint
getData(format)
```

### Tham số

- `format`
  - : Một chuỗi đại diện cho kiểu dữ liệu cần lấy.

### Giá trị trả về

Một chuỗi đại diện cho dữ liệu kéo cho `format` được chỉ định. Nếu thao tác kéo không có dữ liệu hoặc thao tác không có dữ liệu cho `format` được chỉ định, phương thức này trả về một chuỗi rỗng.

Lưu ý rằng `DataTransfer.getData()` có thể không trả về giá trị mong đợi, vì nó chỉ cho phép đọc và ghi dữ liệu cho các sự kiện được chỉ định. Trong các sự kiện `dragstart` và `drop`, việc truy cập dữ liệu là an toàn. Đối với tất cả các sự kiện khác, dữ liệu nên được coi là không khả dụng. Dù vậy, các mục và định dạng của chúng vẫn có thể được liệt kê.

## Ví dụ

Ví dụ này cho thấy cách sử dụng các phương thức `getData()` và {{domxref("DataTransfer.setData()","setData()")}} của đối tượng {{domxref("DataTransfer")}}.

### HTML

```html
<div id="div1">
  <span id="drag" draggable="true">drag me to the other box</span>
</div>
<div id="div2"></div>
```

### CSS

```css
#div1,
#div2 {
  width: 100px;
  height: 50px;
  padding: 10px;
  border: 1px solid #aaaaaa;
}
```

### JavaScript

```js
const div1 = document.getElementById("div1");
const div2 = document.getElementById("div2");
const dragElement = document.getElementById("drag");

dragElement.addEventListener("dragstart", drag);
div1.addEventListener("dragover", allowDrop);
div2.addEventListener("dragover", allowDrop);
div1.addEventListener("drop", drop);
div2.addEventListener("drop", drop);

function allowDrop(allowDropEvent) {
  allowDropEvent.target.style.color = "blue";
  allowDropEvent.preventDefault();
}

function drag(dragEvent) {
  dragEvent.dataTransfer.setData("text", dragEvent.target.id);
  dragEvent.target.style.color = "green";
}

function drop(dropEvent) {
  dropEvent.preventDefault();
  const data = dropEvent.dataTransfer.getData("text");
  dropEvent.target.appendChild(document.getElementById(data));
  dragElement.style.color = "black";
}
```

### Kết quả

{{EmbedLiveSample('Examples', 600) }}

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Kéo và thả](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- [Thao tác kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_operations)
- [Làm việc với kho dữ liệu kéo](/en-US/docs/Web/API/HTML_Drag_and_Drop_API/Drag_data_store)

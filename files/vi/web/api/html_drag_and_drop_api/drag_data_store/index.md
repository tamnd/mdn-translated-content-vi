---
title: Làm việc với kho dữ liệu kéo
slug: Web/API/HTML_Drag_and_Drop_API/Drag_data_store
page-type: guide
---

{{DefaultAPISidebar("HTML Drag and Drop API")}}

Kho dữ liệu kéo là nơi lưu trữ dữ liệu được chuyển trong quá trình kéo và thả. Hướng dẫn này mô tả cách đọc và ghi vào kho đó.

## Giới thiệu

Trong quá trình kéo và thả, dữ liệu được lưu trữ trong đối tượng {{domxref("DataTransfer")}} liên kết với sự kiện kéo. Đối tượng này có thể truy cập thông qua thuộc tính {{domxref("DragEvent.dataTransfer","dataTransfer")}} của {{domxref("DragEvent")}}.

```js
element.addEventListener("dragstart", (event) => {
  console.log(event.dataTransfer); // Đối tượng DataTransfer
});
```

## Thêm dữ liệu vào kho

Dữ liệu chỉ có thể được thêm vào kho trong trình xử lý sự kiện `dragstart`. Sử dụng phương thức {{domxref("DataTransfer.setData","setData()")}} với một loại MIME và chuỗi dữ liệu.

```js
element.addEventListener("dragstart", (event) => {
  event.dataTransfer.setData("text/plain", "Dữ liệu văn bản đơn giản");
  event.dataTransfer.setData("text/html", "<p>Nội dung HTML</p>");
});
```

Bạn có thể thêm nhiều mục với các loại khác nhau, điều này cho phép mục tiêu thả chọn loại phù hợp nhất với chúng.

## Đọc dữ liệu từ kho

Dữ liệu chỉ có thể được đọc trong trình xử lý sự kiện `drop`.

```js
dropTarget.addEventListener("drop", (event) => {
  event.preventDefault();
  const textData = event.dataTransfer.getData("text/plain");
  const htmlData = event.dataTransfer.getData("text/html");
  console.log(textData, htmlData);
});
```

## Liệt kê các loại dữ liệu

Thuộc tính {{domxref("DataTransfer.types","types")}} trả về danh sách các loại dữ liệu hiện có trong kho.

```js
dropTarget.addEventListener("dragover", (event) => {
  event.preventDefault();
  const types = event.dataTransfer.types;
  if (types.includes("text/plain")) {
    // Có dữ liệu văn bản thuần túy
  }
});
```

## Xóa dữ liệu

Phương thức {{domxref("DataTransfer.clearData","clearData()")}} xóa dữ liệu cho loại đã chỉ định hoặc tất cả dữ liệu nếu không có đối số.

```js
element.addEventListener("dragstart", (event) => {
  event.dataTransfer.setData("text/plain", "some data");
  event.dataTransfer.clearData("text/plain"); // Xóa text/plain
});
```

## Đặt hình ảnh kéo

Theo mặc định, trình duyệt hiển thị hình ảnh mờ của phần tử đang được kéo. Bạn có thể thay thế bằng cách sử dụng phương thức {{domxref("DataTransfer.setDragImage","setDragImage()")}}.

```js
element.addEventListener("dragstart", (event) => {
  const img = document.createElement("img");
  img.src = "custom-drag-image.png";
  event.dataTransfer.setDragImage(img, 10, 10);
});
```

## Đặt hiệu ứng kéo

Thuộc tính {{domxref("DataTransfer.effectAllowed","effectAllowed")}} và {{domxref("DataTransfer.dropEffect","dropEffect")}} kiểm soát con trỏ khi kéo và thả.

```js
element.addEventListener("dragstart", (event) => {
  event.dataTransfer.effectAllowed = "copy"; // "copy", "move", "link", "none", "copyMove", "copyLink", "linkMove", "all"
});

dropTarget.addEventListener("dragover", (event) => {
  event.preventDefault();
  event.dataTransfer.dropEffect = "copy";
});
```

## Xem thêm

- [HTML Drag and Drop API](/en-US/docs/Web/API/HTML_Drag_and_Drop_API)
- {{domxref("DataTransfer")}}

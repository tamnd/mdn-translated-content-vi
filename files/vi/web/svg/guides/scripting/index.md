---
title: Viết script
slug: Web/SVG/Guides/Scripting
page-type: guide
sidebar: svgref
---

Có nhiều cách để tạo và thao tác SVG bằng JavaScript.
Tài liệu này mô tả việc xử lý sự kiện, tính tương tác và làm việc với nội dung SVG được nhúng.

Bạn có thể ghi đè hành vi mặc định của trình duyệt bằng phương thức `evt.preventDefault()`, thêm trình nghe sự kiện vào các đối tượng bằng cú pháp `element.addEventListener(event, function, useCapture)`, và đặt thuộc tính phần tử bằng cú pháp như `svgElement.style.setProperty("fill-opacity", "0.0", "")`. Lưu ý rằng có cả ba đối số khi thiết lập thuộc tính.

## Ngăn hành vi mặc định trong mã sự kiện

Khi viết mã kéo-thả, đôi khi bạn sẽ thấy văn bản trên trang vô tình bị chọn trong lúc kéo. Hoặc nếu bạn muốn dùng phím backspace trong mã của mình, bạn có thể muốn ghi đè hành vi mặc định của trình duyệt khi phím backspace được nhấn, vốn là quay lại trang trước đó. Phương thức `evt.preventDefault()` cho phép bạn làm điều đó.

## Sử dụng `eventListeners` với đối tượng

Các phương thức `addEventListener()` và `removeEventListener()` rất hữu ích khi viết SVG tương tác. Bạn có thể truyền một đối tượng triển khai giao diện `handleEvent` làm tham số thứ hai cho các phương thức này.

```js
function myRect(x, y, w, h, message) {
  this.message = message;

  this.rect = document.createElementNS("http://www.w3.org/2000/svg", "rect");
  this.rect.setAttributeNS(null, "x", x);
  this.rect.setAttributeNS(null, "y", y);
  this.rect.setAttributeNS(null, "width", w);
  this.rect.setAttributeNS(null, "height", h);
  document.documentElement.appendChild(this.rect);

  this.rect.addEventListener("click", this);

  this.handleEvent = (evt) => {
    switch (evt.type) {
      case "click":
        alert(this.message);
        break;
    }
  };
}
```

## Viết script giữa các tài liệu

### Tham chiếu SVG được nhúng

Khi dùng SVG trong HTML, SVG Viewer 3.0 của Adobe tự động bao gồm một thuộc tính window tên là `svgDocument` trỏ đến tài liệu SVG. Điều này không xảy ra với cách triển khai SVG gốc của Mozilla; vì vậy, dùng `window.svgDocument` sẽ không hoạt động trong Mozilla. Thay vào đó, bạn có thể dùng

```js
const svgDoc = document.embeds["name_of_svg"].getSVGDocument();
```

để lấy một tham chiếu đến tài liệu SVG được nhúng.

Cách tốt nhất để truy cập {{domxref("Document")}} đại diện cho một tài liệu SVG là xem {{domxref("HTMLIFrameElement.contentDocument")}} (nếu tài liệu được trình bày trong một phần tử {{HTMLElement("iframe")}}) hoặc {{domxref("HTMLObjectElement.contentDocument")}} (nếu tài liệu được trình bày trong một phần tử {{HTMLElement("object")}}), như sau:

```js
const svgDoc = document.getElementById("iframe_element").contentDocument;
```

Ngoài ra, các phần tử {{HTMLElement("iframe")}}, {{HTMLElement("embed")}} và {{HTMLElement("object")}} cung cấp một phương thức `getSVGDocument()`, trả về {{domxref("XMLDocument")}} đại diện cho SVG được nhúng của phần tử, hoặc `null` nếu phần tử không đại diện cho một tài liệu SVG.

Bạn cũng có thể dùng `document.getElementById("svg_elem_name").getSVGDocument()`, cho kết quả tương tự.

> [!NOTE]
> Bạn có thể gặp tài liệu nhắc tới giao diện `SVGDocument`. Trước SVG 2, tài liệu SVG được biểu diễn bằng giao diện đó. Tuy nhiên, hiện nay tài liệu SVG được biểu diễn bằng giao diện {{domxref("XMLDocument")}}.

### Gọi các hàm JavaScript

Khi gọi một hàm JavaScript nằm trong tệp HTML từ một tệp SVG được nhúng trong tài liệu HTML, bạn nên dùng `parent.functionName()` để tham chiếu tới hàm đó. Mặc dù plugin trình xem SVG của Adobe cho phép dùng `functionName()`, đó không phải là cách nên dùng.

> [!NOTE]
> Theo [SVG wiki](https://web.archive.org/web/20100223210744/http://wiki.svg.org/Inter-Document_Communication), biến JS `"parent"` bị lỗi trong plugin xem trước SVG version 6 của Adobe. Cách khắc phục được đề xuất là dùng `"top"` thay cho `"parent"`. Vì đây là bản beta của plugin, chúng ta có lẽ có thể bỏ qua vấn đề này một cách an toàn.

Thêm thông tin và một số ví dụ có thể xem tại trang [SVG wiki inter-document scripting page](https://web.archive.org/web/20100223210744/http://wiki.svg.org/Inter-Document_Communication).

## `setProperty` có ba tham số

Hàm `svgElement.style.setProperty("fill-opacity", "0.0")` sẽ ném ra một DOMException - `SYNTAX ERR` trong Mozilla. Hành vi này được W3C chỉ định trong đặc tả DOM Level 2 Style. Hàm `setProperty` được định nghĩa với ba tham số. Câu lệnh trên có thể được thay bằng `'svgElement.style.setProperty("fill-opacity", "0.0", "")'`, đây là cách tuân thủ tiêu chuẩn.

## Xem thêm

- [SVG wiki về Scripting and Programming](https://web.archive.org/web/20100212202713/http://wiki.svg.org/Main_Page#Scripting_and_Programming)

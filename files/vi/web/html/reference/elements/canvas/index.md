---
title: "<canvas>: The Graphics Canvas element"
slug: Web/HTML/Reference/Elements/canvas
page-type: html-element
browser-compat: html.elements.canvas
sidebar: htmlsidebar
---

Sử dụng **phần tử HTML `<canvas>`** với [canvas scripting API](/en-US/docs/Web/API/Canvas_API) hoặc [WebGL API](/en-US/docs/Web/API/WebGL_API) để vẽ đồ họa và hoạt ảnh.

## Thuộc tính

Các thuộc tính của phần tử này bao gồm [thuộc tính toàn cục](/en-US/docs/Web/HTML/Reference/Global_attributes).

- `height`
  - : Chiều cao của không gian tọa độ tính bằng CSS pixels. Mặc định là 150.
- `moz-opaque` {{non-standard_inline}} {{deprecated_inline}}
  - : Cho phép canvas biết liệu độ trong suốt có phải là một yếu tố hay không. Nếu canvas biết không có độ trong suốt, hiệu suất vẽ có thể được tối ưu hóa. Thuộc tính này chỉ được hỗ trợ bởi các trình duyệt dựa trên Mozilla; thay vào đó hãy sử dụng {{domxref("HTMLCanvasElement.getContext()", "canvas.getContext('2d', { alpha: false })")}} đã được chuẩn hóa.
- `width`
  - : Chiều rộng của không gian tọa độ tính bằng CSS pixels. Mặc định là 300.

## Ghi chú sử dụng

### Nội dung thay thế

Bạn nên cung cấp nội dung thay thế bên trong khối `<canvas>`. Nội dung đó sẽ được hiển thị trên các trình duyệt cũ không hỗ trợ canvas và trên các trình duyệt có JavaScript bị tắt.

### Thẻ đóng `</canvas>`

Khác với phần tử {{HTMLElement("img")}}, phần tử `<canvas>` **yêu cầu** thẻ đóng (`</canvas>`).

### Đặt kích thước canvas bằng CSS so với HTML

Kích thước hiển thị của canvas có thể được thay đổi bằng CSS, nhưng nếu làm vậy, hình ảnh sẽ được thu phóng trong quá trình kết xuất để vừa với kích thước được tạo kiểu, điều này có thể khiến kết xuất đồ họa cuối cùng bị méo.

Tốt hơn là chỉ định kích thước canvas của bạn bằng cách đặt trực tiếp các thuộc tính `width` và `height` trên các phần tử `<canvas>`, trực tiếp trong HTML hoặc bằng cách dùng JavaScript.

### Kích thước canvas tối đa

Kích thước tối đa chính xác của phần tử `<canvas>` phụ thuộc vào trình duyệt và môi trường. Trong hầu hết các trường hợp, kích thước tối đa vượt quá 10.000 x 10.000 pixel, nhưng đáng chú ý là các thiết bị iOS giới hạn kích thước canvas chỉ còn 4.096 x 4.096 pixel. Xem [giới hạn kích thước canvas trong các trình duyệt và thiết bị khác nhau](https://jhildenbiddle.github.io/canvas-size/#/?id=test-results).

> [!NOTE]
> Vượt quá kích thước hoặc diện tích tối đa sẽ khiến canvas không thể sử dụng được — các lệnh vẽ sẽ không hoạt động.

### Sử dụng canvas ngoài màn hình

Canvas có thể được kết xuất bằng API {{domxref("OffscreenCanvas")}} nơi tài liệu và canvas được tách rời nhau.
Lợi ích là [luồng worker](/en-US/docs/Web/API/Web_Workers_API/Using_web_workers) có thể xử lý việc kết xuất canvas và luồng chính của ứng dụng web của bạn không bị chặn bởi các thao tác canvas.
Bằng cách song song hóa công việc, các phần tử UI khác của ứng dụng web của bạn sẽ vẫn phản hồi ngay cả khi bạn đang chạy đồ họa phức tạp trên canvas ngoài màn hình.
Để biết thêm thông tin, xem tài liệu API {{domxref("OffscreenCanvas")}}.

## Khả năng tiếp cận

### Nội dung thay thế

Phần tử `<canvas>` tự nó chỉ là một bitmap và không cung cấp thông tin về bất kỳ đối tượng được vẽ nào. Nội dung canvas không được hiển thị với các công cụ hỗ trợ tiếp cận như HTML ngữ nghĩa. Nhìn chung, bạn nên tránh sử dụng canvas trong trang web hoặc ứng dụng có thể tiếp cận. Các hướng dẫn sau có thể giúp làm cho nó dễ tiếp cận hơn.

- [Canvas accessibility use cases](https://www.w3.org/WAI/PF/HTML/wiki/Canvas_Accessibility_Use_Cases)
- [Canvas element accessibility issues](https://www.w3.org/html/wg/wiki/AddedElementCanvas)
- [Best practices for interactive canvas elements](https://html.spec.whatwg.org/multipage/scripting.html#best-practices)

## Ví dụ

### HTML

Đoạn code này thêm phần tử canvas vào tài liệu HTML của bạn. Văn bản dự phòng được cung cấp nếu trình duyệt không thể đọc hoặc kết xuất canvas.

```html
<canvas width="120" height="120">
  An alternative text describing what your canvas displays.
</canvas>
```

### JavaScript

Sau đó, trong code JavaScript, hãy gọi {{domxref("HTMLCanvasElement.getContext()")}} để lấy ngữ cảnh vẽ và bắt đầu vẽ lên canvas:

```js
const canvas = document.querySelector("canvas");
const ctx = canvas.getContext("2d");
ctx.fillStyle = "green";
// Add a rectangle at (10, 10) with size 100x100 pixels
ctx.fillRect(10, 10, 100, 100);
```

### Kết quả

{{EmbedLiveSample('Examples', 600, 150)}}

## Tóm tắt kỹ thuật

<table class="properties">
  <tbody>
    <tr>
      <th scope="row">
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories"
          >Danh mục nội dung</a
        >
      </th>
      <td>
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#flow_content"
          >Nội dung luồng</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >,
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#embedded_content"
          >nội dung nhúng</a
        >, nội dung hữu hình.
      </td>
    </tr>
    <tr>
      <th scope="row">Nội dung được phép</th>
      <td>
        Trong suốt nhưng không có phần tử con
        <a
          href="/en-US/docs/Web/HTML/Guides/Content_categories#interactive_content"
          >nội dung tương tác</a
        >
        ngoại trừ phần tử {{HTMLElement("a")}},
        phần tử {{HTMLElement("button")}},
        phần tử {{HTMLElement("input")}} có thuộc tính
        <a href="/en-US/docs/Web/HTML/Reference/Elements/input#type"><code>type</code></a>
        là <code>checkbox</code>, <code>radio</code> hoặc <code>button</code>.
      </td>
    </tr>
    <tr>
      <th scope="row">Bỏ qua thẻ</th>
      <td>Không được phép, cả thẻ mở và thẻ đóng đều bắt buộc.</td>
    </tr>
    <tr>
      <th scope="row">Phần tử cha được phép</th>
      <td>
        Bất kỳ phần tử nào chấp nhận
        <a href="/en-US/docs/Web/HTML/Guides/Content_categories#phrasing_content"
          >nội dung cụm từ</a
        >.
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA ngầm định</th>
      <td>
        <a href="https://w3c.github.io/html-aria/#dfn-no-corresponding-role"
          >Không có vai trò tương ứng</a
        >
      </td>
    </tr>
    <tr>
      <th scope="row">Vai trò ARIA được phép</th>
      <td>Bất kỳ</td>
    </tr>
    <tr>
      <th scope="row">Giao diện DOM</th>
      <td>{{domxref("HTMLCanvasElement")}}</td>
    </tr>
  </tbody>
</table>

## Đặc tả

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Canvas API](/en-US/docs/Web/API/Canvas_API)
- [Hướng dẫn Canvas](/en-US/docs/Web/API/Canvas_API/Tutorial)
- [OffscreenCanvas](/en-US/docs/Web/API/OffscreenCanvas)
- [Canvas cheat sheet](https://simon.html5.org/dump/html5-canvas-cheat-sheet.html) (2009)
- [Canvas cheat sheet](https://websitesetup.org/wp-content/uploads/2015/11/Infopgraphic-CanvasCheatSheet-Final2.pdf) (pdf) (2015)
- [Safari HTML canvas guide](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/HTML-canvas-guide/Introduction/Introduction.html) via Apple (2013)
- [`CanvasRenderingContext2D` 2D drawing context for a canvas element](https://developer.apple.com/documentation/webkitjs/canvasrenderingcontext2d) via Apple.com
- API [WebGL](/en-US/docs/Web/API/WebGL_API)
- {{HTMLElement("img")}}
- [SVG](/en-US/docs/Web/SVG)
- [Video và âm thanh HTML](/en-US/docs/Learn_web_development/Core/Structuring_content/HTML_video_and_audio)

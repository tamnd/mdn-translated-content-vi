---
title: Cắt kéo cơ bản
slug: Web/API/WebGL_API/By_example/Basic_scissoring
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Color_masking","Web/API/WebGL_API/By_example/Canvas_size_and_WebGL")}}

Trong ví dụ này, chúng ta thấy cách vẽ hình chữ nhật và hình vuông bằng cách sử dụng các thao tác cắt kéo WebGL. Cắt kéo thiết lập một vùng cắt bên ngoài mà việc vẽ sẽ không xảy ra.

## Xóa bộ đệm vẽ khi áp dụng cắt kéo

{{EmbedLiveSample("Clearing_the_drawing_buffer_when_scissoring_applies",660,425)}}

Đây là minh họa hiển thị bằng {{domxref("WebGLRenderingContext.scissor","scissor()")}}.

Mặc dù lệnh vẽ {{domxref("WebGLRenderingContext.clear","clear()")}} ghi màu rõ ràng (được đặt bởi {{domxref("WebGLRenderingContext.clearColor","clearColor()")}}) cho tất cả các pixel trong vùng đệm vẽ, {{domxref("WebGLRenderingContext.scissor","scissor()")}} xác định một mặt nạ chỉ cho phép các pixel bên trong vùng hình chữ nhật được chỉ định được cập nhật.

Đây là cơ hội tốt để nói về sự khác biệt giữa pixel và _fragments_. Pixel là một thành phần hình ảnh (trong thực tế là một điểm) trên màn hình hoặc một thành phần duy nhất của vùng đệm vẽ, vùng đó trong bộ nhớ chứa dữ liệu pixel của bạn (chẳng hạn như các thành phần màu {{glossary("RGB")}}). _fragment_ đề cập đến pixel trong khi nó đang được xử lý bởi đường dẫn {{glossary("WebGL")}}.

Lý do cho sự khác biệt này là màu sắc của phân đoạn (và các giá trị phân đoạn khác, chẳng hạn như độ sâu) có thể bị thao tác và thay đổi nhiều lần trong quá trình hoạt động đồ họa trước khi cuối cùng được ghi lên màn hình. Chúng ta đã thấy màu sắc của mảnh thay đổi như thế nào trong các thao tác đồ họa, bằng cách áp dụng {{domxref("WebGLRenderingContext.colorMask()","color masking", "", 1)}}. Trong các trường hợp khác, các phân đoạn có thể bị loại bỏ hoàn toàn (do đó giá trị pixel không được cập nhật) hoặc nó có thể tương tác với giá trị pixel đã có (chẳng hạn như khi thực hiện trộn màu cho các phần tử không mờ trong cảnh).

Ở đây chúng ta thấy một ví dụ khác về sự khác biệt giữa các mảnh và pixel. Cắt kéo là một giai đoạn riêng biệt trong quy trình đồ họa {{glossary("WebGL")}}/{{glossary("OpenGL")}} (xảy ra sau khi xóa màu nhưng trước khi che màu). Trước khi các pixel thực tế được cập nhật, các mảnh phải trải qua bài kiểm tra cắt kéo. Nếu các mảnh vượt qua bài kiểm tra cắt kéo, chúng sẽ tiếp tục đi xuống quy trình đồ họa và các pixel tương ứng sẽ được cập nhật trên màn hình. Nếu không vượt qua bài kiểm tra, chúng sẽ bị loại bỏ ngay lập tức, không xử lý thêm và các pixel không được cập nhật. Bởi vì chỉ các mảnh trong khu vực hình chữ nhật được chỉ định mới vượt qua thử nghiệm cắt kéo thành công nên chỉ các pixel bên trong khu vực đó mới được cập nhật và chúng ta nhận được một hình chữ nhật trên màn hình.

Theo mặc định, giai đoạn cắt kéo của đường ống bị tắt. Chúng tôi kích hoạt nó ở đây bằng cách sử dụng phương thức {{domxref("WebGLRenderingContext.enable","enable()")}} (bạn cũng sẽ sử dụng `enable()` để kích hoạt nhiều tính năng khác của WebGL; do đó, việc sử dụng hằng số `SCISSOR_TEST` làm đối số trong trường hợp này). Điều này một lần nữa thể hiện thứ tự điển hình của các lệnh trong {{glossary("WebGL")}}. Đầu tiên chúng tôi điều chỉnh trạng thái WebGL. Trong trường hợp này, kích hoạt thử nghiệm cắt kéo và thiết lập mặt nạ hình chữ nhật. Chỉ khi trạng thái WebGL đã được tinh chỉnh thỏa đáng, chúng tôi mới thực thi lệnh vẽ (trong trường hợp này là `clear()`) để bắt đầu xử lý các đoạn trong quy trình đồ họa.

```html
<p>Result of scissoring.</p>
<canvas>Your browser does not seem to support HTML canvas.</canvas>
```

```css
body {
  text-align: center;
}
canvas {
  display: block;
  width: 280px;
  height: 210px;
  margin: auto;
  padding: 0;
  border: none;
  background-color: black;
}
```

```js
const paragraph = document.querySelector("p");
const canvas = document.querySelector("canvas");

// The following two lines set the size (in CSS pixels) of
// the drawing buffer to be identical to the size of the
// canvas HTML element, as determined by CSS.
canvas.width = canvas.clientWidth;
canvas.height = canvas.clientHeight;

const gl = canvas.getContext("webgl");
gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);

// Enable scissoring operation and define the position and
// size of the scissoring area.
gl.enable(gl.SCISSOR_TEST);
gl.scissor(40, 20, 60, 130);

// Clear the drawing buffer solid yellow.
gl.clearColor(1.0, 1.0, 0.0, 1.0);
gl.clear(gl.COLOR_BUFFER_BIT);
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/basic-scissoring).

{{PreviousNext("Web/API/WebGL_API/By_example/Color_masking","Web/API/WebGL_API/By_example/Canvas_size_and_WebGL")}}

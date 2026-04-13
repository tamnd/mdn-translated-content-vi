---
title: Mặt nạ màu
slug: Web/API/WebGL_API/By_example/Color_masking
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example/Simple_color_animation","Web/API/WebGL_API/By_example/Basic_scissoring")}}

Ví dụ WebGL này sửa đổi các màu ngẫu nhiên bằng cách áp dụng mặt nạ màu để giới hạn phạm vi màu được hiển thị ở các sắc thái cụ thể.

## Che màu ngẫu nhiên

{{EmbedLiveSample("Masking_random_colors",660,425)}}

Ví dụ này sửa đổi hoạt ảnh màu ngẫu nhiên bằng cách áp dụng mặt nạ màu với {{domxref("WebGLRenderingContext.colorMask()","colorMask()")}}. Bạn có thể hình dung thao tác tạo mặt nạ màu giống như đang nhìn vào bức vẽ màu qua kính màu hoặc bộ lọc màu. Vì vậy, bằng cách che đi các kênh màu xanh lam và xanh lục, bạn chỉ cho phép cập nhật thành phần pixel màu đỏ và do đó, điều này giống như thể bạn đang nhìn qua một tấm kính màu đỏ.

Việc che màu cho phép chúng tôi thể hiện một số điều cơ bản về [lý thuyết màu sắc](https://en.wikipedia.org/wiki/Color_theory). Bằng cách che đi một số kênh, trên thực tế, chúng ta đang thiên về màu sắc được hiển thị theo màu bổ sung. Vì vậy, việc che đi rõ ràng cả màu xanh lam và màu đỏ sẽ mang lại cho chúng ta sắc thái xanh lục. Chỉ che đi kênh màu xanh lam sẽ mang lại cho chúng ta các sắc thái màu vàng (bao gồm các sắc thái của cam, nâu, ô liu và xanh lục vàng), phần bổ sung của màu xanh lam. Tương tự, chỉ che màu xanh lá cây sẽ mang lại cho chúng ta các sắc thái màu đỏ tươi (cũng như màu tím, đỏ thẫm, v.v.) và chỉ che màu đỏ sẽ tạo ra các sắc thái lục lam (cũng như xanh nước biển, xanh lam, v.v.).

Lưu ý rằng lệnh gọi `colorMask()` chỉ xảy ra khi người dùng nhấp vào một trong các nút chuyển đổi. Nhưng việc hiển thị được thực hiện mỗi giây bằng cách sử dụng bộ đếm thời gian. Trạng thái mặt nạ màu của {{glossary("WebGL")}} được giữ nguyên, vì vậy chúng ta không cần gọi `colorMask()` mọi khung hình để thiết lập mặt nạ màu. Đây là một khía cạnh quan trọng của máy trạng thái WebGL. Nó cho phép chúng ta thiết lập WebGL trong một giai đoạn khởi tạo duy nhất và sau đó chỉ thực hiện các lệnh vẽ cho từng khung.

Mặt nạ màu cho phép bạn kiểm soát tốt việc cập nhật giá trị pixel trên màn hình. Bằng cách giới hạn các kênh màu được ghi bởi mỗi lệnh vẽ, bạn có thể sử dụng từng kênh, ví dụ: để lưu trữ một hình ảnh thang độ xám khác nhau. Ngoài ra, bạn có thể sử dụng thành phần {{glossary("RGB")}} cho màu sắc nhưng thành phần alpha cho một số dữ liệu pixel tùy chỉnh theo sáng chế của bạn.

Cuối cùng, mặt nạ màu dạy chúng ta rằng {{glossary("WebGL")}} không chỉ là một máy trạng thái mà còn là một _đường dẫn đồ họa_. Điều này có nghĩa là các thao tác đồ họa trong WebGL được thực hiện theo một thứ tự nhất định, trong đó đầu ra của mỗi thao tác đóng vai trò là đầu vào của thao tác tiếp theo. Vì vậy, ví dụ: thao tác xóa sẽ đặt giá trị của từng pixel thành màu rõ ràng đã chọn. Việc tạo mặt nạ xảy ra sau đó trong quy trình và sửa đổi giá trị màu pixel, do đó, kết quả cuối cùng trên màn hình là màu rõ ràng, được nhuốm màu bởi mặt nạ màu.

```html
<p>Tinting the displayed colors with color masking.</p>
<canvas>Your browser does not seem to support HTML canvas.</canvas>
<button id="red-toggle">On</button>
<button id="green-toggle">On</button>
<button id="blue-toggle">On</button>
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
button {
  display: inline-block;
  font-family: serif;
  font-size: inherit;
  font-weight: 900;
  color: white;
  margin: auto;
  padding: 0.6em 1.2em;
}
#red-toggle {
  background-color: red;
}
#green-toggle {
  background-color: green;
}
#blue-toggle {
  background-color: blue;
}
```

```js
const canvas = document.querySelector("canvas");
const gl = canvas.getContext("webgl");
gl.viewport(0, 0, gl.drawingBufferWidth, gl.drawingBufferHeight);

const timer = setInterval(drawAnimation, 1000);

const mask = [true, true, true];
const redToggle = document.querySelector("#red-toggle");
const greenToggle = document.querySelector("#green-toggle");
const blueToggle = document.querySelector("#blue-toggle");
redToggle.addEventListener("click", setColorMask);
greenToggle.addEventListener("click", setColorMask);
blueToggle.addEventListener("click", setColorMask);

function setColorMask(evt) {
  const index =
    (evt.target === greenToggle && 1) || (evt.target === blueToggle && 2) || 0;
  mask[index] = !mask[index];
  evt.target.textContent = mask[index] ? "On" : "Off";
  gl.colorMask(mask[0], mask[1], mask[2], true);
  drawAnimation();
}

function drawAnimation() {
  const color = getRandomColor();
  gl.clearColor(color[0], color[1], color[2], 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);
}

function getRandomColor() {
  return [Math.random(), Math.random(), Math.random()];
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/color-masking).

{{PreviousNext("Web/API/WebGL_API/By_example/Simple_color_animation","Web/API/WebGL_API/By_example/Basic_scissoring")}}

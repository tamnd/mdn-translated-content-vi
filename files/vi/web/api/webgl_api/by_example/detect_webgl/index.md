---
title: Phát hiện WebGL
slug: Web/API/WebGL_API/By_example/Detect_WebGL
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}{{PreviousNext("Web/API/WebGL_API/By_example","Web/API/WebGL_API/By_example/Clearing_with_colors")}}

Ví dụ này trình bày cách phát hiện bối cảnh hiển thị {{glossary("WebGL")}} và báo cáo kết quả cho người dùng.

## WebGL phát hiện tính năng

{{EmbedLiveSample("Feature-detecting_WebGL",660,150)}}

Trong ví dụ đầu tiên này, chúng ta sẽ kiểm tra xem trình duyệt có hỗ trợ {{glossary("WebGL")}} hay không. Vì mục đích đó, chúng tôi sẽ cố gắng lấy {{domxref("WebGLRenderingContext","WebGL rendering context","",1)}} từ phần tử {{domxref("HTMLCanvasElement","canvas")}}. {{domxref("WebGLRenderingContext","WebGL rendering context", "", 1)}} là một giao diện, qua đó bạn có thể đặt và truy vấn trạng thái của máy đồ họa, gửi dữ liệu tới WebGL và thực thi các lệnh vẽ.

Việc lưu trạng thái của máy đồ họa trong một giao diện ngữ cảnh không phải chỉ có ở {{glossary("WebGL")}}. Điều này cũng được thực hiện trong các đồ họa khác {{glossary("API")}}, chẳng hạn như {{domxref("CanvasRenderingContext2D","canvas 2D rendering context", "", 1)}}. Tuy nhiên, các thuộc tính và biến bạn có thể điều chỉnh sẽ khác nhau đối với mỗi {{glossary("API")}}.

```html
<p>[ Here would go the result of WebGL feature detection ]</p>
<button>Press here to detect WebGLRenderingContext</button>
```

```css
body {
  text-align: center;
}
button {
  display: block;
  font-size: inherit;
  margin: auto;
  padding: 0.6em;
}
```

```js
const paragraph = document.querySelector("p");
const button = document.querySelector("button");

// Adding click event handler to button.
button.addEventListener("click", detectWebGLContext);
function detectWebGLContext() {
  // Create canvas element. The canvas is not added to the
  // document itself, so it is never displayed in the
  // browser window.
  const canvas = document.createElement("canvas");

  // Get WebGLRenderingContext from canvas element.
  const gl = canvas.getContext("webgl");

  // Report the result.
  paragraph.textContent =
    gl instanceof WebGLRenderingContext
      ? "Congratulations! Your browser supports WebGL."
      : "Failed. Your browser or device may not support WebGL.";
}
```

Mã nguồn của ví dụ này cũng có trên [GitHub](https://github.com/idofilin/webgl-by-example/tree/master/ detect-webgl).

{{PreviousNext("Web/API/WebGL_API/By_example","Web/API/WebGL_API/By_example/Clearing_with_colors")}}

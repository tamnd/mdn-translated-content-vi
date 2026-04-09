---
title: Tối ưu hóa canvas
slug: Web/API/Canvas_API/Tutorial/Optimizing_canvas
page-type: guide
---

{{DefaultAPISidebar("Canvas API")}} {{PreviousNext("Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas", "Web/API/Canvas_API/Tutorial/Finale")}}

Phần tử {{HTMLElement("canvas")}} là một trong những công cụ được sử dụng rộng rãi nhất để hiển thị đồ họa 2D trên web. Tuy nhiên, khi các trang web và ứng dụng đẩy API Canvas đến giới hạn, hiệu suất sẽ bắt đầu bị ảnh hưởng. Bài viết này cung cấp các đề xuất để tối ưu hóa việc sử dụng phần tử canvas nhằm đảm bảo đồ họa của bạn hoạt động tốt.

## Mẹo về hiệu suất

Sau đây là tập hợp các mẹo để cải thiện hiệu suất canvas.

### Kết xuất trước các đối tượng gốc tương tự hoặc các đối tượng lặp lại trên canvas ngoài màn hình

Nếu bạn thấy mình lặp lại một số thao tác vẽ giống nhau trên mỗi khung hình hoạt ảnh, hãy cân nhắc việc chuyển chúng sang canvas ngoài màn hình. Sau đó, bạn có thể hiển thị hình ảnh ngoài màn hình cho canvas chính của mình thường xuyên nếu cần mà không cần lặp lại các bước cần thiết để tạo hình ảnh đó ngay từ đầu.

```js
myCanvas.offscreenCanvas = document.createElement("canvas");
myCanvas.offscreenCanvas.width = myCanvas.width;
myCanvas.offscreenCanvas.height = myCanvas.height;

myCanvas.getContext("2d").drawImage(myCanvas.offScreenCanvas, 0, 0);
```

### Tránh tọa độ dấu phẩy động và thay vào đó hãy sử dụng số nguyên

Kết xuất pixel phụ xảy ra khi bạn kết xuất các đối tượng trên canvas mà không có toàn bộ giá trị.

```js
ctx.drawImage(myImage, 0.3, 0.5);
```

Điều này buộc trình duyệt phải thực hiện các phép tính bổ sung để tạo hiệu ứng khử răng cưa. Để tránh điều này, hãy đảm bảo làm tròn tất cả tọa độ được sử dụng trong lệnh gọi đến {{domxref("CanvasRenderingContext2D.drawImage", "drawImage()")}} bằng cách sử dụng {{jsxref("Math.floor()")}} chẳng hạn.

### Không chia tỷ lệ hình ảnh trong `drawImage`

Lưu vào bộ nhớ đệm các kích thước hình ảnh khác nhau của bạn trên canvas ngoài màn hình khi tải thay vì liên tục chia tỷ lệ chúng trong {{domxref("CanvasRenderingContext2D.drawImage", "drawImage()")}}.

### Sử dụng nhiều canvas nhiều lớp cho những cảnh phức tạp

Trong ứng dụng của mình, bạn có thể thấy rằng một số đối tượng cần phải di chuyển hoặc thay đổi thường xuyên, trong khi những đối tượng khác vẫn tương đối tĩnh. Một cách tối ưu hóa có thể có trong tình huống này là xếp lớp các mục của bạn bằng cách sử dụng nhiều phần tử `<canvas>`.

Ví dụ: giả sử bạn có một trò chơi có giao diện người dùng ở trên cùng, hành động chơi trò chơi ở giữa và nền tĩnh ở phía dưới. Trong trường hợp này, bạn có thể chia trò chơi của mình thành ba lớp `<canvas>`. Giao diện người dùng sẽ chỉ thay đổi khi người dùng nhập, lớp trò chơi sẽ thay đổi theo mỗi khung hình mới và nền nhìn chung sẽ không thay đổi.

```html
<div id="stage">
  <canvas id="ui-layer" width="480" height="320"></canvas>
  <canvas id="game-layer" width="480" height="320"></canvas>
  <canvas id="background-layer" width="480" height="320"></canvas>
</div>
```

```css
#stage {
  width: 480px;
  height: 320px;
  position: relative;
  border: 2px solid black;
}

canvas {
  position: absolute;
}
#ui-layer {
  z-index: 3;
}
#game-layer {
  z-index: 2;
}
#background-layer {
  z-index: 1;
}
```

### Sử dụng CSS đơn giản cho hình nền lớn

Nếu bạn có hình nền tĩnh, bạn có thể vẽ nó lên phần tử {{HTMLElement("div")}} đơn giản bằng cách sử dụng thuộc tính CSS {{cssxref("background")}} và đặt nó dưới canvas. Điều này sẽ phủ nhận sự cần thiết phải hiển thị nền cho canvas trên mỗi tích tắc.

### Chia tỷ lệ canvas bằng cách sử dụng các biến đổi CSS

[Biến đổi CSS](/en-US/docs/Web/CSS/Guides/Transforms/Using) nhanh hơn vì chúng sử dụng GPU. Trường hợp tốt nhất là không chia tỷ lệ canvas hoặc có canvas nhỏ hơn và tăng tỷ lệ thay vì canvas lớn hơn và thu nhỏ lại.

```js
const scaleX = window.innerWidth / canvas.width;
const scaleY = window.innerHeight / canvas.height;

const scaleToFit = Math.min(scaleX, scaleY);
const scaleToCover = Math.max(scaleX, scaleY);

stage.style.transformOrigin = "0 0"; // Scale from top left
stage.style.transform = `scale(${scaleToFit})`;
```

### Tắt tính minh bạch

Nếu ứng dụng của bạn sử dụng canvas và không cần phông nền trong suốt, hãy đặt tùy chọn `alpha` thành `false` khi tạo ngữ cảnh vẽ bằng {{domxref("HTMLCanvasElement.getContext()")}}. Thông tin này có thể được trình duyệt sử dụng nội bộ để tối ưu hóa kết xuất.

```js
const ctx = canvas.getContext("2d", { alpha: false });
```

### Chia tỷ lệ cho màn hình có độ phân giải cao

Bạn có thể thấy rằng các mục canvas xuất hiện mờ trên màn hình có độ phân giải cao hơn. Mặc dù có thể tồn tại nhiều giải pháp, bước đơn giản đầu tiên là tăng giảm kích thước canvas lên và xuống đồng thời, sử dụng các thuộc tính, kiểu dáng và tỷ lệ ngữ cảnh của canvas.

```js
// Get the DPR and size of the canvas
const dpr = window.devicePixelRatio;
const rect = canvas.getBoundingClientRect();

// Set the "actual" size of the canvas
canvas.width = rect.width * dpr;
canvas.height = rect.height * dpr;

// Scale the context to ensure correct drawing operations
ctx.scale(dpr, dpr);

// Set the "drawn" size of the canvas
canvas.style.width = `${rect.width}px`;
canvas.style.height = `${rect.height}px`;
```

### Các mẹo khác

- Các cuộc gọi canvas hàng loạt cùng nhau. Ví dụ: vẽ một đường đa tuyến thay vì nhiều đường riêng biệt.
- Tránh những thay đổi trạng thái canvas không cần thiết.
- Render màn hình chỉ có sự khác biệt chứ không phải trạng thái mới hoàn toàn.
- Tránh thuộc tính {{domxref("CanvasRenderingContext2D.shadowBlur", "shadowBlur")}} bất cứ khi nào có thể.
- Tránh [hiển thị văn bản](/en-US/docs/Web/API/Canvas_API/Tutorial/Drawing_text) bất cứ khi nào có thể.
- Hãy thử các cách khác nhau để xóa canvas ({{domxref("CanvasRenderingContext2D.clearRect", "clearRect()")}} so với {{domxref("CanvasRenderingContext2D.fillRect", "fillRect()")}} so với thay đổi kích thước canvas).
- Với hình ảnh động, hãy sử dụng {{domxref("Window.requestAnimationFrame()")}} thay vì {{domxref("Window.setInterval", "setInterval()")}}.
- Hãy cẩn thận với các thư viện vật lý nặng.

{{PreviousNext("Web/API/Canvas_API/Tutorial/Pixel_manipulation_with_canvas", "Web/API/Canvas_API/Tutorial/Finale")}}

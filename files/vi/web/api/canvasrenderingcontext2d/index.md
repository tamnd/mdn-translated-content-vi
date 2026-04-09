---
title: CanvasRenderingContext2D
slug: Web/API/CanvasRenderingContext2D
page-type: web-api-interface
browser-compat: api.CanvasRenderingContext2D
---

{{APIRef("Canvas API")}}

Giao diện **`CanvasRenderingContext2D`**, một phần của [Canvas API](/en-US/docs/Web/API/Canvas_API), cung cấp bối cảnh hiển thị 2D cho bề mặt vẽ của phần tử {{HTMLElement("canvas")}}. Nó được sử dụng để vẽ hình dạng, văn bản, hình ảnh và các đối tượng khác.

Các thuộc tính và phương thức của giao diện được mô tả trong phần tham khảo của trang này. [Canvas tutorial](/en-US/docs/Web/API/Canvas_API/Tutorial) cũng có nhiều lời giải thích, ví dụ và tài nguyên hơn.

Đối với [`OffscreenCanvas`](/en-US/docs/Web/API/OffscreenCanvas), có một giao diện tương đương cung cấp ngữ cảnh kết xuất. Bối cảnh hiển thị ngoài màn hình kế thừa hầu hết các thuộc tính và phương thức giống như`CanvasRenderingContext2D` và được mô tả chi tiết hơn trong trang tham chiếu {{domxref("OffscreenCanvasRenderingContext2D")}}.

## Ví dụ cơ bản

Để có phiên bản `CanvasRenderingContext2D`, trước tiên bạn phải có phần tử HTML`<canvas>` để làm việc với:

```html
<canvas id="my-house" width="300" height="300"></canvas>
```

Để lấy ngữ cảnh hiển thị 2D của canvas, hãy gọi {{domxref("HTMLCanvasElement.getContext()", "getContext()")}} trên phần tử `<canvas>`, cung cấp`'2d'` làm đối số:

```js
const canvas = document.getElementById("my-house");
const ctx = canvas.getContext("2d");
```

Với bối cảnh trong tay, bạn có thể vẽ bất cứ thứ gì bạn thích. Mã này vẽ một ngôi nhà:

```js
// Set line width
ctx.lineWidth = 10;

// Wall
ctx.strokeRect(75, 140, 150, 110);

// Door
ctx.fillRect(130, 190, 40, 60);

// Roof
ctx.beginPath();
ctx.moveTo(50, 140);
ctx.lineTo(150, 60);
ctx.lineTo(250, 140);
ctx.closePath();
ctx.stroke();
```

Bản vẽ kết quả trông như thế này:

{{EmbedLiveSample("Basic_example", 700, 330)}}

## Tham khảo

### Bối cảnh

- {{domxref("CanvasRenderingContext2D.getContextAttributes()")}}
- : Trả về một đối tượng chứa các thuộc tính ngữ cảnh được trình duyệt sử dụng. Thuộc tính bối cảnh có thể được yêu cầu khi sử dụng {{domxref("HTMLCanvasElement.getContext()")}} để tạo bối cảnh 2D.
- {{domxref("CanvasRenderingContext2D.isContextLost()")}}
- : Trả về `true` nếu ngữ cảnh hiển thị bị mất.

### Vẽ hình chữ nhật

Có ba phương pháp vẽ ngay hình chữ nhật vào khung vẽ.

- {{domxref("CanvasRenderingContext2D.clearRect()")}}
- : Đặt tất cả pixel trong hình chữ nhật được xác định bởi điểm bắt đầu _(x, y)_ và kích thước _(width, Height)_ thành màu đen trong suốt, xóa mọi nội dung đã vẽ trước đó.
- {{domxref("CanvasRenderingContext2D.fillRect()")}}
- : Vẽ một hình chữ nhật được tô đầy tại vị trí _(x, y)_ có kích thước được xác định bởi _width_ và _height_.
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
- : Vẽ một hình chữ nhật có điểm bắt đầu tại _(x, y)_ và có chiều rộng _w_ và chiều cao _h_ trên khung vẽ, sử dụng kiểu nét vẽ hiện tại.

### Vẽ văn bản

Các phương pháp sau đây vẽ văn bản. Xem thêm đối tượng {{domxref("TextMetrics")}} để biết các thuộc tính văn bản.

- {{domxref("CanvasRenderingContext2D.fillText()")}}
- : Vẽ (điền) một văn bản nhất định tại vị trí (x, y) đã cho.
- {{domxref("CanvasRenderingContext2D.strokeText()")}}
- : Vẽ (nét) một văn bản nhất định tại vị trí (x, y) đã cho.
- {{domxref("CanvasRenderingContext2D.measureText()")}}
- : Trả về một đối tượng {{domxref("TextMetrics")}}.

### Kiểu đường

Các phương pháp và thuộc tính sau đây kiểm soát cách vẽ đường.

- {{domxref("CanvasRenderingContext2D.lineWidth")}}
- : Chiều rộng của dòng. Mặc định `1.0`.
- {{domxref("CanvasRenderingContext2D.lineCap")}}
- : Kiểu kết thúc ở cuối dòng. Các giá trị có thể có:`butt`(mặc định),`round`,`square`.
- {{domxref("CanvasRenderingContext2D.lineJoin")}}
- : Xác định loại góc nơi hai đường thẳng gặp nhau. Các giá trị có thể có:`round`,`bevel`,`miter`(mặc định).
- {{domxref("CanvasRenderingContext2D.miterLimit")}}
- : Tỷ lệ giới hạn miter. Mặc định `10`.
- {{domxref("CanvasRenderingContext2D.getLineDash()")}}
- : Trả về mảng mẫu gạch ngang dòng hiện tại chứa số chẵn các số không âm.
- {{domxref("CanvasRenderingContext2D.setLineDash()")}}
- : Đặt mẫu gạch ngang hiện tại.
- {{domxref("CanvasRenderingContext2D.lineDashOffset")}}
- : Chỉ định vị trí bắt đầu một mảng gạch ngang trên một dòng.

### Kiểu văn bản

Các thuộc tính sau đây kiểm soát cách trình bày văn bản.

- {{domxref("CanvasRenderingContext2D.font")}}
- : Cài đặt phông chữ. Giá trị mặc định `"10px sans-serif"`.
- {{domxref("CanvasRenderingContext2D.textAlign")}}
- : Cài đặt căn chỉnh văn bản. Các giá trị có thể có:`start`(mặc định),`end`,`left`,`right`,`center`.
- {{domxref("CanvasRenderingContext2D.textBaseline")}}
- : Cài đặt căn chỉnh đường cơ sở. Các giá trị có thể có:`top`,`hanging`,`middle`,`alphabetic`(mặc định),`ideographic`,`bottom`.
- {{domxref("CanvasRenderingContext2D.direction")}}
- : Tính định hướng. Các giá trị có thể có:`ltr`,`rtl`,`inherit`(mặc định).
- {{domxref("CanvasRenderingContext2D.letterSpacing")}}
- : Khoảng cách chữ. Mặc định:`0px`.
- {{domxref("CanvasRenderingContext2D.fontKerning")}}
- : Kerning phông chữ. Các giá trị có thể có:`auto`(mặc định),`normal`,`none`.
- {{domxref("CanvasRenderingContext2D.fontStretch")}}
- : Kéo dài phông chữ. Các giá trị có thể có:`ultra-condensed`,`extra-condensed`,`condensed`,`semi-condensed`,`normal`(mặc định),`semi-expanded`,`expanded`,`extra-expanded`,`ultra-expanded`.
- {{domxref("CanvasRenderingContext2D.fontVariantCaps")}}
- : Mũ biến thể phông chữ. Các giá trị có thể có:`normal`(mặc định),`small-caps`,`all-small-caps`,`petite-caps`,`all-petite-caps`,`unicase`,`titling-caps`.
- {{domxref("CanvasRenderingContext2D.textRendering")}}
- : Kết xuất văn bản. Các giá trị có thể có:`auto`(mặc định),`optimizeSpeed`,`optimizeLegibility`,`geometricPrecision`.
- {{domxref("CanvasRenderingContext2D.wordSpacing")}}
- : Khoảng cách từ. Giá trị mặc định:`0px`
- {{domxref("CanvasRenderingContext2D.lang")}}{{experimental_inline}}
- : Lấy hoặc đặt ngôn ngữ của bối cảnh vẽ canvas.

### Kiểu tô và nét

Kiểu tô được sử dụng cho màu sắc và kiểu dáng bên trong hình dạng và kiểu dáng nét vẽ được sử dụng cho các đường xung quanh hình.

- {{domxref("CanvasRenderingContext2D.fillStyle")}}
- : Màu sắc hoặc kiểu dáng để sử dụng hình dạng bên trong. Mặc định là `black`.
- {{domxref("CanvasRenderingContext2D.strokeStyle")}}
- : Màu sắc hoặc kiểu dáng để sử dụng cho các đường xung quanh hình dạng. Mặc định là `black`.

### Độ dốc và mẫu

- {{domxref("CanvasRenderingContext2D.createConicGradient()")}}
- : Tạo một gradient hình nón xung quanh một điểm được cho bởi tọa độ được biểu thị bằng các tham số.
- {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}
- : Tạo một gradient tuyến tính dọc theo đường được cho bởi tọa độ được biểu thị bằng các tham số.
- {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}
- : Tạo một gradient hướng tâm được cho bởi tọa độ của hai vòng tròn được biểu thị bằng các tham số.
- {{domxref("CanvasRenderingContext2D.createPattern()")}}
- : Tạo một mẫu bằng cách sử dụng hình ảnh được chỉ định. Nó lặp lại nguồn theo các hướng được chỉ định bởi đối số lặp lại. Phương thức này trả về {{domxref("CanvasPattern")}}.

### Bóng tối

- {{domxref("CanvasRenderingContext2D.shadowBlur")}}
- : Chỉ định hiệu ứng làm mờ. Mặc định:`0`.
- {{domxref("CanvasRenderingContext2D.shadowColor")}}
- : Màu sắc của bóng tối. Mặc định: màu đen hoàn toàn trong suốt.
- {{domxref("CanvasRenderingContext2D.shadowOffsetX")}}
- : Khoảng cách ngang bóng sẽ được bù đắp. Mặc định:`0`.
- {{domxref("CanvasRenderingContext2D.shadowOffsetY")}}
- : Khoảng cách theo chiều dọc bóng sẽ được bù đắp. Mặc định:`0`.

### Đường dẫn

Các phương pháp sau đây có thể được sử dụng để thao tác đường dẫn của các đối tượng.

- {{domxref("CanvasRenderingContext2D.beginPath()")}}
- : Bắt đầu một đường dẫn mới bằng cách làm trống danh sách các đường dẫn phụ. Gọi phương thức này khi bạn muốn tạo một đường dẫn mới.
- {{domxref("CanvasRenderingContext2D.closePath()")}}
- : Làm cho điểm của bút di chuyển trở lại điểm bắt đầu của đường dẫn phụ hiện tại. Nó cố gắng vẽ một đường thẳng từ điểm hiện tại đến điểm bắt đầu. Nếu hình đã được đóng hoặc chỉ có một điểm thì hàm này không có tác dụng gì.
- {{domxref("CanvasRenderingContext2D.moveTo()")}}
- : Di chuyển điểm bắt đầu của đường dẫn phụ mới tới tọa độ (x, y).
- {{domxref("CanvasRenderingContext2D.lineTo()")}}
- : Kết nối điểm cuối cùng trong đường dẫn phụ hiện tại với tọa độ (x, y) đã chỉ định bằng một đường thẳng.
- {{domxref("CanvasRenderingContext2D.bezierCurveTo()")}}
- : Thêm đường cong Bézier hình khối vào đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.quadraticCurveTo()")}}
- : Thêm đường cong Bézier bậc hai vào đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.arc()")}}
- : Thêm một vòng cung tròn vào đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.arcTo()")}}
- : Thêm một cung vào đường dẫn hiện tại với các điểm điều khiển và bán kính đã cho, được nối với điểm trước đó bằng một đường thẳng.
- {{domxref("CanvasRenderingContext2D.ellipse()")}}
- : Thêm một vòng cung hình elip vào đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.rect()")}}
- : Tạo đường dẫn cho hình chữ nhật tại vị trí (x, y) với kích thước được xác định bởi _width_ và _height_.
- {{domxref("CanvasRenderingContext2D.roundRect()")}}
- : Tạo đường dẫn cho hình chữ nhật tròn với vị trí, chiều rộng, chiều cao và bán kính góc được chỉ định.

### Vẽ đường dẫn

- {{domxref("CanvasRenderingContext2D.fill()")}}
- : Điền vào các đường dẫn phụ hiện tại với kiểu điền hiện tại.
- {{domxref("CanvasRenderingContext2D.stroke()")}}
- : Tạo nét cho các đường dẫn phụ hiện tại với kiểu nét hiện tại.
- {{domxref("CanvasRenderingContext2D.drawFocusIfNeeded()")}}
- : Nếu một phần tử nhất định được tập trung, phương pháp này sẽ vẽ một vòng tiêu điểm xung quanh đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.clip()")}}
- : Tạo một đường cắt từ các đường dẫn phụ hiện tại. Mọi thứ được vẽ sau `clip()` được gọi chỉ xuất hiện bên trong đường cắt. Để biết ví dụ, hãy xem [Clipping paths](/en-US/docs/Web/API/Canvas_API/Tutorial/Compositing) trong hướng dẫn Canvas.
- {{domxref("CanvasRenderingContext2D.isPointInPath()")}}
- : Báo cáo xem điểm đã chỉ định có nằm trong đường dẫn hiện tại hay không.
- {{domxref("CanvasRenderingContext2D.isPointInStroke()")}}
- : Báo cáo xem điểm đã chỉ định có nằm trong khu vực được chứa bởi nét của đường dẫn hay không.

### chuyển đổi

Các đối tượng trong ngữ cảnh hiển thị `CanvasRenderingContext2D` có ma trận chuyển đổi hiện tại và các phương thức để thao tác với nó. Ma trận chuyển đổi được áp dụng khi tạo đường dẫn mặc định hiện tại, vẽ văn bản, hình dạng và các đối tượng {{domxref("Path2D")}}. Các phương thức được liệt kê bên dưới vẫn được giữ nguyên vì lý do lịch sử và khả năng tương thích vì các đối tượng {{domxref("DOMMatrix")}} hiện được sử dụng trong hầu hết các phần của API và thay vào đó sẽ được sử dụng trong tương lai.

- {{domxref("CanvasRenderingContext2D.getTransform()")}}
- : Truy xuất ma trận chuyển đổi hiện tại đang được áp dụng cho ngữ cảnh.
- {{domxref("CanvasRenderingContext2D.rotate()")}}
- : Thêm phép quay vào ma trận chuyển đổi. Đối số góc đại diện cho góc quay theo chiều kim đồng hồ và được biểu thị bằng radian.
- {{domxref("CanvasRenderingContext2D.scale()")}}
- : Thêm phép chuyển đổi tỷ lệ cho các đơn vị canvas theo x theo chiều ngang và theo y theo chiều dọc.
- {{domxref("CanvasRenderingContext2D.translate()")}}
- : Thêm một phép biến đổi dịch bằng cách di chuyển canvas và điểm gốc của nó x theo chiều ngang và y theo chiều dọc trên lưới.
- {{domxref("CanvasRenderingContext2D.transform()")}}
- : Nhân ma trận biến đổi hiện tại với ma trận được mô tả bởi các đối số của nó.
- {{domxref("CanvasRenderingContext2D.setTransform()")}}
- : Đặt lại phép biến đổi hiện tại thành ma trận nhận dạng, sau đó gọi phương thức `transform()` với cùng các đối số.
- {{domxref("CanvasRenderingContext2D.resetTransform()")}}
- : Đặt lại phép biến đổi hiện tại bằng ma trận nhận dạng.

### Soạn

- {{domxref("CanvasRenderingContext2D.globalAlpha")}}
- : Giá trị Alpha được áp dụng cho các hình dạng và hình ảnh trước khi chúng được tổng hợp vào khung vẽ. Mặc định `1.0`(mờ).
- {{domxref("CanvasRenderingContext2D.globalCompositeOperation")}}
- : Với `globalAlpha` được áp dụng, điều này sẽ đặt ra cách vẽ hình dạng và hình ảnh trên bitmap hiện có.

### Vẽ hình ảnh

- {{domxref("CanvasRenderingContext2D.drawImage()")}}
- : Vẽ hình ảnh được chỉ định. Phương pháp này có sẵn ở nhiều định dạng, mang lại sự linh hoạt cao trong việc sử dụng.

### Thao tác pixel

Xem thêm đối tượng {{domxref("ImageData")}}.

- {{domxref("CanvasRenderingContext2D.createImageData()")}}
- : Tạo một đối tượng {{domxref("ImageData")}} mới, trống với các kích thước được chỉ định. Tất cả các pixel trong đối tượng mới đều có màu đen trong suốt.
- {{domxref("CanvasRenderingContext2D.getImageData()")}}
- : Trả về một đối tượng {{domxref("ImageData")}} biểu thị dữ liệu pixel cơ bản cho vùng canvas được biểu thị bằng hình chữ nhật bắt đầu tại _(sx, sy)_ và có chiều rộng _sw_ và _sh_.
- {{domxref("CanvasRenderingContext2D.putImageData()")}}
- : Vẽ dữ liệu từ đối tượng {{domxref("ImageData")}} đã cho lên bitmap. Nếu một hình chữ nhật bẩn được cung cấp thì chỉ các pixel từ hình chữ nhật đó được sơn.

### Làm mịn hình ảnh

- {{domxref("CanvasRenderingContext2D.imageSmoothingEnabled")}}
- : Chế độ làm mịn ảnh; nếu bị tắt, hình ảnh sẽ không được làm mịn nếu thu nhỏ.
- {{domxref("CanvasRenderingContext2D.imageSmoothingQuality")}}
- : Cho phép bạn đặt chất lượng làm mịn hình ảnh.

### Trạng thái canvas

Bối cảnh kết xuất `CanvasRenderingContext2D` chứa nhiều trạng thái kiểu vẽ khác nhau (thuộc tính cho kiểu đường, kiểu tô, kiểu bóng, kiểu văn bản). Các phương pháp sau đây giúp bạn làm việc với trạng thái đó:

- {{domxref("CanvasRenderingContext2D.save()")}}
- : Lưu trạng thái kiểu vẽ hiện tại bằng cách sử dụng một ngăn xếp để bạn có thể hoàn nguyên bất kỳ thay đổi nào bạn thực hiện đối với nó bằng cách sử dụng `restore()`.
- {{domxref("CanvasRenderingContext2D.restore()")}}
- : Khôi phục trạng thái kiểu vẽ về phần tử cuối cùng trên 'ngăn xếp trạng thái' được lưu bởi `save()`.
- {{domxref("CanvasRenderingContext2D.canvas")}}
- : Tham chiếu ngược chỉ đọc tới {{domxref("HTMLCanvasElement")}}. Có thể là [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) nếu nó không được liên kết với phần tử {{HTMLElement("canvas")}}.
- {{domxref("CanvasRenderingContext2D.getContextAttributes()")}}
- : Trả về một đối tượng chứa các thuộc tính ngữ cảnh được trình duyệt sử dụng. Thuộc tính bối cảnh có thể được yêu cầu khi sử dụng {{domxref("HTMLCanvasElement.getContext()")}} để tạo bối cảnh 2D.
- {{domxref("CanvasRenderingContext2D.reset()")}}
- : Đặt lại bối cảnh kết xuất, bao gồm bộ đệm sao lưu, ngăn xếp trạng thái vẽ, đường dẫn và kiểu.
- {{domxref("CanvasRenderingContext2D.isContextLost()")}}{{Experimental_Inline}}
- : Trả về `true` nếu ngữ cảnh hiển thị bị mất.

### Bộ lọc

- {{domxref("CanvasRenderingContext2D.filter")}}
- : Áp dụng bộ lọc CSS hoặc SVG cho khung vẽ, ví dụ: để thay đổi độ sáng hoặc độ mờ của nó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("HTMLCanvasElement")}}
- {{HTMLElement("canvas")}}
- {{domxref("OffscreenCanvas")}}

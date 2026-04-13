---
title: PaintRenderingContext2D
slug: Web/API/PaintRenderingContext2D
page-type: web-api-interface
browser-compat: api.PaintRenderingContext2D
---

{{APIRef("CSS Painting API")}}

Giao diện **`PaintRenderingContext2D`** của [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API) là ngữ cảnh kết xuất của API để vẽ lên bitmap. Nó triển khai một tập con của {{domxref("CanvasRenderingContext2D")}} API, với các ngoại lệ sau:

- Nó không triển khai các phương thức giao diện thao tác pixel [`CanvasImageData`](/en-US/docs/Web/API/CanvasRenderingContext2D#pixel_manipulation), tiêu điểm [`CanvasUserInterface`](/en-US/docs/Web/API/CanvasRenderingContext2D/drawFocusIfNeeded), vẽ văn bản [`CanvasText`](/en-US/docs/Web/API/CanvasRenderingContext2D) hoặc kiểu văn bản [`CanvasTextDrawingStyles`](/en-US/docs/Web/API/CanvasRenderingContext2D#text_styles).
- Bitmap đầu ra có kích thước của đối tượng mà nó đang kết xuất.
- Giá trị `currentColor`, khi được sử dụng làm màu, được coi là màu đen không trong suốt.

Giao diện chỉ có sẵn trong {{domxref("PaintWorkletGlobalScope")}}.

## Thuộc tính và phương thức phiên bản

_`PaintRenderingContext2D` triển khai một tập con của {{domxref("CanvasRenderingContext2D")}} API, với tất cả các thuộc tính và phương thức có cùng cách sử dụng như trong `CanvasRenderingContext2D`_

### Ngữ cảnh

- {{domxref("CanvasRenderingContext2D.isContextLost()")}}
  - : Trả về `true` nếu ngữ cảnh kết xuất bị mất.

### Trạng thái

- {{domxref("CanvasRenderingContext2D.save()")}}
  - : Lưu trạng thái kiểu vẽ hiện tại bằng cách sử dụng stack để bạn có thể hoàn nguyên bất kỳ thay đổi nào bằng cách sử dụng `restore()`.
- {{domxref("CanvasRenderingContext2D.restore()")}}
  - : Khôi phục trạng thái kiểu vẽ về phần tử cuối cùng trên 'state stack' được lưu bởi `save()`.
- {{domxref("CanvasRenderingContext2D.reset()")}}
  - : Đặt lại trạng thái kiểu vẽ hiện tại về giá trị mặc định.

### Biến đổi

- {{domxref("CanvasRenderingContext2D.getTransform()")}}
  - : Lấy ma trận biến đổi hiện tại đang được áp dụng cho ngữ cảnh dưới dạng {{domxref("DOMMatrix")}}.
- {{domxref("CanvasRenderingContext2D.rotate()")}}
  - : Thêm phép quay vào ma trận biến đổi. Đối số góc đại diện cho góc quay theo chiều kim đồng hồ và được biểu thị bằng radian.
- {{domxref("CanvasRenderingContext2D.scale()")}}
  - : Thêm phép biến đổi co giãn vào các đơn vị canvas theo x theo chiều ngang và theo y theo chiều dọc.
- {{domxref("CanvasRenderingContext2D.translate()")}}
  - : Thêm phép biến đổi dịch chuyển bằng cách di chuyển canvas và gốc tọa độ của nó x theo chiều ngang và y theo chiều dọc trên lưới.
- {{domxref("CanvasRenderingContext2D.transform()")}}
  - : Nhân ma trận biến đổi hiện tại với ma trận được mô tả bởi các đối số của nó.
- {{domxref("CanvasRenderingContext2D.setTransform()")}}
  - : Đặt lại phép biến đổi hiện tại về ma trận đơn vị, sau đó gọi phương thức `transform()` với các đối số tương tự.
- {{domxref("CanvasRenderingContext2D.resetTransform()")}}
  - : Đặt lại phép biến đổi hiện tại về ma trận đơn vị.

### Compositing

- {{domxref("CanvasRenderingContext2D.globalAlpha")}}
  - : Giá trị alpha được áp dụng cho các hình và hình ảnh trước khi chúng được tổng hợp lên canvas.
- {{domxref("CanvasRenderingContext2D.globalCompositeOperation")}}
  - : Với `globalAlpha` được áp dụng, điều này đặt cách các hình và hình ảnh được vẽ lên bitmap hiện có.

### Làm mịn hình ảnh

- {{domxref("CanvasRenderingContext2D.imageSmoothingEnabled")}}
  - : Chế độ làm mịn hình ảnh; nếu bị vô hiệu hóa, hình ảnh sẽ không được làm mịn nếu được co giãn.
- {{domxref("CanvasRenderingContext2D.imageSmoothingQuality")}}
  - : Cho phép bạn đặt chất lượng làm mịn hình ảnh.

### Kiểu tô màu và nét

- {{domxref("CanvasRenderingContext2D.fillStyle")}}
  - : Màu hoặc kiểu sử dụng bên trong các hình.
- {{domxref("CanvasRenderingContext2D.strokeStyle")}}
  - : Màu hoặc kiểu sử dụng cho các đường xung quanh các hình.

### Gradient và pattern

- {{domxref("CanvasRenderingContext2D.createConicGradient()")}}
  - : Tạo gradient hình côn xung quanh điểm được cho bởi tọa độ được đại diện bởi các tham số.
- {{domxref("CanvasRenderingContext2D.createLinearGradient()")}}
  - : Tạo gradient tuyến tính dọc theo đường được cho bởi tọa độ được đại diện bởi các tham số.
- {{domxref("CanvasRenderingContext2D.createRadialGradient()")}}
  - : Tạo gradient hướng tâm được cho bởi tọa độ của hai vòng tròn được đại diện bởi các tham số.
- {{domxref("CanvasRenderingContext2D.createPattern()")}}
  - : Tạo pattern {{domxref("CanvasPattern")}} của hình ảnh được chỉ định lặp lại theo các hướng được chỉ định bởi đối số repetition.

### Bóng đổ

- {{domxref("CanvasRenderingContext2D.shadowBlur")}}
  - : Xác định lượng mờ dưới dạng số.
- {{domxref("CanvasRenderingContext2D.shadowColor")}}
  - : Xác định màu của bóng đổ dưới dạng CSS {{cssxref("&lt;color&gt;")}}.
- {{domxref("CanvasRenderingContext2D.shadowOffsetX")}}
  - : Xác định khoảng cách ngang mà bóng đổ sẽ bị offset dưới dạng số.
- {{domxref("CanvasRenderingContext2D.shadowOffsetY")}}
  - : Xác định khoảng cách dọc mà bóng đổ sẽ bị offset dưới dạng số.

### Vẽ hình chữ nhật

- {{domxref("CanvasRenderingContext2D.clearRect()")}}
  - : Xóa các pixel trong hình chữ nhật đã cho, đặt chúng thành màu đen trong suốt.
- {{domxref("CanvasRenderingContext2D.fillRect()")}}
  - : Tô màu các pixel của hình chữ nhật đã cho, điền nó với kiểu tô màu hiện tại.
- {{domxref("CanvasRenderingContext2D.strokeRect()")}}
  - : Tô màu viền của hình chữ nhật đã cho bằng kiểu nét vẽ hiện tại.

### Vẽ đường dẫn

- {{domxref("CanvasRenderingContext2D.beginPath()")}}
  - : Bắt đầu đường dẫn mới, làm trống danh sách các đường dẫn con.
- {{domxref("CanvasRenderingContext2D.fill()")}}
  - : Tô màu các đường dẫn con của đường dẫn hiện tại với kiểu tô màu hiện tại.
- {{domxref("CanvasRenderingContext2D.stroke()")}}
  - : Vẽ các đường dẫn con của đường dẫn hiện tại với kiểu nét vẽ hiện tại.
- {{domxref("CanvasRenderingContext2D.clip()")}}
  - : Biến đường dẫn hiện tại hoặc đã cho thành vùng cắt hiện tại.
- {{domxref("CanvasRenderingContext2D.isPointInPath()")}}
  - : Trả về boolean cho biết điểm đã chỉ định có nằm trong đường dẫn hiện tại hay không.
- {{domxref("CanvasRenderingContext2D.isPointInStroke()")}}
  - : Trả về boolean cho biết điểm có nằm trong vùng được bao quanh bởi nét vẽ của đường dẫn không.

### Vẽ hình ảnh

- {{domxref("CanvasRenderingContext2D.drawImage()")}}
  - : Vẽ hình ảnh đã cho hoặc phần được chỉ định của nó, tùy chọn với kích thước và vị trí được chỉ định.

### Kiểu đường

- {{domxref("CanvasRenderingContext2D.lineWidth")}}
  - : Số xác định độ rộng đường, tính bằng đơn vị không gian tọa độ.
- {{domxref("CanvasRenderingContext2D.lineCap")}}
  - : Loại kết thúc ở cuối các đường. Các giá trị có thể: `butt` (mặc định), `round`, `square`.
- {{domxref("CanvasRenderingContext2D.lineJoin")}}
  - : Xác định loại góc nơi hai đường gặp nhau. Các giá trị có thể: `round`, `bevel`, `miter` (mặc định).
- {{domxref("CanvasRenderingContext2D.miterLimit")}}
  - : Số xác định tỷ lệ giới hạn miter, tính bằng đơn vị không gian tọa độ.
- {{domxref("CanvasRenderingContext2D.getLineDash()")}}
  - : Trả về pattern gạch ngang dòng hiện tại dưới dạng mảng.
- {{domxref("CanvasRenderingContext2D.setLineDash()")}}
  - : Đặt danh sách khoảng cách đường và gạch ngang làm pattern gạch ngang dòng hiện tại.
- {{domxref("CanvasRenderingContext2D.lineDashOffset")}}
  - : Xác định nơi bắt đầu mảng gạch ngang trên một đường.

### Bộ lọc

- {{domxref("CanvasRenderingContext2D.filter")}} {{Non-standard_Inline}}
  - : Áp dụng bộ lọc CSS hoặc SVG vào canvas.

## Ví dụ

Xem ví dụ đầy đủ tại [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API).

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- [Sử dụng CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API/Guide)
- [CSS Painting API](/en-US/docs/Web/API/CSS_Painting_API)
- [Houdini APIs](/en-US/docs/Web/API/Houdini_APIs)

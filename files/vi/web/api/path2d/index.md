---
title: Path2D
slug: Web/API/Path2D
page-type: web-api-interface
browser-compat: api.Path2D
---

{{APIRef("Canvas API")}}{{AvailableInWorkers}}

**`Path2D`** là giao diện của Canvas 2D API dùng để khai báo một đường dẫn, sau đó có thể được sử dụng trên đối tượng {{domxref("CanvasRenderingContext2D")}}. Các [phương thức đường dẫn](/en-US/docs/Web/API/CanvasRenderingContext2D#paths) của giao diện `CanvasRenderingContext2D` cũng có sẵn trên giao diện này, giúp bạn thuận tiện giữ lại và phát lại đường dẫn bất cứ khi nào cần.

## Bộ khởi tạo

- {{domxref("Path2D.Path2D", "Path2D()")}}
  - : Bộ khởi tạo của `Path2D`. Tạo một đối tượng `Path2D` mới.

## Phương thức thể hiện

- {{domxref("Path2D.addPath()")}}
  - : Thêm một đường dẫn vào đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.closePath", "Path2D.closePath()")}}
  - : Làm cho điểm bút quay lại điểm bắt đầu của đường dẫn con hiện tại. Phương thức này cố gắng vẽ một đường thẳng từ điểm hiện tại đến điểm bắt đầu. Nếu hình đã được đóng hoặc chỉ có một điểm, hàm này không làm gì cả.
- {{domxref("CanvasRenderingContext2D.moveTo()", "Path2D.moveTo()")}}
  - : Di chuyển điểm bắt đầu của một đường dẫn con mới đến tọa độ (`x, y`).
- {{domxref("CanvasRenderingContext2D.lineTo()", "Path2D.lineTo()")}}
  - : Nối điểm cuối cùng trong đường dẫn con với tọa độ (`x, y`) bằng một đường thẳng.
- {{domxref("CanvasRenderingContext2D.bezierCurveTo()", "Path2D.bezierCurveTo()")}}
  - : Thêm một đường cong Bézier bậc ba vào đường dẫn. Nó cần ba điểm. Hai điểm đầu là điểm điều khiển và điểm thứ ba là điểm kết thúc. Điểm bắt đầu là điểm cuối cùng trong đường dẫn hiện tại, và có thể thay đổi bằng `moveTo()` trước khi tạo đường cong Bézier.
- {{domxref("CanvasRenderingContext2D.quadraticCurveTo()", "Path2D.quadraticCurveTo()")}}
  - : Thêm một đường cong Bézier bậc hai vào đường dẫn hiện tại.
- {{domxref("CanvasRenderingContext2D.arc()", "Path2D.arc()")}}
  - : Thêm một cung tròn vào đường dẫn, được đặt tâm tại vị trí (`x, y`) với bán kính `r`, bắt đầu tại `startAngle` và kết thúc tại `endAngle`, đi theo chiều được xác định bởi `counterclockwise` (mặc định là theo chiều kim đồng hồ).
- {{domxref("CanvasRenderingContext2D.arcTo()", "Path2D.arcTo()")}}
  - : Thêm một cung tròn vào đường dẫn với các điểm điều khiển và bán kính được cho, nối với điểm trước đó bằng một đoạn thẳng.
- {{domxref("CanvasRenderingContext2D.ellipse()", "Path2D.ellipse()")}}
  - : Thêm một cung ellipse vào đường dẫn, được đặt tâm tại vị trí (`x, y`) với các bán kính `radiusX` và `radiusY`, bắt đầu tại `startAngle` và kết thúc tại `endAngle`, đi theo chiều được xác định bởi `counterclockwise` (mặc định là theo chiều kim đồng hồ).
- {{domxref("CanvasRenderingContext2D.rect()", "Path2D.rect()")}}
  - : Tạo một đường dẫn hình chữ nhật tại vị trí (`x, y`) với kích thước được xác định bởi `width` và `height`.
- {{domxref("CanvasRenderingContext2D.roundRect()", "Path2D.roundRect()")}}
  - : Tạo một đường dẫn hình chữ nhật bo góc tại vị trí (`x, y`) với kích thước được xác định bởi `width` và `height`, trong đó bán kính của cung tròn dùng cho các góc chữ nhật được xác định bởi `radii`.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("CanvasRenderingContext2D")}}

---
title: DOMMatrixReadOnly
slug: Web/API/DOMMatrixReadOnly
page-type: web-api-interface
browser-compat: api.DOMMatrixReadOnly
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Giao diện **`DOMMatrixReadOnly`** biểu diễn ma trận 4x4 chỉ đọc, phù hợp cho các phép toán 2D và 3D. Giao diện {{domxref("DOMMatrix")}} dựa trên `DOMMatrixReadOnly` bổ sung khả năng [thay đổi](https://en.wikipedia.org/wiki/Immutable_object), cho phép bạn chỉnh sửa ma trận sau khi tạo.

Giao diện này nên có thể sử dụng bên trong [web workers](/en-US/docs/Web/API/Web_Workers_API), mặc dù một số trình duyệt chưa hỗ trợ điều đó.

## Hàm khởi tạo

- {{domxref("DOMMatrixReadOnly.DOMMatrixReadOnly", "DOMMatrixReadOnly()")}}
  - : Tạo một đối tượng `DOMMatrixReadOnly` mới.

## Thuộc tính phiên bản

_Giao diện này không kế thừa bất kỳ thuộc tính nào._

- {{domxref("DOMMatrixReadOnly.is2D")}} {{ReadOnlyInline}}
  - : Cờ Boolean có giá trị `true` nếu ma trận được khởi tạo là ma trận 2D. Nếu là `false`, ma trận là 3D.
- {{domxref("DOMMatrixReadOnly.isIdentity")}} {{ReadOnlyInline}}
  - : Giá trị Boolean có giá trị `true` nếu ma trận là [ma trận đơn vị](https://en.wikipedia.org/wiki/Identity_matrix).
- `m11`, `m12`, `m13`, `m14`, `m21`, `m22`, `m23`, `m24`, `m31`, `m32`, `m33`, `m34`, `m41`, `m42`, `m43`, `m44`
  - : Các giá trị số thực dấu phẩy động độ chính xác kép đại diện cho từng thành phần của ma trận 4x4, trong đó `m11` đến `m14` là cột đầu tiên, `m21` đến `m24` là cột thứ hai, và tiếp tục như vậy.
- `a`, `b`, `c`, `d`, `e`, `f`
  - : Các giá trị số thực dấu phẩy động độ chính xác kép đại diện cho các thành phần của ma trận 4x4 cần thiết để thực hiện các phép xoay và dịch chuyển 2D. Đây là các bí danh cho các thành phần cụ thể của ma trận 4x4, như bảng dưới đây.

    | 2D  | Tương đương 3D |
    | --- | -------------- |
    | `a` | `m11`          |
    | `b` | `m12`          |
    | `c` | `m21`          |
    | `d` | `m22`          |
    | `e` | `m41`          |
    | `f` | `m42`          |

## Phương thức phiên bản

_Giao diện này không kế thừa bất kỳ phương thức nào. Không có phương thức nào dưới đây thay đổi ma trận gốc._

- {{domxref("DOMMatrixReadOnly.flipX()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách lật ma trận nguồn quanh trục X. Điều này tương đương với việc nhân ma trận với `DOMMatrix(-1, 0, 0, 1, 0, 0)`. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.flipY()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách lật ma trận nguồn quanh trục Y. Điều này tương đương với việc nhân ma trận với `DOMMatrix(1, 0, 0, -1, 0, 0)`. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.inverse()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách nghịch đảo ma trận nguồn. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.multiply()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách tính tích vô hướng của ma trận nguồn và ma trận được chỉ định. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.rotateAxisAngle()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách xoay ma trận nguồn theo góc cho trước quanh vectơ được chỉ định. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.rotate()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách xoay ma trận nguồn quanh từng trục theo số độ được chỉ định. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.rotateFromVector()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách xoay ma trận nguồn theo góc giữa vectơ được chỉ định và `(1, 0)`. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.scale()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách thu phóng ma trận nguồn theo lượng được chỉ định cho từng trục, lấy tâm tại gốc tọa độ được cho. Mặc định, trục X và Z được thu phóng với tỷ lệ `1` và trục Y không có giá trị thu phóng mặc định. Gốc tọa độ mặc định là `(0, 0, 0)`. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.scale3d()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách thu phóng ma trận 3D nguồn theo hệ số cho trước dọc theo tất cả các trục, lấy tâm tại điểm gốc tọa độ được chỉ định. Gốc tọa độ mặc định là `(0, 0, 0)`. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.scaleNonUniform()")}} {{deprecated_inline}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách áp dụng thu phóng được chỉ định trên các trục X, Y, và Z, lấy tâm tại gốc tọa độ được cho. Mặc định, hệ số thu phóng của trục Y và Z đều là `1`, nhưng hệ số thu phóng cho X phải được chỉ định. Gốc tọa độ mặc định là `(0, 0, 0)`. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.skewX()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách áp dụng phép biến đổi xiên được chỉ định lên ma trận nguồn dọc theo trục X. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.skewY()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới được tạo bằng cách áp dụng phép biến đổi xiên được chỉ định lên ma trận nguồn dọc theo trục Y. Ma trận gốc không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.toFloat32Array()")}}
  - : Trả về một {{jsxref("Float32Array")}} mới gồm các số thực dấu phẩy động độ chính xác đơn, chứa tất cả 16 phần tử tạo nên ma trận.
- {{domxref("DOMMatrixReadOnly.toFloat64Array()")}}
  - : Trả về một {{jsxref("Float64Array")}} mới gồm các số thực dấu phẩy động độ chính xác kép, chứa tất cả 16 phần tử tạo nên ma trận.
- {{domxref("DOMMatrixReadOnly.toJSON()")}}
  - : Trả về biểu diễn JSON của đối tượng `DOMMatrixReadOnly`.
- {{domxref("DOMMatrixReadOnly.toString()")}}
  - : Tạo và trả về biểu diễn chuỗi của ma trận theo cú pháp ma trận CSS, sử dụng ký hiệu ma trận CSS phù hợp.
- {{domxref("DOMMatrixReadOnly.transformPoint()")}}
  - : Biến đổi điểm được chỉ định bằng ma trận, trả về một đối tượng {{domxref("DOMPoint")}} mới chứa điểm đã biến đổi. Cả ma trận lẫn điểm gốc đều không bị thay đổi.
- {{domxref("DOMMatrixReadOnly.translate()")}}
  - : Trả về một {{domxref("DOMMatrix")}} mới chứa ma trận được tính bằng cách dịch chuyển ma trận nguồn theo vectơ được chỉ định. Mặc định, vectơ là `(0, 0, 0)`. Ma trận gốc không bị thay đổi.

## Phương thức tĩnh

- {{domxref("DOMMatrixReadOnly.fromFloat32Array_static", "fromFloat32Array()")}}
  - : Tạo một đối tượng `DOMMatrixReadOnly` mới từ một {{jsxref("Float32Array")}} gồm 6 hoặc 16 giá trị số thực dấu phẩy động độ chính xác đơn (32-bit).
- {{domxref("DOMMatrixReadOnly.fromFloat64Array_static", "fromFloat64Array()")}}
  - : Tạo một đối tượng `DOMMatrixReadOnly` mới từ một {{jsxref("Float64Array")}} gồm 6 hoặc 16 giá trị số thực dấu phẩy động độ chính xác kép (64-bit).
- {{domxref("DOMMatrixReadOnly.fromMatrix_static", "fromMatrix()")}}
  - : Tạo một đối tượng `DOMMatrixReadOnly` mới từ một ma trận hiện có hoặc một đối tượng cung cấp các giá trị cho các thuộc tính của nó.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- Kiểu ma trận có thể thay đổi, {{domxref("DOMMatrix")}}, dựa trên giao diện này.
- Ký hiệu hàm CSS {{cssxref("transform-function/matrix", "matrix()")}} và {{cssxref("transform-function/matrix3d", "matrix3d()")}} có thể được tạo ra từ giao diện này để sử dụng trong thuộc tính CSS {{cssxref("transform")}}.

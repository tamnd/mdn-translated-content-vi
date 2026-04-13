---
title: DOMMatrix
slug: Web/API/DOMMatrix
page-type: web-api-interface
browser-compat: api.DOMMatrix
---

{{APIRef("Geometry Interfaces")}}{{AvailableInWorkers}}

Giao diện **`DOMMatrix`** biểu diễn ma trận 4x4, phù hợp cho các phép toán 2D và 3D bao gồm xoay và dịch chuyển. Đây là phiên bản có thể thay đổi của giao diện {{domxref("DOMMatrixReadOnly")}}.
Giao diện này có thể sử dụng bên trong [web workers](/en-US/docs/Web/API/Web_Workers_API).

**`WebKitCSSMatrix`** và **`SVGMatrix`** là các bí danh của **`DOMMatrix`**.

{{InheritanceDiagram}}

## Hàm khởi tạo

- {{domxref("DOMMatrix.DOMMatrix","DOMMatrix()")}}
  - : Tạo và trả về một đối tượng `DOMMatrix` mới.

## Thuộc tính phiên bản

_Giao diện này kế thừa các thuộc tính từ {{domxref("DOMMatrixReadOnly")}}, tuy nhiên một số thuộc tính được thay đổi để có thể thay đổi được._

- `m11`, `m12`, `m13`, `m14`, `m21`, `m22`, `m23`, `m24`, `m31`, `m32`, `m33`, `m34`, `m41`, `m42`, `m43`, `m44`
  - : Các giá trị số thực dấu phẩy động độ chính xác kép đại diện cho từng thành phần của ma trận 4x4, trong đó `m11` đến `m14` là cột đầu tiên, `m21` đến `m24` là cột thứ hai, và tiếp tục như vậy.
- `a`, `b`, `c`, `d`, `e`, `f`
  - : Các giá trị số thực dấu phẩy động độ chính xác kép đại diện cho các thành phần của ma trận 4x4 cần thiết để thực hiện các phép xoay và dịch chuyển 2D. Đây là các bí danh cho các thành phần cụ thể của ma trận 4x4, như bảng dưới đây.

    | `2D` | `Tương đương 3D` |
    | ---- | ---------------- |
    | `a`  | `m11`            |
    | `b`  | `m12`            |
    | `c`  | `m21`            |
    | `d`  | `m22`            |
    | `e`  | `m41`            |
    | `f`  | `m42`            |

## Phương thức phiên bản

_Giao diện này bao gồm các phương thức sau, cùng với các phương thức kế thừa từ {{domxref("DOMMatrixReadOnly")}}._

- {{domxref("DOMMatrix.invertSelf()")}}
  - : Sửa đổi ma trận bằng cách nghịch đảo nó. Nếu ma trận không thể nghịch đảo, tất cả các thành phần của nó được đặt thành `NaN` và [`is2D`](/en-US/docs/Web/API/DOMMatrixReadOnly/is2D) trả về `false`.
- {{domxref("DOMMatrix.multiplySelf()")}}
  - : Sửa đổi ma trận bằng cách nhân nó với `DOMMatrix` được chỉ định theo kiểu hậu nhân. Điều này tương đương với tích vô hướng `A⋅B`, trong đó ma trận `A` là ma trận nguồn và `B` là ma trận được truyền vào phương thức. Trả về chính nó.
- {{domxref("DOMMatrix.preMultiplySelf()")}}
  - : Sửa đổi ma trận bằng cách nhân nó với `DOMMatrix` được chỉ định theo kiểu tiền nhân. Trả về chính nó.
- {{domxref("DOMMatrix.translateSelf()")}}
  - : Sửa đổi ma trận bằng cách áp dụng vectơ dịch chuyển được chỉ định. Vectơ mặc định là `[0, 0, 0]`. Trả về chính nó.
- {{domxref("DOMMatrix.scaleSelf()")}}
  - : Sửa đổi ma trận bằng cách áp dụng các hệ số tỷ lệ được chỉ định, với tâm tại gốc tọa độ được chỉ định. Cũng trả về chính nó. Mặc định, hệ số tỷ lệ là `1` cho cả ba trục và gốc tọa độ là `(0, 0, 0)`. Trả về chính nó.
- {{domxref("DOMMatrix.scale3dSelf()")}}
  - : Sửa đổi ma trận bằng cách áp dụng hệ số tỷ lệ được chỉ định cho cả ba trục, lấy tâm tại gốc tọa độ được cho. Trả về chính nó.
- {{domxref("DOMMatrix.rotateSelf()")}}
  - : Sửa đổi ma trận bằng cách xoay nó quanh từng trục theo số độ được chỉ định. Trả về chính nó.
- {{domxref("DOMMatrix.rotateAxisAngleSelf()")}}
  - : Sửa đổi ma trận bằng cách xoay nó theo góc được chỉ định quanh vectơ trục cho trước. Trả về chính nó.
- {{domxref("DOMMatrix.rotateFromVectorSelf()")}}
  - : Sửa đổi ma trận bằng cách xoay nó theo góc giữa vectơ được chỉ định và `(1, 0)`. Trả về chính nó.
- {{domxref("DOMMatrix.setMatrixValue()")}}
  - : Thay thế nội dung của ma trận bằng ma trận được mô tả bởi phép biến đổi hoặc các phép biến đổi được chỉ định. Trả về chính nó.
- {{domxref("DOMMatrix.skewXSelf()")}}
  - : Sửa đổi ma trận bằng cách áp dụng phép biến đổi xiên được chỉ định dọc theo trục X. Trả về chính nó.
- {{domxref("DOMMatrix.skewYSelf()")}}
  - : Sửa đổi ma trận bằng cách áp dụng phép biến đổi xiên được chỉ định dọc theo trục Y. Trả về chính nó.

## Phương thức tĩnh

- {{domxref("DOMMatrix.fromFloat32Array_static", "fromFloat32Array()")}}
  - : Tạo một đối tượng `DOMMatrix` mới từ một {{jsxref("Float32Array")}} gồm 6 hoặc 16 giá trị số thực dấu phẩy động độ chính xác đơn (32-bit).
- {{domxref("DOMMatrix.fromFloat64Array_static", "fromFloat64Array()")}}
  - : Tạo một đối tượng `DOMMatrix` mới từ một {{jsxref("Float64Array")}} gồm 6 hoặc 16 giá trị số thực dấu phẩy động độ chính xác kép (64-bit).
- {{domxref("DOMMatrix.fromMatrix_static", "fromMatrix()")}}
  - : Tạo một đối tượng `DOMMatrix` mới từ một ma trận hiện có hoặc một đối tượng cung cấp các giá trị cho các thuộc tính của nó.

## Ghi chú sử dụng

Ma trận được xác định bởi giao diện `DOMMatrix` bao gồm bốn hàng, mỗi hàng có bốn cột. Mặc dù việc giải thích toán học liên quan nằm ngoài phạm vi của bài viết này, kích thước 4x4 này đủ để mô tả bất kỳ phép biến đổi nào có thể áp dụng cho hình học 2D hoặc 3D.

Dưới đây là vị trí của 16 phần tử (m_11 đến m_44) tạo nên ma trận trừu tượng 4x4:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>[</mo><mtable rowspacing="0.5ex"><mtr><mtd><msub><mi>m</mi><mn>11</mn></msub></mtd><mtd><msub><mi>m</mi><mn>21</mn></msub></mtd><mtd><msub><mi>m</mi><mn>31</mn></msub></mtd><mtd><msub><mi>m</mi><mn>41</mn></msub></mtd></mtr><mtr><mtd><msub><mi>m</mi><mn>12</mn></msub></mtd><mtd><msub><mi>m</mi><mn>22</mn></msub></mtd><mtd><msub><mi>m</mi><mn>32</mn></msub></mtd><mtd><msub><mi>m</mi><mn>42</mn></msub></mtd></mtr><mtr><mtd><msub><mi>m</mi><mn>13</mn></msub></mtd><mtd><msub><mi>m</mi><mn>23</mn></msub></mtd><mtd><msub><mi>m</mi><mn>33</mn></msub></mtd><mtd><msub><mi>m</mi><mn>43</mn></msub></mtd></mtr><mtr><mtd><msub><mi>m</mi><mn>14</mn></msub></mtd><mtd><msub><mi>m</mi><mn>24</mn></msub></mtd><mtd><msub><mi>m</mi><mn>34</mn></msub></mtd><mtd><msub><mi>m</mi><mn>44</mn></msub></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\left [ \begin{matrix} m_{11} & m_{21} & m_{31} & m_{41} \\ m_{12} & m_{22} & m_{32} & m_{42} \\ m_{13} & m_{23} & m_{33} & m_{43} \\ m_{14} & m_{24} & m_{34} & m_{44} \end{matrix} \right ]</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Giao diện `DOMMatrix` được thiết kế với mục đích sử dụng cho tất cả các ma trận trong đánh dấu.

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("DOMMatrixReadOnly.is2D")}}
- {{domxref("DOMMatrixReadOnly.isIdentity")}}

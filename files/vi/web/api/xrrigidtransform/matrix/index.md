---
title: "XRRigidTransform: matrix property"
short-title: matrix
slug: Web/API/XRRigidTransform/matrix
page-type: web-api-instance-property
browser-compat: api.XRRigidTransform.matrix
---

{{APIRef("WebXR Device API")}}{{SecureContext_Header}}

Thuộc tính chỉ đọc **`matrix`** của giao diện {{domxref("XRRigidTransform")}} trả về ma trận biến đổi được đại diện bởi đối tượng. Ma trận được trả về sau đó có thể được nhân trước với một vector cột để xoay vector theo phép quay 3D được chỉ định bởi {{domxref("XRRigidTransform.orientation", "orientation")}}, sau đó dịch chuyển nó theo {{domxref("XRRigidTransform.position", "position")}}.

## Giá trị

Một {{jsxref("Float32Array")}} chứa 16 phần tử, đại diện cho ma trận biến đổi 4x4 được mô tả bởi các thuộc tính {{domxref("XRRigidTransform.position", "position")}} và {{domxref("XRRigidTransform.orientation", "orientation")}}.

## Ghi chú sử dụng

### Định dạng ma trận

Tất cả ma trận biến đổi 4x4 được sử dụng trong WebGL được lưu trữ trong {{jsxref("Float32Array")}} gồm 16 phần tử. Các giá trị được lưu trữ trong mảng theo thứ tự cột-chính; tức là mỗi cột được ghi vào mảng từ trên xuống trước khi chuyển sang cột tiếp theo ở bên phải và ghi vào mảng. Do đó, đối với mảng `[a0, a1, a2, …, a13, a14, a15]`, ma trận trông như sau:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>[</mo><mtable rowspacing="0.5ex"><mtr><mtd><mi>a0</mi></mtd><mtd><mi>a4</mi></mtd><mtd><mi>a8</mi></mtd><mtd><mi>a12</mi></mtd></mtr><mtr><mtd><mi>a1</mi></mtd><mtd><mi>a5</mi></mtd><mtd><mi>a9</mi></mtd><mtd><mi>a13</mi></mtd></mtr><mtr><mtd><mi>a2</mi></mtd><mtd><mi>a6</mi></mtd><mtd><mi>a10</mi></mtd><mtd><mi>a14</mi></mtd></mtr><mtr><mtd><mi>a3</mi></mtd><mtd><mi>a7</mi></mtd><mtd><mi>a11</mi></mtd><mtd><mi>a15</mi></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\begin{bmatrix} a[0] & a[4] & a[8] & a[12]\\ a[1] & a[5] & a[9] & a[13]\\ a[2] & a[6] & a[10] & a[14]\\ a[3] & a[7] & a[11] & a[15]\\ \end{bmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Ở lần yêu cầu đầu tiên, `matrix` được tính toán. Sau đó, nó nên được lưu vào bộ nhớ đệm vì lý do hiệu suất.

### Tạo ma trận

Trong phần này, dành cho người đọc nâng cao hơn, chúng tôi trình bày cách API tính toán ma trận cho phép biến đổi được chỉ định. Nó bắt đầu bằng cách phân bổ một ma trận mới và ghi ma trận đơn vị 4x4 vào đó:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>[</mo><mtable rowspacing="0.5ex"><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\begin{bmatrix} 1 & 0 & 0 & 0\\ 0 & 1 & 0 & 0\\ 0 & 0 & 1 & 0\\ 0 & 0 & 0 & 1 \end{bmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Đây là một phép biến đổi sẽ không thay đổi hướng hoặc vị trí của bất kỳ điểm, vector hoặc đối tượng nào được áp dụng.

Tiếp theo, `position` được đặt vào cột bên phải, tạo ra một ma trận dịch chuyển sẽ biến đổi hệ tọa độ theo khoảng cách được chỉ định trong mỗi chiều, không có thay đổi quay. Ở đây _p<sub>x</sub>_, _p<sub>y</sub>_, và _p<sub>z</sub>_ là các giá trị của các thành viên `x`, `y`, và `z` của {{domxref("DOMPointReadOnly")}} `position`.

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>[</mo><mtable rowspacing="0.5ex"><mtr><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><msub><mi>p</mi><mi>x</mi></msub></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><mn>0</mn></mtd><mtd><msub><mi>p</mi><mi>y</mi></msub></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd><mtd><msub><mi>p</mi><mi>z</mi></msub></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\begin{bmatrix} 1 & 0 & 0 & x\\ 0 & 1 & 0 & y\\ 0 & 0 & 1 & z\\ 0 & 0 & 0 & 1 \end{bmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

Sau đó một ma trận quay được tạo bằng cách tính toán một ma trận quay vector cột từ quaternion đơn vị được chỉ định bởi `orientation`:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>[</mo><mtable rowspacing="0.5ex"><mtr><mtd><mn>1</mn><mo>-</mo><mn>2</mn><mo stretchy="false">(</mo><msubsup><mi>q</mi><mi>y</mi><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>q</mi><mi>z</mi><mn>2</mn></msubsup><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>y</mi></msub><mo>-</mo><msub><mi>q</mi><mi>z</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>+</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>y</mi></msub><mo>+</mo><msub><mi>q</mi><mi>z</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>-</mo><mn>2</mn><mo stretchy="false">(</mo><msubsup><mi>q</mi><mi>x</mi><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>q</mi><mi>z</mi><mn>2</mn></msubsup><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>-</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>-</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>+</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>-</mo><mn>2</mn><mo stretchy="false">(</mo><msubsup><mi>q</mi><mi>x</mi><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>q</mi><mi>y</mi><mn>2</mn></msubsup><mo stretchy="false">)</mo></mtd><mtd><mn>0</mn></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\begin{bmatrix} 1 - 2(q_y^2 + q_z^2) & 2(q_xq_y - q_zq_w) & 2(q_xq_z + q_yq_w) & p_x\\ 2(q_xq_y + q_zq_w) & 1 - 2(q_x^2 + q_z^2) & 2(q_yq_z - q_xq_w) & p_y\\ 2(q_xq_z - q_yq_w) & 2(q_yq_z + q_xq_w) & 1 - 2(q_x^2 + q_y^2) & p_z\\ 0 & 0 & 0 & 1 \end{bmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

`matrix` biến đổi cuối cùng được tính bằng cách nhân ma trận dịch chuyển với ma trận quay, theo thứ tự `(translation * rotation)`. Điều này tạo ra ma trận biến đổi cuối cùng được trả về bởi `matrix`:

<!-- prettier-ignore-start -->
<math display="block">
  <semantics><mrow><mo>[</mo><mtable rowspacing="0.5ex"><mtr><mtd><mn>1</mn><mo>-</mo><mn>2</mn><mo stretchy="false">(</mo><msubsup><mi>q</mi><mi>y</mi><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>q</mi><mi>z</mi><mn>2</mn></msubsup><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>y</mi></msub><mo>-</mo><msub><mi>q</mi><mi>z</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>+</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><msub><mi>p</mi><mi>x</mi></msub></mtd></mtr><mtr><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>y</mi></msub><mo>+</mo><msub><mi>q</mi><mi>z</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>-</mo><mn>2</mn><mo stretchy="false">(</mo><msubsup><mi>q</mi><mi>x</mi><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>q</mi><mi>z</mi><mn>2</mn></msubsup><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>-</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><msub><mi>p</mi><mi>y</mi></msub></mtd></mtr><mtr><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>-</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>2</mn><mo stretchy="false">(</mo><msub><mi>q</mi><mi>y</mi></msub><msub><mi>q</mi><mi>z</mi></msub><mo>+</mo><msub><mi>q</mi><mi>x</mi></msub><msub><mi>q</mi><mi>w</mi></msub><mo stretchy="false">)</mo></mtd><mtd><mn>1</mn><mo>-</mo><mn>2</mn><mo stretchy="false">(</mo><msubsup><mi>q</mi><mi>x</mi><mn>2</mn></msubsup><mo>+</mo><msubsup><mi>q</mi><mi>y</mi><mn>2</mn></msubsup><mo stretchy="false">)</mo></mtd><mtd><msub><mi>p</mi><mi>z</mi></msub></mtd></mtr><mtr><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>0</mn></mtd><mtd><mn>1</mn></mtd></mtr></mtable><mo>]</mo></mrow><annotation encoding="TeX">\begin{bmatrix} 1 - 2(q_y^2 + q_z^2) & 2(q_xq_y - q_zq_w) & 2(q_xq_z + q_yq_w) & p_x\\ 2(q_xq_y + q_zq_w) & 1 - 2(q_x^2 + q_z^2) & 2(q_yq_z - q_xq_w) & p_y\\ 2(q_xq_z - q_yq_w) & 2(q_yq_z + q_xq_w) & 1 - 2(q_x^2 + q_y^2) & p_z\\ 0 & 0 & 0 & 1 \end{bmatrix}</annotation></semantics>
</math>
<!-- prettier-ignore-end -->

## Ví dụ

Trong ví dụ này, một phép biến đổi được tạo để tạo ra một ma trận có thể được sử dụng làm phép biến đổi trong quá trình kết xuất các đối tượng WebGL, nhằm đặt các đối tượng khớp với một độ lệch và hướng nhất định. Sau đó `matrix` được truyền vào một hàm thư viện sử dụng WebGL để kết xuất một đối tượng khớp với một tên nhất định bằng cách sử dụng ma trận biến đổi được chỉ định để định vị và định hướng nó.

```js
let transform = new XRRigidTransform(
  { x: 0, y: 0.5, z: 0.5 },
  { x: 0, y: -0.5, z: -0.5, w: 1 },
);
drawGLObject("magic-lamp", transform.matrix);
```

## Thông số kỹ thuật

{{Specifications}}

## Tương thích trình duyệt

{{Compat}}

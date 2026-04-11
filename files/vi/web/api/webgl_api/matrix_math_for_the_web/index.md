---
title: Toán ma trận cho web
slug: Web/API/WebGL_API/Matrix_math_for_the_web
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

Ma trận có thể được sử dụng để biểu diễn các phép biến đổi của các đối tượng trong không gian và được sử dụng để thực hiện nhiều loại tính toán chính khi xây dựng hình ảnh và trực quan hóa dữ liệu trên Web. Bài viết này khám phá cách tạo ma trận và cách sử dụng chúng với [các biến đổi CSS](/en-US/docs/Web/CSS/Guides/Transforms/Using) và loại biến đổi `matrix3d`.

Mặc dù bài viết này sử dụng [CSS](/en-US/docs/Web/CSS) để đơn giản hóa phần giải thích, nhưng ma trận là khái niệm cốt lõi được nhiều công nghệ khác nhau sử dụng, bao gồm [WebGL](/en-US/docs/Web/API/WebGL_API), API [WebXR](/en-US/docs/Web/API/WebXR_Device_API) (VR và AR) và [GLSL shader](/en-US/docs/Games/Techniques/3D_on_the_web/GLSL_Shaders).

## Ma trận chuyển đổi

There are many types of matrices, but the ones we are interested in are the 3D transformation matrices. Các ma trận này bao gồm một tập hợp gồm 16 giá trị được sắp xếp theo lưới 4 × 4. Trong [JavaScript](/en-US/docs/Web/JavaScript), thật dễ dàng để biểu diễn ma trận dưới dạng một mảng.

Hãy bắt đầu bằng cách xem xét **ma trận danh tính**. Đây là một ma trận biến đổi đặc biệt có chức năng giống như số 1 trong phép nhân vô hướng; giống như n \* 1 = n, nhân bất kỳ ma trận nào với ma trận đơn vị sẽ cho ra ma trận kết quả có giá trị khớp với ma trận gốc.

Ma trận nhận dạng trông như thế này trong JavaScript:

```js
// prettier-ignore
const identityMatrix = [
  1, 0, 0, 0,
  0, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 0, 1,
];
```

Nhân với ma trận danh tính trông như thế nào? Ví dụ đơn giản nhất là nhân một điểm với ma trận đồng nhất. Vì điểm 3D chỉ cần ba giá trị (`x`, `y` và `z`) và ma trận chuyển đổi là ma trận giá trị 4×4 nên chúng ta cần thêm chiều thứ tư vào điểm. Theo quy ước, thứ nguyên này được gọi là **phối cảnh** và được biểu thị bằng chữ cái `w`. Đối với một vị trí điển hình, việc đặt `w` thành 1 sẽ làm cho phép toán được tính ra.

Sau khi thêm thành phần `w` vào điểm, hãy chú ý cách sắp xếp ma trận và điểm một cách gọn gàng:

```js-nolint
[1, 0, 0, 0,
 0, 1, 0, 0,
 0, 0, 1, 0,
 0, 0, 0, 1];

[4, 3, 2, 1]; // Point at [x, y, z, w]
```

Thành phần `w` có một số cách sử dụng bổ sung nằm ngoài phạm vi của bài viết này. Hãy xem bài viết [phép chiếu chế độ xem mô hình WebGL](/en-US/docs/Web/API/WebGL_API/WebGL_model_view_projection) để biết tính năng này hữu ích như thế nào.

### Nhân một ma trận và một điểm

Trong mã ví dụ của chúng tôi, chúng tôi đã xác định một hàm để nhân một ma trận và một điểm — `multiplyMatrixAndPoint()`:

```js live-sample___translation_matrix_ex live-sample___scale_matrix_ex live-sample___rotation_matrix_ex live-sample___matrix_composition_ex
// point • matrix
function multiplyMatrixAndPoint(matrix, point) {
  // Give a simple variable name to each part of the matrix, a column and row number
  const c0r0 = matrix[0],
    c1r0 = matrix[1],
    c2r0 = matrix[2],
    c3r0 = matrix[3];
  const c0r1 = matrix[4],
    c1r1 = matrix[5],
    c2r1 = matrix[6],
    c3r1 = matrix[7];
  const c0r2 = matrix[8],
    c1r2 = matrix[9],
    c2r2 = matrix[10],
    c3r2 = matrix[11];
  const c0r3 = matrix[12],
    c1r3 = matrix[13],
    c2r3 = matrix[14],
    c3r3 = matrix[15];

  // Now set some simple names for the point
  const x = point[0];
  const y = point[1];
  const z = point[2];
  const w = point[3];

  // Multiply the point against each part of the 1st column, then add together
  const resultX = x * c0r0 + y * c0r1 + z * c0r2 + w * c0r3;

  // Multiply the point against each part of the 2nd column, then add together
  const resultY = x * c1r0 + y * c1r1 + z * c1r2 + w * c1r3;

  // Multiply the point against each part of the 3rd column, then add together
  const resultZ = x * c2r0 + y * c2r1 + z * c2r2 + w * c2r3;

  // Multiply the point against each part of the 4th column, then add together
  const resultW = x * c3r0 + y * c3r1 + z * c3r2 + w * c3r3;

  return [resultX, resultY, resultZ, resultW];
}
```

> [!NOTE]
> Các ví dụ của chúng tôi trên trang này sử dụng vectơ hàng để biểu thị điểm và phép nhân phải để áp dụng ma trận biến đổi. Nghĩa là, ở trên thực hiện `điểm * ma trận` trong đó `điểm` là một vectơ hàng 4x1. Nếu muốn sử dụng vectơ cột và phép nhân trái, bạn cần điều chỉnh hàm nhân cho phù hợp và hoán vị từng ma trận được giới thiệu bên dưới.
>
> Ví dụ: [`translationMatrix`](#translation_matrix) được giới thiệu bên dưới ban đầu có dạng như sau:
>
> ```js-nolint
> [1, 0, 0, 0,
> 0, 1, 0, 0,
> 0, 0, 1, 0,
> x, y, z, 1]
> ```
>
> Sau khi chuyển vị, nó sẽ trông như sau:
>
> ```js-nolint
> [1, 0, 0, x,
> 0, 1, 0, y,
> 0, 0, 1, z,
> 0, 0, 0, 1]
> ```

Bây giờ bằng cách sử dụng hàm trên, chúng ta có thể nhân một điểm với ma trận. Sử dụng ma trận đơn vị, nó sẽ trả về một điểm giống với điểm gốc, vì một điểm (hoặc bất kỳ ma trận nào khác) nhân với ma trận đơn vị luôn bằng chính nó:

```js
// sets identityResult to [4,3,2,1]
const identityResult = multiplyMatrixAndPoint(identityMatrix, [4, 3, 2, 1]);
```

Trả về cùng một điểm không hữu ích lắm, nhưng có những loại ma trận khác có thể thực hiện các phép toán hữu ích trên điểm. Các phần tiếp theo sẽ chứng minh một số ma trận này.

### Nhân hai ma trận

Ngoài việc nhân một ma trận và một điểm với nhau, bạn còn có thể nhân hai ma trận với nhau. Chức năng ở trên có thể được sử dụng lại để trợ giúp trong quá trình này:

```js live-sample___translation_matrix_ex live-sample___scale_matrix_ex live-sample___rotation_matrix_ex live-sample___matrix_composition_ex
// matrixB • matrixA
function multiplyMatrices(matrixA, matrixB) {
  // Slice the second matrix up into rows
  const row0 = [matrixB[0], matrixB[1], matrixB[2], matrixB[3]];
  const row1 = [matrixB[4], matrixB[5], matrixB[6], matrixB[7]];
  const row2 = [matrixB[8], matrixB[9], matrixB[10], matrixB[11]];
  const row3 = [matrixB[12], matrixB[13], matrixB[14], matrixB[15]];

  // Multiply each row by matrixA
  const result0 = multiplyMatrixAndPoint(matrixA, row0);
  const result1 = multiplyMatrixAndPoint(matrixA, row1);
  const result2 = multiplyMatrixAndPoint(matrixA, row2);
  const result3 = multiplyMatrixAndPoint(matrixA, row3);

  // Turn the result rows back into a single matrix
  // prettier-ignore
  return [
    result0[0], result0[1], result0[2], result0[3],
    result1[0], result1[1], result1[2], result1[3],
    result2[0], result2[1], result2[2], result2[3],
    result3[0], result3[1], result3[2], result3[3],
  ];
}

function multiplyArrayOfMatrices(matrices) {
  if (matrices.length === 1) {
    return matrices[0];
  }
  return matrices.reduce((result, matrix) => multiplyMatrices(result, matrix));
}
```

Chúng ta hãy xem chức năng này hoạt động:

```js
// prettier-ignore
const someMatrix = [
  4, 0, 0, 0,
  0, 3, 0, 0,
  0, 0, 5, 0,
  4, 8, 4, 1,
];

// prettier-ignore
const identityMatrix = [
  1, 0, 0, 0,
  0, 1, 0, 0,
  0, 0, 1, 0,
  0, 0, 0, 1,
];

// Returns a new array equivalent to someMatrix
const someMatrixResult = multiplyMatrices(identityMatrix, someMatrix);
```

> [!WARNING]
> Các hàm ma trận này được viết để giải thích rõ ràng chứ không phải để quản lý tốc độ hoặc bộ nhớ. Các hàm này tạo ra rất nhiều mảng mới, có thể đặc biệt tốn kém cho các hoạt động thời gian thực do việc thu gom rác. Trong mã sản xuất thực, tốt nhất nên sử dụng các hàm được tối ưu hóa. [glMatrix](https://glmatrix.net/) là một ví dụ về thư viện tập trung vào tốc độ và hiệu suất. Trọng tâm của thư viện glMatrix là có các mảng mục tiêu được phân bổ trước vòng lặp cập nhật.

## Ma trận dịch

**ma trận dịch** dựa trên ma trận nhận dạng và được sử dụng trong đồ họa 3D để di chuyển một điểm hoặc đối tượng theo một hoặc nhiều hướng trong ba hướng (`x`, `y` và/hoặc `z`). Cách dễ nhất để nghĩ về một bản dịch cũng giống như việc cầm một tách cà phê lên. Cốc cà phê phải được giữ thẳng đứng và định hướng giống nhau để cà phê không bị đổ ra ngoài. Nó có thể di chuyển lên không trung khỏi bàn và di chuyển xung quanh không khí trong không gian.

Thực tế, bạn không thể uống cà phê chỉ bằng ma trận dịch, vì để uống nó, bạn phải nghiêng hoặc xoay cốc để rót cà phê vào miệng. Chúng ta sẽ xem xét loại ma trận (được gọi một cách khéo léo là **[ma trận xoay](#rotation_matrix)**) mà bạn sử dụng để thực hiện việc này sau.

```js live-sample___translation_matrix_ex live-sample___matrix_composition_ex
function translate(x, y, z) {
  // prettier-ignore
  return [
    1, 0, 0, 0,
    0, 1, 0, 0,
    0, 0, 1, 0,
    x, y, z, 1,
  ];
}
```

Đặt các khoảng cách dọc theo ba trục vào các vị trí tương ứng trong ma trận dịch chuyển, sau đó nhân nó với điểm hoặc ma trận bạn cần di chuyển trong không gian 3D.

## Thao tác với DOM bằng ma trận

Một cách thực sự dễ dàng để bắt đầu sử dụng ma trận là sử dụng CSS {{cssxref("transform-function/matrix3d","matrix3d()")}} {{cssxref("transform")}}. Trước tiên, chúng ta sẽ thiết lập một {{htmlelement("div")}} đơn giản với một số nội dung. Kiểu này không được hiển thị nhưng được đặt ở chiều rộng và chiều cao cố định và được căn giữa trên trang. `<div>` có một bộ chuyển tiếp cho phép biến đổi để ma trận được tạo hoạt ảnh nhằm giúp bạn dễ dàng xem những gì đang được thực hiện.xem những gì đang được thực hiện.

```html live-sample___translation_matrix_ex live-sample___scale_matrix_ex live-sample___rotation_matrix_ex live-sample___matrix_composition_ex
<div class="transformable ghost">
  <h2>Move me with a matrix</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  </p>
</div>

<div id="move-me" class="transformable">
  <h2>Move me with a matrix</h2>
  <p>
    Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod
    tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
    quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo
    consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse
    cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat
    non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
  </p>
</div>
```

```css hidden live-sample___translation_matrix_ex live-sample___scale_matrix_ex live-sample___rotation_matrix_ex live-sample___matrix_composition_ex
.transformable {
  width: 200px;
  height: 200px;
  overflow-y: scroll;
  background: #44cccc;
  padding: 10px;
  border: 2px solid #333333;
  position: absolute;
  top: 50%;
  left: 50%;
  margin-left: -100px;
  margin-top: -100px;
  transition: transform 500ms;
}
.transformable h2 {
  margin-top: 0;
}
.ghost {
  opacity: 0.1;
  pointer-events: none;
}
```

Cuối cùng, với mỗi ví dụ, chúng ta sẽ tạo một ma trận 4×4, sau đó cập nhật kiểu của `<div>` để áp dụng một phép biến đổi cho nó, được đặt thành `matrix3d`. Hãy nhớ rằng mặc dù ma trận được tạo thành từ 4 hàng và 4 cột nhưng nó vẫn thu gọn thành một dòng gồm 16 giá trị. Ma trận luôn được lưu trữ trong danh sách một chiều trong JavaScript.

```js live-sample___translation_matrix_ex live-sample___scale_matrix_ex live-sample___rotation_matrix_ex live-sample___matrix_composition_ex
// Create the matrix3d style property from a matrix array
function matrixArrayToCssMatrix(array) {
  return `matrix3d(${array.join(",")})`;
}

const moveMe = document.getElementById("move-me");

function setTransform(matrix) {
  moveMe.style.transform = matrixArrayToCssMatrix(matrix);
}
```

Ví dụ: chúng tôi sử dụng hàm `translate()` từ phần [translation ma trận](#translation_matrix) ở trên để di chuyển `<div>` xuống 100 pixel và sang phải 50 pixel. Giá trị `z` được đặt thành 0, vì vậy nó không di chuyển trong chiều thứ ba.

```js live-sample___translation_matrix_ex
const translationMatrix = translate(50, 100, 0);
setTransform(translationMatrix);
```

{{EmbedLiveSample("translation_matrix_ex", "", 350)}}

## Ma trận tỷ lệ

**ma trận tỷ lệ** làm cho thứ gì đó lớn hơn hoặc nhỏ hơn theo một hoặc nhiều trong ba chiều: chiều rộng, chiều cao và chiều sâu. Trong tọa độ điển hình (Descartes), điều này gây ra sự kéo dài hoặc co lại của vật thể theo các hướng tương ứng.

Mức độ thay đổi áp dụng cho từng chiều rộng, chiều cao và chiều sâu được đặt theo đường chéo bắt đầu từ góc trên cùng bên trái và đi xuống phía dưới bên phải.

```js live-sample___scale_matrix_ex live-sample___matrix_composition_ex
function scale(x, y, z) {
  // prettier-ignore
  return [
    x, 0, 0, 0,
    0, y, 0, 0,
    0, 0, z, 0,
    0, 0, 0, 1,
  ];
}
```

```js live-sample___scale_matrix_ex
const scaleMatrix = scale(1.5, 0.7, 1);
setTransform(scaleMatrix);
```

{{EmbedLiveSample("scale_matrix_ex", "", 350)}}

## Ma trận xoay

**Ma trận xoay** được sử dụng để xoay một điểm hoặc đối tượng. Ma trận xoay trông phức tạp hơn một chút so với ma trận chia tỷ lệ và ma trận biến đổi. Họ sử dụng các hàm lượng giác để thực hiện phép quay. Mặc dù phần này sẽ không chia nhỏ các bước thành chi tiết đầy đủ (hãy xem [bài viết này trên Wolfram MathWorld](https://mathworld.wolfram.com/RotationMatrix.html) để biết điều đó), hãy lấy ví dụ này để minh họa.

Đầu tiên, đây là đoạn mã xoay một điểm quanh gốc tọa độ mà không sử dụng ma trận.

```js
// Manually rotating a point about the origin without matrices
const point = [10, 2];

// Calculate the angle from the positive x-axis, counterclockwise, in radians
const angleInRadians = Math.atan2(point[1], point[0]);

// Calculate the distance from the origin
const distance = Math.sqrt(point[0] * point[0] + point[1] * point[1]);

// The equivalent of 60 degrees, in radians
const rotationInRadians = Math.PI / 3;

const transformedPoint = [
  Math.cos(angleInRadians + rotationInRadians) * distance,
  Math.sin(angleInRadians + rotationInRadians) * distance,
];
```

Có thể mã hóa các loại bước này thành một ma trận và thực hiện điều đó cho từng kích thước `x`, `y` và `z`. Dưới đây là một tập hợp các hàm trả về ma trận quay khi quay quanh mỗi trục trong số ba trục. Một lưu ý lớn là không áp dụng phối cảnh nên có thể chưa có cảm giác 3D cho lắm. Độ phẳng tương đương với khi máy ảnh phóng to thật gần một vật thể ở xa - cảm giác phối cảnh biến mất.

```js live-sample___rotation_matrix_ex live-sample___matrix_composition_ex
const sin = Math.sin;
const cos = Math.cos;

function rotateX(a) {
  // prettier-ignore
  return [
    1, 0, 0, 0,
    0, cos(a), -sin(a), 0,
    0, sin(a), cos(a), 0,
    0, 0, 0, 1,
  ];
}

function rotateY(a) {
  // prettier-ignore
  return [
    cos(a), 0, sin(a), 0,
    0, 1, 0, 0,
    -sin(a), 0, cos(a), 0,
    0, 0, 0, 1,
  ];
}

function rotateZ(a) {
  // prettier-ignore
  return [
    cos(a), -sin(a), 0, 0,
    sin(a), cos(a), 0, 0,
    0, 0, 1, 0,
    0, 0, 0, 1,
  ];
}
```

```js live-sample___rotation_matrix_ex
const rotateZMatrix = rotateZ(Math.PI * 0.3);
setTransform(rotateZMatrix);
```

{{EmbedLiveSample("rotation_matrix_ex", "", 350)}}

## Thành phần ma trận

Sức mạnh thực sự của ma trận đến từ **thành phần ma trận**. Khi các ma trận của một lớp nhất định được nhân với nhau, chúng sẽ giữ nguyên lịch sử của các phép biến đổi và có thể đảo ngược. Điều này có nghĩa là nếu tất cả ma trận tịnh tiến, ma trận xoay và ma trận tỷ lệ được kết hợp với nhau thì khi thứ tự của ma trận được đảo ngược và áp dụng lại thì điểm ban đầu sẽ được trả về.

Thứ tự nhân các ma trận có vấn đề. Khi nhân các số, a \* b = c và b \* a = c đều đúng. Ví dụ: 3 \* 4 = 12 và 4 \* 3 = 12. Trong toán học, những số này được mô tả là **giao hoán**. Ma trận _không_ được đảm bảo giống nhau nếu đổi thứ tự, vì vậy ma trận **không giao hoán**.

Một điều đáng chú ý khác là phép nhân ma trận trong WebGL và CSS cần phải diễn ra theo thứ tự ngược lại với các thao tác diễn ra một cách trực quan. Ví dụ: để thu nhỏ một cái gì đó xuống 80%, hãy di chuyển nó xuống 200 pixel và sau đó xoay quanh gốc 90 độ sẽ trông giống như sau trong mã giả.

```plain
transformation = rotate * translate * scale
```

### Soạn nhiều phép biến đổi

Hàm mà chúng ta sẽ sử dụng để soạn ma trận là `multiplyArrayOfMatrices()`, là một phần của tập hợp các hàm tiện ích được giới thiệu ở gần đầu bài viết này. Nó lấy một mảng ma trận rồi nhân chúng lại với nhau và trả về kết quả. Trong mã trình đổ bóng WebGL, mã này được tích hợp vào ngôn ngữ và toán tử `*` có thể được sử dụng.

```js live-sample___matrix_composition_ex
const transformMatrix = multiplyArrayOfMatrices([
  rotateZ(Math.PI * 0.5), // Step 3: rotate around 90 degrees
  translate(0, 200, 0), // Step 2: move down 200 pixels
  scale(0.8, 0.8, 0.8), // Step 1: scale down
]);

setTransform(transformMatrix);
```

{{EmbedLiveSample("matrix_composition_ex", "", 350)}}

Cuối cùng, một bước thú vị để chỉ ra cách hoạt động của ma trận là đảo ngược các bước để đưa ma trận trở lại ma trận đơn vị ban đầu.

```js
const transformMatrix = multiplyArrayOfMatrices([
  scale(1.25, 1.25, 1.25), // Step 6: scale back up
  translate(0, -200, 0), // Step 5: move back up
  rotateZ(-Math.PI * 0.5), // Step 4: rotate back
  rotateZ(Math.PI * 0.5), // Step 3: rotate around 90 degrees
  translate(0, 200, 0), // Step 2: move down 200 pixels
  scale(0.8, 0.8, 0.8), // Step 1: scale down
]);
```

## Tại sao ma trận lại quan trọng

Ma trận rất quan trọng vì chúng bao gồm một tập hợp nhỏ các số có thể mô tả một loạt các phép biến đổi trong không gian. Chúng có thể dễ dàng được chia sẻ trong các chương trình. Các không gian tọa độ khác nhau có thể được mô tả bằng ma trận và một số phép nhân ma trận sẽ di chuyển một bộ dữ liệu từ không gian tọa độ này sang không gian tọa độ khác. Ma trận ghi nhớ một cách hiệu quả mọi phần của các phép biến đổi trước đó được sử dụng để tạo ra chúng.

Để sử dụng trong WebGL, card đồ họa đặc biệt tốt trong việc nhân một số lượng lớn các điểm trong không gian với ma trận. Các hoạt động khác nhau như định vị điểm, tính toán ánh sáng và tạo dáng cho các nhân vật hoạt hình đều dựa vào công cụ cơ bản này.

---
title: Ví dụ về hoạt ảnh WebGL 2D cơ bản
slug: Web/API/WebGL_API/Basic_2D_animation_example
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

Trong ví dụ về WebGL này, chúng tôi tạo một canvas và trong đó hiển thị một hình vuông xoay bằng WebGL. Hệ tọa độ mà chúng tôi sử dụng để thể hiện cảnh của mình giống với hệ tọa độ của khung vẽ. Tức là (0, 0) ở góc trên bên trái và góc dưới bên phải ở (600, 460).

## Ví dụ về hình vuông xoay

Hãy làm theo các bước khác nhau để có được hình vuông xoay của chúng ta.

### Trình đổ bóng đỉnh

Đầu tiên, chúng ta hãy nhìn vào vertex shader. Công việc của nó, như mọi khi, là chuyển đổi tọa độ mà chúng ta đang sử dụng cho cảnh của mình thành tọa độ không gian clip (nghĩa là hệ thống mà (0, 0) nằm ở trung tâm của ngữ cảnh và mỗi trục kéo dài từ -1,0 đến 1,0 bất kể kích thước thực tế của ngữ cảnh).

```html
<script id="vertex-shader" type="x-shader/x-vertex">
  attribute vec2 aVertexPosition;

  uniform vec2 uScalingFactor;
  uniform vec2 uRotationVector;

  void main() {
    vec2 rotatedPosition = vec2(
      aVertexPosition.x * uRotationVector.y +
            aVertexPosition.y * uRotationVector.x,
      aVertexPosition.y * uRotationVector.y -
            aVertexPosition.x * uRotationVector.x
    );

    gl_Position = vec4(rotatedPosition * uScalingFactor, 0.0, 1.0);
  }
</script>
```

Chương trình chính chia sẻ với chúng ta thuộc tính `aVertexPosition`, là vị trí của đỉnh trong bất kỳ hệ tọa độ nào mà nó đang sử dụng. Chúng ta cần chuyển đổi các giá trị này để cả hai thành phần của vị trí đều nằm trong phạm vi -1,0 đến 1,0. Điều này có thể được thực hiện đủ dễ dàng bằng cách nhân với hệ số tỷ lệ dựa trên {{glossary("aspect ratio")}} của ngữ cảnh. Chúng ta sẽ sớm thấy tính toán đó.

Chúng ta cũng đang xoay hình dạng và chúng ta có thể làm điều đó ở đây bằng cách áp dụng một phép biến đổi. Chúng ta sẽ làm điều đó trước tiên. Vị trí xoay của đỉnh được tính toán bằng cách áp dụng vectơ xoay, được tìm thấy trong `uRotationVector` thống nhất, được tính toán bằng mã JavaScript.

Sau đó, vị trí cuối cùng được tính bằng cách nhân vị trí đã xoay với vectơ tỷ lệ được cung cấp bởi mã JavaScript trong `uScalingFactor`. Các giá trị của `z` và `w` được cố định lần lượt là 0,0 và 1,0 vì chúng ta đang vẽ ở dạng 2D.

Sau đó, `gl_Position` toàn cầu WebGL tiêu chuẩn được đặt thành vị trí của đỉnh được chuyển đổi và xoay.

### Trình đổ bóng phân đoạn

Tiếp theo là trình đổ bóng mảnh. Vai trò của nó là trả về màu của từng pixel trong hình được hiển thị. Vì chúng ta đang vẽ một vật thể rắn, không có kết cấu và không áp dụng ánh sáng nên việc này cực kỳ đơn giản:

```html
<script id="fragment-shader" type="x-shader/x-fragment">
  #ifdef GL_ES
    precision highp float;
  #endif

  uniform vec4 uGlobalColor;

  void main() {
    gl_FragColor = uGlobalColor;
  }
</script>
```

Việc này bắt đầu bằng cách chỉ định độ chính xác của loại `float`, theo yêu cầu. Sau đó, chúng tôi đặt `gl_FragColor` toàn cục thành giá trị của `uGlobalColor` thống nhất, được đặt bởi mã JavaScript thành màu được sử dụng để vẽ hình vuông.

### HTML

HTML chỉ bao gồm {{HTMLElement("canvas")}} mà chúng ta sẽ lấy bối cảnh WebGL trên đó.

```html
<canvas id="gl-canvas" width="600" height="460">
  Oh no! Your browser doesn't support canvas!
</canvas>
```

### Toàn cầu và khởi tạo

Đầu tiên, các biến toàn cục. Chúng ta sẽ không thảo luận những điều này ở đây; thay vào đó, chúng ta sẽ nói về chúng khi chúng được sử dụng trong đoạn mã sắp tới.

```js
const glCanvas = document.getElementById("gl-canvas");
const gl = glCanvas.getContext("webgl");

const shaderSet = [
  {
    type: gl.VERTEX_SHADER,
    id: "vertex-shader",
  },
  {
    type: gl.FRAGMENT_SHADER,
    id: "fragment-shader",
  },
];

const shaderProgram = buildShaderProgram(shaderSet);

// Aspect ratio and coordinate system details
const aspectRatio = glCanvas.width / glCanvas.height;
const currentRotation = [0, 1];
const currentScale = [1.0, aspectRatio];

// Vertex information
const vertexArray = new Float32Array([
  -0.5, 0.5, 0.5, 0.5, 0.5, -0.5, -0.5, 0.5, 0.5, -0.5, -0.5, -0.5,
]);
const vertexBuffer = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);
gl.bufferData(gl.ARRAY_BUFFER, vertexArray, gl.STATIC_DRAW);
const vertexNumComponents = 2;
const vertexCount = vertexArray.length / vertexNumComponents;

// Rendering data shared with the scalers.
let uScalingFactor;
let uGlobalColor;
let uRotationVector;
let aVertexPosition;

// Animation timing
let previousTime = 0.0;
const degreesPerSecond = 90.0;
let currentAngle = 0.0;

animateScene();
```

Sau khi có được bối cảnh WebGL, `gl`, chúng ta cần bắt đầu bằng cách xây dựng chương trình đổ bóng. Ở đây, chúng tôi đang sử dụng mã được thiết kế để cho phép chúng tôi thêm nhiều trình đổ bóng vào chương trình của mình khá dễ dàng. Mảng `shaderSet` chứa danh sách các đối tượng, mỗi đối tượng mô tả một hàm shader sẽ được biên dịch vào chương trình. Mỗi hàm có một loại (một trong `gl.VERTEX_SHADER` hoặc `gl.FRAGMENT_SHADER`) và một ID (ID của phần tử {{HTMLElement("script")}} chứa mã của trình đổ bóng).

Bộ đổ bóng được chuyển vào hàm `buildShaderProgram()`, hàm này trả về chương trình đổ bóng được biên dịch và liên kết. Chúng ta sẽ xem cách nó hoạt động tiếp theo.

Sau khi chương trình đổ bóng được xây dựng, chúng tôi tính toán tỷ lệ khung hình của bối cảnh bằng cách chia chiều rộng cho chiều cao của nó. Sau đó, chúng tôi đặt vectơ xoay hiện tại cho hoạt ảnh thành `[0, 1]` và vectơ tỷ lệ thành `[1.0,specRatio]`. Vectơ chia tỷ lệ, như chúng ta đã thấy trong trình đổ bóng đỉnh, được sử dụng để chia tỷ lệ tọa độ cho phù hợp với phạm vi -1,0 đến 1,0.

Mảng các đỉnh được tạo tiếp theo, dưới dạng {{jsxref("Float32Array")}} với sáu tọa độ (ba đỉnh 2D) trên mỗi tam giác sẽ được vẽ, tổng cộng có 12 giá trị.

Như bạn có thể thấy, chúng tôi đang sử dụng hệ tọa độ từ -1,0 đến 1,0 cho mỗi trục. Bạn có thể hỏi tại sao chúng ta có cần thực hiện bất kỳ điều chỉnh nào không? Điều này là do bối cảnh của chúng tôi không vuông. Chúng tôi đang sử dụng bối cảnh rộng 600 pixel và cao 460 pixel. Mỗi thứ nguyên đó được ánh xạ tới phạm vi -1,0 đến 1,0. Vì hai trục không có cùng độ dài nên nếu chúng ta không điều chỉnh giá trị của một trong hai trục, hình vuông sẽ bị kéo dài ra theo hướng này hay hướng khác. Vì vậy chúng ta cần bình thường hóa các giá trị này.

Khi mảng đỉnh đã được tạo, chúng ta tạo bộ đệm GL mới để chứa chúng bằng cách gọi {{domxref("WebGLRenderingContext.createBuffer", "gl.createBuffer()")}}. Chúng tôi liên kết tham chiếu bộ đệm mảng WebGL tiêu chuẩn với bộ đệm đó bằng cách gọi {{domxref("WebGLRenderingContext.bindBuffer", "gl.bindBuffer()")}} rồi sao chép dữ liệu đỉnh vào bộ đệm bằng cách sử dụng {{domxref("WebGLRenderingContext.bufferData", "gl.bufferData()")}}. Gợi ý sử dụng `gl.STATIC_DRAW` được chỉ định, cho WebGL biết rằng dữ liệu sẽ chỉ được đặt một lần và không bao giờ được sửa đổi nhưng sẽ được sử dụng nhiều lần. Điều này cho phép WebGL xem xét mọi tối ưu hóa có thể áp dụng để cải thiện hiệu suất dựa trên thông tin đó.

Với dữ liệu đỉnh hiện được cung cấp cho WebGL, chúng tôi đặt `vertexNumComponents` thành số thành phần trong mỗi đỉnh (2, vì chúng là các đỉnh 2D) và `vertexCount` thành số đỉnh trong danh sách đỉnh.

Sau đó, góc xoay hiện tại (tính bằng độ) được đặt thành 0,0 vì chúng tôi chưa thực hiện bất kỳ thao tác xoay nào và tốc độ xoay (tính bằng độ trên mỗi khoảng thời gian làm mới màn hình, thường là 60 FPS) được đặt thành 6.

Cuối cùng, `animateScene()` được gọi để hiển thị khung hình đầu tiên và lên lịch hiển thị khung hình tiếp theo của hoạt ảnh.

### Biên dịch và liên kết chương trình đổ bóng

Hàm `buildShaderProgram()` chấp nhận làm đầu vào một mảng đối tượng mô tả một tập hợp các hàm đổ bóng sẽ được biên dịch và liên kết vào chương trình đổ bóng và trả về chương trình đổ bóng sau khi nó được xây dựng và liên kết.

```js
function buildShaderProgram(shaderInfo) {
  const program = gl.createProgram();

  shaderInfo.forEach((desc) => {
    const shader = compileShader(desc.id, desc.type);

    if (shader) {
      gl.attachShader(program, shader);
    }
  });

  gl.linkProgram(program);

  if (!gl.getProgramParameter(program, gl.LINK_STATUS)) {
    console.log("Error linking shader program:");
    console.log(gl.getProgramInfoLog(program));
  }

  return program;
}
```

Đầu tiên, {{domxref("WebGLRenderingContext.createProgram", "gl.createProgram()")}} được gọi để tạo một chương trình GLSL mới, trống.

Sau đó, đối với mỗi trình đổ bóng trong danh sách các trình đổ bóng được chỉ định, chúng tôi gọi hàm `compileShader()` để biên dịch nó, chuyển vào đó ID và loại của hàm đổ bóng để xây dựng. Mỗi đối tượng đó bao gồm, như đã đề cập trước đó, ID của phần tử `<script>` chứa mã trình đổ bóng và loại trình đổ bóng đó. Trình đổ bóng đã biên dịch được gắn vào chương trình đổ bóng bằng cách chuyển nó vào {{domxref("WebGLRenderingContext.attachShader", "gl.attachShader()")}}.

> [!LƯU Ý]
> Trên thực tế, chúng ta có thể tiến thêm một bước nữa và xem xét giá trị của thuộc tính `type` của phần tử `<script>` để xác định loại trình đổ bóng.

Sau khi tất cả các trình đổ bóng được biên dịch, chương trình sẽ được liên kết bằng cách sử dụng {{domxref("WebGLRenderingContext.linkProgram", "gl.linkProgram()")}}.

Nếu xảy ra lỗi khi liên kết chương trình, thông báo lỗi sẽ được ghi vào bảng điều khiển.

Cuối cùng, chương trình đã biên dịch sẽ được trả về cho người gọi.

### Biên dịch một shader riêng lẻ

Hàm `compileShader()` dưới đây được gọi bởi `buildShaderProgram()` để biên dịch một shader duy nhất.

```js
function compileShader(id, type) {
  const code = document.getElementById(id).firstChild.nodeValue;
  const shader = gl.createShader(type);

  gl.shaderSource(shader, code);
  gl.compileShader(shader);

  if (!gl.getShaderParameter(shader, gl.COMPILE_STATUS)) {
    console.log(
      `Error compiling ${
        type === gl.VERTEX_SHADER ? "vertex" : "fragment"
      } shader:`,
    );
    console.log(gl.getShaderInfoLog(shader));
  }
  return shader;
}
```

Mã được tìm nạp từ tài liệu HTML bằng cách lấy giá trị của nút văn bản có trong phần tử {{HTMLElement("script")}} có ID được chỉ định. Sau đó, một trình đổ bóng mới thuộc loại đã chỉ định sẽ được tạo bằng cách sử dụng {{domxref("WebGLRenderingContext.createShader", "gl.createShader()")}}.

Mã nguồn được gửi vào trình đổ bóng mới bằng cách chuyển nó vào {{domxref("WebGLRenderingContext.shaderSource", "gl.shaderSource()")}}, sau đó trình đổ bóng được biên dịch bằng cách sử dụng {{domxref("WebGLRenderingContext.compileShader", "gl.compileShader()")}}

Lỗi biên dịch được ghi vào bảng điều khiển. Lưu ý việc sử dụng chuỗi [template Literal](/en-US/docs/Web/JavaScript/Reference/Template_literals) để chèn chuỗi loại trình đổ bóng chính xác vào thông báo được tạo. Chi tiết lỗi thực tế có được bằng cách gọi {{domxref("WebGLRenderingContext.getShaderInfoLog", "gl.getShaderInfoLog()")}}.

Cuối cùng, shader đã biên dịch được trả về cho người gọi (đó là hàm `buildShaderProgram()`.

### Vẽ và tạo hoạt ảnh cho cảnh

Hàm `animateScene()` được gọi để hiển thị từng khung hình động.

```js
function animateScene() {
  gl.viewport(0, 0, glCanvas.width, glCanvas.height);
  gl.clearColor(0.8, 0.9, 1.0, 1.0);
  gl.clear(gl.COLOR_BUFFER_BIT);

  const radians = (currentAngle * Math.PI) / 180.0;
  currentRotation[0] = Math.sin(radians);
  currentRotation[1] = Math.cos(radians);

  gl.useProgram(shaderProgram);

  uScalingFactor = gl.getUniformLocation(shaderProgram, "uScalingFactor");
  uGlobalColor = gl.getUniformLocation(shaderProgram, "uGlobalColor");
  uRotationVector = gl.getUniformLocation(shaderProgram, "uRotationVector");

  gl.uniform2fv(uScalingFactor, currentScale);
  gl.uniform2fv(uRotationVector, currentRotation);
  gl.uniform4fv(uGlobalColor, [0.1, 0.7, 0.2, 1.0]);

  gl.bindBuffer(gl.ARRAY_BUFFER, vertexBuffer);

  aVertexPosition = gl.getAttribLocation(shaderProgram, "aVertexPosition");

  gl.enableVertexAttribArray(aVertexPosition);
  gl.vertexAttribPointer(
    aVertexPosition,
    vertexNumComponents,
    gl.FLOAT,
    false,
    0,
    0,
  );

  gl.drawArrays(gl.TRIANGLES, 0, vertexCount);

  requestAnimationFrame((currentTime) => {
    const deltaAngle =
      ((currentTime - previousTime) / 1000.0) * degreesPerSecond;

    currentAngle = (currentAngle + deltaAngle) % 360;

    previousTime = currentTime;
    animateScene();
  });
}
```

Điều đầu tiên cần làm để vẽ khung hình động là xóa nền về màu mong muốn. Trong trường hợp này, chúng tôi đặt khung nhìn dựa trên kích thước của {{HTMLElement("canvas")}}, gọi {{domxref("WebGLRenderingContext.clearColor", "clearColor()")}} để đặt màu sẽ sử dụng khi xóa nội dung, sau đó chúng tôi xóa bộ đệm bằng {{domxref("WebGLRenderingContext.clear", "clear()")}}.

Tiếp theo, vectơ xoay hiện tại được tính bằng cách chuyển đổi góc xoay hiện tại theo độ (`currentAngle`) thành [radians](https://en.wikipedia.org/wiki/Radians), sau đó đặt thành phần đầu tiên của vectơ xoay thành [sine](https://en.wikipedia.org/wiki/Sine) của giá trị đó và thành phần thứ hai thành [cosine](https://en.wikipedia.org/wiki/Cosine). Vectơ `currentRotation` hiện là vị trí của điểm trên [vòng tròn đơn vị](https://en.wikipedia.org/wiki/Unit_circle) nằm ở góc `currentAngle`.

{{domxref("WebGLRenderingContext.useProgram", "useProgram()")}} được gọi để kích hoạt chương trình tạo bóng GLSL mà chúng ta đã thiết lập trước đó. Sau đó, chúng tôi lấy vị trí của từng bộ đồng phục được sử dụng để chia sẻ thông tin giữa mã JavaScript và trình đổ bóng (với {{domxref("WebGLRenderingContext.getUniformLocation", "getUniformLocation()")}}).

Đồng phục có tên `uScalingFactor` được đặt thành giá trị `currentScale` đã được tính toán trước đó; như bạn có thể nhớ lại, đây là giá trị được sử dụng để điều chỉnh hệ tọa độ dựa trên tỷ lệ khung hình của ngữ cảnh. Việc này được thực hiện bằng cách sử dụng {{domxref("WebGLRenderingContext/uniform", "uniform2fv()")}} (vì đây là vectơ dấu phẩy động 2 giá trị).

`uRotationVector` được đặt thành vectơ xoay hiện tại (`currentRotation)`, cũng sử dụng `uniform2fv()`.

`uGlobalColor` được đặt bằng cách sử dụng {{domxref("WebGLRenderingContext/uniform", "uniform4fv()")}} thành màu mà chúng ta muốn sử dụng khi vẽ hình vuông. Đây là vectơ dấu phẩy động gồm 4 thành phần (mỗi thành phần một thành phần cho màu đỏ, lục, lam và alpha).

Bây giờ đã xong, chúng ta có thể thiết lập bộ đệm đỉnh và vẽ hình của mình, trước tiên, bộ đệm các đỉnh sẽ được sử dụng để vẽ các hình tam giác có hình được đặt bằng cách gọi {{domxref("WebGLRenderingContext.bindBuffer", "bindBuffer()")}}. Sau đó, chỉ mục của thuộc tính vị trí đỉnh được lấy từ chương trình đổ bóng bằng cách gọi {{domxref("WebGLRenderingContext.getAttribLocation", "getAttribLocation()")}}.

Với chỉ mục của thuộc tính vị trí đỉnh hiện có sẵn trong `aVertexPosition`, chúng tôi gọi `enableVertexAttribArray()` để bật thuộc tính vị trí để chương trình đổ bóng (cụ thể là bởi trình đổ bóng đỉnh) có thể sử dụng thuộc tính này.

Sau đó, bộ đệm đỉnh được liên kết với thuộc tính `aVertexPosition` bằng cách gọi {{domxref("WebGLRenderingContext.vertexAttribPointer", "vertexAttribPointer()")}}. Bước này không rõ ràng vì ràng buộc này gần như là một tác dụng phụ. Nhưng kết quả là, việc truy cập `aVertexPosition` hiện lấy được dữ liệu từ bộ đệm đỉnh.

Với sự liên kết giữa bộ đệm đỉnh cho hình dạng của chúng ta và thuộc tính `aVertexPosition` được sử dụng để phân phối từng đỉnh một vào trình đổ bóng đỉnh, chúng ta đã sẵn sàng vẽ hình bằng cách gọi {{domxref("WebGLRenderingContext.drawArrays", "drawArrays()")}}.

Tại thời điểm này, khung đã được vẽ. Tất cả những gì còn lại phải làm là lên lịch vẽ bức tiếp theo. Điều đó được thực hiện ở đây bằng cách gọi {{domxref("Window.requestAnimationFrame", "requestAnimationFrame()")}}, yêu cầu chức năng gọi lại được thực thi vào lần tiếp theo khi trình duyệt sẵn sàng cập nhật màn hình.

Lệnh gọi lại `requestAnimationFrame()` của chúng tôi nhận đầu vào là một tham số duy nhất, `currentTime`, chỉ định thời gian bắt đầu vẽ khung. Chúng tôi sử dụng thời gian đó và thời gian đã lưu mà khung hình cuối cùng được vẽ, `previousTime`, cùng với số độ mỗi giây mà hình vuông sẽ xoay (`degreesPerSecond`) để tính giá trị mới của `currentAngle`. Sau đó, giá trị của `previousTime` được cập nhật và chúng ta gọi `animateScene()` để vẽ khung tiếp theo (và lần lượt lên lịch cho khung tiếp theo sẽ được vẽ, ad infinitum).

### Kết quả

Đây là một ví dụ khá đơn giản, vì nó chỉ vẽ một đối tượng đơn giản nhưng các khái niệm được sử dụng ở đây còn mở rộng sang các hoạt ảnh phức tạp hơn nhiều.

{{EmbedLiveSample("A_rotating_square_example", 660, 500)}}

## Xem thêm

- [API WebGL](/en-US/docs/Web/API/WebGL_API)
- [Hướng dẫn về WebGL](/en-US/docs/Web/API/WebGL_API/Tutorial)

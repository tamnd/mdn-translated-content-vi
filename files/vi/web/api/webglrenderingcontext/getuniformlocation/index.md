---
title: "WebGLRenderingContext: getUniformLocation() method"
short-title: getUniformLocation()
slug: Web/API/WebGLRenderingContext/getUniformLocation
page-type: web-api-instance-method
browser-compat: api.WebGLRenderingContext.getUniformLocation
---

{{APIRef("WebGL")}}{{AvailableInWorkers}}

Một phần của [WebGL API](/en-US/docs/Web/API/WebGL_API), phương thức {{domxref("WebGLRenderingContext")}} **`getUniformLocation()`** trả về vị trí của một biến **đồng nhất** cụ thể mà là một phần của một {{domxref("WebGLProgram")}} nhất định.

Biến thống nhất được trả về dưới dạng một đối tượng {{domxref("WebGLUniformLocation")}}, là một mã định danh không rõ ràng được sử dụng để xác định vị trí của biến thống nhất trong bộ nhớ GPU.

Sau khi có vị trí của đồng phục, bạn có thể truy cập vào chính đồng phục đó bằng một trong các phương thức truy cập thống nhất khác, chuyển vị trí thống nhất làm một trong các đầu vào:

- {{domxref("WebGLRenderingContext.getUniform", "getUniform()")}}
  - : Trả về giá trị của đồng phục tại vị trí đã cho.
- [`WebGLRenderingContext.uniform[1234][fi][v]()`](/en-US/docs/Web/API/WebGLRenderingContext/uniform)
  - : Đặt giá trị của đồng phục thành giá trị đã chỉ định, có thể là một giá trị nổi duy nhất
điểm hoặc số nguyên, hoặc một vectơ thành phần 2-4 được chỉ định dưới dạng danh sách các giá trị hoặc dưới dạng {{jsxref("Float32Array")}} hoặc {{jsxref("Int32Array")}}.
- [`WebGLRenderingContext.uniformMatrix[234][fv]()`](/en-US/docs/Web/API/WebGLRenderingContext/uniformMatrix)
  - : Đặt giá trị của đồng phục cho ma trận đã chỉ định, có thể có chuyển vị. các
giá trị được biểu diễn dưới dạng một chuỗi các giá trị `GLfloat` hoặc dưới dạng `Float32Array`.

Bản thân đồng phục được khai báo trong chương trình đổ bóng sử dụng GLSL.

## Cú pháp

```js-nolint
getUniformLocation(program, name)
```

### Thông số

- `program`
  - : {{domxref("WebGLProgram")}} để định vị biến thống nhất đã chỉ định.
- `name`
  - : Một chuỗi xác định tên của biến thống nhất có
vị trí sẽ được trả lại. Tên không được có bất kỳ khoảng trắng nào trong đó, và bạn không thể sử dụng chức năng này để lấy vị trí của bất kỳ bộ đồng phục nào bắt đầu bằng chuỗi dành riêng `"gl_"`, vì chúng nằm bên trong lớp WebGL.

Các giá trị có thể tương ứng với các tên thống nhất được trả về bởi {{domxref("WebGLRenderingContext.getActiveUniform()", "getActiveUniform")}}; xem chức năng đó để biết thông tin cụ thể về cách ánh xạ đồng phục được khai báo tới tên vị trí thống nhất.

Ngoài ra, đối với đồng phục được khai báo dưới dạng mảng, các tên sau cũng hợp lệ:
    - Tên thống nhất không có hậu tố `[0]`. Ví dụ. vị trí
được trả về cho `arrayUniform` tương đương với giá trị cho `arrayUniform[0]`.
    - Tên thống nhất được lập chỉ mục bằng một số nguyên. Ví dụ. vị trí được trả lại cho
`arrayUniform[2]` sẽ trỏ trực tiếp đến mục thứ ba của đồng phục `arrayUniform`.

### Giá trị trả về

Giá trị {{domxref("WebGLUniformLocation")}} cho biết vị trí của biến được đặt tên, nếu nó tồn tại. Nếu biến được chỉ định không tồn tại, [`null`](/en-US/docs/Web/JavaScript/Reference/Operators/null) sẽ được trả về thay thế.

`WebGLUniformLocation` là một giá trị mờ được sử dụng để xác định duy nhất vị trí trong bộ nhớ của GPU nơi đặt biến thống nhất. Với giá trị này trong tay, bạn có thể gọi các phương thức WebGL khác để truy cập giá trị của biến thống nhất.

> [!GHI CHÚ]
> Loại `WebGLUniformLocation` tương thích với
> Loại `GLint` khi chỉ định chỉ số hoặc vị trí của đồng phục
> thuộc tính.

### Lỗi

Các lỗi sau có thể xảy ra; để kiểm tra lỗi sau khi `getUniformLocation()` trả về, hãy gọi {{domxref("WebGLRenderingContext.getError", "getError()")}}.

- `GL_INVALID_VALUE`
  - : Tham số `program` không phải là giá trị hoặc đối tượng được tạo bởi WebGL.
- `GL_INVALID_OPERATION`
  - : Tham số `program` không tương ứng với chương trình GLSL được tạo
bởi WebGL, hoặc chương trình được chỉ định chưa được liên kết thành công.

## Ví dụ

Trong ví dụ này, được lấy từ phương pháp `animateScene()` trong bài viết [Một ví dụ hoạt hình WebGL 2D cơ bản](/en-US/docs/Web/API/WebGL_API/Basic_2D_animation_example#drawing_and_animating_the_scene), lấy vị trí của ba bộ đồng phục từ chương trình tô bóng, sau đó đặt giá trị của từng bộ đồng phục trong số ba bộ đồng phục đó.

```js
gl.useProgram(shaderProgram);

uScalingFactor = gl.getUniformLocation(shaderProgram, "uScalingFactor");
uGlobalColor = gl.getUniformLocation(shaderProgram, "uGlobalColor");
uRotationVector = gl.getUniformLocation(shaderProgram, "uRotationVector");

gl.uniform2fv(uScalingFactor, currentScale);
gl.uniform2fv(uRotationVector, currentRotation);
gl.uniform4fv(uGlobalColor, [0.1, 0.7, 0.2, 1.0]);
```

> [!GHI CHÚ]
> Đoạn mã này được lấy từ [hàm TOK0](/en-US/docs/Web/API/WebGL_API/Basic_2D_animation_example#drawing_and_animating_the_scene) trong "Ví dụ hoạt hình WebGL 2D cơ bản."
> Hãy xem bài viết đó để biết mẫu đầy đủ và xem hoạt ảnh thu được đang hoạt động.

Sau khi thiết lập chương trình tô bóng hiện tại thành `shaderProgram`, mã này sẽ tìm nạp ba bộ đồng phục `"uScalingFactor"`, `"uGlobalColor"`, và `"uRotationVector"`, gọi `getUniformLocation()` một lần cho mỗi bộ đồng phục.

Sau đó, giá trị của ba bộ đồng phục được đặt:

- Đồng phục `uScalingFactor` — một đỉnh gồm 2 thành phần — nhận được
các hệ số tỷ lệ ngang và dọc từ biến `currentScale`.
- Đồng nhất `uRotationVector` được đặt theo nội dung của biến
`currentRotation`. Đây cũng là một đỉnh có 2 thành phần.
- Cuối cùng, đồng phục `uGlobalColor` được đặt thành màu
`[0.1, 0.7, 0.2, 1.0]`, các thành phần trong vectơ 4 thành phần này lần lượt biểu thị các giá trị đỏ, lục, lam và alpha.

Sau khi thực hiện điều này, lần tiếp theo khi các hàm tô bóng được gọi, các biến riêng của chúng có tên là `uScalingFactor`, `uGlobalColor`, và `uRotationVector` đều sẽ có các giá trị do mã JavaScript cung cấp.

## Thông số kỹ thuật

{{Specifications}}

## Khả năng tương thích của trình duyệt

{{Compat}}

## Xem thêm

- {{domxref("WebGLRenderingContext.getAttribLocation()")}}
- {{domxref("WebGLRenderingContext.getActiveUniform()")}}
- {{domxref("WebGLUniformLocation")}}

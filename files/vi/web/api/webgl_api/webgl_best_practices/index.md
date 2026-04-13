---
title: Các phương pháp hay nhất về WebGL
slug: Web/API/WebGL_API/WebGL_best_practices
page-type: guide
---

{{DefaultAPISidebar("WebGL")}}

WebGL là một API phức tạp và thường không rõ ràng về cách sử dụng được khuyến nghị. Trang này đề cập đến các đề xuất trên nhiều lĩnh vực chuyên môn và không chỉ nêu bật những điều nên làm và không nên làm mà còn nêu chi tiết _tại sao_. Bạn có thể dựa vào tài liệu này để hướng dẫn lựa chọn phương pháp tiếp cận của mình và đảm bảo bạn đang đi đúng hướng cho dù người dùng của bạn chạy trình duyệt hay phần cứng nào.

## Giải quyết và loại bỏ lỗi WebGL

Ứng dụng của bạn sẽ chạy mà không tạo ra bất kỳ lỗi WebGL nào (được trả về bởi `getError`). Mọi lỗi WebGL đều được báo cáo trong Bảng điều khiển Web dưới dạng cảnh báo JavaScript kèm theo thông báo mô tả. Sau quá nhiều lỗi (32 lỗi trong Firefox), WebGL ngừng tạo thông báo mô tả, điều này thực sự cản trở việc gỡ lỗi.

Các lỗi _only_ mà một trang có định dạng đúng tạo ra là `OUT_OF_MEMORY` và `CONTEXT_LOST`.

## Hiểu tính khả dụng của tiện ích mở rộng

Tính khả dụng của hầu hết các tiện ích mở rộng WebGL phụ thuộc vào hệ thống máy khách. Khi sử dụng tiện ích mở rộng WebGL, nếu có thể, hãy cố gắng biến chúng thành tùy chọn bằng cách điều chỉnh linh hoạt cho phù hợp với trường hợp chúng không được hỗ trợ.

Các tiện ích mở rộng WebGL 1 này được hỗ trợ trên toàn cầu và có thể tin cậy là sẽ có mặt:

- ANGLE_instanced_arrays
- EXT_blend_minmax
- OES_element_index_uint
- OES_standard_dẫn xuất
- OES_vertex_array_object
- WEBGL_debug_renderer_info
- WEBGL_lose_context

_(xem thêm: [Các cấp tính năng WebGL và % hỗ trợ](https://kdashg.github.io/misc/webgl/webgl-feature-levels.html))_

Hãy cân nhắc việc điền những thứ này vào WebGLRenderingContext, như: <https://github.com/kdashg/misc/blob/tip/webgl/webgl-v1.1.js>

## Hiểu giới hạn hệ thống

Tương tự như tiện ích mở rộng, giới hạn trong hệ thống của bạn sẽ khác với hệ thống của khách hàng! Đừng cho rằng bạn có thể sử dụng ba mươi bộ lấy mẫu kết cấu cho mỗi trình đổ bóng chỉ vì nó hoạt động trên máy của bạn!

Yêu cầu tối thiểu cho WebGL khá thấp. Trong thực tế, tất cả các hệ thống đều hỗ trợ ít nhất những điều sau:

```plain
MAX_CUBE_MAP_TEXTURE_SIZE: 4096
MAX_RENDERBUFFER_SIZE: 4096
MAX_TEXTURE_SIZE: 4096
MAX_VIEWPORT_DIMS: [4096,4096]
MAX_VERTEX_TEXTURE_IMAGE_UNITS: 4
MAX_TEXTURE_IMAGE_UNITS: 8
MAX_COMBINED_TEXTURE_IMAGE_UNITS: 8
MAX_VERTEX_ATTRIBS: 16
MAX_VARYING_VECTORS: 8
MAX_VERTEX_UNIFORM_VECTORS: 128
MAX_FRAGMENT_UNIFORM_VECTORS: 64
ALIASED_POINT_SIZE_RANGE: [1,100]
```

Máy tính để bàn của bạn có thể hỗ trợ họa tiết 16k hoặc có thể là 16 đơn vị họa tiết trong trình đổ bóng đỉnh, nhưng hầu hết các hệ thống khác thì không, và nội dung phù hợp với bạn sẽ không phù hợp với chúng!

## Tránh làm mất hiệu lực các ràng buộc đính kèm FBO

Hầu như bất kỳ thay đổi nào đối với các ràng buộc đính kèm của FBO sẽ làm mất hiệu lực tính đầy đủ của bộ đệm khung của nó. Thiết lập bộ đệm khung nóng của bạn trước thời hạn.

Trong Firefox, việc đặt pref `webgl.perf.max-warnings` thành `-1` trong about:config sẽ kích hoạt các cảnh báo hiệu suất bao gồm các cảnh báo về việc vô hiệu tính đầy đủ của FB.

### Tránh thay đổi phần đính kèm VAO (vertexAttribPointer, tắt/bậtVertexAttribArray)

Việc vẽ từ các VAO tĩnh, không thay đổi sẽ nhanh hơn so với việc thay đổi cùng một VAO cho mỗi lệnh rút thăm. Đối với các VAO không thay đổi, trình duyệt có thể lưu vào bộ nhớ đệm giới hạn tìm nạp, trong khi khi VAO thay đổi, trình duyệt phải xác thực lại và tính toán lại giới hạn. Chi phí cho việc này tương đối thấp, nhưng việc sử dụng lại VAO đồng nghĩa với việc ít lệnh gọi `vertexAttribPointer` hơn, vì vậy bạn nên thực hiện ở bất cứ nơi nào dễ dàng.

## Xóa đối tượng một cách háo hức

Đừng đợi người thu gom rác/người thu gom chu kỳ nhận ra các đối tượng mồ côi và tiêu hủy chúng. Quá trình triển khai theo dõi hoạt động của các đối tượng, do đó, việc 'xóa' chúng ở cấp API chỉ giải phóng phần điều khiển tham chiếu đến đối tượng thực tế. (về mặt khái niệm giải phóng con trỏ tham chiếu của điều khiển tới đối tượng) Chỉ khi đối tượng không được sử dụng trong quá trình triển khai thì nó mới thực sự được giải phóng. Ví dụ: nếu bạn không bao giờ muốn truy cập trực tiếp lại các đối tượng đổ bóng của mình, chỉ cần xóa các điều khiển của chúng sau khi gắn chúng vào một đối tượng chương trình.

## Mất bối cảnh một cách háo hức

Ngoài ra, hãy cân nhắc việc mất đi ngữ cảnh WebGL thông qua tiện ích mở rộng `WEBGL_lose_context` khi bạn chắc chắn đã sử dụng xong chúng và không còn cần kết quả hiển thị của canvas mục tiêu nữa. Lưu ý rằng điều này không cần thiết phải thực hiện khi điều hướng khỏi một trang - không thêm trình xử lý sự kiện dỡ tải chỉ vì mục đích này.

## Xả nước khi mong đợi kết quả

Gọi `flush()` khi mong đợi kết quả như truy vấn hoặc khi hoàn thành khung kết xuất.

Flush yêu cầu quá trình triển khai đẩy tất cả các lệnh đang chờ xử lý ra ngoài để thực thi, xóa chúng ra khỏi hàng đợi, thay vì đợi thêm lệnh vào hàng đợi trước khi gửi để thực thi.

Ví dụ: có thể những điều sau đây không bao giờ hoàn thành mà không mất ngữ cảnh:

```js
sync = glFenceSync(GL_SYNC_GPU_COMMANDS_COMPLETE, 0);
glClientWaitSync(sync, 0, GL_TIMEOUT_IGNORED);
```

Theo mặc định, WebGL không có lệnh gọi SwapBuffers, do đó, việc xóa cũng có thể giúp lấp đầy khoảng trống.

### Sử dụng `webgl.flush()` khi không sử dụng requestAnimationFrame

Khi không sử dụng RAF, hãy sử dụng `webgl.flush()` để khuyến khích việc thực hiện nhanh chóng các lệnh được xếp vào hàng đợi.

Vì RAF được theo sau trực tiếp bởi ranh giới khung nên một `webgl.flush()` rõ ràng không thực sự cần thiết với RAF.

## Tránh chặn lệnh gọi API trong quá trình sản xuất

Một số điểm nhập WebGL nhất định - bao gồm `getError` và `getParameter` - gây ra tình trạng ngừng đồng bộ trên chuỗi cuộc gọi. Ngay cả các yêu cầu cơ bản cũng có thể mất tới 1 mili giây, nhưng chúng có thể mất nhiều thời gian hơn nữa nếu chúng cần đợi tất cả công việc đồ họa được hoàn thành (với hiệu ứng tương tự như `glFinish()` trong OpenGL gốc).

Trong mã sản xuất, hãy tránh các điểm nhập như vậy, đặc biệt là trên luồng chính của trình duyệt, nơi chúng có thể khiến toàn bộ trang bị giật (thường bao gồm cả thao tác cuộn hoặc thậm chí toàn bộ trình duyệt).

- `getError()`: gây ra lệnh xóa + khứ hồi để tìm nạp lỗi từ quy trình GPU).

Ví dụ: trong Firefox, lần duy nhất glGetError được kiểm tra là sau khi phân bổ (`bufferData`, `*texImage*`, `texStorage*`) để phát hiện bất kỳ lỗi GL_OUT_OF_MEMORY nào.

- `getShader/ProgramParameter()`, `getShader/ProgramInfoLog()`, các `get` khác trên shader/chương trình: tuôn ra + biên dịch shader + khứ hồi, nếu không được thực hiện sau khi quá trình biên dịch shader hoàn tất. (Xem thêm [biên dịch trình đổ bóng song song](#compile_shaders_and_link_programs_in_parallel) bên dưới.)
- `get*Parameter()` nói chung: có thể xả + khứ hồi. Trong một số trường hợp, những thông tin này sẽ được lưu vào bộ nhớ đệm để tránh việc quay vòng, nhưng hãy cố gắng tránh dựa vào điều này.
- `checkFramebufferStatus()`: có thể xóa + khứ hồi.
- `getBufferSubData()`: kết thúc thông thường + khứ hồi. (Điều này phù hợp với bộ đệm READ kết hợp với hàng rào - xem [đọc lại dữ liệu không đồng bộ](#use_non-blocking_async_data_readback) bên dưới.)
- `readPixels()` tới CPU (tức là không có bộ đệm UNPACK bị ràng buộc): kết thúc + khứ hồi. Thay vào đó, hãy sử dụng GPU-GPU `readPixels` kết hợp với tính năng đọc lại dữ liệu không đồng bộ.

## Luôn kích hoạt đỉnh attrib 0 dưới dạng một mảng

Nếu bạn vẽ mà không kích hoạt đỉnh attrib 0 dưới dạng mảng, bạn sẽ buộc trình duyệt thực hiện mô phỏng phức tạp khi chạy trên OpenGL trên máy tính để bàn (chẳng hạn như trên macOS). Điều này là do trong OpenGL trên máy tính để bàn, không có gì được rút ra nếu đỉnh attrib 0 không được bật mảng. Bạn có thể sử dụng `bindAttribLocation` để buộc thuộc tính đỉnh sử dụng vị trí 0 và sử dụng `enableVertexAttribArray(0)` để kích hoạt thuộc tính theo mảng.

## Ước tính ngân sách VRAM trên mỗi pixel

WebGL không cung cấp API để truy vấn lượng bộ nhớ video tối đa trên hệ thống vì các truy vấn đó không thể di chuyển được. Tuy nhiên, các ứng dụng phải có ý thức về việc sử dụng VRAM chứ không chỉ phân bổ càng nhiều càng tốt.

Một kỹ thuật được nhóm Google Maps tiên phong là khái niệm về _ngân sách VRAM cho mỗi pixel_:

1\) Đối với một hệ thống (ví dụ: một máy tính để bàn / máy tính xách tay cụ thể), hãy quyết định lượng VRAM tối đa mà ứng dụng của bạn nên sử dụng. 2) Tính số pixel được bao phủ bởi cửa sổ trình duyệt được phóng to. Ví dụ. `(window.innerWidth * devicePixelRatio) * (window.innerHeight * window.devicePixelRatio)` 3) Ngân sách VRAM trên mỗi pixel là (1) chia cho (2) và là một hằng số.

Hằng số này _nói chung_ phải có khả năng di động giữa các hệ thống. Thiết bị di động thường có màn hình nhỏ hơn so với máy tính để bàn mạnh mẽ có màn hình lớn. Tính lại hằng số này trên một số hệ thống mục tiêu để có được ước tính đáng tin cậy.

Bây giờ hãy điều chỉnh tất cả bộ nhớ đệm nội bộ trong ứng dụng (WebGLBuffers, WebGLTextures, v.v.) để tuân theo kích thước tối đa, được tính bằng hằng số này nhân với số pixel được bao phủ bởi cửa sổ trình duyệt _current_. Ví dụ: điều này đòi hỏi phải ước tính số byte được tiêu thụ bởi mỗi kết cấu. Giới hạn cũng thường phải được cập nhật khi cửa sổ trình duyệt thay đổi kích thước và các tài nguyên cũ vượt quá giới hạn phải bị xóa.

Giữ mức sử dụng VRAM của ứng dụng ở mức giới hạn này sẽ giúp tránh lỗi hết bộ nhớ và tình trạng mất ổn định liên quan.

## Xem xét hiển thị tới bộ đệm phía sau nhỏ hơn

Một cách phổ biến (và dễ dàng) để đánh đổi chất lượng lấy tốc độ là hiển thị vào bộ đệm phía sau nhỏ hơn và nâng cấp kết quả. Hãy cân nhắc việc giảm canvas.width và chiều cao, đồng thời giữ canvas.style.width và chiều cao ở kích thước không đổi.

## Cuộc gọi rút thăm hàng loạt

Các lệnh gọi rút thăm "gói" thành ít lệnh gọi rút thăm hơn, các lệnh gọi rút thăm lớn hơn thường sẽ cải thiện hiệu suất. Nếu bạn có 1000 họa tiết để vẽ, hãy thử thực hiện nó dưới dạng một lệnh gọi drawArrays() hoặc drawElements() duy nhất.

Người ta thường sử dụng "hình tam giác suy biến" nếu bạn cần vẽ các đối tượng không liên tục dưới dạng lệnh gọi drawArrays(TRIANGLE_STRIP) duy nhất. Tam giác suy biến là các tam giác không có diện tích, do đó, bất kỳ tam giác nào có nhiều hơn một điểm đều ở cùng một vị trí. Những hình tam giác này được bỏ qua một cách hiệu quả, cho phép bạn bắt đầu một dải tam giác mới không được gắn với dải trước đó mà không cần phải chia thành nhiều lệnh rút thăm.

Một phương pháp quan trọng khác để phân khối là bản đồ kết cấu, trong đó nhiều hình ảnh được đặt vào một kết cấu duy nhất, thường giống như bàn cờ. Vì bạn cần chia các đợt lệnh gọi vẽ để thay đổi kết cấu, nên bản đồ kết cấu cho phép bạn kết hợp nhiều lệnh gọi vẽ thành các đợt ít hơn, lớn hơn. Xem [ví dụ này](https://webglsamples.org/sprites/readme.html) trình bày cách kết hợp các họa tiết chẵn tham chiếu nhiều tập bản đồ kết cấu vào một lệnh rút thăm duy nhất.

## Tránh "#ifdef GL_ES"

Bạn không bao giờ nên sử dụng `#ifdef GL_ES` trong trình đổ bóng WebGL của mình; điều kiện này luôn đúng trong WebGL. Mặc dù một số ví dụ ban đầu đã sử dụng điều này nhưng nó không cần thiết.

## Thích làm việc với vertex shader hơn

Thực hiện nhiều công việc nhất có thể trong trình đổ bóng đỉnh, thay vì trong trình đổ bóng phân đoạn. Điều này là do mỗi lệnh rút thăm, trình đổ bóng phân đoạn thường chạy nhiều lần hơn trình đổ bóng đỉnh. Bất kỳ phép tính nào có thể được thực hiện trên các đỉnh và sau đó chỉ cần nội suy giữa các đoạn (thông qua `thay đổi`) đều mang lại lợi ích về hiệu suất. (Việc nội suy các biến số rất rẻ và được thực hiện tự động cho bạn thông qua giai đoạn rasterization chức năng cố định của quy trình đồ họa.)

Ví dụ, một hình ảnh động đơn giản của một bề mặt có kết cấu có thể đạt được thông qua việc chuyển đổi tọa độ kết cấu phụ thuộc vào thời gian. (Trường hợp đơn giản nhất là thêm một vectơ đồng nhất vào vectơ thuộc tính tọa độ kết cấu) Nếu có thể chấp nhận được về mặt trực quan, người ta có thể chuyển đổi tọa độ kết cấu trong trình đổ bóng đỉnh thay vì trong trình đổ bóng phân đoạn, để có hiệu suất tốt hơn.

Một sự đánh đổi phổ biến là tính toán ánh sáng trên mỗi đỉnh thay vì trên mỗi mảnh (pixel). Trong một số trường hợp, đặc biệt là với các mô hình đơn giản hoặc các đỉnh dày đặc, điều này có vẻ đủ tốt.

Sự đảo ngược của điều này là nếu một mô hình có nhiều đỉnh hơn số pixel trong kết quả đầu ra được hiển thị. Tuy nhiên, lưới LOD thường là câu trả lời cho vấn đề này, hiếm khi di chuyển công việc từ đỉnh _to_ trình đổ bóng phân đoạn.

## Biên dịch song song các chương trình đổ bóng và liên kết

Việc biên dịch các chương trình đổ bóng và liên kết một cách tuần tự là một điều hấp dẫn, nhưng nhiều trình duyệt có thể biên dịch và liên kết song song trên các luồng nền.

Thay vì:

```js
function compileOnce(gl, shader) {
  if (shader.compiled) return;
  gl.compileShader(shader);
  shader.compiled = true;
}
for (const [vs, fs, prog] of programs) {
  compileOnce(gl, vs);
  compileOnce(gl, fs);
  gl.linkProgram(prog);
  if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
    console.error(`Link failed: ${gl.getProgramInfoLog(prog)}`);
    console.error(`vs info-log: ${gl.getShaderInfoLog(vs)}`);
    console.error(`fs info-log: ${gl.getShaderInfoLog(fs)}`);
  }
}
```

Coi như:

```js
function compileOnce(gl, shader) {
  if (shader.compiled) return;
  gl.compileShader(shader);
  shader.compiled = true;
}
for (const [vs, fs, prog] of programs) {
  compileOnce(gl, vs);
  compileOnce(gl, fs);
}
for (const [vs, fs, prog] of programs) {
  gl.linkProgram(prog);
}
for (const [vs, fs, prog] of programs) {
  if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
    console.error(`Link failed: ${gl.getProgramInfoLog(prog)}`);
    console.error(`vs info-log: ${gl.getShaderInfoLog(vs)}`);
    console.error(`fs info-log: ${gl.getShaderInfoLog(fs)}`);
  }
}
```

## Thích KHR_parallel_shader_compile

Mặc dù chúng tôi đã mô tả một mẫu cho phép các trình duyệt biên dịch và liên kết song song, nhưng thông thường việc kiểm tra các khối `COMPILE_STATUS` hoặc `LINK_STATUS` cho đến khi quá trình biên dịch hoặc liên kết hoàn tất. Trong các trình duyệt có sẵn, tiện ích [KHR_parallel_shader_compile](https://registry.khronos.org/webgl/extensions/KHR_parallel_shader_compile/) cung cấp truy vấn _non-blocking_ `COMPLETION_STATUS`. Thích kích hoạt và sử dụng tiện ích mở rộng này.

Cách sử dụng ví dụ:

```js
ext = gl.getExtension("KHR_parallel_shader_compile");
gl.compileProgram(vs);
gl.compileProgram(fs);
gl.attachShader(prog, vs);
gl.attachShader(prog, fs);
gl.linkProgram(prog);

// Store program in your data structure.
// Later, for example the next frame:

if (ext) {
  if (gl.getProgramParameter(prog, ext.COMPLETION_STATUS_KHR)) {
    // Check program link status; if OK, use and draw with it.
  }
} else {
  // Program linking is synchronous.
  // Check program link status; if OK, use and draw with it.
}
```

Kỹ thuật này có thể không hoạt động trong tất cả các ứng dụng, ví dụ như những ứng dụng yêu cầu chương trình phải có sẵn ngay lập tức để hiển thị. Tuy nhiên, hãy xem xét các biến thể có thể hoạt động như thế nào.

## Không kiểm tra trạng thái biên dịch shader trừ khi liên kết không thành công

Có rất ít lỗi được đảm bảo gây ra lỗi biên dịch shader, nhưng không thể trì hoãn thời gian liên kết. [Thông số ESL3](https://registry.khronos.org/OpenGL/specs/es/3.0/GLSL_ES_Specification_3.00.pdf) cho biết điều này trong phần "Xử lý lỗi":

> Việc triển khai cần báo lỗi càng sớm càng tốt nhưng trong mọi trường hợp đều phải đáp ứng các yêu cầu sau:
>
> - Tất cả các lỗi từ vựng, ngữ pháp và ngữ nghĩa phải được phát hiện sau lệnh gọi tới glLinkProgram
> - Phải phát hiện lỗi do không khớp giữa trình đổ bóng đỉnh và đoạn (lỗi liên kết) sau lệnh gọi tới glLinkProgram
> - Lỗi do vượt quá giới hạn tài nguyên phải được phát hiện sau bất kỳ lệnh rút thăm nào hoặc lệnh gọi tới glValidateProgram
> - Lệnh gọi tới glValidateProgram phải báo cáo tất cả các lỗi liên quan đến đối tượng chương trình ở trạng thái GL hiện tại.
>
> Việc phân bổ nhiệm vụ giữa trình biên dịch và trình liên kết phụ thuộc vào việc triển khai. Do đó, có nhiều lỗi có thể được phát hiện tại thời điểm biên dịch hoặc liên kết, tùy thuộc vào việc triển khai.

Ngoài ra, truy vấn trạng thái biên dịch là một lệnh gọi đồng bộ, làm gián đoạn quá trình dẫn truyền.

Thay vì:

```js
gl.compileShader(vs);
if (!gl.getShaderParameter(vs, gl.COMPILE_STATUS)) {
  console.error(`vs compile failed: ${gl.getShaderInfoLog(vs)}`);
}

gl.compileShader(fs);
if (!gl.getShaderParameter(fs, gl.COMPILE_STATUS)) {
  console.error(`fs compile failed: ${gl.getShaderInfoLog(fs)}`);
}

gl.linkProgram(prog);
if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
  console.error(`Link failed: ${gl.getProgramInfoLog(prog)}`);
}
```

Coi như:

```js
gl.compileShader(vs);
gl.compileShader(fs);
gl.linkProgram(prog);
if (!gl.getProgramParameter(prog, gl.LINK_STATUS)) {
  console.error(`Link failed: ${gl.getProgramInfoLog(prog)}`);
  console.error(`vs info-log: ${gl.getShaderInfoLog(vs)}`);
  console.error(`fs info-log: ${gl.getShaderInfoLog(fs)}`);
}
```

## Hãy chính xác với các chú thích chính xác GLSL

Nếu bạn muốn chuyển essl300 `int` giữa các trình đổ bóng và bạn cần nó có 32 bit, bạn _phải_ sử dụng `highp` nếu không bạn sẽ gặp vấn đề về tính di động. (Hoạt động trên Máy tính để bàn, không phải trên Android)

Nếu bạn có kết cấu nổi, iOS yêu cầu bạn sử dụng `highp sampler2D foo;`, nếu không nó sẽ rất khó cung cấp cho bạn các mẫu kết cấu `lowp`! (+/-2.0 max có lẽ không đủ tốt cho bạn)

### Giá trị mặc định ngầm

Ngôn ngữ đỉnh có các câu lệnh chính xác mặc định có phạm vi toàn cầu được khai báo trước sau đây:

```glsl
precision highp float;
precision highp int;
precision lowp sampler2D;
precision lowp samplerCube;
```

Ngôn ngữ phân đoạn có các câu lệnh về độ chính xác mặc định có phạm vi toàn cầu được khai báo trước sau đây:

```glsl
precision mediump int;
precision lowp sampler2D;
precision lowp samplerCube;
```

### Trong WebGL 1, hỗ trợ "highp float" là tùy chọn trong trình đổ bóng phân đoạn

Việc sử dụng độ chính xác `highp` vô điều kiện trong trình đổ bóng phân đoạn sẽ ngăn nội dung của bạn hoạt động trên một số phần cứng di động cũ hơn.

Mặc dù bạn có thể sử dụng `mediump float` thay thế, nhưng hãy lưu ý rằng điều này thường dẫn đến kết xuất bị hỏng do thiếu độ chính xác (đặc biệt là các hệ thống di động) mặc dù lỗi này sẽ không hiển thị trên máy tính để bàn thông thường.

Nếu bạn biết các yêu cầu về độ chính xác của mình, `getShaderPrecisionFormat()` sẽ cho bạn biết hệ thống hỗ trợ những gì.

Nếu `highp float` có sẵn, `GL_FRAGMENT_PRECISION_HIGH` sẽ được xác định là `1`.

Một mẫu hay cho "luôn mang lại cho tôi độ chính xác cao nhất":

```glsl
#ifdef GL_FRAGMENT_PRECISION_HIGH
precision highp float;
#else
precision mediump float;
#endif
```

### Yêu cầu tối thiểu ESSL100 (WebGL 1)

| `phao`       | nghĩ                 | phạm vi       | phút trên 0 | độ chính xác    |
| ------------ | -------------------- | ------------- | ----------- | --------------- |
| `cao`        | float24\*            | (-2^62, 2^62) | 2^-62       | 2^-16 tương đối |
| `trung bình` | IEEE phao16          | (-2^14, 2^14) | 2^-14       | 2^-10 tương đối |
| `thấp`       | Đã sửa lỗi ký 10 bit | (-2, 2)       | 2^-8        | 2^-8 tuyệt đối  |

| `int`        | nghĩ  | phạm vi       |
| ------------ | ----- | ------------- |
| `cao`        | int17 | (-2^16, 2^16) |
| `trung bình` | int11 | (-2^10, 2^10) |
| `thấp`       | int9  | (-2^8, 2^8)   |

_\*float24: bit dấu, 7-bit cho số mũ, 16-bit cho phần định trị._

### Yêu cầu tối thiểu ESSL300 (WebGL 2)

| `phao`       | nghĩ                 | phạm vi         | phút trên 0 | độ chính xác    |
| ------------ | -------------------- | --------------- | ----------- | --------------- |
| `cao`        | IEEE float32         | (-2^126, 2^127) | 2^-126      | 2^-24 tương đối |
| `trung bình` | IEEE phao16          | (-2^14, 2^14)   | 2^-14       | 2^-10 tương đối |
| `thấp`       | Đã sửa lỗi ký 10 bit | (-2, 2)         | 2^-8        | 2^-8 tuyệt đối  |

| `(u)int`     | nghĩ     | phạm vi `int` | phạm vi `unsign int` |
| ------------ | -------- | ------------- | -------------------- |
| `cao`        | (u)int32 | [-2^31, 2^31] | [0, 2^32]            |
| `trung bình` | (u)int16 | [-2^15, 2^15] | [0, 2^16]            |
| `thấp`       | (u)int9  | [-2^8, 2^8]   | [0, 2^9]             |

## Ưu tiên các nội dung dựng sẵn thay vì xây dựng nội dung của riêng bạn

Thích các nội dung như `dot`, `mix` và `normalize`. Tốt nhất, việc triển khai tùy chỉnh có thể chạy nhanh như các phần dựng sẵn mà chúng thay thế, nhưng đừng mong đợi chúng sẽ chạy như vậy. Phần cứng thường có các hướng dẫn siêu tối ưu hóa hoặc thậm chí chuyên biệt cho các phần dựng sẵn và trình biên dịch không thể thay thế các phần thay thế dựng sẵn tùy chỉnh của bạn một cách đáng tin cậy bằng các đường dẫn mã dựng sẵn đặc biệt.

## Sử dụng mipmap cho bất kỳ kết cấu nào bạn sẽ thấy ở chế độ 3d

Khi nghi ngờ, hãy gọi `generateMipmaps()` sau khi tải kết cấu lên. Mipmap có giá thành rẻ trên bộ nhớ (chỉ tốn 30%) trong khi mang lại lợi thế về hiệu suất thường rất lớn khi kết cấu được "thu nhỏ" hoặc thường được thu nhỏ về khoảng cách trong chế độ 3d hoặc thậm chí đối với bản đồ khối!

Việc lấy mẫu từ các hình ảnh kết cấu nhỏ hơn sẽ nhanh hơn do vị trí bộ đệm tìm nạp kết cấu vốn có tốt hơn: Việc thu nhỏ trên kết cấu không được ánh xạ sẽ làm hỏng kết cấu tìm nạp cục bộ bộ nhớ đệm, vì các pixel lân cận không còn lấy mẫu từ các texel lân cận nữa!

Tuy nhiên, đối với các tài nguyên 2d không bao giờ bị "thu nhỏ", đừng trả phụ phí bộ nhớ 30% cho mipmap:

```js
const tex = gl.createTexture();
gl.bindTexture(gl.TEXTURE_2D, tex);
gl.texParameterf(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR); // Defaults to NEAREST_MIPMAP_LINEAR, for mipmapping!
```

(Trong WebGL 2, bạn chỉ nên sử dụng `texStorage` với `levels=1`)

Một lưu ý: `generateMipmaps` chỉ hoạt động nếu bạn có thể kết xuất thành kết cấu nếu bạn gắn nó vào bộ đệm khung. (Thông số kỹ thuật gọi đây là "định dạng có thể hiển thị màu") Ví dụ: nếu một hệ thống hỗ trợ họa tiết nổi nhưng không hiển thị thành float, `generateMipmaps` sẽ không thành công đối với các định dạng float.

## Đừng cho rằng bạn có thể kết xuất thành họa tiết nổi

Có rất nhiều hệ thống hỗ trợ họa tiết RGBA32F, nhưng nếu bạn gắn một hệ thống vào bộ đệm khung, bạn sẽ nhận được `FRAMEBUFFER_INCOMPLETE_ATTACHMENT` từ `checkFramebufferStatus()`. Nó có thể hoạt động trên hệ thống của bạn, nhưng hầu hết các hệ thống di động sẽ không hỗ trợ nó!

Trên WebGL 1, hãy sử dụng tiện ích mở rộng `EXT_color_buffer_half_float` và `WEBGL_color_buffer_float` để kiểm tra khả năng hỗ trợ kết cấu hiển thị thành float cho float16 và float32 tương ứng.

Trên WebGL 2, `EXT_color_buffer_float` kiểm tra khả năng hỗ trợ kết cấu hiển thị thành float cho cả float32 và float16. `EXT_color_buffer_half_float` hiện diện trên các hệ thống chỉ hỗ trợ kết xuất thành họa tiết float16.

### Render-to-float32 không có nghĩa là trộn float32!

Nó có thể hoạt động trên hệ thống của bạn, nhưng trên nhiều hệ thống khác thì không. Tránh nó nếu bạn có thể. Kiểm tra tiện ích mở rộng `EXT_float_blend` để kiểm tra hỗ trợ.

Pha trộn Float16 luôn được hỗ trợ.

## Một số định dạng (ví dụ: RGB) có thể được mô phỏng

Một số định dạng (đặc biệt là định dạng ba kênh) được mô phỏng. Ví dụ: RGB32F thực tế thường là RGBA32F và Luminance8 thực tế có thể là RGBA8. Đặc biệt, RGB8 thường chậm một cách đáng ngạc nhiên, vì việc che giấu kênh alpha và/hoặc vá các chức năng hòa trộn có chi phí khá cao. Thích sử dụng RGBA8 và bỏ qua bản alpha để có hiệu suất tốt hơn.

## Tránh alpha:false, điều này có thể tốn kém

Việc chỉ định `alpha:false` trong quá trình tạo ngữ cảnh sẽ khiến trình duyệt kết hợp khung vẽ được hiển thị bằng WebGL như thể nó mờ đục, bỏ qua mọi giá trị alpha mà ứng dụng ghi trong trình đổ bóng phân đoạn của nó. Thật không may, trên một số nền tảng, khả năng này lại đi kèm với chi phí hiệu năng đáng kể. Bộ đệm phía sau RGB có thể phải được mô phỏng trên bề mặt RGBA và có tương đối ít kỹ thuật có sẵn trong API OpenGL để làm cho ứng dụng thấy rằng bề mặt RGBA không có kênh alpha. [Người ta nhận thấy](https://crbug.com/1045643) rằng tất cả các kỹ thuật này đều có tác động hiệu suất gần như ngang nhau trên các nền tảng bị ảnh hưởng.

Hầu hết các ứng dụng, ngay cả những ứng dụng yêu cầu trộn alpha, đều có thể được cấu trúc để tạo ra `1.0` cho kênh alpha. Ngoại lệ chính là bất kỳ ứng dụng nào yêu cầu đích alpha trong hàm hòa trộn. Nếu khả thi, bạn nên thực hiện việc này thay vì sử dụng `alpha:false`.

## Xem xét các định dạng kết cấu nén

Mặc dù JPG và PNG thường nhỏ hơn khi truyền qua mạng, các định dạng kết cấu nén GPU nhỏ hơn trong bộ nhớ GPU và lấy mẫu nhanh hơn. (Điều này làm giảm băng thông bộ nhớ kết cấu, vốn rất quý giá trên thiết bị di động) Tuy nhiên, các định dạng kết cấu nén có chất lượng kém hơn JPG và thường chỉ được chấp nhận đối với màu sắc (không phải định dạng chuẩn hoặc tọa độ).

Thật không may, không có định dạng duy nhất được hỗ trợ phổ biến. Mỗi hệ thống đều có ít nhất một trong những điều sau đây:

- WEBGL_compression_texture_s3tc (máy tính để bàn)
- WEBGL_compression_texture_etc1 (Android)
- WEBGL_compression_texture_pvrtc (iOS)

WebGL 2 có hỗ trợ phổ biến bằng cách kết hợp:

- WEBGL_compression_texture_s3tc (máy tính để bàn)
- WEBGL_compression_texture_etc (di động)

WEBGL_compression_texture_astc có cả chất lượng cao hơn và/hoặc độ nén cao hơn nhưng chỉ được hỗ trợ trên phần cứng mới hơn.

### Cơ sở Định dạng/thư viện nén kết cấu phổ quát

Basis Universal giải quyết một số vấn đề nêu trên. Nó cung cấp một cách để hỗ trợ tất cả các định dạng kết cấu nén phổ biến bằng một tệp kết cấu nén duy nhất, thông qua thư viện JavaScript giúp chuyển đổi định dạng một cách hiệu quả khi tải. Nó cũng bổ sung tính năng nén bổ sung giúp các tệp kết cấu nén Basis Universal nhỏ hơn nhiều so với các kết cấu được nén qua mạng thông thường, có thể so sánh được với JPEG.

<https://github.com/BinomialLLC/basis_universal/blob/master/webgl/README.md>

## Sử dụng bộ nhớ của các định dạng chiều sâu và khuôn tô

Các tệp đính kèm và định dạng có độ sâu và stencil thực sự không thể tách rời trên nhiều thiết bị. Bạn có thể yêu cầu DEPTH_COMPONENT24 hoặc STENCIL_INDEX8 nhưng bạn thường nhận được các định dạng D24X8 và X24S8 32bpp phía sau. Giả sử rằng mức sử dụng bộ nhớ của các định dạng chiều sâu và khuôn tô được làm tròn đến bốn byte gần nhất.

## Tải lên texImage/texSubImage (đặc biệt là video) có thể gây ra hiện tượng xóa đường ống

Hầu hết các kết cấu được tải lên từ các phần tử DOM sẽ phải chịu một quá trình xử lý sẽ tạm thời chuyển đổi các Chương trình GL bên trong, gây ra tình trạng xóa đường dẫn. (Các đường dẫn được chính thức hóa một cách rõ ràng trong [Vulkan](https://docs.vulkan.org/spec/latest/chapters/pipelines.html) và các cộng sự, nhưng ẩn chứa thông tin hậu trường trong OpenGL và WebGL. Các đường ống ít nhiều là một bộ chương trình đổ bóng, độ sâu/stencil/multisample/blend/rasterization state)

Trong WebGL:

```glsl
    …
    useProgram(prog1)
<pipeline flush>
    bindFramebuffer(target)
    drawArrays()
    bindTexture(webgl_texture)
    texImage2D(HTMLVideoElement)
    drawArrays()
    …
```

Đằng sau hậu trường trong trình duyệt:

```glsl
    …
    useProgram(prog1)
<pipeline flush>
    bindFramebuffer(target)
    drawArrays()
    bindTexture(webgl_texture)
    -texImage2D(HTMLVideoElement):
        +useProgram(_internal_tex_transform_prog)
<pipeline flush>
        +bindFramebuffer(webgl_texture._internal_framebuffer)
        +bindTexture(HTMLVideoElement._internal_video_tex)
        +drawArrays() // y-flip/colorspace-transform/alpha-(un)premultiply
        +bindTexture(webgl_texture)
        +bindFramebuffer(target)
        +useProgram(prog1)
<pipeline flush>
    drawArrays()
    …
```

Thích thực hiện tải lên trước khi bắt đầu vẽ hoặc ít nhất là giữa các đường ống:

Trong WebGL:

```glsl
    …
    bindTexture(webgl_texture)
    texImage2D(HTMLVideoElement)
    useProgram(prog1)
<pipeline flush>
    bindFramebuffer(target)
    drawArrays()
    bindTexture(webgl_texture)
    drawArrays()
    …
```

Đằng sau hậu trường trong trình duyệt:

```glsl
    …
    bindTexture(webgl_texture)
    -texImage2D(HTMLVideoElement):
        +useProgram(_internal_tex_transform_prog)
<pipeline flush>
        +bindFramebuffer(webgl_texture._internal_framebuffer)
        +bindTexture(HTMLVideoElement._internal_video_tex)
        +drawArrays() // y-flip/colorspace-transform/alpha-(un)premultiply
        +bindTexture(webgl_texture)
        +bindFramebuffer(target)
    useProgram(prog1)
<pipeline flush>
    bindFramebuffer(target)
    drawArrays()
    bindTexture(webgl_texture)
    drawArrays()
    …
```

## Sử dụng texStorage để tạo họa tiết

API WebGL 2.0 `texImage*` cho phép bạn xác định từng cấp độ mip một cách độc lập và ở bất kỳ kích thước nào, ngay cả khi kích thước mips không trùng khớp cũng không phải là lỗi cho đến thời gian vẽ, nghĩa là không có cách nào trình điều khiển thực sự có thể chuẩn bị kết cấu trong bộ nhớ GPU cho đến khi kết cấu được vẽ lần đầu tiên.

Hơn nữa, một số trình điều khiển có thể phân bổ vô điều kiện toàn bộ chuỗi mip (+30% bộ nhớ!) ngay cả khi bạn chỉ muốn một cấp độ duy nhất.

Vì vậy, hãy ưu tiên `texStorage` + `texSubImage` cho họa tiết trong WebGL 2.

## Sử dụng bộ đệm khung không hợp lệ

Việc lưu trữ dữ liệu mà bạn sẽ không sử dụng lại có thể tốn kém, đặc biệt là trên các GPU kết xuất xếp lớp phổ biến trên thiết bị di động. Khi bạn hoàn tất nội dung của tệp đính kèm bộ đệm khung, hãy sử dụng `invalidateFramebuffer` của WebGL 2.0 để loại bỏ dữ liệu, thay vì để trình điều khiển lãng phí thời gian lưu trữ dữ liệu để sử dụng sau này. DEPTH/STENCIL và/hoặc các tệp đính kèm nhiều mẫu nói riêng là những ứng cử viên sáng giá cho `invalidateFramebuffer`.

## Sử dụng tính năng đọc lại dữ liệu không đồng bộ không chặn

Các hoạt động như `readPixels` và `getBufferSubData` thường đồng bộ, nhưng sử dụng cùng một API, có thể đạt được việc đọc lại dữ liệu không đồng bộ, không bị chặn. Cách tiếp cận trong WebGL 2 tương tự như cách tiếp cận trong OpenGL: [Tải xuống không đồng bộ trong các API chặn](https://kdashg.github.io/misc/async-gpu-downloads.html)

```js
function clientWaitAsync(gl, sync, flags, intervalMs) {
  return new Promise((resolve, reject) => {
    function test() {
      const res = gl.clientWaitSync(sync, flags, 0);
      if (res === gl.WAIT_FAILED) {
        reject(new Error("clientWaitSync failed"));
        return;
      }
      if (res === gl.TIMEOUT_EXPIRED) {
        setTimeout(test, intervalMs);
        return;
      }
      resolve();
    }
    test();
  });
}

async function getBufferSubDataAsync(
  gl,
  target,
  buffer,
  srcByteOffset,
  dstBuffer,
  /* optional */ dstOffset,
  /* optional */ length,
) {
  const sync = gl.fenceSync(gl.SYNC_GPU_COMMANDS_COMPLETE, 0);
  gl.flush();

  await clientWaitAsync(gl, sync, 0, 10);
  gl.deleteSync(sync);

  gl.bindBuffer(target, buffer);
  gl.getBufferSubData(target, srcByteOffset, dstBuffer, dstOffset, length);
  gl.bindBuffer(target, null);

  return dstBuffer;
}

async function readPixelsAsync(gl, x, y, w, h, format, type, dest) {
  const buf = gl.createBuffer();
  gl.bindBuffer(gl.PIXEL_PACK_BUFFER, buf);
  gl.bufferData(gl.PIXEL_PACK_BUFFER, dest.byteLength, gl.STREAM_READ);
  gl.readPixels(x, y, w, h, format, type, 0);
  gl.bindBuffer(gl.PIXEL_PACK_BUFFER, null);

  await getBufferSubDataAsync(gl, gl.PIXEL_PACK_BUFFER, buf, 0, dest);

  gl.deleteBuffer(buf);
  return dest;
}
```

## `devicePixelRatio` và hiển thị dpi cao

Việc xử lý `devicePixelRatio !== 1.0` thật khó khăn. Mặc dù cách tiếp cận phổ biến là đặt `canvas.width = width * devicePixelRatio`, nhưng điều này sẽ gây ra hiện tượng moire với các giá trị không nguyên của `devicePixelRatio`, điều này thường xảy ra với việc chia tỷ lệ giao diện người dùng trên Windows cũng như thu phóng trên tất cả các nền tảng.

Thay vào đó, chúng ta có thể sử dụng các giá trị không nguyên cho `top`/`bottom`/`left`/`right` của CSS để 'bắt trước' canvas của chúng ta với toàn bộ tọa độ thiết bị số nguyên một cách khá đáng tin cậy.

Bản trình diễn: [Tính năng chụp trước pixel của thiết bị](https://kdashg.github.io/misc/webgl/device-pixel-presnap.html)

## Thay đổi kích thướcObserver và 'hộp nội dung-pixel-thiết bị'

Trên [các trình duyệt hỗ trợ](/en-US/docs/Web/API/ResizeObserverEntry/devicePixelContentBoxSize#browser_compatibility), `ResizeObserver` có thể được sử dụng với `'device-pixel-content-box'` để yêu cầu lệnh gọi lại bao gồm kích thước {{glossary("device pixel")}} thực của một phần tử. Điều này có thể được sử dụng để xây dựng hàm không đồng bộ nhưng chính xác:

```js
function getDevicePixelSize(elem) {
  return new Promise((resolve) => {
    const observer = new ResizeObserver(([cur]) => {
      if (!cur) {
        throw new Error(
          `device-pixel-content-box not observed for elem ${elem}`,
        );
      }
      const devSize = cur.devicePixelContentBoxSize;
      const ret = {
        width: devSize[0].inlineSize,
        height: devSize[0].blockSize,
      };
      resolve(ret);
      observer.disconnect();
    });
    observer.observe(elem, { box: "device-pixel-content-box" });
  });
}
```

## Sử dụng `WEBGL_provoking_vertex` khi có sẵn

Khi ghép các đỉnh thành các phần nguyên thủy như hình tam giác và đường thẳng, trong quy ước của OpenGL, đỉnh cuối cùng của phần nguyên thủy được coi là "đỉnh khiêu khích". Điều này có liên quan khi sử dụng phép nội suy thuộc tính đỉnh `phẳng` trong ESSL300 (WebGL 2); giá trị thuộc tính từ đỉnh kích thích được sử dụng cho tất cả các đỉnh của nguyên thủy.

Ngày nay, việc triển khai WebGL của nhiều trình duyệt được lưu trữ trên các API đồ họa khác với OpenGL và một số API này sử dụng đỉnh đầu tiên làm đỉnh kích thích để vẽ các lệnh. Việc mô phỏng quy ước đỉnh kích thích của OpenGL có thể tốn kém về mặt tính toán trên một số API này.

Vì lý do này, tiện ích [WEBGL_provoking_vertex](https://registry.khronos.org/webgl/extensions/WEBGL_provoking_vertex/) đã được giới thiệu. Nếu việc triển khai WebGL hiển thị tiện ích mở rộng này thì đây là gợi ý cho ứng dụng rằng việc thay đổi quy ước thành `FIRST_VERTEX_CONVENTION_WEBGL` sẽ cải thiện hiệu suất. Chúng tôi đặc biệt khuyến nghị các ứng dụng sử dụng tính năng tạo bóng phẳng hãy kiểm tra sự hiện diện của tiện ích mở rộng này và sử dụng nó để làm như vậy nếu có. Lưu ý rằng điều này có thể yêu cầu thay đổi bộ đệm hoặc bộ đổ bóng đỉnh của ứng dụng.
